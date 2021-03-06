// @(#)root/reflex:$Name:  $:$Id: SharedLibrary.h,v 1.2 2007/01/10 08:52:22 roiser Exp $
// Author: Stefan Roiser 2006

// Copyright CERN, CH-1211 Geneva 23, 2004-2006, All rights reserved.
//
// Permission to use, copy, modify, and distribute this software for any
// purpose is hereby granted without fee, provided that this copyright and
// permissions notice appear in all copies and derivatives.
//
// This software is provided "as is" without express or implied warranty.

#ifndef ROOT_Reflex_SharedLibrary 
#define ROOT_Reflex_SharedLibrary

// Include files
#ifdef _WIN32
#include <windows.h>
#else
#include <dlfcn.h>
#include <errno.h>
#endif

namespace ROOT {
   namespace Reflex {


      /**
       * @class SharedLibrary SharedLibrary.h Reflex/SharedLibrary.h
       * @author Stefan Roiser
       * @date 24/11/2006
       * @ingroup Ref
       * Parts of this implementation are copyied from SEAL (http://cern.ch/seal)
       */
      class SharedLibrary {
         
      public:
         
         SharedLibrary( const std::string & libname );
         
         bool Load();
         
         bool Unload();
         
         bool Symbol( const std::string & symname, void * & sym );
         
         const std::string Error();

      private:
         
         /** a handle to the loaded library */
#ifdef _WIN32
         HMODULE fHandle;
#else
         void* fHandle;
#endif
         /** the name of the shared library to handle */
         std::string fLibName;
      };

   } // namespace Reflex
} // namespace ROOT


//-------------------------------------------------------------------------------
inline ROOT::Reflex::SharedLibrary::SharedLibrary( const std::string & libname ) :
//-------------------------------------------------------------------------------
   fHandle(0), fLibName(libname) {}


//-------------------------------------------------------------------------------
inline const std::string ROOT::Reflex::SharedLibrary::Error() {
//-------------------------------------------------------------------------------
  std::string errString =  "";
#ifdef _WIN32
  int error =  ::GetLastError();
  LPVOID lpMessageBuffer;
  ::FormatMessage( 
    FORMAT_MESSAGE_ALLOCATE_BUFFER |  FORMAT_MESSAGE_FROM_SYSTEM,
    NULL,
    error,
    MAKELANGID(LANG_NEUTRAL, SUBLANG_DEFAULT), //The user default language
    (LPTSTR) &lpMessageBuffer,
    0,
    NULL );
  errString = (const char*)lpMessageBuffer;
  // Free the buffer allocated by the system
  ::LocalFree( lpMessageBuffer ); 
#else
  errString = std::string(dlerror());
#endif
  return errString;
}


//-------------------------------------------------------------------------------
inline bool ROOT::Reflex::SharedLibrary::Load() {
//-------------------------------------------------------------------------------

#ifdef _WIN32 
   ::SetErrorMode(0);
   fHandle = ::LoadLibrary(fLibName.c_str());
#else
   fHandle = ::dlopen(fLibName.c_str(), RTLD_LAZY | RTLD_GLOBAL );
#endif

   if ( ! fHandle ) return false;
   else return true;
}


//-------------------------------------------------------------------------------
inline bool ROOT::Reflex::SharedLibrary::Symbol( const std::string & symname, 
                                                 void * & sym ) {
//-------------------------------------------------------------------------------

   if ( fHandle ) {
#ifdef _WIN32
      sym = GetProcAddress(fHandle, symname.c_str());
#else 
      sym = dlsym(fHandle, symname.c_str());
#endif
      if ( sym )  return true;
   }
   return false;
}

   
//-------------------------------------------------------------------------------
inline bool ROOT::Reflex::SharedLibrary::Unload() {
//-------------------------------------------------------------------------------

#ifdef _WIN32
   if ( FreeLibrary(fHandle) == 0 ) return false;
#else 
   if ( dlclose(fHandle) == -1 ) return false;
#endif
   else return true;
}


#endif // ROOT_Reflex_SharedLibrary
