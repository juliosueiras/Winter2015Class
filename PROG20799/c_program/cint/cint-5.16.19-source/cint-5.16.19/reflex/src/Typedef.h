// @(#)root/reflex:$Name:  $:$Id: Typedef.h,v 1.18 2006/11/30 11:37:15 roiser Exp $
// Author: Stefan Roiser 2004

// Copyright CERN, CH-1211 Geneva 23, 2004-2006, All rights reserved.
//
// Permission to use, copy, modify, and distribute this software for any
// purpose is hereby granted without fee, provided that this copyright and
// permissions notice appear in all copies and derivatives.
//
// This software is provided "as is" without express or implied warranty.

#ifndef ROOT_Reflex_Typedef
#define ROOT_Reflex_Typedef

// Include files
#include "Reflex/internal/TypeBase.h"
#include "Reflex/Type.h"

namespace ROOT {
   namespace Reflex {

      // forward declarations
      class Base;
      class Object;
      class Member;
      class MemberTemplate;
      class Scope;
      class TypeTemplate;

      /**
       * @class Typedef Typedef.h Reflex/Typedef.h
       * @author Stefan Roiser
       * @date 24/11/2003
       * @ingroup Ref
       */
      class Typedef : public TypeBase {

      public:

         /** constructor */
         Typedef( const char * typ,
                  const Type & typedefType,
                  TYPE typeTyp = TYPEDEF,
                  const Type & finalType = Dummy::Type()) ;


         /** destructor */
         virtual ~Typedef();


         /**
          * nthBase will return the nth BaseAt class information
          * @param  nth nth BaseAt class
          * @return pointer to BaseAt class information
          */
         virtual Base BaseAt( size_t nth ) const;


         /**
          * BaseSize will return the number of BaseAt classes
          * @return number of BaseAt classes
          */
         virtual size_t BaseSize() const;


         virtual Base_Iterator Base_Begin() const;
         virtual Base_Iterator Base_End() const;
         virtual Reverse_Base_Iterator Base_RBegin() const;
         virtual Reverse_Base_Iterator Base_REnd() const;


         /**
          * CastObject an object from this class At to another one
          * @param  to is the class At to cast into
          * @param  obj the memory AddressGet of the object to be casted
          */
         virtual Object CastObject( const Type & to, 
                                    const Object & obj ) const;


         /**
          * DataMemberAt will return the nth data MemberAt of the At
          * @param  nth data MemberAt
          * @return pointer to data MemberAt
          */
         virtual Member DataMemberAt( size_t nth ) const;


         /**
          * DataMemberByName will return the MemberAt with Name
          * @param  Name of data MemberAt
          * @return data MemberAt
          */
         virtual Member DataMemberByName( const std::string & Name ) const;


         /**
          * DataMemberSize will return the number of data members of this At
          * @return number of data members
          */
         virtual size_t DataMemberSize() const;


         virtual Member_Iterator DataMember_Begin() const;
         virtual Member_Iterator DataMember_End() const;
         virtual Reverse_Member_Iterator DataMember_RBegin() const;
         virtual Reverse_Member_Iterator DataMember_REnd() const;


         /**
          * Destruct will call the destructor of a At and remove its memory
          * allocation if desired
          * @param  instance of the At in memory
          * @param  dealloc for also deallacoting the memory
          */
         virtual void Destruct( void * instance, 
                                bool dealloc = true ) const;


         /**
          * DynamicType is used to discover whether an object represents the
          * current class At or not
          * @param  mem is the memory AddressGet of the object to checked
          * @return the actual class of the object
          */
         virtual Type DynamicType( const Object & obj ) const;


         /**
          * FunctionMemberAt will return the nth function MemberAt of the At
          * @param  nth function MemberAt
          * @return pointer to function MemberAt
          */
         virtual Member FunctionMemberAt( size_t nth ) const;


         /**
          * FunctionMemberByName will return the MemberAt with the Name, 
          * optionally the signature of the function may be given
          * @param  Name of function MemberAt
          * @param  signature of the MemberAt function 
          * @return function MemberAt
          */
         virtual Member FunctionMemberByName( const std::string & Name,
                                              const Type & signature = Type() ) const;


         /**
          * FunctionMemberSize will return the number of function members of
          * this At
          * @return number of function members
          */
         virtual size_t FunctionMemberSize() const;


         virtual Member_Iterator FunctionMember_Begin() const;
         virtual Member_Iterator FunctionMember_End() const;
         virtual Reverse_Member_Iterator FunctionMember_RBegin() const;
         virtual Reverse_Member_Iterator FunctionMember_REnd() const;


