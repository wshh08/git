#include<stdio.h>
#include<unistd.h>
main()
{
    printf("Excuting ls\n");
    execl("/bin/ls","ls","-l",NULL); //通过execl执行ls。

    perror("execl failed to run ls"); //错误处理。
    exit(1);
}
