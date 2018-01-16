# Windows Socket 2.0 32-Bit DLL Fix for RAD Studio 10.2.2 and above

# Introduction

When launch an application built with runtime packages compiled by RAD Studio 10.2 update 2 in **Windows XP**, an error prompt

    The procedure entry point inet_pton could not be located in the dynamic link library ws2_32.dll.

The application works fine from Windows Vista onwards.

As stated in [InetPton function](https://msdn.microsoft.com/en-us/library/windows/desktop/cc805844(v=vs.85).aspx):

    The InetPton function is supported on Windows Vista and later.
    
RAD Studio 10.2 update 2 has a new update in unit `Windows.WinSock2.pas`:

    function inet_pton; external ws2_32 name 'inet_pton';

The function is bind statically when application was launch.  There is no way to patch the source code easily.  A quick workaround solution is built the application as single executable file instead of runtime packages.

# Solution: Deploy a proxy DLL to original WS2_32.dll

This project attempt to define proxy functions to all exported functions of original Windows XP's `WS2_32.dll` including `inet_pton` that was missing in Windows XP's `WS2_32.dll`.  It tricks the Windows XP application process to think that `inet_pton` is available and not prompting any errors.

Please note that the DLL shall deploy to Windows XP only.
