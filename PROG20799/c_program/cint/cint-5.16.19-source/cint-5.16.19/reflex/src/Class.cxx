// @(#)root/reflex:$Name:  $:$Id: Class.cxx,v 1.25 2006/10/30 12:51:33 roiser Exp $
// Author: Stefan Roiser 2004

// Copyright CERN, CH-1211 Geneva 23, 2004-2006, All rights reserved.
//
// Permission to use, copy, modify, and distribute this software for any
// purpose is hereby granted without fee, provided that this copyright and
// permissions notice appear in all copies and derivatives.
//
// This software is provided "as is" without express or implied warranty.

#ifndef REFLEX_BUILD
#define REFLEX_BUILD
#endif

#include "Class.h"

#include "Reflex/Object.h"
#include "Reflex/Type.h"

#include "DataMember.h"
#include "FunctionMember.h"
#include "Reflex/Tools.h"
#include "Reflex/DictionaryGenerator.h"

#include <typeinfo>
#include <iostream>
#include <sstream>
#include <algorithm>
#if defined (__linux) || defined (__APPLE__)
#include <cxxabi.h>
#endif


//-------------------------------------------------------------------------------
ROOT::Reflex::Class::Class(  const char *           typ, 
                             size_t                 size,
                             const std::type_info & ti,
                             unsigned int           modifiers,
                             TYPE                   classType )
//-------------------------------------------------------------------------------
// Construct a Class instance. 
   : TypeBase( typ, size, classType, ti ),
     ScopeBase( typ, classType ),
     fModifiers( modifiers ),
     fAllBases( 0 ),
     fCompleteType( false ),
     fConstructors( std::vector< Member >()),
     fDestructor( Member()),
     fPathsToBase( PathsToBase()) {}
    

//-------------------------------------------------------------------------------
ROOT::Reflex::Class::~Class() {
//-------------------------------------------------------------------------------
   for ( PathsToBase::iterator it = fPathsToBase.begin(); it != fPathsToBase.end(); ++it ) {
      delete it->second;
   }
}


//-------------------------------------------------------------------------------
void ROOT::Reflex::Class::AddBase( const Type &   bas,
                                   OffsetFunction offsFP,
                                   unsigned int   modifiers ) const {
//-------------------------------------------------------------------------------
// Add a base class information.
   Base b(bas, offsFP, modifiers);
   fBases.push_back( b );
}