         /**
          * HasBase will check whether this class has a BaseAt class given
          * as argument
          * @param  cl the BaseAt-class to check for
          * @return true if this class has a BaseAt-class cl, false otherwise
          */
         virtual bool HasBase( const Type & cl ) const;


         /**
          * IsAbstract will return true if the the class is abstract
          * @return true if the class is abstract
          */
         virtual bool IsAbstract() const;


         /** 
          * IsComplete will return true if all classes and BaseAt classes of this 
          * class are resolved and fully known in the system
          */
         virtual bool IsComplete() const;


         /**
          * IsVirtual will return true if the class contains a virtual table
          * @return true if the class contains a virtual table
          */
         virtual bool IsVirtual() const;


         /**
          * MemberByName will return the first MemberAt with a given Name
          * @param  MemberAt Name
          * @return pointer to MemberAt
          */
         virtual Member MemberByName( const std::string & Name,
                                              const Type & signature ) const;


         /**
          * MemberAt will return the nth MemberAt of the At
          * @param  nth MemberAt
          * @return pointer to nth MemberAt
          */
         virtual Member MemberAt( size_t nth ) const;


         /**
          * MemberSize will return the number of members
          * @return number of members
          */
         virtual size_t MemberSize() const;


         virtual Member_Iterator Member_Begin() const;
         virtual Member_Iterator Member_End() const;
         virtual Reverse_Member_Iterator Member_RBegin() const;
         virtual Reverse_Member_Iterator Member_REnd() const;


         /** 
          * MemberTemplateAt will return the nth MemberAt template of this At
          * @param nth MemberAt template
          * @return nth MemberAt template
          */
         virtual MemberTemplate MemberTemplateAt( size_t nth ) const;


         /** 
          * MemberTemplateSize will return the number of MemberAt templates in this socpe
          * @return number of defined MemberAt templates
          */
         virtual size_t MemberTemplateSize() const;


         virtual MemberTemplate_Iterator MemberTemplate_Begin() const;
         virtual MemberTemplate_Iterator MemberTemplate_End() const;
         virtual Reverse_MemberTemplate_Iterator MemberTemplate_RBegin() const;
         virtual Reverse_MemberTemplate_Iterator MemberTemplate_REnd() const;


         /**
          * Name will return the fully qualified Name of the Typedef
          * @param  typedefexp expand typedefs or not
          * @return fully expanded Name of typedef
          */
         virtual std::string Name( unsigned int mod = 0 ) const;


         /**
          * SimpleName returns the name of the type as a reference. It provides a 
          * simplified but faster generation of a type name. Attention currently it
          * is not guaranteed that Name() and SimpleName() return the same character 
          * layout of a name (ie. spacing, commas, etc. )
          * @param pos will indicate where in the returned reference the requested name starts
          * @param mod The only 'mod' support is SCOPED
          * @return name of type
          */
         virtual const std::string & SimpleName( size_t & pos, 
                                                 unsigned int mod = 0 ) const;

 
         virtual Type_Iterator FunctionParameter_Begin() const;
         virtual Type_Iterator FunctionParameter_End() const;
         virtual Reverse_Type_Iterator FunctionParameter_RBegin() const;
         virtual Reverse_Type_Iterator FunctionParameter_REnd() const;


         /**
          * SubScopeAt will return a pointer to a sub-scopes
          * @param  nth sub-At
          * @return pointer to nth sub-At
          */
         virtual Scope SubScopeAt( size_t nth ) const;


         /**
          * ScopeSize will return the number of sub-scopes
          * @return number of sub-scopes
          */
         virtual size_t SubScopeSize() const;


         virtual Scope_Iterator SubScope_Begin() const;
         virtual Scope_Iterator SubScope_End() const;
         virtual Reverse_Scope_Iterator SubScope_RBegin() const;
         virtual Reverse_Scope_Iterator SubScope_REnd() const;


         /**
          * nthType will return a pointer to the nth sub-At
          * @param  nth sub-At
          * @return pointer to nth sub-At
          */
         virtual Type SubTypeAt( size_t nth ) const;


         /**
          * TypeSize will returnt he number of sub-types
          * @return number of sub-types
          */
         virtual size_t SubTypeSize() const;


         virtual Type_Iterator SubType_Begin() const;
         virtual Type_Iterator SubType_End() const;
         virtual Reverse_Type_Iterator SubType_RBegin() const;
         virtual Reverse_Type_Iterator SubType_REnd() const;


