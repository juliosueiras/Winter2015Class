// @(#)root/cintex:$Id: CINTScopeBuilder.h 20882 2007-11-19 11:31:26Z rdm $
// Author: Pere Mato 2005

// Copyright CERN, CH-1211 Geneva 23, 2004-2005, All rights reserved.
//
// Permission to use, copy, modify, and distribute this software for any
// purpose is hereby granted without fee, provided that this copyright and
// permissions notice appear in all copies and derivatives.
//
// This software is provided "as is" without express or implied warranty.

#ifndef ROOT_Cintex_CINTScopeBuilder
#define ROOT_Cintex_CINTScopeBuilder

#include "Reflex/Scope.h"
#include "CINTdefs.h"

namespace ROOT {
   namespace Cintex {

      namespace CINTScopeBuilder {
         void Setup(const ROOT::Reflex::Scope&);
         void Setup(const ROOT::Reflex::Type&);    
      }
   }
}

#endif // ROOT_Cintex_CINTScopeBuilder
