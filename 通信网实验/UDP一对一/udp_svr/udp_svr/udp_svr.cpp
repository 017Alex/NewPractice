#include "udp.hpp"

int main()
{
    WSADATA WSAData;
    char receBuf[BUFFER_SIZE];
    char Response[] = "";
    if (WSAStartup(MAKEWORD(2, 2), &WSAData) != 0)
    {
        printf("初始化失败");
        exit(1);
    }

    SOCKET sockServer = socket(AF_INET, SOCK_DGRAM, IPPROTO_UDP);
    if (sockServer == INVALID_SOCKET)
    {
        printf("Failed socket() \n");
        return 0;
    }

    SOCKADDR_IN addr_Server; //服务器的地址等信息
    addr_Server.sin_family = AF_INET;
    addr_Server.sin_port = htons(19999);
    addr_Server.sin_addr.S_un.S_addr = INADDR_ANY;

    if (bind(sockServer, (SOCKADDR*)&addr_Server, sizeof(addr_Server)) == SOCKET_ERROR)
    {
        //服务器与本地地址绑定
        printf("Failed socket() %d \n", WSAGetLastError());
        return 0;
    }
    SOCKADDR_IN addr_Clt;

    int fromlen = sizeof(SOCKADDR);
    while (true)
    {
        int last = recvfrom(sockServer, receBuf, 1024, 0, (SOCKADDR*)&addr_Clt, &fromlen);
        if (last > 0)
        {
            //判断接收到的数据是否为空
            receBuf[last] = '\0';
            if (strcmp(receBuf, "bye") == 0)
            {
                cout << "客户端退出" << endl;
                closesocket(sockServer);
                return 0;
            }
            else
            {
                printf("接收到数据（%s）：%s\n", inet_ntoa(addr_Clt.sin_addr), receBuf);
            }
        }
        cout << "回复客户端:";
        cin >> Response;
        sendto(sockServer, Response, strlen(Response), 0, (SOCKADDR*)&addr_Clt, sizeof(SOCKADDR));
    }

    closesocket(sockServer);

    WSACleanup();
    return 0;
}