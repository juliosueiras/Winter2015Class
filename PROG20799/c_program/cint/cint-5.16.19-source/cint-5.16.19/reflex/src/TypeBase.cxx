// @(#)root/reflex:$Name:  $:$Id: TypeBase.cxx,v 1.30 2006/11/30 11:37:15 roiser Exp $
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

#include "Reflex/internal/TypeBase.h"

#include "Reflex/Type.h"
#include "Reflex/internal/OwnedPropertyList.h"
#include "Reflex/Object.h"
#include "Reflex/Scope.h"
#include "Reflex/internal/TypeName.h"
#include "Reflex/Base.h"
#include "Reflex/TypeTemplate.h"
#include "Reflex/DictionaryGenerator.h"


#include "Array.h"
#include "Pointer.h"
#include "PointerToMember.h"
#include "Union.h"
#include "Enum.h"
#include "Fundamental.h"
#include "Function.h"
#include "Class.h"
#include "Typedef.h"
#include "ClassTemplateInstance.h"
#include "FunctionMemberTemplateInstance.h"

#include "Reflex/Tools.h"

#include "Reflex/Builder/TypeBuilder.h"

//-------------------------------------------------------------------------------
ROOT::Reflex::TypeBase::TypeBase( const char * nam, 
                                  size_t size,
                                  TYPE typeTyp, 
                                  const std::type_info & ti,
                                  const Type & finalType) 
   : fTypeInfo( &ti ), 
     fScope( Scope::__NIRVANA__() ),
     fSize( size ),
     fTypeType( typeTyp ),
     fPropertyList( OwnedPropertyList( new PropertyListImpl())),
     fBasePosition(Tools::GetBasePosition( nam)),
     fFinalType(finalType.Id() ? new Type(finalType) : 0 ),
     fRawType(0) {
//-------------------------------------------------------------------------------
// Construct the dictinary info for a type.
   Type t = TypeName::ByName( nam );
   if ( t.Id() == 0 ) { 
      fTypeName = new TypeName( nam, this, &ti ); 
   }
   else {
      fTypeName = (TypeName*)t.Id();
      if ( t.Id() != TypeName::ByTypeInfo(ti).Id()) fTypeName->SetTypeId( ti );
      if ( fTypeName->fTypeBase ) delete fTypeName->fTypeBase;
      fTypeName->fTypeBase = this;
   }

   if ( typeTyp != FUNDAMENTAL && 
        typeTyp != FUNCTION &&
        typeTyp != POINTER  ) {
      std::string sname = Tools::GetScopeName(nam);
      fScope = Scope::ByName(sname);
      if ( fScope.Id() == 0 ) fScope = (new ScopeName(sname.c_str(), 0))->ThisScope();
    
      // Set declaring At
      if ( fScope ) fScope.AddSubType(ThisType());
   }
}


//-------------------------------------------------------------------------------
ROOT::Reflex::TypeBase::~TypeBase( ) {
//-------------------------------------------------------------------------------
// Destructor.
   fPropertyList.Delete();
   if ( fFinalType ) delete fFinalType;
   if ( fRawType ) delete fRawType;
   if ( fTypeName->fTypeBase == this ) fTypeName->fTypeBase = 0;
}


//-------------------------------------------------------------------------------
ROOT::Reflex::TypeBase::operator ROOT::Reflex::Scope () const {
//-------------------------------------------------------------------------------
// Conversion operator to Scope.
   switch ( fTypeType ) {
   case CLASS:
   case STRUCT:
   case TYPETEMPLATEINSTANCE:
   case UNION:
   case ENUM:
      return (dynamic_cast<const ScopeBase*>(this))->ThisScope();
   case TYPEDEF:
      return FinalType();
   default:
      return Dummy::Scope();
   }
}


//-------------------------------------------------------------------------------
ROOT::Reflex::TypeBase::operator ROOT::Reflex::Type () const {
//-------------------------------------------------------------------------------
// Converison operator to Type.
   return ThisType();
}


//-------------------------------------------------------------------------------
void * ROOT::Reflex::TypeBase::Allocate() const {
//-------------------------------------------------------------------------------
// Allocate memory for this type.
   return malloc( fSize );
}


