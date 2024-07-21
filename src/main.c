#include "../inc/libasm.h"
#include <assert.h>
#include <string.h>
#include <stdio.h>
#include <fcntl.h>
#include <stdlib.h>

int main() {

	char	*len = "hello";
	assert(ft_strlen(len) == strlen(len));
	printf("\e[0;32mft_strlen: Success\n\e[0;31m");
	
	char	cpy[50];
	char	*res = ft_strcpy(cpy, len);
	assert(strcmp(len, cpy) == 0);
	assert(res == cpy);
	printf("\e[0;32mft_strcpy: Success\n\e[0;31m");
	
	assert(strcmp(len, cpy) == ft_strcmp(len, cpy));
//	assert(strcmp("hey", "hoe") == ft_strcmp("hey", "hoe"));
	assert(strcmp("hey", "hoe") < 0);
	assert(ft_strcmp("hey", "hoe") < 0);
	printf("\e[0;32mft_strcmp: Success\n\e[0;31m");

	assert(ft_write(-1, "Success\n", 8) == -1);
	assert(ft_write(1, "ft_write : Success\n", 11) == 11);
	assert(ft_write(1, "Success\n", 8) == 8);

	int fd = open("test.txt", O_RDONLY);
	assert(ft_read(fd, cpy, 5) == 5);
	cpy[5] = '\0';
	assert(ft_strcmp(cpy, "tests") == 0);
	assert(ft_read(-1, "Success\n", 8) == -1);
	printf("\e[0;32mft_read  : Success\n\e[0;31m");

	char	*dup = ft_strdup("ft_strdup: Success\n");
	assert(ft_strcmp("ft_strdup: Success\n", dup) == 0);
	printf("\e[0;32m%s", dup);
	free(dup);

	return 0;
}