//-------------------------------------------------------------------------------
ROOT::Reflex::Object ROOT::Reflex::Class::CastObject( const Type & to, 
                                                      const Object & obj ) const {
//-------------------------------------------------------------------------------
// Cast an object. Will do up and down cast. Cross cast missing.
   std::vector< Base > path = std::vector< Base >();
   if ( HasBase( to, path )) { // up cast 
      // in case of up cast the Offset has to be calculated by Reflex
      size_t obj2 = (size_t)obj.Address();
      for( std::vector< Base >::reverse_iterator bIter = path.rbegin();
           bIter != path.rend(); ++bIter ) {
         obj2 += bIter->Offset((void*)obj2);
      }
      return Object(to,(void*)obj2);
   }
   path.clear();
   Type t = *this;
   if ( to.HasBase( t ) ) {  // down cast
      // use the internal dynamic casting of the compiler (e.g. libstdc++.so)
      void * obj3 = 0;
#if defined (__linux) || defined (__APPLE__)
      obj3 = abi::__dynamic_cast(obj.Address(),
                                 (const abi::__class_type_info*)&this->TypeInfo(),
                                 (const abi::__class_type_info*)&to.TypeInfo(),
                                 -1); 
#elif defined (_WIN32)
      obj3 = __RTDynamicCast(obj.Address(),
                             0,
                             (void*)&this->TypeInfo(),
                             (void*)&to.TypeInfo(),
                             0);
#endif
      return Object(to, obj3);
   }
   // fixme cross cast missing ?? internal cast possible ??

   // if the same At was passed return the object
   if ((Type)(*this) == to) return obj;

   // if everything fails return the dummy object
   return Object();
}

    
/*/-------------------------------------------------------------------------------
  ROOT::Reflex::Object ROOT::Reflex::Class::Construct( const Type & signature, 
                                                       const std::vector < Object > & args, 
                                                       void * mem ) const {
//------------------------------------------------------------------------------- 
  static Type defSignature = Type::ByName("void (void)");
  Type signature2 = signature;
  
  Member constructor = Member();
  if ( !signature &&  fConstructors.size() > 1 ) 
  signature2 = defSignature; 
  
  for (size_t i = 0; i < fConstructors.size(); ++ i) {
  if ( !signature2 || fConstructors[i].TypeOf().Id() == signature2.Id()) {
  constructor = fConstructors[i];
  break;
  }
  }
  
  if ( constructor.TypeOf() ) {
  // no memory Address passed -> Allocate memory for class
  if ( mem == 0 ) mem = Allocate();
  Object obj = Object( TypeOf(), mem );
  constructor.Invoke( obj, args );
  return obj;
  }
  else {
  throw RuntimeError("No suitable constructor found");
  }
  }
*/

    
//-------------------------------------------------------------------------------
ROOT::Reflex::Object ROOT::Reflex::Class::Construct( const Type & sig, 
                                                     const std::vector < void * > & args, 
                                                     void * mem ) const {
//------------------------------------------------------------------------------- 
// Construct an object of this class type. The signature of the constructor function
// can be given as the first argument. Furhter arguments are a vector of memory 
// addresses for non default constructors and a memory address for in place construction.
   static Type defSignature = Type::ByName("void (void)");
   Type signature = ( !sig &&  fConstructors.size() > 1 ) ? defSignature : sig;
  
   for (size_t i = 0; i < fConstructors.size(); ++ i) {
      if ( !signature || fConstructors[i].TypeOf().Id() == signature.Id()) {
         Member constructor = fConstructors[i];
         if ( mem == 0 ) mem = Allocate();
         Object obj = Object( ThisType(), mem );
         constructor.Invoke( obj, args );
         return obj;
      }
   }
   std::stringstream s;
   s << "No suitable constructor found with signature '" << signature.Name() << "'";
   throw RuntimeError( s.str() );
}

    
//-------------------------------------------------------------------------------
void ROOT::Reflex::Class::Destruct( void * instance, 
                                    bool dealloc ) const {
//-------------------------------------------------------------------------------
// Call the destructor for this class type on a memory address (instance). Deallocate
// memory if dealloc = true (i.e. default).
   if ( ! fDestructor.TypeOf() ) {
      // destructor for this class not yet revealed
      for ( size_t i = 0; i < ScopeBase::FunctionMemberSize(); ++i ) {
         Member fm = ScopeBase::FunctionMemberAt( i );
         // constructor found Set the cache pointer
         if ( fm.IsDestructor() ) {
            fDestructor = fm; 
            break;
         }
      }
   }
   if ( fDestructor.TypeOf()) {
      // we found a destructor -> Invoke it
      Object dummy = Object(Type(), instance);
      fDestructor.Invoke( dummy );
      // if deallocation of memory wanted 
      if ( dealloc ) { Deallocate( instance ); }
   }
   else {
      // this class has no destructor defined we call the operator delete on it
      ::operator delete(instance);
   }
}


//-------------------------------------------------------------------------------
struct DynType_t {
//-------------------------------------------------------------------------------
   virtual ~DynType_t() {
      // dummy type with vtable.
   }
};

    
//-------------------------------------------------------------------------------
ROOT::Reflex::Type ROOT::Reflex::Class::DynamicType( const Object & obj ) const {
//-------------------------------------------------------------------------------
// Discover the dynamic type of a class object and return it.
   // If no virtual_function_table return itself
   if ( IsVirtual() ) {
      // Avoid the case that the first word is a virtual_base_offset_table instead of
      // a virtual_function_table  
      long int offset = **(long**)obj.Address();
      if ( offset == 0 ) return ThisType();
      else {
         const Type & dytype = Type::ByTypeInfo(typeid(*(DynType_t*)obj.Address()));
         if ( dytype && dytype.IsClass() ) return dytype;
         else                              return ThisType();
      }
   }
   else {
      return ThisType(); 
   }
}


//-------------------------------------------------------------------------------
bool ROOT::Reflex::Class::HasBase( const Type & cl ) const {
//-------------------------------------------------------------------------------
// Return true if this class has a base class of type cl.
   std::vector<Base> v = std::vector<Base>();
   return HasBase(cl, v);
}


//-------------------------------------------------------------------------------
bool ROOT::Reflex::Class::HasBase( const Type & cl,  
                                   std::vector< Base > & path ) const {
//-------------------------------------------------------------------------------
// Return true if this class has a base class of type cl. Return also the path
// to this type.
   if ( ! cl.Id() ) return false;
   for ( size_t i = 0; i < BaseSize(); ++i ) {
      Base b = BaseAt( i );
      Type basetype = b.ToType();
      if ( basetype.Id() == cl.Id() || basetype.FinalType().Id() == cl.Id()) { 
         // remember the path to this class
         path.push_back( b ); 
         return true; 
      }
      else if ( basetype && basetype.HasBase(cl) ) {
         // is the final base class one of the current class ?
         // if searched base class is not direct base look in the bases of this one
         //       if ( basetype.HasBase( cl ) ) {                                              
            // if successfull remember path
            path.push_back( b ); 
            return true; 
            //}
      }
   }
   return false;
}