         /**
          * TemplateArgumentAt will return a pointer to the nth template argument
          * @param  nth nth template argument
          * @return pointer to nth template argument
          */
         virtual Type TemplateArgumentAt( size_t nth ) const;


         /**
          * templateArgSize will return the number of template arguments
          * @return number of template arguments
          */
         virtual size_t TemplateArgumentSize() const;


         virtual Type_Iterator TemplateArgument_Begin() const;
         virtual Type_Iterator TemplateArgument_End() const;
         virtual Reverse_Type_Iterator TemplateArgument_RBegin() const;
         virtual Reverse_Type_Iterator TemplateArgument_REnd() const;


         /**
          * TemplateFamily returns the corresponding TypeTemplate if any
          * @return corresponding TypeTemplate
          */
         virtual TypeTemplate TemplateFamily() const;


         /** 
          * SubTypeTemplateAt will return the nth At template of this At
          * @param nth At template
          * @return nth At template
          */
         virtual TypeTemplate SubTypeTemplateAt( size_t nth ) const;


         /** 
          * SubTypeTemplateSize will return the number of At templates in this socpe
          * @return number of defined At templates
          */
         virtual size_t SubTypeTemplateSize() const;


         virtual TypeTemplate_Iterator SubTypeTemplate_Begin() const;
         virtual TypeTemplate_Iterator SubTypeTemplate_End() const;
         virtual Reverse_TypeTemplate_Iterator SubTypeTemplate_RBegin() const;
         virtual Reverse_TypeTemplate_Iterator SubTypeTemplate_REnd() const;


         /**
          * TypeInfo will return the c++ type_info object of the At
          * @return type_info object of At
          */
         virtual const std::type_info & TypeInfo() const;


         /**
          * typedefType will return a pointer to the At of the typedef.
          * @return pointer to Type of MemberAt et. al.
          */
         virtual Type ToType() const;

      private:  

         bool ForwardStruct() const;
         bool ForwardTemplate() const;
         bool ForwardFunction() const;
        
      private:

         /**
          * pointer to the type of the typedef
          * @label typedef type
          * @link aggregation
          * @supplierCardinality 1
          * @clientCardinality 1
          */
         Type fTypedefType;

      }; // class Typedef
   } //namespace Reflex
} //namespace ROOT

#include "Reflex/Base.h"
#include "Reflex/Object.h"
#include "Reflex/Member.h"
#include "Reflex/MemberTemplate.h"
#include "Reflex/Scope.h"
#include "Reflex/TypeTemplate.h"

//-------------------------------------------------------------------------------
inline ROOT::Reflex::Base ROOT::Reflex::Typedef::BaseAt( size_t nth ) const {
//-------------------------------------------------------------------------------
   if ( ForwardStruct()) return fTypedefType.BaseAt( nth );
   return Dummy::Base();  
}


//-------------------------------------------------------------------------------
inline size_t ROOT::Reflex::Typedef::BaseSize() const {
//-------------------------------------------------------------------------------
   if ( ForwardStruct()) return fTypedefType.BaseSize();
   return 0;  
}


//-------------------------------------------------------------------------------
inline ROOT::Reflex::Base_Iterator ROOT::Reflex::Typedef::Base_Begin() const {
//-------------------------------------------------------------------------------
   if ( ForwardStruct()) return fTypedefType.Base_Begin();
   return Base_Iterator();
}


//-------------------------------------------------------------------------------
inline ROOT::Reflex::Base_Iterator ROOT::Reflex::Typedef::Base_End() const {
//-------------------------------------------------------------------------------
   if ( ForwardStruct()) return fTypedefType.Base_End();
   return Base_Iterator();
}


//-------------------------------------------------------------------------------
inline ROOT::Reflex::Reverse_Base_Iterator ROOT::Reflex::Typedef::Base_RBegin() const {
//-------------------------------------------------------------------------------
   if ( ForwardStruct()) return fTypedefType.Base_RBegin();
   return Reverse_Base_Iterator();
}


//-------------------------------------------------------------------------------
inline ROOT::Reflex::Reverse_Base_Iterator ROOT::Reflex::Typedef::Base_REnd() const {
//-------------------------------------------------------------------------------
   if ( ForwardStruct()) return fTypedefType.Base_REnd();
   return Reverse_Base_Iterator();
}


