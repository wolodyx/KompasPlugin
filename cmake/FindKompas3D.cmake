add_library(Kompas3D INTERFACE IMPORTED GLOBAL)

set(Kompas3D_SDK_Dir "c:/Program Files (x86)/ASCON/KOMPAS-3D LT V12/SDK")
set(Kompas3D_Lib_Dir "c:/Program Files (x86)/ASCON/KOMPAS-3D LT V12/SDK/Lib")
set(Kompas3D_TLB_Dir "c:/Program Files (x86)/ASCON/KOMPAS-3D LT V12/SDK/Lib")

set(Kompas3D_TLB_Files
  ksConstants3D.tlb
  ksConstants.tlb
  kAPI2D5COM.tlb
  kAPI3D5COM.tlb 
)

target_link_libraries(Kompas3D
  INTERFACE
    ${Kompas3D_Lib_Dir}/klAPI2D5.lib
    ${Kompas3D_Lib_Dir}/klAPI3D5.lib
    ${Kompas3D_Lib_Dir}/klAPI5.lib
    ${Kompas3D_Lib_Dir}/klAPI7.lib
)

target_include_directories(Kompas3D
  INTERFACE
    ${Kompas3D_SDK_Dir}/Include
)

target_compile_definitions(Kompas3D
  INTERFACE _AFXDLL UNICODE _UNICODE
)


## Создание файла ImportTlbFiles.h, содержимое которого импортирует tlb-файлы.
# Файл создается в текущем бинарном каталоге.
function(CreateImportTlbFiles)
  set(fileName ${CMAKE_CURRENT_BINARY_DIR}/ImportTlbFiles.h)
  file(WRITE ${fileName} "#ifndef cmake_generated_ImportTlbFiles_h\n")
  file(APPEND ${fileName} "#define cmake_generated_ImportTlbFiles_h\n\n")

  foreach(tlb_file ${Kompas3D_TLB_Files})
    file(APPEND ${fileName} "#import \"${Kompas3D_TLB_Dir}/${tlb_file}\" no_namespace named_guids\n")
  endforeach()

  file(APPEND ${fileName} "\n#endif //cmake_generated_ImportTlbFiles_h\n")
endfunction()
