NAME =	libft.a

BUILD_PATH	= .build
LIBFT_PATH	= ./libft
SRC =	$(addprefix $(LIBFT_PATH)/, ft_isalpha.c ft_isprint.c ft_isdigit.c ft_isalnum.c ft_isascii.c ft_strlen.c ft_strcmp.c ft_memset.c ft_bzero.c ft_memcpy.c ft_memmove.c ft_toupper.c ft_foreach.c ft_tolower.c ft_atoi.c ft_atol.c ft_strdup.c ft_strlcpy.c ft_strlcat.c ft_strchr.c ft_strrchr.c ft_strncmp.c ft_memchr.c ft_memcmp.c ft_strnstr.c ft_calloc.c ft_substr.c ft_strjoin.c ft_strtrim.c ft_split.c ft_itoa.c ft_strmapi.c ft_striteri.c ft_putchar_fd.c ft_putstr_fd.c ft_putendl_fd.c ft_putnbr_fd.c)

BONUS = $(addprefix $(LIBFT_PATH)/, ft_lstnew_bonus.c ft_lstadd_front_bonus.c ft_lstsize_bonus.c ft_lstlast_bonus.c ft_lstadd_back_bonus.c ft_lstdelone_bonus.c ft_lstclear_bonus.c ft_lstiter_bonus.c ft_lstmap_bonus.c)

PRINTF_PATH	= ./printf
PRINTF_SRC 	= $(addprefix $(PRINTF_PATH)/, ft_printf.c ft_putchar.c ft_putstr.c ft_putnbr.c ft_putunsint.c ft_puthex_small.c ft_puthex_big.c ft_putpoint.c)

GNL_PATH 	= ./gnl
GNL_SRC		= $(addprefix $(GNL_PATH)/, get_next_line.c get_next_line_utils.c)

OBJS		= $(addprefix $(BUILD_PATH)/, $(notdir $(SRC:.c=.o)))
BONUS_OBJS	= $(addprefix $(BUILD_PATH)/, $(notdir $(BONUS:.c=.o)))
PRINTF_OBJS	= $(addprefix $(BUILD_PATH)/, $(notdir $(PRINTF_SRC:.c=.o)))
GNL_OBJS	= $(addprefix $(BUILD_PATH)/, $(notdir $(GNL_SRC:.c=.o)))

### Message Vars
_NAME	 		= [$(MAG)libft$(D)]
_SUCCESS 		= [$(GRN)SUCCESS$(D)]
_INFO 			= [$(BLU)INFO$(D)]
_NORM 			= [$(YEL)Norminette$(D)]
_NORM_SUCCESS 	= $(GRN)=== OK:$(D)
_NORM_INFO 		= $(BLU)File no:$(D)

#==============================================================================#
#                            FLAGS & CMDS                                      #
#==============================================================================#

MAKE		= make -C
CFLAGS		= -Wall -Wextra -Werror
CFLAGS		+= -g
# CFLAGS		+= -lm
INCLUDE 	= -I.

CC 			= cc
RM 			= rm -rf
AR 			= ar rcs
MKDIR_P		= mkdir -p

#==============================================================================#
#                                  RULES                                       #
#==============================================================================#

##@ Libft Compilation Rules 🏗

all: $(NAME)	## Compile Basic libft

$(BUILD_PATH):
	$(MKDIR_P) $(BUILD_PATH)
	@echo " $(YEL)Creating $(BUILD_PATH) folder:$(D) $(_SUCCESS)"

$(BUILD_PATH)/%.o: $(LIBFT_PATH)/%.c
	@echo -n "$(GRN)█$(D)"
	@$(CC) $(CFLAGS) -c $< -o $@

$(BUILD_PATH)/%.o: $(PRINTF_PATH)/%.c
	@echo -n "$(GRN)█$(D)"
	@$(CC) $(CFLAGS) -c $< -o $@

$(BUILD_PATH)/%.o: $(GNL_PATH)/%.c
	@echo -n "$(GRN)█$(D)"
	@$(CC) $(CFLAGS) -c $< -o $@

$(NAME): $(BUILD_PATH) $(OBJS)
	@echo " $(YEL)Archiving $(_NAME) archive$(D)"
	$(AR) $(NAME) $(OBJS)
	@echo " $(_NAME) archived: $(_SUCCESS) $(YEL)🖔$(D)"

bonus: $(BUILD_PATH) $(OBJS) $(BONUS_OBJS)	## Compile libft with bonus
	@echo " $(YEL)Archiving $(_NAME) w/ bonus$(D)"
	$(AR) $(NAME) $(OBJS) $(BONUS_OBJS)
	@echo " $(_NAME) archived w/ bonus: $(_SUCCESS) $(YEL)🖔$(D)"

extra: $(BUILD_PATH) $(OBJS) $(BONUS_OBJS) $(EXTRA_OBJS) $(GNL_OBJS) $(PRINTF_OBJS) $(FPRINTF_OBJS) ## Compile libft with extra
	@echo " $(YEL)Archiving $(_NAME)$(D)"
	$(AR) $(NAME) $(OBJS) $(BONUS_OBJS) $(EXTRA_OBJS) $(GNL_OBJS) $(PRINTF_OBJS) $(FPRINTF_OBJS)
	@echo " $(_NAME) archived: $(_SUCCESS) $(YEL)🖔$(D)"


clean:			## Clean libft binaries
	@echo "* $(RED)Removing libft binaries$(D)"
	$(RM) $(OBJS) $(BONUS_OBJS) $(EXTRA_OBJS) $(GNL_OBJS) $(PRINTF_OBJS)
	@echo "* $(YEL)Cleaning libft binaries!$(D) $(_SUCCESS) $(YEL)🖔$(D)"

fclean: clean	## Clean libft archive
	@echo " $(RED)Removing $(NAME) archive and .build directory$(D)"
	$(RM) $(NAME)
	$(RM) $(BUILD_PATH)
	@echo " $(YEL)Cleaning $(NAME) archive and .build directory!$(D) $(_SUCCESS) $(YEL)🖔$(D)"

re: fclean extra	## Clean and re-compile libft
	@echo " Cleaning & re-compiling libft!=: $(_SUCCESS) $(YEL)🖔$(D)"

.PHONY: all bonus extra clean fclean re help

# Colors
#
# Run the following command to get list of available colors
# bash -c 'for c in {0..255}; do tput setaf $c; tput setaf $c | cat -v; echo =$c; done'
#
B  		= $(shell tput bold)
BLA		= $(shell tput setaf 0)
RED		= $(shell tput setaf 1)
GRN		= $(shell tput setaf 2)
YEL		= $(shell tput setaf 3)
BLU		= $(shell tput setaf 4)
MAG		= $(shell tput setaf 5)
CYA		= $(shell tput setaf 6)
WHI		= $(shell tput setaf 7)
GRE		= $(shell tput setaf 8)
BRED 	= $(shell tput setaf 9)
BGRN	= $(shell tput setaf 10)
BYEL	= $(shell tput setaf 11)
BBLU	= $(shell tput setaf 12)
BMAG	= $(shell tput setaf 13)
BCYA	= $(shell tput setaf 14)
BWHI	= $(shell tput setaf 15)
D 		= $(shell tput sgr0)
BEL 	= $(shell tput bel)
CLR 	= $(shell tput el 1)