//-------------------------------------------------------------------------------
inline ROOT::Reflex::Object ROOT::Reflex::Typedef::CastObject( const Type & to,
                                                               const Object & obj ) const {
//-------------------------------------------------------------------------------
   if ( ForwardStruct()) return fTypedefType.CastObject( to, obj );
   return Dummy::Object();
}


//-------------------------------------------------------------------------------
inline ROOT::Reflex::Member ROOT::Reflex::Typedef::DataMemberAt( size_t nth ) const {
//-------------------------------------------------------------------------------
   if ( ForwardStruct()) return fTypedefType.DataMemberAt( nth );
   return Dummy::Member();
}


//-------------------------------------------------------------------------------
inline ROOT::Reflex::Member ROOT::Reflex::Typedef::DataMemberByName( const std::string & name ) const {
//-------------------------------------------------------------------------------
   if ( ForwardStruct()) return fTypedefType.DataMemberByName( name );
   return Dummy::Member();
}


//-------------------------------------------------------------------------------
inline size_t ROOT::Reflex::Typedef::DataMemberSize() const {
//-------------------------------------------------------------------------------
   if ( ForwardStruct()) return fTypedefType.DataMemberSize();
   return 0;
}


//-------------------------------------------------------------------------------
inline ROOT::Reflex::Member_Iterator ROOT::Reflex::Typedef::DataMember_Begin() const {
//-------------------------------------------------------------------------------
   if ( ForwardStruct()) return fTypedefType.DataMember_Begin();
   return Dummy::MemberCont().begin();
}


//-------------------------------------------------------------------------------
inline ROOT::Reflex::Member_Iterator ROOT::Reflex::Typedef::DataMember_End() const {
//-------------------------------------------------------------------------------
   if ( ForwardStruct()) return fTypedefType.DataMember_End();
   return Dummy::MemberCont().end();
}


//-------------------------------------------------------------------------------
inline ROOT::Reflex::Reverse_Member_Iterator ROOT::Reflex::Typedef::DataMember_RBegin() const {
//-------------------------------------------------------------------------------
   if ( ForwardStruct()) return fTypedefType.DataMember_RBegin();
   return Dummy::MemberCont().rbegin();
}


//-------------------------------------------------------------------------------
inline ROOT::Reflex::Reverse_Member_Iterator ROOT::Reflex::Typedef::DataMember_REnd() const {
//-------------------------------------------------------------------------------
   if ( ForwardStruct()) return fTypedefType.DataMember_REnd();
   return Dummy::MemberCont().rend();
}


//-------------------------------------------------------------------------------
inline void ROOT::Reflex::Typedef::Destruct( void * instance,
                                             bool dealloc ) const {
//-------------------------------------------------------------------------------
   if ( ForwardStruct()) fTypedefType.Destruct( instance, dealloc );
}


//-------------------------------------------------------------------------------
inline ROOT::Reflex::Type ROOT::Reflex::Typedef::DynamicType( const Object & obj ) const {
//-------------------------------------------------------------------------------
   if ( ForwardStruct()) return fTypedefType.DynamicType( obj );
   return Dummy::Type();
}


//-------------------------------------------------------------------------------
inline ROOT::Reflex::Member ROOT::Reflex::Typedef::FunctionMemberAt( size_t nth ) const {
//-------------------------------------------------------------------------------
   if ( ForwardStruct()) return fTypedefType.FunctionMemberAt( nth );
   return Dummy::Member();
}


//-------------------------------------------------------------------------------
inline ROOT::Reflex::Member ROOT::Reflex::Typedef::FunctionMemberByName( const std::string & name,
                                                                                 const Type & signature ) const {
//-------------------------------------------------------------------------------
   if ( ForwardStruct()) return fTypedefType.FunctionMemberByName( name, signature );
   return Dummy::Member();
}


//-------------------------------------------------------------------------------
inline size_t ROOT::Reflex::Typedef::FunctionMemberSize() const {
//-------------------------------------------------------------------------------
   if ( ForwardStruct()) return fTypedefType.FunctionMemberSize();
   return 0;
}


//-------------------------------------------------------------------------------
inline ROOT::Reflex::Member_Iterator ROOT::Reflex::Typedef::FunctionMember_Begin() const {
//-------------------------------------------------------------------------------
   if ( ForwardStruct()) return fTypedefType.FunctionMember_Begin();
   return Dummy::MemberCont().begin();
}


//-------------------------------------------------------------------------------
inline ROOT::Reflex::Member_Iterator ROOT::Reflex::Typedef::FunctionMember_End() const {
//-------------------------------------------------------------------------------
   if ( ForwardStruct()) return fTypedefType.FunctionMember_End();
   return Dummy::MemberCont().end();
}


