unit WS2_32_XP;

interface

implementation

uses System.SysUtils, Winapi.Windows, Winapi.ShlObj;

{$WARN SYMBOL_PLATFORM OFF}

var
    freeaddrinfo
  , getaddrinfo
  , __WSAFDIsSet
  , accept
  , bind
  , closesocket
  , connect
  , ioctlsocket
  , getpeername
  , getsockname
  , getsockopt
  , htonl
  , htons
  , inet_addr
  , inet_ntoa
  , inet_pton
  , listen
  , ntohl
  , ntohs
  , recv
  , recvfrom
  , select
  , send
  , sendto
  , setsockopt
  , shutdown
  , socket

  , gethostbyaddr
  , gethostbyname
  , gethostname
  , getservbyport
  , getservbyname
  , getprotobynumber
  , getprotobyname

  , WSAStartup
  , WSACleanup
  , WSASetLastError
  , WSAGetLastError
  , WSAIsBlocking
  , WSAUnhookBlockingHook
  , WSASetBlockingHook
  , WSACancelBlockingCall
  , WSAAsyncGetServByName
  , WSAAsyncGetServByPort
  , WSAAsyncGetProtoByName
  , WSAAsyncGetProtoByNumber
  , WSAAsyncGetHostByName
  , WSAAsyncGetHostByAddr
  , WSACancelAsyncRequest
  , WSAAsyncSelect
  , WSAAccept
  , WSACloseEvent
  , WSAConnect
  , WSAConnectByNameW
  , WSAConnectByNameA
  , WSAConnectByName
  , WSAConnectByList
  , WSACreateEvent
  , WSADuplicateSocketA
  , WSADuplicateSocketW
  , WSADuplicateSocket
  , WSAEnumNetworkEvents
  , WSAEnumProtocolsA
  , WSAEnumProtocolsW
  , WSAEnumProtocols
  , WSAEventSelect
  , WSAGetOverlappedResult
  , WSAGetQOSByName
  , WSAHtonl
  , WSAHtons
  , WSAIoctl
  , WSAJoinLeaf
  , WSANtohl
  , WSANtohs
  , WSARecv
  , WSARecvDisconnect
  , WSARecvFrom
  , WSAResetEvent
  , WSASend
  , WSASendMsg
  , WSASendDisconnect
  , WSASendTo
  , WSASetEvent
  , WSASocketA
  , WSASocketW
  , WSASocket
  , WSAWaitForMultipleEvents
  , WSAAddressToStringA
  , WSAAddressToStringW
  , WSAAddressToString
  , WSAStringToAddressA
  , WSAStringToAddressW
  , WSAStringToAddress

  , WSALookupServiceBeginA
  , WSALookupServiceBeginW
  , WSALookupServiceBegin
  , WSALookupServiceNextA
  , WSALookupServiceNextW
  , WSALookupServiceNext
  , WSANSPIoctl
  , WSALookupServiceEnd
  , WSAInstallServiceClassA
  , WSAInstallServiceClassW
  , WSAInstallServiceClass
  , WSARemoveServiceClass
  , WSAGetServiceClassInfoA
  , WSAGetServiceClassInfoW
  , WSAGetServiceClassInfo
  , WSAEnumNameSpaceProvidersA
  , WSAEnumNameSpaceProvidersW
  , WSAEnumNameSpaceProviders
  , WSAEnumNameSpaceProvidersExA
  , WSAEnumNameSpaceProvidersExW
  , WSAEnumNameSpaceProvidersEx
  , WSAGetServiceClassNameByClassIdA
  , WSAGetServiceClassNameByClassIdW
  , WSAGetServiceClassNameByClassId
  , WSASetServiceA
  , WSASetServiceW
  , WSASetService
  , WSAProviderConfigChange
  , WSAPoll
  : procedure; stdcall;

