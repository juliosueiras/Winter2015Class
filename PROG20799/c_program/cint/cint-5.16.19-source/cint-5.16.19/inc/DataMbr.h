/* /% C++ %/ */
/***********************************************************************
 * cint (C/C++ interpreter)
 ************************************************************************
 * Header file DataMbr.h
 ************************************************************************
 * Description:
 *  Extended Run Time Type Identification API
 ************************************************************************
 * Copyright(c) 1995~1998  Masaharu Goto 
 *
 * For the licensing terms see the file COPYING
 *
 ************************************************************************/


#ifndef G__DATAMEMBER_H
#define G__DATAMEMBER_H

#include "Api.h"

namespace Cint {

/*********************************************************************
* class G__DataMemberInfo
*
*
*********************************************************************/
class 
#ifndef __CINT__
G__EXPORT
#endif
G__DataMemberInfo {
 public:
  ~G__DataMemberInfo() {}
  G__DataMemberInfo(): handle(0), index(0), belongingclass(NULL), type() 
    { Init(); }
  G__DataMemberInfo(const G__DataMemberInfo& dmi): 
    handle(dmi.handle), index(dmi.index), belongingclass(dmi.belongingclass), 
    type(dmi.type) {}
  G__DataMemberInfo(class G__ClassInfo &a): handle(0), index(0), belongingclass(NULL), type()  
    { Init(a); }
  G__DataMemberInfo& operator=(const G__DataMemberInfo& dmi) {
    handle=dmi.handle; index=dmi.index; belongingclass=dmi.belongingclass;
    type=dmi.type; return *this;}


  void Init();
  void Init(class G__ClassInfo &a);
  void Init(long handlinin,long indexin,G__ClassInfo *belongingclassin);

  long Handle() { return(handle); }
  int Index() { return ((int)index); }
  const char *Name() ;
  const char *Title() ;
  G__TypeInfo* Type() { return(&type); }
  long Property();
  long Offset() ;
  int Bitfield();
  int ArrayDim() ;
  int MaxIndex(int dim) ;
  G__ClassInfo* MemberOf() { return(belongingclass); }
  void SetGlobalcomp(int globalcomp);
  int IsValid();
  int SetFilePos(const char* fname);
  int Next();
  int Prev();

  enum error_code { VALID, NOT_INT, NOT_DEF, IS_PRIVATE, UNKNOWN };
  const char *ValidArrayIndex(int *errnum = 0, char **errstr = 0);

  const char *FileName();
  int LineNumber();

 private:
  long handle;
  long index;
  G__ClassInfo *belongingclass;
  G__TypeInfo type;
};

}

using namespace Cint;
#endif