//-------------------------------------------------------------------------------
inline ROOT::Reflex::Reverse_Member_Iterator ROOT::Reflex::Typedef::FunctionMember_RBegin() const {
//-------------------------------------------------------------------------------
   if ( ForwardStruct()) return fTypedefType.FunctionMember_RBegin();
   return Dummy::MemberCont().rbegin();
}


//-------------------------------------------------------------------------------
inline ROOT::Reflex::Reverse_Member_Iterator ROOT::Reflex::Typedef::FunctionMember_REnd() const {
//-------------------------------------------------------------------------------
   if ( ForwardStruct()) return fTypedefType.FunctionMember_REnd();
   return Dummy::MemberCont().rend();
}


//-------------------------------------------------------------------------------
inline bool ROOT::Reflex::Typedef::HasBase( const Type & cl ) const {
//-------------------------------------------------------------------------------
   if ( ForwardStruct()) return fTypedefType.HasBase( cl );
   return false;
}


//-------------------------------------------------------------------------------
inline bool ROOT::Reflex::Typedef::IsAbstract() const {
//-------------------------------------------------------------------------------
   if ( ForwardStruct()) return fTypedefType.IsAbstract();
   return false;
}


//-------------------------------------------------------------------------------
inline bool ROOT::Reflex::Typedef::IsComplete() const {
//-------------------------------------------------------------------------------
   if ( ForwardStruct()) return fTypedefType.IsComplete();
   return false;
}


//-------------------------------------------------------------------------------
inline bool ROOT::Reflex::Typedef::IsVirtual() const {
//-------------------------------------------------------------------------------
   if ( ForwardStruct()) return fTypedefType.IsVirtual();
   return false;
}


//-------------------------------------------------------------------------------
inline ROOT::Reflex::Member ROOT::Reflex::Typedef::MemberByName( const std::string & name,
                                                                         const Type & signature ) const {
//-------------------------------------------------------------------------------
   if ( ForwardStruct()) return fTypedefType.MemberByName( name, signature );
   return Dummy::Member();
}


//-------------------------------------------------------------------------------
inline ROOT::Reflex::Member ROOT::Reflex::Typedef::MemberAt( size_t nth ) const {
//-------------------------------------------------------------------------------
   if ( ForwardStruct()) return fTypedefType.MemberAt( nth );
   return Dummy::Member();
}


//-------------------------------------------------------------------------------
inline size_t ROOT::Reflex::Typedef::MemberSize() const {
//-------------------------------------------------------------------------------
   if ( ForwardStruct()) return fTypedefType.MemberSize();
   return 0;
}


//-------------------------------------------------------------------------------
inline ROOT::Reflex::Member_Iterator ROOT::Reflex::Typedef::Member_Begin() const {
//-------------------------------------------------------------------------------
   if ( ForwardStruct()) return fTypedefType.Member_Begin();
   return Dummy::MemberCont().begin();
}


//-------------------------------------------------------------------------------
inline ROOT::Reflex::Member_Iterator ROOT::Reflex::Typedef::Member_End() const {
//-------------------------------------------------------------------------------
   if ( ForwardStruct()) return fTypedefType.Member_End();
   return Dummy::MemberCont().end();
}


//-------------------------------------------------------------------------------
inline ROOT::Reflex::Reverse_Member_Iterator ROOT::Reflex::Typedef::Member_RBegin() const {
//-------------------------------------------------------------------------------
   if ( ForwardStruct()) return fTypedefType.Member_RBegin();
   return Dummy::MemberCont().rbegin();
}


//-------------------------------------------------------------------------------
inline ROOT::Reflex::Reverse_Member_Iterator ROOT::Reflex::Typedef::Member_REnd() const {
//-------------------------------------------------------------------------------
   if ( ForwardStruct()) return fTypedefType.Member_REnd();
   return Dummy::MemberCont().rend();  
}


//-------------------------------------------------------------------------------
inline ROOT::Reflex::MemberTemplate ROOT::Reflex::Typedef::MemberTemplateAt( size_t nth ) const {
//-------------------------------------------------------------------------------
   if ( ForwardStruct()) return fTypedefType.MemberTemplateAt( nth );
   return Dummy::MemberTemplate();
}


//-------------------------------------------------------------------------------
inline size_t ROOT::Reflex::Typedef::MemberTemplateSize() const {
//-------------------------------------------------------------------------------
   if ( ForwardStruct()) return fTypedefType.MemberTemplateSize();
   return 0;
}