//-------------------------------------------------------------------------------
size_t ROOT::Reflex::TypeBase::ArrayLength() const {
//-------------------------------------------------------------------------------
// Return the length of the array type.
   return 0;
}


//-------------------------------------------------------------------------------
ROOT::Reflex::Base ROOT::Reflex::TypeBase::BaseAt( size_t /* nth */ ) const {
//-------------------------------------------------------------------------------
// Return the nth base info.
   throw RuntimeError("Type does not represent a Class/Struct");
   return Dummy::Base();
}


//-------------------------------------------------------------------------------
size_t ROOT::Reflex::TypeBase::BaseSize() const {
//-------------------------------------------------------------------------------
// Return number of bases.
   throw RuntimeError("Type does not represent a Class/Struct");
   return 0;
}


//-------------------------------------------------------------------------------
void ROOT::Reflex::TypeBase::Deallocate( void * instance ) const {
//-------------------------------------------------------------------------------
// Deallocate the memory for this type from instance.
   free( instance );
}


//-------------------------------------------------------------------------------
ROOT::Reflex::Scope ROOT::Reflex::TypeBase::DeclaringScope() const {
//-------------------------------------------------------------------------------
// Return the declaring scope of this type.
   return fScope;
}


//-------------------------------------------------------------------------------
ROOT::Reflex::Object ROOT::Reflex::TypeBase::CastObject( const Type & /* to */,
                                                         const Object & /* obj */ ) const {
//-------------------------------------------------------------------------------
// Cast this type into "to" using object "obj"
   throw RuntimeError("This function can only be called on Class/Struct");
   return Dummy::Object();
}


//-------------------------------------------------------------------------------
//const ROOT::Reflex::Object & 
//ROOT::Reflex::TypeBase::Construct( const Type &  /*signature*/,
//                                   const std::vector < Object > & /*values*/, 
//                                   void * /*mem*/ ) const {
//-------------------------------------------------------------------------------
//  return Object(ThisType(), Allocate());
//}


//-------------------------------------------------------------------------------
ROOT::Reflex::Object
ROOT::Reflex::TypeBase::Construct( const Type &  /*signature*/,
                                   const std::vector < void * > & /*values*/, 
                                   void * /*mem*/ ) const {
//-------------------------------------------------------------------------------
// Construct this type.
   return Object(ThisType(), Allocate());
}


//-------------------------------------------------------------------------------
ROOT::Reflex::Member ROOT::Reflex::TypeBase::DataMemberAt( size_t /* nth */ ) const {
//-------------------------------------------------------------------------------
// Return the nth data member.
   return Dummy::Member();
}


//-------------------------------------------------------------------------------
ROOT::Reflex::Member ROOT::Reflex::TypeBase::DataMemberByName( const std::string & /* nam */ ) const {
//-------------------------------------------------------------------------------
// Return data member by name.
   return Dummy::Member();
}


//-------------------------------------------------------------------------------
void ROOT::Reflex::TypeBase::Destruct( void * instance, 
                                       bool dealloc ) const {
//-------------------------------------------------------------------------------
// Destruct this type.
   if ( dealloc ) Deallocate(instance);
}


//-------------------------------------------------------------------------------
ROOT::Reflex::Type ROOT::Reflex::TypeBase::DynamicType( const Object & /* obj */ ) const {
//-------------------------------------------------------------------------------
// Return the dynamic type info of this type.
   throw RuntimeError("Type::DynamicType can only be called on Class/Struct");
   return Dummy::Type();
}


//-------------------------------------------------------------------------------
ROOT::Reflex::Type ROOT::Reflex::TypeBase::FinalType() const {
//-------------------------------------------------------------------------------
// Return the type without typedefs information.
   if ( fFinalType ) return *fFinalType;

   Type tmpType = ThisType();
   while ( tmpType.TypeType() == TYPEDEF ) tmpType = tmpType.ToType();

   Type retType = tmpType;

   while ( true ) {

      while ( tmpType.TypeType() == TYPEDEF ) tmpType = tmpType.ToType();

      switch ( tmpType.TypeType()) {

      case POINTER:
         tmpType = PointerBuilder(tmpType.ToType(),tmpType.TypeInfo()).ToType();
         break;
      case POINTERTOMEMBER:
         tmpType = PointerToMemberBuilder(tmpType.ToType(), tmpType.PointerToMemberScope(), tmpType.TypeInfo()).ToType();
         break;
      case ARRAY:
         tmpType = ArrayBuilder(tmpType.ToType(), tmpType.ArrayLength(), tmpType.TypeInfo()).ToType();
         break;
      case UNRESOLVED:
         return Dummy::Type();
      default:
         fFinalType = new Type(retType);
         return *fFinalType;
      }
   }
}


