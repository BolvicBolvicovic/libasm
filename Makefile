NAME    = libasm.a
TESTS   = tests
CC      = nasm
AR      = ar rcs
FILES   = ft_strlen.asm ft_strcpy.asm ft_strcmp.asm ft_write.asm ft_read.asm ft_strdup.asm
FLAGS   = -felf64
CFLAGS  = -Wall -Wextra -Werror -Iinc
SOURCE  = $(addprefix src/, $(FILES))
OBJ     = $(SOURCE:.asm=.o)

all     : $(NAME)

$(NAME) : $(OBJ)
	$(AR) $@ $(OBJ)

%.o: %.asm
	$(CC) $(FLAGS) -o $@ $<

$(TESTS): $(NAME)
	cc $(CFLAGS) -o $@ src/main.c ./$(NAME)

clean   :
	rm -f $(OBJ)
	rm -f $(NAME)

fclean  : clean
	rm -f $(TESTS)

re      : fclean all

.PHONY  : re clean