//-------------------------------------------------------------------------------
inline ROOT::Reflex::MemberTemplate_Iterator ROOT::Reflex::Typedef::MemberTemplate_Begin() const {
//-------------------------------------------------------------------------------
   if ( ForwardStruct()) return fTypedefType.MemberTemplate_Begin();
   return Dummy::MemberTemplateCont().begin();
}


//-------------------------------------------------------------------------------
inline ROOT::Reflex::MemberTemplate_Iterator ROOT::Reflex::Typedef::MemberTemplate_End() const {
//-------------------------------------------------------------------------------
   if ( ForwardStruct()) return fTypedefType.MemberTemplate_End();
   return Dummy::MemberTemplateCont().end();
}


//-------------------------------------------------------------------------------
inline ROOT::Reflex::Reverse_MemberTemplate_Iterator ROOT::Reflex::Typedef::MemberTemplate_RBegin() const {
//-------------------------------------------------------------------------------
   if ( ForwardStruct()) return fTypedefType.MemberTemplate_RBegin();
   return Dummy::MemberTemplateCont().rbegin();
}


//-------------------------------------------------------------------------------
inline ROOT::Reflex::Reverse_MemberTemplate_Iterator ROOT::Reflex::Typedef::MemberTemplate_REnd() const {
//-------------------------------------------------------------------------------
   if ( ForwardStruct()) return fTypedefType.MemberTemplate_REnd(); 
   return Dummy::MemberTemplateCont().rend();
}


//-------------------------------------------------------------------------------
inline ROOT::Reflex::Type_Iterator ROOT::Reflex::Typedef::FunctionParameter_Begin() const {
//-------------------------------------------------------------------------------
   if ( ForwardFunction()) return fTypedefType.FunctionParameter_Begin();
   return Dummy::TypeCont().begin();
}


//-------------------------------------------------------------------------------
inline ROOT::Reflex::Type_Iterator ROOT::Reflex::Typedef::FunctionParameter_End() const {
//-------------------------------------------------------------------------------
   if ( ForwardFunction()) return fTypedefType.FunctionParameter_End();
   return Dummy::TypeCont().end();
}


//-------------------------------------------------------------------------------
inline ROOT::Reflex::Reverse_Type_Iterator ROOT::Reflex::Typedef::FunctionParameter_RBegin() const {
//-------------------------------------------------------------------------------
   if ( ForwardFunction()) return fTypedefType.FunctionParameter_RBegin();
   return Dummy::TypeCont().rbegin();
}


//-------------------------------------------------------------------------------
inline ROOT::Reflex::Reverse_Type_Iterator ROOT::Reflex::Typedef::FunctionParameter_REnd() const {
//-------------------------------------------------------------------------------
   if ( ForwardFunction()) return fTypedefType.FunctionParameter_REnd();
   return Dummy::TypeCont().rend();
}


//-------------------------------------------------------------------------------
inline std::string ROOT::Reflex::Typedef::Name( unsigned int mod ) const {
//-------------------------------------------------------------------------------
   if ( 0 != ( mod & ( FINAL | F ))) return FinalType().Name( mod );
   else                              return TypeBase::Name( mod );
}


//-------------------------------------------------------------------------------
inline const std::string&  ROOT::Reflex::Typedef::SimpleName( size_t & pos, 
                                                              unsigned int mod ) const {
//-------------------------------------------------------------------------------
   return TypeBase::SimpleName( pos, mod );
}


//-------------------------------------------------------------------------------
inline ROOT::Reflex::Scope ROOT::Reflex::Typedef::SubScopeAt( size_t nth ) const {
//-------------------------------------------------------------------------------
   if ( ForwardStruct()) return fTypedefType.SubScopeAt( nth );
   return Dummy::Scope();
}


//-------------------------------------------------------------------------------
inline size_t ROOT::Reflex::Typedef::SubScopeSize() const {
//-------------------------------------------------------------------------------
   if ( ForwardStruct()) return fTypedefType.SubScopeSize();
   return 0;
}


//-------------------------------------------------------------------------------
inline ROOT::Reflex::Scope_Iterator ROOT::Reflex::Typedef::SubScope_Begin() const {
//-------------------------------------------------------------------------------
   if ( ForwardStruct()) return fTypedefType.SubScope_Begin();
   return Dummy::ScopeCont().begin();
}


