NAME = libasm.a

SRCS = ft_strlen.s \
		ft_write.s \
		ft_strcpy.s \
		ft_strcmp.s \
		ft_read.s \
		ft_strdup.s

OBJS = $(SRCS:%.s=%.o)

all : $(NAME)

$(NAME) : $(OBJS) $(MAIN)
	@ar rc libasm.a $(OBJS)

%.o : %.s
	@nasm -f macho64 $< -o $@

re : fclean all

clean :
	@rm -rf $(OBJS)
	@echo "Objects removed"

fclean : clean
	@echo "$(NAME) Removed"
	@rm -rf $(NAME)