//-------------------------------------------------------------------------------
ROOT::Reflex::Member ROOT::Reflex::TypeBase::FunctionMemberAt( size_t /* nth */ ) const {
//-------------------------------------------------------------------------------
// Return the nth function member.
   return Dummy::Member();
}


//-------------------------------------------------------------------------------
ROOT::Reflex::Member ROOT::Reflex::TypeBase::FunctionMemberByName( const std::string & /* nam */,
                                                                           const Type & /* signature */ ) const {
//-------------------------------------------------------------------------------
// Return a function member by name.
   return Dummy::Member();
}


//-------------------------------------------------------------------------------
bool ROOT::Reflex::TypeBase::HasBase( const Type & /* cl */ ) const {
//-------------------------------------------------------------------------------
   // Return base info if type has base cl.
   return false;
}


//-------------------------------------------------------------------------------
void ROOT::Reflex::TypeBase::HideName() const {
//-------------------------------------------------------------------------------
// Append the string " @HIDDEN@" to a type name.
   fTypeName->HideName();
}


//-------------------------------------------------------------------------------
ROOT::Reflex::Member ROOT::Reflex::TypeBase::MemberByName( const std::string & /* nam */,
                                                           const Type & /* signature */) const {
//-------------------------------------------------------------------------------
// Return a member by name.
   return Dummy::Member();
}


//-------------------------------------------------------------------------------
ROOT::Reflex::Member ROOT::Reflex::TypeBase::MemberAt( size_t /* nth */ ) const {
//-------------------------------------------------------------------------------
// Return the nth member.
   return Dummy::Member();
}


//-------------------------------------------------------------------------------
ROOT::Reflex::MemberTemplate ROOT::Reflex::TypeBase::MemberTemplateAt( size_t /* nth */ ) const {
//-------------------------------------------------------------------------------
// Return the nth member template.
   return Dummy::MemberTemplate();
}


//-------------------------------------------------------------------------------
std::string ROOT::Reflex::TypeBase::Name( unsigned int mod ) const {
//-------------------------------------------------------------------------------
// Return the name of the type.
   if ( 0 != ( mod & ( SCOPED | S ))) return fTypeName->Name();
   return std::string(fTypeName->Name(), fBasePosition);
}


//-------------------------------------------------------------------------------
const std::string & ROOT::Reflex::TypeBase::SimpleName( size_t & pos, 
                                                        unsigned int mod ) const {
//-------------------------------------------------------------------------------
// Return the name of the type.
   if ( 0 != ( mod & ( SCOPED | S ))) {
      pos = 0;
      return fTypeName->Name();
   }
   pos = fBasePosition;
   return fTypeName->Name();
}


//-------------------------------------------------------------------------------
ROOT::Reflex::Type ROOT::Reflex::TypeBase::FunctionParameterAt( size_t /* nth */ ) const {
//-------------------------------------------------------------------------------
// Return the nth function parameter type.
   return Dummy::Type();
}


//-------------------------------------------------------------------------------
size_t ROOT::Reflex::TypeBase::FunctionParameterSize() const {
//-------------------------------------------------------------------------------
// Return the number of function parameters.
   return 0;
}


//-------------------------------------------------------------------------------
ROOT::Reflex::Scope ROOT::Reflex::TypeBase::PointerToMemberScope() const {
//-------------------------------------------------------------------------------
// Return the scope of a pointer to member type.
   return Dummy::Scope();
}


//-------------------------------------------------------------------------------
ROOT::Reflex::PropertyList ROOT::Reflex::TypeBase::Properties() const {
//-------------------------------------------------------------------------------
// Return the property list attached to this type.
   return fPropertyList;
}


