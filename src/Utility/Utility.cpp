#include "Utility.h"

#include <afxcmn.h>

#include "LT_GrDlg.h"


void ShowInfoMessage(const std::wstring& message)
{
	MessageW(const_cast<wchar_t*>(message.c_str()));
}