exports
    freeaddrinfo
  , getaddrinfo

  , __WSAFDIsSet
  , accept
  , bind
  , closesocket
  , connect
  , ioctlsocket
  , getpeername
  , getsockname
  , getsockopt
  , htonl
  , htons
  , inet_addr
  , inet_ntoa
  , inet_pton
  , listen
  , ntohl
  , ntohs
  , recv
  , recvfrom
  , select
  , send
  , sendto
  , setsockopt
  , shutdown
  , socket

  , gethostbyaddr
  , gethostbyname
  , gethostname
  , getservbyport
  , getservbyname
  , getprotobynumber
  , getprotobyname

  , WSAStartup
  , WSACleanup
  , WSASetLastError
  , WSAGetLastError
  , WSAIsBlocking
  , WSAUnhookBlockingHook
  , WSASetBlockingHook
  , WSACancelBlockingCall
  , WSAAsyncGetServByName
  , WSAAsyncGetServByPort
  , WSAAsyncGetProtoByName
  , WSAAsyncGetProtoByNumber
  , WSAAsyncGetHostByName
  , WSAAsyncGetHostByAddr
  , WSACancelAsyncRequest
  , WSAAsyncSelect
  , WSAAccept
  , WSACloseEvent
  , WSAConnect
  , WSAConnectByNameW
  , WSAConnectByNameA
  , WSAConnectByName
  , WSAConnectByList
  , WSACreateEvent
  , WSADuplicateSocketA
  , WSADuplicateSocketW
  , WSADuplicateSocket
  , WSAEnumNetworkEvents
  , WSAEnumProtocolsA
  , WSAEnumProtocolsW
  , WSAEnumProtocols
  , WSAEventSelect
  , WSAGetOverlappedResult
  , WSAGetQOSByName
  , WSAHtonl
  , WSAHtons
  , WSAIoctl
  , WSAJoinLeaf
  , WSANtohl
  , WSANtohs
  , WSARecv
  , WSARecvDisconnect
  , WSARecvFrom
  , WSAResetEvent
  , WSASend
  , WSASendMsg
  , WSASendDisconnect
  , WSASendTo
  , WSASetEvent
  , WSASocketA
  , WSASocketW
  , WSASocket
  , WSAWaitForMultipleEvents
  , WSAAddressToStringA
  , WSAAddressToStringW
  , WSAAddressToString
  , WSAStringToAddressA
  , WSAStringToAddressW
  , WSAStringToAddress

  , WSALookupServiceBeginA
  , WSALookupServiceBeginW
  , WSALookupServiceBegin
  , WSALookupServiceNextA
  , WSALookupServiceNextW
  , WSALookupServiceNext
  , WSANSPIoctl
  , WSALookupServiceEnd
  , WSAInstallServiceClassA
  , WSAInstallServiceClassW
  , WSAInstallServiceClass
  , WSARemoveServiceClass
  , WSAGetServiceClassInfoA
  , WSAGetServiceClassInfoW
  , WSAGetServiceClassInfo
  , WSAEnumNameSpaceProvidersA
  , WSAEnumNameSpaceProvidersW
  , WSAEnumNameSpaceProviders
  , WSAEnumNameSpaceProvidersExA
  , WSAEnumNameSpaceProvidersExW
  , WSAEnumNameSpaceProvidersEx
  , WSAGetServiceClassNameByClassIdA
  , WSAGetServiceClassNameByClassIdW
  , WSAGetServiceClassNameByClassId
  , WSASetServiceA
  , WSASetServiceW
  , WSASetService
  , WSAProviderConfigChange
  , WSAPoll
  ;

function System_ws2_32: string;
var P: array[0..MAX_PATH] of Char;
begin
  Win32Check(
    SHGetSpecialFolderPath(0, P
      ,
      {$ifdef Win32}CSIDL_SYSTEMX86{$endif}
      {$ifdef Win64}CSIDL_SYSTEM{$endif}
      , False
    )
  );
  Result := IncludeTrailingPathDelimiter(P) + 'WS2_32.dll';
end;

