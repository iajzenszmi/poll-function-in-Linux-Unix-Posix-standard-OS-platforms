#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <poll.h>

#define TIMEOUT 5 // Time in seconds to wait

int main(void) {
    struct pollfd fds[1];
    int ret;

    // Set up the pollfd structure
    fds[0].fd = STDIN_FILENO; // Standard input
    fds[0].events = POLLIN;   // Check for input

    // Wait for up to TIMEOUT seconds for input
    ret = poll(fds, 1, TIMEOUT * 1000);

    if (ret == -1) {
        perror("poll");
        return 1;
    }

    if (!ret) {
        printf("%d seconds elapsed.\n", TIMEOUT);
        return 0;
    }

    if (fds[0].revents & POLLIN) {
        char buf[1024];
        int len = read(STDIN_FILENO, buf, sizeof(buf));
        if (len == -1) {
            perror("read");
            return 1;
        }

        if (len) {
            buf[len] = '\0';
            printf("Read: %s\n", buf);
        }

        return 0;
    }

    fprintf(stderr, "Unexpected condition.\n");
    return 1;
}