//-------------------------------------------------------------------------------
ROOT::Reflex::Type ROOT::Reflex::TypeBase::RawType() const {
//-------------------------------------------------------------------------------
// Return the raw type of this type, removing all info of pointers, arrays, typedefs.
   if ( fRawType ) return *fRawType;
   
   Type rawType = ThisType();
   
   while ( true ) {
      
      switch (rawType.TypeType()) {
         
      case POINTER:
      case POINTERTOMEMBER:
      case TYPEDEF:
      case ARRAY:
         rawType = rawType.ToType();
         break;
      case UNRESOLVED:
         return Dummy::Type();
      default:
         fRawType = new Type(rawType);
         return *fRawType;
      }     
   }
}


//-------------------------------------------------------------------------------
ROOT::Reflex::Type ROOT::Reflex::TypeBase::ReturnType() const {
//-------------------------------------------------------------------------------
// Return the function return type.
   return Dummy::Type();
}


//-------------------------------------------------------------------------------
ROOT::Reflex::Scope ROOT::Reflex::TypeBase::SubScopeAt( size_t /* nth */ ) const {
//-------------------------------------------------------------------------------
// Return the nth sub scope.
   return Dummy::Scope();
}


//-------------------------------------------------------------------------------
ROOT::Reflex::Type ROOT::Reflex::TypeBase::SubTypeAt( size_t /* nth */ ) const {
//-------------------------------------------------------------------------------
// Return the nth sub type.
   return Dummy::Type();
}


//-------------------------------------------------------------------------------
ROOT::Reflex::Type ROOT::Reflex::TypeBase::TemplateArgumentAt( size_t /* nth */ ) const {
//-------------------------------------------------------------------------------
// Return the nth template argument.
   return Dummy::Type();
}


//-------------------------------------------------------------------------------
ROOT::Reflex::Type ROOT::Reflex::TypeBase::ToType() const {
//-------------------------------------------------------------------------------
// Return the underlying type.
   return Dummy::Type();
}


//-------------------------------------------------------------------------------
ROOT::Reflex::Type ROOT::Reflex::TypeBase::ThisType() const {
//-------------------------------------------------------------------------------
// Return the Type object pointing to this TypeBase.
   return fTypeName->ThisType();
}


//-------------------------------------------------------------------------------
std::string ROOT::Reflex::TypeBase::TypeTypeAsString() const {
//-------------------------------------------------------------------------------
// Return the kind of type as a string.
   switch ( fTypeType ) {
   case CLASS:
      return "CLASS";
      break;
   case STRUCT:
      return "STRUCT";
      break;
   case ENUM:
      return "ENUM";
      break;
   case FUNCTION:
      return "FUNCTION";
      break;
   case ARRAY:
      return "ARRAY";
      break;
   case FUNDAMENTAL:
      return "FUNDAMENTAL";
      break;
   case POINTER:
      return "POINTER";
      break;
   case REFERENCE:
      return "REFERENCE";
      break;
   case TYPEDEF:
      return "TYPEDEF";
      break;
   case TYPETEMPLATEINSTANCE:
      return "TYPETEMPLATEINSTANCE";
      break;
   case MEMBERTEMPLATEINSTANCE:
      return "MEMBERTEMPLATEINSTANCE";
      break;
   case UNRESOLVED:
      return "UNRESOLVED";
      break;
   default:
      return "Type " + Name() + "is not assigned to a TYPE";
   }
}


//-------------------------------------------------------------------------------
ROOT::Reflex::TypeTemplate ROOT::Reflex::TypeBase::SubTypeTemplateAt( size_t /* nth */ ) const {
//-------------------------------------------------------------------------------
// Return teh nth sub type template.
   return Dummy::TypeTemplate();
}


//-------------------------------------------------------------------------------
ROOT::Reflex::TYPE ROOT::Reflex::TypeBase::TypeType() const {
//-------------------------------------------------------------------------------
// Return the kind of type as an enum.
   return fTypeType;
}

//-------------------------------------------------------------------------------
void ROOT::Reflex::TypeBase::GenerateDict( DictionaryGenerator & /* generator */ ) const {
//-------------------------------------------------------------------------------
// Generate Dictionary information about itself.
}