//-------------------------------------------------------------------------------
bool ROOT::Reflex::Class::IsComplete() const {
//-------------------------------------------------------------------------------
// Return true if this class is complete. I.e. all dictionary information for all
// data and function member types and base classes is available.
   if ( ! fCompleteType ) fCompleteType = IsComplete2(); 
   return fCompleteType;
}


//-------------------------------------------------------------------------------
bool ROOT::Reflex::Class::IsComplete2() const {
//-------------------------------------------------------------------------------
// Return true if this class is complete. I.e. all dictionary information for all
// data and function member types and base classes is available (internal function).
   for (size_t i = 0; i < BaseSize(); ++i) {
      Type baseType = BaseAt( i ).ToType().FinalType();
      if ( ! baseType )  return false;
      if ( ! baseType.IsComplete()) return false;
   }
   return true;
}

    
//-------------------------------------------------------------------------------
size_t ROOT::Reflex::Class::AllBases() const {
//-------------------------------------------------------------------------------
// Return the number of base classes.
   size_t aBases = 0;
   for ( size_t i = 0; i < BaseSize(); ++i ) {
      ++aBases;
      if ( BaseAt( i )) { 
         aBases += BaseAt( i ).BaseClass()->AllBases();
      }
   }
   return aBases;
}


//-------------------------------------------------------------------------------
bool ROOT::Reflex::Class::NewBases() const {
//-------------------------------------------------------------------------------
// Check if information for new base classes has been added.
   if ( ! fCompleteType ) {
      size_t numBases = AllBases();
      if ( fAllBases != numBases ) {
         fCompleteType = IsComplete2();
         fAllBases = numBases;
         return true;
      }
   }
   return false;
}


//-------------------------------------------------------------------------------
void ROOT::Reflex::Class::UpdateMembers() const {
//-------------------------------------------------------------------------------
// Update information for function and data members. 
   std::vector < OffsetFunction > basePath = std::vector < OffsetFunction >();
   UpdateMembers2( fMembers, 
                   fDataMembers, 
                   fFunctionMembers,
                   fPathsToBase,
                   basePath );
}


//-------------------------------------------------------------------------------
const std::vector < ROOT::Reflex::OffsetFunction > & 
ROOT::Reflex::Class::PathToBase( const Scope & bas ) const {
//-------------------------------------------------------------------------------
// Return a vector of offset functions from the current class to the base class.
   std::vector < OffsetFunction > * pathToBase = fPathsToBase[ bas.Id() ];
   if ( ! pathToBase ) {
      UpdateMembers();
      pathToBase = fPathsToBase[ bas.Id() ];
      /* fixme can Get rid of UpdateMembers() ?
         std::cerr << Reflex::Argv0() << ": WARNING: No path found from " 
         << this->Name() << " to " << bas.Name() << std::endl;
         if ( NewBases()) {
         std::cerr << Reflex::Argv0() << ": INFO: Not all base classes have resolved, "
         << "do Class::UpdateMembers() and try again " << std::endl; 
         }
      */
   }
   return * pathToBase;
}


