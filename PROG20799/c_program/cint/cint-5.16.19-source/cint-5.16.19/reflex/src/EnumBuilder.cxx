// @(#)root/reflex:$Name:  $:$Id: EnumBuilder.cxx,v 1.11 2006/11/02 09:01:19 roiser Exp $
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

#include "Reflex/Builder/EnumBuilder.h"
#include "Reflex/Member.h"
#include "Reflex/Callback.h"

#include "DataMember.h"
#include "Enum.h"

//-------------------------------------------------------------------------------
ROOT::Reflex::EnumBuilder::EnumBuilder( const char * nam,
                                        const std::type_info & ti,
                                        unsigned int modifiers ) {
//-------------------------------------------------------------------------------
// Construct a new enum dictionary info.
   fEnum = new Enum( nam, ti, modifiers );
}

//-------------------------------------------------------------------------------
ROOT::Reflex::EnumBuilder::~EnumBuilder() {
//-------------------------------------------------------------------------------
// Destructor of enum builder. Used for call back functions.
   FireClassCallback( *fEnum );
}


//-------------------------------------------------------------------------------
ROOT::Reflex::EnumBuilder & ROOT::Reflex::EnumBuilder::AddItem( const char * nam,
                                                                long value ) {  
//-------------------------------------------------------------------------------
// Add an item (as data member) to this enum scope.
   fEnum->AddDataMember( Member(new DataMember( nam, 
                                                Type::ByName("int"), 
                                                value, 
                                                0 )));
   return *this;
}


//-------------------------------------------------------------------------------
ROOT::Reflex::EnumBuilder & ROOT::Reflex::EnumBuilder::AddProperty( const char * key,
                                                                    Any value ) {
//-------------------------------------------------------------------------------
// Add a property info to this enum as any object.
   if ( fLastMember ) fLastMember.Properties().AddProperty( key , value );
   else                fEnum->Properties().AddProperty( key, value );
   return *this;
}


//-------------------------------------------------------------------------------
ROOT::Reflex::EnumBuilder &  ROOT::Reflex::EnumBuilder::AddProperty( const char * key,
                                                                     const char * value ) {
//-------------------------------------------------------------------------------
// Add a property info to this enum as string.
   AddProperty( key, Any(value));
   return *this;
}


//-------------------------------------------------------------------------------
ROOT::Reflex::Type ROOT::Reflex::EnumBuilder::ToType() {
//-------------------------------------------------------------------------------
// Return the type currently being built.
   return fEnum->ThisType();
}