//-------------------------------------------------------------------------------
inline ROOT::Reflex::Scope_Iterator ROOT::Reflex::Typedef::SubScope_End() const {
//-------------------------------------------------------------------------------
   if ( ForwardStruct()) return fTypedefType.SubScope_End();
   return Dummy::ScopeCont().end();
}


//-------------------------------------------------------------------------------
inline ROOT::Reflex::Reverse_Scope_Iterator ROOT::Reflex::Typedef::SubScope_RBegin() const {
//-------------------------------------------------------------------------------
   if ( ForwardStruct()) return fTypedefType.SubScope_RBegin();
   return Dummy::ScopeCont().rbegin();
}


//-------------------------------------------------------------------------------
inline ROOT::Reflex::Reverse_Scope_Iterator ROOT::Reflex::Typedef::SubScope_REnd() const {
//-------------------------------------------------------------------------------
   if ( ForwardStruct()) return fTypedefType.SubScope_REnd();
   return Dummy::ScopeCont().rend();
}


//-------------------------------------------------------------------------------
inline ROOT::Reflex::Type ROOT::Reflex::Typedef::SubTypeAt( size_t nth ) const {
//-------------------------------------------------------------------------------
   if ( ForwardStruct()) return fTypedefType.SubTypeAt( nth );
   return Dummy::Type();
}


//-------------------------------------------------------------------------------
inline size_t ROOT::Reflex::Typedef::SubTypeSize() const {
//-------------------------------------------------------------------------------
   if ( ForwardStruct()) return fTypedefType.SubTypeSize();
   return 0;
}


//-------------------------------------------------------------------------------
inline ROOT::Reflex::Type_Iterator ROOT::Reflex::Typedef::SubType_Begin() const {
//-------------------------------------------------------------------------------
   if ( ForwardStruct()) return fTypedefType.SubType_Begin();
   return Dummy::TypeCont().begin();
}


//-------------------------------------------------------------------------------
inline ROOT::Reflex::Type_Iterator ROOT::Reflex::Typedef::SubType_End() const {
//-------------------------------------------------------------------------------
   if ( ForwardStruct()) return fTypedefType.SubType_End();
   return Dummy::TypeCont().end();
}


//-------------------------------------------------------------------------------
inline ROOT::Reflex::Reverse_Type_Iterator ROOT::Reflex::Typedef::SubType_RBegin() const {
//-------------------------------------------------------------------------------
   if ( ForwardStruct()) return fTypedefType.SubType_RBegin();
   return Dummy::TypeCont().rbegin();
}


//-------------------------------------------------------------------------------
inline ROOT::Reflex::Reverse_Type_Iterator ROOT::Reflex::Typedef::SubType_REnd() const {
//-------------------------------------------------------------------------------
   if ( ForwardStruct()) return fTypedefType.SubType_REnd();
   return Dummy::TypeCont().rend();
}


//-------------------------------------------------------------------------------
inline ROOT::Reflex::Type ROOT::Reflex::Typedef::TemplateArgumentAt( size_t nth ) const {
//-------------------------------------------------------------------------------
   if ( ForwardTemplate()) return fTypedefType.TemplateArgumentAt( nth );
   return Dummy::Type();
}


//-------------------------------------------------------------------------------
inline size_t ROOT::Reflex::Typedef::TemplateArgumentSize() const {
//-------------------------------------------------------------------------------
   if ( ForwardTemplate()) return fTypedefType.TemplateArgumentSize();
   return 0;
}


//-------------------------------------------------------------------------------
inline ROOT::Reflex::Type_Iterator ROOT::Reflex::Typedef::TemplateArgument_Begin() const {
//-------------------------------------------------------------------------------
   if ( ForwardTemplate()) return fTypedefType.TemplateArgument_Begin();
   return Dummy::TypeCont().begin();
}


//-------------------------------------------------------------------------------
inline ROOT::Reflex::Type_Iterator ROOT::Reflex::Typedef::TemplateArgument_End() const {
//-------------------------------------------------------------------------------
   if ( ForwardTemplate()) return fTypedefType.TemplateArgument_End();
   return Dummy::TypeCont().end();
}


//-------------------------------------------------------------------------------
inline ROOT::Reflex::Reverse_Type_Iterator ROOT::Reflex::Typedef::TemplateArgument_RBegin() const {
//-------------------------------------------------------------------------------
   if ( ForwardTemplate()) return fTypedefType.TemplateArgument_RBegin();
   return Dummy::TypeCont().rbegin();
}