//-------------------------------------------------------------------------------
void ROOT::Reflex::Class::UpdateMembers2( OMembers & members,
                                          Members & dataMembers,
                                          Members & functionMembers,
                                          PathsToBase & pathsToBase,
                                          std::vector < OffsetFunction > & basePath ) const {
//-------------------------------------------------------------------------------
// Internal function to update the data and function member information.
   std::vector < Base >::const_iterator bIter;
   for ( bIter = fBases.begin(); bIter != fBases.end(); ++bIter ) {
      Type bType = bIter->ToType().FinalType();
      basePath.push_back( bIter->OffsetFP());
      if ( bType ) {
         void * id = (dynamic_cast<const Class*>(bType.ToTypeBase()))->ThisScope().Id();
         PathsToBase::iterator it = pathsToBase.find(id);
         if ( it != pathsToBase.end()) delete it->second;
         pathsToBase[ id ] = new std::vector < OffsetFunction >( basePath );
         size_t i = 0;
         for ( i = 0; i < bType.DataMemberSize(); ++i ) {
            Member dm = bType.DataMemberAt(i);
            if ( std::find( dataMembers.begin(),
                            dataMembers.end(),
                            dm ) == dataMembers.end()) {
               members.push_back( OwnedMember(dm) );
               dataMembers.push_back( dm );
            }
         }
         for ( i = 0; i < bType.FunctionMemberSize(); ++i ) {
            Member fm = bType.FunctionMemberAt( i );
            if ( std::find( functionMembers.begin(), 
                            functionMembers.end(),
                            fm ) == functionMembers.end()) {
               members.push_back( OwnedMember(fm) );
               functionMembers.push_back( fm );
            }
         }
         if ( bType ) (dynamic_cast<const Class*>(bType.ToTypeBase()))->UpdateMembers2( members,
                                                                                        dataMembers, 
                                                                                        functionMembers,
                                                                                        pathsToBase,
                                                                                        basePath );
      }
      basePath.pop_back();
   }
   /*
   // breath first search to find the "lowest" members in the hierarchy
   for ( bIter = fBases.begin(); bIter != fBases.end(); ++bIter ) {
   const Class * bClass = (*bIter)->toClass();
   if ( bClass ) {  bClass->UpdateMembers2( members,
   dataMembers, 
   functionMembers,
   pathsToBase,
   basePath );
   }
   }
   */
}


//-------------------------------------------------------------------------------
void ROOT::Reflex::Class::AddDataMember( const Member & dm ) const {
//-------------------------------------------------------------------------------
// Add data member dm to this class
   ScopeBase::AddDataMember( dm );
}


//-------------------------------------------------------------------------------
void ROOT::Reflex::Class::AddDataMember( const char * nam,
                                         const Type & typ,
                                         size_t offs,
                                         unsigned int modifiers ) const {
//-------------------------------------------------------------------------------
// Add data member to this class
   ScopeBase::AddDataMember( nam, typ, offs, modifiers );
}

    
//-------------------------------------------------------------------------------
void ROOT::Reflex::Class::RemoveDataMember( const Member & dm ) const {
//-------------------------------------------------------------------------------
// Remove data member dm from this class
   ScopeBase::RemoveDataMember( dm );
}

    
//-------------------------------------------------------------------------------
void ROOT::Reflex::Class::AddFunctionMember( const Member & fm ) const {
//-------------------------------------------------------------------------------
// Add function member fm to this class
   ScopeBase::AddFunctionMember( fm );
   if ( fm.IsConstructor() )    fConstructors.push_back( fm );
   else if ( fm.IsDestructor() ) fDestructor = fm;
}

    
//-------------------------------------------------------------------------------
void ROOT::Reflex::Class::AddFunctionMember( const char * nam,
                                             const Type & typ,
                                             StubFunction stubFP,
                                             void * stubCtx,
                                             const char * params,
                                             unsigned int modifiers ) const {
//-------------------------------------------------------------------------------
// Add function member to this class
   ScopeBase::AddFunctionMember(nam,typ,stubFP,stubCtx,params,modifiers);
   if ( 0 !=  (modifiers & CONSTRUCTOR )) fConstructors.push_back(fFunctionMembers[fFunctionMembers.size()-1]);
   // setting the destructor is not needed because it is always provided when building the class
}


//-------------------------------------------------------------------------------
void ROOT::Reflex::Class::RemoveFunctionMember( const Member & fm ) const {
//-------------------------------------------------------------------------------
// Remove function member from this class.
   ScopeBase::RemoveFunctionMember( fm );
}




