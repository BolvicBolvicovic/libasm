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

	assert(ft_isalpha('a') == 1);
	assert(ft_isdigit('5') == 1);
	assert(ft_isalnum('G') == 1);
	assert(ft_isascii('~') == 1);
	assert(ft_isprint('"') == 1);
	assert(ft_isalpha('\'') == 0);
	assert(ft_isdigit('e') == 0);
	assert(ft_isascii(255) == 0);
	assert(ft_isprint('\n') == 0);
	assert(ft_isalnum('&') == 0);
	printf("\e[0;32mBooleans : Success\n\e[0;31m");

	
	char	hi[5];
	int		i = -1;
	ft_memset(hi, 'a', 5);
	while (++i < 5) {
		assert(hi[i] == 'a');
	}
	printf("\e[0;32mft_memset: Success\n\e[0;31m");

	ft_bzero(hi, 5);
	while (++i < 5) {
		assert(hi[i] == '\0');
	}
	printf("\e[0;32mft_bzero : Success\n\e[0;31m");

	ft_memcpy(hi, "bibo", 4);
	assert(ft_strcmp("bibo", hi) == 0);
	printf("\e[0;32mft_memcpy: Success\n\e[0;31m");

	ft_memmove(hi + 1, hi, 2);
	assert(ft_strcmp("bbio", hi) == 0);
	int	nbs[3] = {1, 2, 3};
	ft_memmove(nbs + 1, nbs, 2 * sizeof(int));
	assert(nbs[0] == 1 && nbs[1] == 1 && nbs[2] == 2);
	printf("\e[0;32mft_memmove: Success\n\e[0;31m");
	return 0;
}
