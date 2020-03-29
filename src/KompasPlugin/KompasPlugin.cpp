#include "stdafx.h"

#include <sstream>

#include <LHead3d.h>
#include "LIBTOOL.H"

#include "Utility.h"


AFX_EXTENSION_MODULE StepDLL = { NULL, NULL };


extern "C" int APIENTRY
DllMain( HINSTANCE hInstance, DWORD dwReason, LPVOID lpReserved )
{
    UNREFERENCED_PARAMETER( lpReserved );

    if ( dwReason == DLL_PROCESS_ATTACH )
    {
        TRACE0( "DLL Initializing!" );
 
        if ( !AfxInitExtensionModule( StepDLL, hInstance ) )
            return 0;

        new CDynLinkLibrary( StepDLL );
    }
    else if ( dwReason == DLL_PROCESS_DETACH )
    {
        TRACE0( "DLL Terminating!" );
        AfxTermExtensionModule( StepDLL );
    }

    return 1;
}


unsigned int WINAPI LIBRARYID()
{
	return 100;
}


// Загрузить строку из ресурса
LPTSTR LoadStr( int id ) 
{ 
    static TCHAR buf[512]; 
    // Конвертировать строку в соответствии с текущим словарем
    ksConvertLangStrExT( StepDLL.hModule, id, buf, 512 );
    return buf;
}


void WINAPI LIBRARYENTRY( unsigned int ) 
{
    // Получить указатель на активный документ трехмерной модели
    IDocument3D* document3d = ksGetActive3dDocument();
    IPart* part = document3d->GetPart(pTop_Part);
    if (!part)
    {
        ShowInfoMessage(L"Not Part in Active Document.");
        return;
    }

    std::wstringstream ss;

    IBody* body = part->GetMainBody();
    IFaceCollection* faces = body->FaceCollection();
    for (long i = 0; i < faces->GetCount(); ++i)
    {
        IFaceDefinition* f = faces->GetByIndex(i);
        double area = f->GetArea(0x3);
        ss << area << "m^2" << std::endl;
    }

    ShowInfoMessage(ss.str());

    if(ReturnResult() != etSuccess)
        ResultNULL();
}


bool WINAPI SELECTFILTERPROC( IEntity* entity ) 
{
    return false;
}


int WINAPI SELECTCALLBACKPROC( IEntity * entity, IRequestInfo * info ) 
{
    return 0;
}
