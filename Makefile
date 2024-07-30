NAME    = libasm.a
TESTS   = tests
CC      = nasm
AR      = ar rcs
FILES   =	ft_memcpy.asm ft_bzero.asm ft_memset.asm ft_memmove.asm	\
		  	booleans.asm											\
			ft_strlen.asm ft_strcpy.asm ft_strcmp.asm ft_strdup.asm	\
			ft_strlcat.asm ft_strlcpy.asm ft_write.asm ft_read.asm	\
			ft_strrchr.asm ft_strchr.asm ft_tolower.asm ft_toupper.asm \
			ft_memcmp.asm ft_memchr.asm ft_strncmp.asm ft_strnstr.asm \
			ft_strjoin.asm ft_atoi.asm ft_substr.asm
FLAGS   = -g -felf64
CFLAGS  = -g -Wall -Wextra -Werror -Iinc
SOURCE  = $(addprefix src/, $(FILES))
OBJ     = $(SOURCE:.asm=.o)

all     : $(NAME)

$(NAME) : $(OBJ)
	$(AR) $@ $(OBJ)

%.o: %.asm
	$(CC) $(FLAGS) -o $@ $<

$(TESTS): re $(NAME)
	cc $(CFLAGS) -o $@ src/main.c ./$(NAME)

clean   :
	rm -f $(OBJ)
	rm -f $(NAME)

fclean  : clean
	rm -f $(TESTS)

re      : fclean all

.PHONY  : re clean
