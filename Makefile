NAME = Izumi
BUILD_DIR = build
SRC = main.c get_next_line.c get_next_line_utils.c
OBJ = $(addprefix $(BUILD_DIR)/, $(SRC:.c=.o))
CC = cc
CFLAGS = -Wall -Werror -Wextra
RM = rm -f


all: $(NAME)

$(NAME): $(OBJ)
	$(CC) $(CFLAGS) -o $@ $^

$(BUILD_DIR)/%.o: %.c get_next_line.h | $(BUILD_DIR)
	$(CC) $(CFLAGS) -c $< -o $@

$(BUILD_DIR):
	mkdir -p $(BUILD_DIR)

clean:
	$(RM) $(OBJ)

fclean : clean
	$(RM) $(NAME)

re: fclean all

run: $(NAME)
	./$(NAME)

.PHONY: all clean fclean re run
