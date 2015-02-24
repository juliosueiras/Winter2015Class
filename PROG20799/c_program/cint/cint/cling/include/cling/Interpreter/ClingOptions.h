//--------------------------------------------------------------------*- C++ -*-
// CLING - the C++ LLVM-based InterpreterG :)
// version: $Id: ClingOptions.h 39129 2011-05-06 15:59:41Z axel $
// author:  Axel Naumann <axel@cern.ch>
//------------------------------------------------------------------------------

#ifndef CLING_CLINGOPTIONS_H
#define CLING_CLINGOPTIONS_H

namespace cling {
namespace driver {
namespace clingoptions {
   enum ID {
    OPT_INVALID = 0, // This is not an option ID.
#define OPTION(NAME, ID, KIND, GROUP, ALIAS, FLAGS, PARAM, \
               HELPTEXT, METAVAR) OPT_##ID,
#include "cling/Interpreter/ClingOptions.inc"
    LastOption
#undef OPTION
   };
}
}
}
#endif // CLING_CLINGOPTIONS_H


