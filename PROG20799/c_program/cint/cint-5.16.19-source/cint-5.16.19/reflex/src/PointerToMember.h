// @(#)root/reflex:$Name:  $:$Id: PointerToMember.h,v 1.13 2006/10/30 12:51:33 roiser Exp $
// Author: Stefan Roiser 2004

// Copyright CERN, CH-1211 Geneva 23, 2004-2006, All rights reserved.
//
// Permission to use, copy, modify, and distribute this software for any
// purpose is hereby granted without fee, provided that this copyright and
// permissions notice appear in all copies and derivatives.
//
// This software is provided "as is" without express or implied warranty.

#ifndef ROOT_Reflex_PointerToMember
#define ROOT_Reflex_PointerToMember

// Include files
#include "Reflex/internal/TypeBase.h"
#include "Reflex/Type.h"
#include "Reflex/Scope.h"

namespace ROOT {
   namespace Reflex {

      // forward declarations

      /** 
       * @class PointerToMember PointerToMember.h Reflex/PointerToMember.h
       * @author Stefan Roiser
       * @date   2004-01-28
       * @ingroup Ref
       */
      class PointerToMember : public TypeBase {

      public:

         /** default constructor */
         PointerToMember( const Type & pointerToMemberType,
                          const Scope & pointerToMemberScope,
                          const std::type_info & ti );


         /** destructor */
         virtual ~PointerToMember() {}


         /**
          * Name will return the fully qualified Name of the pointer At
          * @param  typedefexp expand typedefs or not
          * @return fully qualified Name of pointer At
          */
         std::string Name( unsigned int mod = 0 ) const;


         /**
          * PointerToMemberScope will return the scope of the pointer to member type
          * @return scope of the pointer to member type
          */
         Scope PointerToMemberScope() const;


         /** pointerToMemberType will return a pointer to the Type the pointer to
          * MemberAt points to
          * @return pointer to Type of pointer to MemberAt
          */
         Type ToType() const;


         /** static funtion that composes the At Name */
         static std::string BuildTypeName( const Type & pointerToMemberType,
                                           const Scope & pointerToMemberScope,
                                           unsigned int mod = SCOPED | QUALIFIED );

      private:

         /**
          * The type of the pointer to member type
          * @link aggregation
          * @label pointer to member type
          * @supplierCardinality 1
          * @clientCardinality 1
          */
         Type fPointerToMemberType;


         /** 
          * The scope of the pointer to member type
          * @link aggregation
          * @label pointer to member scope
          * @supplierCardinality 1
          * @clientCardinality 1
          */
         Scope fPointerToMemberScope;


      }; // class PointerToMember
   } // namespace Reflex
} // namespace ROOT


//-------------------------------------------------------------------------------
inline ROOT::Reflex::Scope ROOT::Reflex::PointerToMember::PointerToMemberScope() const {
//-------------------------------------------------------------------------------
   return fPointerToMemberScope;
}


//-------------------------------------------------------------------------------
inline ROOT::Reflex::Type ROOT::Reflex::PointerToMember::ToType() const {
//-------------------------------------------------------------------------------
   return fPointerToMemberType;
}


#endif // ROOT_Reflex_PointerToMember