function InitLibrary: THandle;
begin
  Result := LoadLibrary(PChar(System_ws2_32));
  if Result > 0 then begin
    freeaddrinfo := GetProcAddress(Result, 'freeaddrinfo');
    getaddrinfo  := GetProcAddress(Result, 'getaddrinfo');

    __WSAFDIsSet := GetProcAddress(Result, '__WSAFDIsSet');
    accept       := GetProcAddress(Result, 'accept');
    bind         := GetProcAddress(Result, 'bind');
    closesocket  := GetProcAddress(Result, 'closesocket');
    connect      := GetProcAddress(Result, 'connect');
    ioctlsocket  := GetProcAddress(Result, 'ioctlsocket');
    getpeername  := GetProcAddress(Result, 'getpeername');
    getsockname  := GetProcAddress(Result, 'getsockname');
    getsockopt   := GetProcAddress(Result, 'getsockopt');
    htonl        := GetProcAddress(Result, 'htonl');
    htons        := GetProcAddress(Result, 'htons');
    inet_addr    := GetProcAddress(Result, 'inet_addr');
    inet_ntoa    := GetProcAddress(Result, 'inet_ntoa');
    inet_pton    := GetProcAddress(Result, 'inet_pton');
    listen       := GetProcAddress(Result, 'listen');
    ntohl        := GetProcAddress(Result, 'ntohl');
    ntohs        := GetProcAddress(Result, 'ntohs');
    recv         := GetProcAddress(Result, 'recv');
    recvfrom     := GetProcAddress(Result, 'recvfrom');
    select       := GetProcAddress(Result, 'select');
    send         := GetProcAddress(Result, 'send');
    sendto       := GetProcAddress(Result, 'sendto');
    setsockopt   := GetProcAddress(Result, 'setsockopt');
    shutdown     := GetProcAddress(Result, 'shutdown');
    socket       := GetProcAddress(Result, 'socket');

    gethostbyaddr             := GetProcAddress(Result, 'gethostbyaddr');
    gethostbyname             := GetProcAddress(Result, 'gethostbyname');
    gethostname               := GetProcAddress(Result, 'gethostname');
    getservbyport             := GetProcAddress(Result, 'getservbyport');
    getservbyname             := GetProcAddress(Result, 'getservbyname');
    getprotobynumber          := GetProcAddress(Result, 'getprotobynumber');
    getprotobyname            := GetProcAddress(Result, 'getprotobyname');

    WSAStartup                := GetProcAddress(Result, 'WSAStartup');
    WSACleanup                := GetProcAddress(Result, 'WSACleanup');
    WSASetLastError           := GetProcAddress(Result, 'WSASetLastError');
    WSAGetLastError           := GetProcAddress(Result, 'WSAGetLastError');
    WSAIsBlocking             := GetProcAddress(Result, 'WSAIsBlocking');
    WSAUnhookBlockingHook     := GetProcAddress(Result, 'WSAUnhookBlockingHook');
    WSASetBlockingHook        := GetProcAddress(Result, 'WSASetBlockingHook');
    WSACancelBlockingCall     := GetProcAddress(Result, 'WSACancelBlockingCall');
    WSAAsyncGetServByName     := GetProcAddress(Result, 'WSAAsyncGetServByName');
    WSAAsyncGetServByPort     := GetProcAddress(Result, 'WSAAsyncGetServByPort');
    WSAAsyncGetProtoByName    := GetProcAddress(Result, 'WSAAsyncGetProtoByName');
    WSAAsyncGetProtoByNumber  := GetProcAddress(Result, 'WSAAsyncGetProtoByNumber');
    WSAAsyncGetHostByName     := GetProcAddress(Result, 'WSAAsyncGetHostByName');
    WSAAsyncGetHostByAddr     := GetProcAddress(Result, 'WSAAsyncGetHostByAddr');
    WSACancelAsyncRequest     := GetProcAddress(Result, 'WSACancelAsyncRequest');
    WSAAsyncSelect            := GetProcAddress(Result, 'WSAAsyncSelect');

    WSAAccept                 := GetProcAddress(Result, 'WSAAccept');
    WSACloseEvent             := GetProcAddress(Result, 'WSACloseEvent');
    WSAConnect                := GetProcAddress(Result, 'WSAConnect');
    WSAConnectByNameW         := GetProcAddress(Result, 'WSAConnectByNameW');
    WSAConnectByNameA         := GetProcAddress(Result, 'WSAConnectByNameA');
    WSAConnectByName          := GetProcAddress(Result, 'WSAConnectByName');
    WSAConnectByList          := GetProcAddress(Result, 'WSAConnectByList');
    WSACreateEvent            := GetProcAddress(Result, 'WSACreateEvent');
    WSADuplicateSocketA       := GetProcAddress(Result, 'WSADuplicateSocketA');
    WSADuplicateSocketW       := GetProcAddress(Result, 'WSADuplicateSocketW');
    WSADuplicateSocket        := GetProcAddress(Result, 'WSADuplicateSocket');
    WSAEnumNetworkEvents      := GetProcAddress(Result, 'WSAEnumNetworkEvents');
    WSAEnumProtocolsA         := GetProcAddress(Result, 'WSAEnumProtocolsA');
    WSAEnumProtocolsW         := GetProcAddress(Result, 'WSAEnumProtocolsW');
    WSAEnumProtocols          := GetProcAddress(Result, 'WSAEnumProtocols');
    WSAEventSelect            := GetProcAddress(Result, 'WSAEventSelect');
    WSAGetOverlappedResult    := GetProcAddress(Result, 'WSAGetOverlappedResult');
    WSAGetQOSByName           := GetProcAddress(Result, 'WSAGetQOSByName');
    WSAHtonl                  := GetProcAddress(Result, 'WSAHtonl');
    WSAHtons                  := GetProcAddress(Result, 'WSAHtons');
    WSAIoctl                  := GetProcAddress(Result, 'WSAIoctl');
    WSAJoinLeaf               := GetProcAddress(Result, 'WSAJoinLeaf');
    WSANtohl                  := GetProcAddress(Result, 'WSANtohl');
    WSANtohs                  := GetProcAddress(Result, 'WSANtohs');
    WSARecv                   := GetProcAddress(Result, 'WSARecv');
    WSARecvDisconnect         := GetProcAddress(Result, 'WSARecvDisconnect');
    WSARecvFrom               := GetProcAddress(Result, 'WSARecvFrom');
    WSAResetEvent             := GetProcAddress(Result, 'WSAResetEvent');
    WSASend                   := GetProcAddress(Result, 'WSASend');
    WSASendMsg                := GetProcAddress(Result, 'WSASendMsg');
    WSASendDisconnect         := GetProcAddress(Result, 'WSASendDisconnect');
    WSASendTo                 := GetProcAddress(Result, 'WSASendTo');
    WSASetEvent               := GetProcAddress(Result, 'WSASetEvent');
    WSASocketA                := GetProcAddress(Result, 'WSASocketA');
    WSASocketW                := GetProcAddress(Result, 'WSASocketW');
    WSASocket                 := GetProcAddress(Result, 'WSASocket');
    WSAWaitForMultipleEvents  := GetProcAddress(Result, 'WSAWaitForMultipleEvents');
    WSAAddressToStringA       := GetProcAddress(Result, 'WSAAddressToStringA');
    WSAAddressToStringW       := GetProcAddress(Result, 'WSAAddressToStringW');
    WSAAddressToString        := GetProcAddress(Result, 'WSAAddressToString');
    WSAStringToAddressA       := GetProcAddress(Result, 'WSAStringToAddressA');
    WSAStringToAddressW       := GetProcAddress(Result, 'WSAStringToAddressW');
    WSAStringToAddress        := GetProcAddress(Result, 'WSAStringToAddress');

    WSALookupServiceBeginA            := GetProcAddress(Result, 'WSALookupServiceBeginA');
    WSALookupServiceBeginW            := GetProcAddress(Result, 'WSALookupServiceBeginW');
    WSALookupServiceBegin             := GetProcAddress(Result, 'WSALookupServiceBegin');
    WSALookupServiceNextA             := GetProcAddress(Result, 'WSALookupServiceNextA');
    WSALookupServiceNextW             := GetProcAddress(Result, 'WSALookupServiceNextW');
    WSALookupServiceNext              := GetProcAddress(Result, 'WSALookupServiceNext');
    WSANSPIoctl                       := GetProcAddress(Result, 'WSANSPIoctl');
    WSALookupServiceEnd               := GetProcAddress(Result, 'WSALookupServiceEnd');
    WSAInstallServiceClassA           := GetProcAddress(Result, 'WSAInstallServiceClassA');
    WSAInstallServiceClassW           := GetProcAddress(Result, 'WSAInstallServiceClassW');
    WSAInstallServiceClass            := GetProcAddress(Result, 'WSAInstallServiceClass');
    WSARemoveServiceClass             := GetProcAddress(Result, 'WSARemoveServiceClass');
    WSAGetServiceClassInfoA           := GetProcAddress(Result, 'WSAGetServiceClassInfoA');
    WSAGetServiceClassInfoW           := GetProcAddress(Result, 'WSAGetServiceClassInfoW');
    WSAGetServiceClassInfo            := GetProcAddress(Result, 'WSAGetServiceClassInfo');
    WSAEnumNameSpaceProvidersA        := GetProcAddress(Result, 'WSAEnumNameSpaceProvidersA');
    WSAEnumNameSpaceProvidersW        := GetProcAddress(Result, 'WSAEnumNameSpaceProvidersW');
    WSAEnumNameSpaceProviders         := GetProcAddress(Result, 'WSAEnumNameSpaceProviders');
    WSAEnumNameSpaceProvidersExA      := GetProcAddress(Result, 'WSAEnumNameSpaceProvidersExA');
    WSAEnumNameSpaceProvidersExW      := GetProcAddress(Result, 'WSAEnumNameSpaceProvidersExW');
    WSAEnumNameSpaceProvidersEx       := GetProcAddress(Result, 'WSAEnumNameSpaceProvidersEx');
    WSAGetServiceClassNameByClassIdA  := GetProcAddress(Result, 'WSAGetServiceClassNameByClassIdA');
    WSAGetServiceClassNameByClassIdW  := GetProcAddress(Result, 'WSAGetServiceClassNameByClassIdW');
    WSAGetServiceClassNameByClassId   := GetProcAddress(Result, 'WSAGetServiceClassNameByClassId');
    WSASetServiceA                    := GetProcAddress(Result, 'WSASetServiceA');
    WSASetServiceW                    := GetProcAddress(Result, 'WSASetServiceW');
    WSASetService                     := GetProcAddress(Result, 'WSASetService');
    WSAProviderConfigChange           := GetProcAddress(Result, 'WSAProviderConfigChange');
    WSAPoll                           := GetProcAddress(Result, 'WSAPoll');
  end;
end;

var H: THandle;

initialization
  H := InitLibrary;
finalization
  FreeLibrary(H);
end.