//-------------------------------------------------------------------------------
void ROOT::Reflex::Class::GenerateDict( DictionaryGenerator & generator ) const {
//-------------------------------------------------------------------------------
   // Generate Dictionary information about itself.

   // Selection file usage
   bool selected = true;

   /*   
   // selection file used
   if (generator.fSelections.size() != 0 || generator.fPattern_selections.size() != 0) {
      selected = false;
      
      // normal selection
      for (unsigned i = 0; i < generator.fSelections.size(); ++i) {
         if (generator.fSelections.at(i) == (*this).Name(SCOPED)) {
            selected = true;
         }
      }

      // pattern selection
      for (unsigned i = 0; i < generator.fPattern_selections.size(); ++i) {
         if ((*this).Name(SCOPED).find(generator.fPattern_selections.at(i)) != std::string::npos) {
            selected = true;
         }
      }

   }
   // EndOf Selection file usage
   */

   if (selected == true) {
      
      std::string typenumber = generator.GetTypeNumber(ThisType());
   
      if (generator.fSelections.size() != 0 || generator.fPattern_selections.size() != 0) {
         std::cout << "  * selecting class " << (*this).Name(SCOPED) << "\n";
      }
   
      generator.AddIntoInstances("      " + generator.Replace_colon(ThisType().Name(SCOPED)) + "_dict();\n");

      // Outputten only, if inside a namespace 
      if (ThisType().DeclaringScope().IsTopScope() && (!DeclaringScope().IsNamespace()) ) {
         generator.AddIntoShadow("\nnamespace " + ThisType().Name() + " {");
      }

      // new
      if (ThisType().DeclaringScope().IsClass()) {  
         generator.AddIntoShadow("};");
      }
      
	   
	   
      
      // begin of the Dictionary-part
      generator.AddIntoShadow("\nclass " + generator.Replace_colon(ThisType().Name(SCOPED)) + " {\n");
      generator.AddIntoShadow("public:\n");
      
      
      
      if ((ThisType().DeclaringScope().IsClass())) {
         generator.AddIntoFree(";\n}\n");
      }

      generator.AddIntoFree("\n\n// ------ Dictionary for class " + ThisType().Name() + "\n");
      generator.AddIntoFree("void " + generator.Replace_colon(ThisType().Name(SCOPED)) + "_dict() {\n");
      generator.AddIntoFree("ClassBuilder(\"" + ThisType().Name(SCOPED));
      if      ( IsPublic()   ) generator.AddIntoFree("\", typeid(" + ThisType().Name(SCOPED) + "), sizeof(" + ThisType().Name(SCOPED) + "), ");
      else if ( IsProtected()) generator.AddIntoFree("\", typeid(ROOT::Reflex::ProtectedClass), 0,");
      else if ( IsPrivate()  ) generator.AddIntoFree("\", typeid(ROOT::Reflex::PrivateClass), 0,");

      if (ThisType().IsPublic())  generator.AddIntoFree("PUBLIC");
      if (ThisType().IsPrivate()) generator.AddIntoFree("PRIVATE");
      if (ThisType().IsProtected()) generator.AddIntoFree("PROTECTED");
      if (ThisType().IsVirtual()) generator.AddIntoFree(" | VIRTUAL");
      generator.AddIntoFree(" | CLASS)\n");

      generator.AddIntoClasses("\n// -- Stub functions for class " + ThisType().Name() + "--\n");

      
      for (Member_Iterator mi = (*this).Member_Begin();
           mi != (*this).Member_End(); ++mi) {
         (*mi).GenerateDict(generator);      // call Members' own gendict
      }

      if (ThisType().DeclaringScope().IsTopScope() && (!DeclaringScope().IsNamespace())) {
         generator.AddIntoShadow("\nnamespace " + ThisType().Name() + " {");
      }

//       std::stringstream tempcounter;
//       tempcounter << generator.fMethodCounter;
//       generator.AddIntoClasses("\nstatic void* method_x" + tempcounter.str());
//       generator.AddIntoClasses(" ( void*, const std::vector<void*>&, void*)\n{\n");
//       generator.AddIntoClasses("  static NewDelFunctions s_funcs;\n");

//       generator.AddIntoFree(".AddFunctionMember<void*(void)>(\"__getNewDelFunctions\", method_x" + tempcounter.str());
//       generator.AddIntoFree(", 0, 0, PUBLIC | ARTIFICIAL)");

//       std::string temp = "NewDelFunctionsT< ::" + ThisType().Name(SCOPED) + " >::";
//       generator.AddIntoClasses("  s_funcs.fNew         = " + temp + "new_T;\n");
//       generator.AddIntoClasses("  s_funcs.fNewArray    = " + temp + "newArray_T;\n");
//       generator.AddIntoClasses("  s_funcs.fDelete      = " + temp + "delete_T;\n");
//       generator.AddIntoClasses("  s_funcs.fDeleteArray = " + temp + "deleteArray_T;\n");
//       generator.AddIntoClasses("  s_funcs.fDestructor  = " + temp + "destruct_T;\n");
//       generator.AddIntoClasses("  return &s_funcs;\n}\n ");     

//       ++generator.fMethodCounter;

      if (ThisType().DeclaringScope().IsTopScope() && (!DeclaringScope().IsNamespace())) {
         generator.AddIntoShadow("}\n");        // End of top namespace
      }
 
      // Recursive call
      this->ScopeBase::GenerateDict(generator);
      
      
      if (!(ThisType().DeclaringScope().IsClass())) {
         generator.AddIntoShadow("};\n");
      }
      
      
      if (!(ThisType().DeclaringScope().IsClass())) {
         generator.AddIntoFree(";\n}\n");
      }

   }//new type
}