//-------------------------------------------------------------------------------
inline ROOT::Reflex::Reverse_Type_Iterator ROOT::Reflex::Typedef::TemplateArgument_REnd() const {
//-------------------------------------------------------------------------------
   if ( ForwardTemplate()) return fTypedefType.TemplateArgument_REnd();
   return Dummy::TypeCont().rend();
}


//-------------------------------------------------------------------------------
inline ROOT::Reflex::TypeTemplate ROOT::Reflex::Typedef::TemplateFamily() const {
//-------------------------------------------------------------------------------
   if ( ForwardTemplate()) return fTypedefType.TemplateFamily();
   return Dummy::TypeTemplate();
}


//-------------------------------------------------------------------------------
inline ROOT::Reflex::TypeTemplate ROOT::Reflex::Typedef::SubTypeTemplateAt( size_t nth ) const {
//-------------------------------------------------------------------------------
   if ( ForwardStruct()) return fTypedefType.SubTypeTemplateAt( nth );
   return Dummy::TypeTemplate();
}


//-------------------------------------------------------------------------------
inline size_t ROOT::Reflex::Typedef::SubTypeTemplateSize() const {
//-------------------------------------------------------------------------------
   if ( ForwardStruct()) return fTypedefType.SubTypeTemplateSize();
   return 0;
}


//-------------------------------------------------------------------------------
inline ROOT::Reflex::TypeTemplate_Iterator ROOT::Reflex::Typedef::SubTypeTemplate_Begin() const {
//-------------------------------------------------------------------------------
   if ( ForwardStruct()) return fTypedefType.SubTypeTemplate_Begin();
   return Dummy::TypeTemplateCont().begin();
}


//-------------------------------------------------------------------------------
inline ROOT::Reflex::TypeTemplate_Iterator ROOT::Reflex::Typedef::SubTypeTemplate_End() const {
//-------------------------------------------------------------------------------
   if ( ForwardStruct()) return fTypedefType.SubTypeTemplate_End();
   return Dummy::TypeTemplateCont().end();
}


//-------------------------------------------------------------------------------
inline ROOT::Reflex::Reverse_TypeTemplate_Iterator ROOT::Reflex::Typedef::SubTypeTemplate_RBegin() const {
//-------------------------------------------------------------------------------
   if ( ForwardStruct()) return fTypedefType.SubTypeTemplate_RBegin();
   return Dummy::TypeTemplateCont().rbegin();
}


//-------------------------------------------------------------------------------
inline ROOT::Reflex::Reverse_TypeTemplate_Iterator ROOT::Reflex::Typedef::SubTypeTemplate_REnd() const {
//-------------------------------------------------------------------------------
   if ( ForwardStruct()) return fTypedefType.SubTypeTemplate_REnd();
   return Dummy::TypeTemplateCont().rend();
}


//-------------------------------------------------------------------------------
inline const std::type_info & ROOT::Reflex::Typedef::TypeInfo() const {
//-------------------------------------------------------------------------------
   if ( *fTypeInfo != typeid(UnknownType) ) return *fTypeInfo;
   Type current = ThisType();
   while ( current.TypeType() == TYPEDEF ) current = current.ToType();
   if ( current && current.TypeInfo() != typeid(UnknownType)) fTypeInfo = &current.TypeInfo();
   return *fTypeInfo;
}


//-------------------------------------------------------------------------------
inline ROOT::Reflex::Type ROOT::Reflex::Typedef::ToType() const {
//-------------------------------------------------------------------------------
   return fTypedefType;
}


//-------------------------------------------------------------------------------
inline bool ROOT::Reflex::Typedef::ForwardStruct() const {
//-------------------------------------------------------------------------------
   switch ( fTypedefType.TypeType()) {
   case TYPEDEF:
   case CLASS:
   case STRUCT:
   case TYPETEMPLATEINSTANCE:
      return true;
   default:
      return false;
   }
}


//-------------------------------------------------------------------------------
inline bool ROOT::Reflex::Typedef::ForwardTemplate() const {
//-------------------------------------------------------------------------------
   switch ( fTypedefType.TypeType()) {
   case TYPEDEF:
   case TYPETEMPLATEINSTANCE:
   case MEMBERTEMPLATEINSTANCE:
      return true;
   default:
      return false;
   }
}


//-------------------------------------------------------------------------------
inline bool ROOT::Reflex::Typedef::ForwardFunction() const {
//-------------------------------------------------------------------------------
   switch ( fTypedefType.TypeType()) {
   case TYPEDEF:
   case FUNCTION:
      return true;
   default:
      return false;
   }
}


 
#endif // ROOT_Reflex_Typedef



