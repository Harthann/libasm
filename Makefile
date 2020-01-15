NAME = a.out

SRCS = ft_strlen.s \
		ft_write.s \
		ft_strcpy.s \
		ft_strcmp.s \
		ft_read.s \
		ft_strdup.s

MAIN_S = main.c

OBJS = $(SRCS:%.s=%.o)
MAIN = $(MAIN_S:.c=.o)

ALL : $(NAME)

$(NAME) : $(OBJS) $(MAIN)
	@gcc $(OBJS) main.o -o $(NAME)

.c.o :
	@gcc -c $(MAIN_S)

%.o : %.s
	nasm -f macho64 $< -o $@

test : $(OBJS)
	ld -arch x86_64 -lSystem -macosx_version_min 10.4 $(OBJS) -o $(NAME)

run : ALL
	@clear
	@./$(NAME)

clean :
	rm $(OBJS)

fclean : clean
	rm $(NAME)