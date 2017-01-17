NAME	= libasm.so

BONUS	= libasmbonus.so

SRCS	= my_strlen.s \
	  my_strchr.s \
	  my_memset.s \
	  my_memcpy.s \
	  my_strcmp.s \
	  my_memmove.s \
	  my_strncmp.s \
	  my_strcasecmp.s \
	  my_rindex.s \
	  my_strstr.s \
	  my_strpbrk.s \
	  my_strcspn.s

BONUSFO	= bonus/

SRCSBO	= $(BONUSFO)my_index.s \
	  $(BONUSFO)my_strrchr.s \
	  $(BONUSFO)my_strchrnul.s \
	  $(BONUSFO)my_strncasecmp.s \
	  $(BONUSFO)my_strcasestr.s \
	  $(BONUSFO)my_strnlen.s \
	  $(BONUSFO)my_strspn.s \
	  $(BONUSFO)my_strcpy.s \
	  $(BONUSFO)my_strncpy.s \
	  $(BONUSFO)my_strdup.s \
	  $(BONUSFO)my_strcat.s \
	  $(BONUSFO)my_strncat.s

OBJS	= $(SRCS:.s=.o)

OBJSBO	= $(SRCSBO:.s=.o)

CC	= gcc -shared -o

ASM	= nasm -f ELF64 -o

RM	= rm -rf

all: $(NAME)

bonus: $(BONUS)

$(BONUS): $(OBJS) $(OBJSBO)
	$(CC) $@ $<

$(NAME): $(OBJS)
	$(CC) $@ $^

%.o: %.s
	$(ASM) $@ $<

clean:
	$(RM) $(OBJS)
	$(RM) $(OBJSBO)

fclean: clean
	$(RM) $(NAME)
	$(RM) $(BONUS)

re: fclean all

.PHONY: all bonus clean fclean re
