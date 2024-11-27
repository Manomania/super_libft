########################################################################################################################
#                                                      VARIABLES                                                       #
########################################################################################################################

NAME 				= 	libft.a
CC 					= 	gcc
CFLAGS 				= 	-Wall -Wextra -Werror
AR					=	ar rcs
RM					=	rm -f
LIBFT_FILES			=	ft_atoi \
						ft_bzero \
						ft_calloc \
						ft_isalnum \
						ft_isalpha \
						ft_isascii \
						ft_isdigit \
						ft_isprint \
						ft_itoa \
						ft_lstadd_back \
						ft_lstadd_front \
						ft_lstclear \
						ft_lstdelone \
						ft_lstiter \
						ft_lstlast \
						ft_lstmap \
						ft_lstnew \
						ft_lstsize \
						ft_memchr \
						ft_memcmp \
						ft_memcpy \
						ft_memmove \
						ft_memset \
						ft_putchar_fd \
						ft_putendl_fd \
						ft_putnbr_fd \
						ft_putstr_fd \
						ft_split \
						ft_strchr \
						ft_strdup \
						ft_striteri \
						ft_strjoin \
						ft_strlcat \
						ft_strlcpy \
						ft_strlen \
						ft_strmapi \
						ft_strncmp \
						ft_strnstr \
						ft_strrchr \
						ft_strtrim \
						ft_substr \
						ft_tolower \
						ft_toupper
FT_PRINTF_FILES		=	ft_printf \
						parsing \
						print_adress \
						print_char \
						print_hexa \
						print_int
GNL_FILES			=	get_next_line \
						get_next_line_utils

LIBFT_SRC 			=	$(addprefix $(SRC_DIR), $(addsuffix .c, $(LIBFT_FILES)))
FT_PRINTF_SRC		=	$(addprefix $(FT_PRINTF_DIR)$(SRC_DIR), $(addsuffix .c, $(FT_PRINTF_FILES)))
GNL_SRC 			=	$(addprefix $(GNL_DIR)$(SRC_DIR), $(addsuffix .c, $(GNL_FILES)))

OBJ 				= 	$(addprefix $(OBJ_DIR), $(addsuffix .o, $(LIBFT_FILES) $(FT_PRINTF_FILES) $(GNL_FILES)))

HEADERS				=	$(INC_DIR)libft.h \
						$(FT_PRINTF_DIR)$(INC_DIR)ft_printf.h \
						$(GNL_DIR)$(INC_DIR)get_next_line.h

########################################################################################################################
#                                                      DIRECTORY                                                       #
########################################################################################################################

SRC_DIR				=	src/
OBJ_DIR				=	obj/
INC_DIR				=	include/

LIBFT_DIR			=	src/
FT_PRINTF_DIR		=	ft_printf/
GNL_DIR				=	get_next_line/

LIBFT_INC			=	.
GNL_INC				=	$(GNL_DIR)$(INC_DIR)
FT_PRINTF_INC		=	$(FT_PRINTF_DIR)$(INC_DIR)

########################################################################################################################
#                                                       COMMANDS                                                       #
########################################################################################################################



all:					$(NAME)
							@echo "$(COL_GREEN)Nothing to be done for 'all'.$(END_COL)"; \

$(NAME):				$(OBJ)
							@if [ -f $(NAME) ] && [ "$(MAKECMDGOALS)" = "" ]; then \
								echo "$(COL_GREEN)Creating repository 'obj'.$(END_COL)"; \
							fi
							$(AR) $@ $^

$(OBJ_DIR):
							@mkdir -p $(OBJ_DIR)

$(OBJ_DIR)%.o: 			$(SRC_DIR)%.c $(HEADERS) | $(OBJ_DIR)
							$(CC) $(CFLAGS) -I$(LIBFT_INC) -I$(FT_PRINTF_INC) -I$(GNL_INC) -c $< -o $@

$(OBJ_DIR)%.o: 			$(FT_PRINTF_DIR)$(SRC_DIR)%.c $(HEADERS) | $(OBJ_DIR)
							$(CC) $(CFLAGS) -I$(LIBFT_INC) -I$(FT_PRINTF_INC) -I$(GNL_INC) -c $< -o $@

$(OBJ_DIR)%.o: 			$(GNL_DIR)$(SRC_DIR)%.c $(HEADERS) | $(OBJ_DIR)
							$(CC) $(CFLAGS) -I$(LIBFT_INC) -I$(FT_PRINTF_INC) -I$(GNL_INC) -c $< -o $@

########################################################################################################################
#                                                      TARGETS                                                         #
########################################################################################################################

clean:
							@if [ -d $(OBJ_DIR) ]; then \
								rm -rf $(OBJ_DIR); \
								echo "$(COL_RED)Deleted repository '$(OBJ_DIR)'.$(END_COL)"; \
							else \
								echo "$(COL_GREEN)Repository '$(OBJ_DIR)' does not exist, nothing to clean.$(END_COL)"; \
							fi

fclean: 				clean
							@if [ -f $(NAME) ]; then \
								$(RM) $(NAME); \
								echo "$(COL_RED)Deleting '$(NAME)'.$(END_COL)"; \
							else \
								echo "$(COL_GREEN)File '$(NAME)' does not exist, nothing to clean.$(END_COL)"; \
							fi

re: 					fclean all

.PHONY: 				all bonus clean fclean re

########################################################################################################################
#                                                      COLOURS                                                         #
########################################################################################################################

COL_GREEN			=	\033[0;32m
COL_RED				=	\033[0;31m
END_COL				=	\033[0m