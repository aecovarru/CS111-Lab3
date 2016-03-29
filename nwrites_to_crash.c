#include <sys/ioctl.h>
#include <errno.h>
#include <stdio.h>
#include <stdlib.h>
#include <fcntl.h>
#include <unistd.h>
#include <inttypes.h>
#include <sys/stat.h>
#include <string.h>
#include <assert.h>
#include <errno.h>
#include <sys/types.h>
#include <dirent.h>
#include "ospfs.h"

int main(int argv, char* argc[]) {
	int fd = open("test/dummy", O_RDWR | OCREAT, 0666);
	if (fd < 0)
	{
		fprintf(stderr, "Error opening dummy file\n");
	}
	ioctl(fd, CRASH_TEST, atoi(argc[1]));
	close(fd);
	return 0;
}