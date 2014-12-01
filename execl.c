#include<stdio.h>
#include<unistd.h>
main()
{
    printf("Excuting ls\n");
    execl("/bin/ls","ls","-l",NULL);

    perror("execl failed to run ls");
    exit(1);
}
