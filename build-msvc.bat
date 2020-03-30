@ECHO off

RMDIR /S /Q build
MKDIR build
CHDIR build

cmake -G "Visual Studio 16 2019" -A Win32 ..

cmake --build . --clean-first --target ALL_BUILD --config Release

CHDIR ..
