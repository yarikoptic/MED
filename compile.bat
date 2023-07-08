:: 
:: This script relies on the following directory hierarchy and library existing:
:: Z: (drive)
::	lib (dir)
::		Windows (dir)
::			targets_m12.h (file) (edited to define "WINDOWS_m12")
::			libmed_m12_win.lib (file)
::	MED2RAW (dir)
::		Windows (dir)
::			MED2RAW.c (file)
::
:: Link the library with "/link %LIBOBJ%\libmed_m12%LIBSFX%.lib" in executables, as below.
::

::
:: For 64-bit native code When compiling with the Visual Studio compiler ("cl") from the command line:
:: 	1) Use "x64 Native Tools Command Prompt for VS 2019" as the terminal program. (This just sets a number of necessary environment variables.)
::	2) Set VSCMD_ARG_HOST_ARCH & VSCMD_ARG_TGT_ARCH to x64, as below.
::	3) If using libraries, add  "/MACHINE:X64" to the link section of the compile line, as below.
::
:: For 32-bit executables remove the additions above. 
:: The library is designed for 64-bit processing, so this is less efficient, but it works.
::

set VSCMD_ARG_HOST_ARCH=x64
set VSCMD_ARG_TGT_ARCH=x64

set DEVDRV=Z
set PRG=MED2RAW
set OS=Windows

set PRGINC=%DEVDRV%:\%PRG%
set PRGSRC=%PRGINC%
set PRGOBJ=%PRGSRC%\%OS%
set LIBINC=%DEVDRV%:\lib
set LIBOBJ=%LIBINC%\%OS%
set LIBSFX=_win

set TGTINC=%PRGOBJ%

cl /I%LIBINC% /I%PRGINC% /I%TGTINC% /Gd /GL /EHsc /nologo /O2 /D NDEBUG /D _CONSOLE /D UNICODE /D _UNICODE %PRGSRC%\%PRG%.c /link /MACHINE:X64 %LIBOBJ%\libmed_m12%LIBSFX%.lib /OUT:%PRGOBJ%\%PRG%.exe

del *.obj

