#include "../inc/libasm.h"
#include <assert.h>
#include <string.h>
#include <stdio.h>
#include <fcntl.h>
#include <stdlib.h>

int main() {

	char	*len = "hello";
	assert(ft_strlen(len) == strlen(len));
	printf("\e[0;32mft_strlen : Success\n\e[0;31m");
	
	char	cpy[50];
	char	*res = ft_strcpy(cpy, len);
	assert(strcmp(len, cpy) == 0);
	assert(res == cpy);
	printf("\e[0;32mft_strcpy : Success\n\e[0;31m");
	
	assert(strcmp(len, cpy) == ft_strcmp(len, cpy));
	assert(strncmp(len, cpy, 10) == ft_strncmp(len, cpy, 10));
//	assert(strcmp("hey", "hoe") == ft_strcmp("hey", "hoe"));
	assert(strcmp("hey", "hoe") < 0);
	assert(ft_strcmp("hey", "hoe") < 0);
	assert(strncmp("hey", "hoe", 2) < 0);
	assert(ft_strncmp("hey", "hoe", 2) == 'e' - 'o');
	assert(ft_strncmp("hey", "hoe", 1) == 0);
	printf("\e[0;32mft_strcmp : Success\n\e[0;31m");
	printf("\e[0;32mft_strncmp: Success\n\e[0;31m");

	assert(ft_write(-1, "Success\n", 8) == -1);
	assert(ft_write(1, "ft_write  : Success\n", 12) == 12);
	assert(ft_write(1, "Success\n", 8) == 8);

	int fd = open("test.txt", O_RDONLY);
	assert(ft_read(fd, cpy, 5) == 5);
	cpy[5] = '\0';
	assert(ft_strcmp(cpy, "tests") == 0);
	assert(ft_read(-1, "Success\n", 8) == -1);
	printf("\e[0;32mft_read   : Success\n\e[0;31m");

	char	*dup = ft_strdup("ft_strdup : Success\n");
	assert(ft_strcmp("ft_strdup : Success\n", dup) == 0);
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
	printf("\e[0;32mBooleans  : Success\n\e[0;31m");

	
	char	hi[5];
	int		i = -1;
	ft_memset(hi, 'a', 5);
	while (++i < 5) {
		assert(hi[i] == 'a');
	}
	printf("\e[0;32mft_memset : Success\n\e[0;31m");

	ft_bzero(hi, 5);
	while (++i < 5) {
		assert(hi[i] == '\0');
	}
	printf("\e[0;32mft_bzero  : Success\n\e[0;31m");

	ft_memcpy(hi, "bibo", 4);
	assert(ft_strcmp("bibo", hi) == 0);
	printf("\e[0;32mft_memcpy : Success\n\e[0;31m");

	ft_memmove(hi + 1, hi, 2);
	assert(ft_strcmp("bbio", hi) == 0);
	int	nbs[3] = {1, 2, 3};
	ft_memmove(nbs + 1, nbs, 2 * sizeof(int));
	assert(nbs[0] == 1 && nbs[1] == 1 && nbs[2] == 2);
	printf("\e[0;32mft_memmove: Success\n\e[0;31m");

	char	hello[4] = "test";
	char	mama[4] = "mama";
	size_t	size = ft_strlcpy(hello, mama, 2);
	assert(size == ft_strlen(mama));
	assert(ft_strcmp(hello, "m") == 0);
	printf("\e[0;32mft_strlcpy: Success\n\e[0;31m");

	char	helo[12] = "test\0";
	char	mam[5] = "mama\0";
	size_t	siz = ft_strlcat(helo, mam, 3);
	assert(siz == 3);
	assert(ft_strcmp(helo, "test") == 0);
	siz = ft_strlcat(helo, mam, 999);
	assert(siz == 8);
	assert(ft_strcmp(helo, "testmama") == 0);
	printf("\e[0;32mft_strlcat: Success\n\e[0;31m");

	assert(ft_toupper('e') == 'E');
	assert(ft_toupper('E') == 'E');
	assert(ft_toupper('\n') == '\n');
	printf("\e[0;32mft_toupper: Success\n\e[0;31m");

	assert(ft_tolower('e') == 'e');
	assert(ft_tolower('E') == 'e');
	assert(ft_tolower('\n') == '\n');
	printf("\e[0;32mft_tolower: Success\n\e[0;31m");
	
	assert(ft_strchr(helo, 's') == helo + 2);
	assert(!ft_strchr(helo, 'z'));
	printf("\e[0;32mft_strchr : Success\n\e[0;31m");

	assert(ft_strrchr(helo, 's') == helo + 2);
	assert(!ft_strrchr(helo, 'z'));
	printf("\e[0;32mft_strrchr: Success\n\e[0;31m");

	assert(ft_strnstr(helo, mam, 25) == helo + 4);
	assert(ft_strnstr(helo, mam, 5) == 0);
	printf("\e[0;32mft_strnstr: Success\n\e[0;31m");

	assert(ft_atoi("5") == 5);
	assert(ft_atoi("-5") == -5);
	printf("\e[0;32mft_atoi   : Success\n\e[0;31m");

	assert(ft_strcmp(ft_substr("test", 2, 2), "st") == 0);
	printf("\e[0;32mft_substr : Success\n\e[0;31m");

	assert(ft_strcmp(ft_strjoin("test\0", " sex\0"), "test sex\0") == 0);
	printf("\e[0;32mft_strjoin: Success\n\e[0;31m");

	assert(ft_strcmp(ft_strtrim("  test ", " "), "test") == 0);
	printf("\e[0;32mft_strtrim: Success\n\e[0;31m");

	char	**tab = ft_split("   hello   my  friend ", ' ');
	assert(ft_strcmp("hello", tab[0]) == 0);
	assert(ft_strcmp("my", tab[1]) == 0);
	assert(ft_strcmp("friend", tab[2]) == 0);
	printf("\e[0;32mft_split  : Success\n\e[0;31m");

	return 0;
}
