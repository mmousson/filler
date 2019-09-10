# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: mmousson <mmousson@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2019/04/04 00:08:26 by mmousson          #+#    #+#              #
#    Updated: 2019/09/10 11:36:24 by mmousson         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

vpath %.c $(dir MAKEFILE_LIST)

include mk/core.mk
include mk/engine.mk

CC = gcc
NAME = mmousson.filler

CFLAGS = -g3 -Wall -Wextra -Werror -I./includes -I./libft/includes
CPPFLAGS += -MMD -MP

LIBFT = libft
LIBS = -lft
LIBSFOLDERS = -L./$(LIBFT)

OBJDIR = .o

OBJS = $(subst .c,.o,$(subst ./src/,./$(OBJDIR)/,$(SRCS)))
DEPS = $(subst .c,.d,$(subst ./src/,./$(OBJDIR)/,$(SRCS)))

all: $(NAME)

$(NAME): $(OBJS) | lib_rule
	@$(RM) tmp_log
	@$(RM) tmp_errors
	@if [ -e files_missing ]; then \
		printf "\033[1;31m\n[$(NAME) COMPILATION FAILED]\033[0m\n"; \
	else \
		if [ -e /tmp/.$(NAME)_makefile_link ] || [ ! -e $(NAME) ]; then \
			$(CC) $(OBJS) -o $(NAME) $(LIBSFOLDERS) $(LIBS); \
			printf "\033[1;36m\n[$(NAME) COMPILATION SUCCESSFUL]\033[0m\n"; \
		fi;\
	fi;
	@$(RM) files_missing
	@$(RM) /tmp/.42sh_makefile_link

$(OBJDIR):
	@$(shell mkdir -p $(OBJDIR))

$(OBJDIR)/%.o: src/%.c | $(OBJDIR)
	@$(shell mkdir -p $(dir $@))
	@$(shell touch /tmp/.$(NAME)_makefile_link)
	@printf "%-50s" "Precompiling $(notdir $@)..."
	@$(CC) $(CFLAGS) $(CPPFLAGS) -c -o $@ $< 2> ./tmp_log || /usr/bin/touch ./tmp_errors
	@if [ -e tmp_errors ]; then \
		printf "\033[1;31m[KO]\n\033[0m" && /bin/cat 1>&2 ./tmp_log && touch files_missing; \
	elif test -s ./tmp_log; then \
		printf "\033[1;33m[WARNING]\n\033[0m" && /bin/cat ./tmp_log; \
	else \
		printf "\033[1;32m[OK]\n\033[0m"; \
	fi;
	@$(RM) ./tmp_errors

clean:
	@$(MAKE) -C $(LIBFT) clean --no-print-directory
	@$(RM) $(OBJS) $(DEPS)
	@printf "\033[1;33m[42SH OBJECT FILES CLEANED]\033[0m\n"

fclean:
	@$(MAKE) -C $(LIBFT) fclean --no-print-directory
	@$(RM) $(OBJS) $(DEPS)
	@printf "\033[1;33m[42SH OBJECT FILES CLEANED]\033[0m\n"
	@$(RM) $(NAME)
	@printf "\033[1;35m[42SH BINARY DELETED]\033[0m\n"

re: fclean all

fclean_nolib:
	@$(RM) $(OBJS) $(DEPS)
	@printf "\033[1;33m[42SH OBJECT FILES CLEANED]\033[0m\n"
	@$(RM) $(NAME)
	@printf "\033[1;35m[42SH BINARY DELETED]\033[0m\n"

re_nolib: fclean_nolib all

lib_rule:
	@$(MAKE) -C $(LIBFT) --no-print-directory

.PHONY: lib_rule all clean fclean re re_nolib fclean_nolib
-include $(DEPS)