NAME = libasm.a

SRC_FILE = ft_strlen.s \
		ft_write.s \
		ft_strcpy.s \
		ft_strcmp.s \
		ft_read.s \
		ft_strdup.s

SRC_PATH = srcs/

OBJS = $(SRCS:%.s=%.o)
SRCS = $(addprefix $(SRC_PATH), $(SRC_FILE))

all : $(NAME)

$(NAME) : $(OBJS) $(MAIN)
	@ar rc $(NAME) $(OBJS)
	@echo "$(NAME) Created"

%.o : %.s
	@nasm -f macho64 $< -o $@

re : fclean all

clean :
	@rm -rf $(OBJS)
	@echo "Objects removed"

fclean : clean
	@echo "$(NAME) Removed"
	@rm -rf $(NAME)