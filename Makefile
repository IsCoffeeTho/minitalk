# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: amenadue <amenadue@student.42adel.org.a    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/07/13 20:06:31 by amenadue          #+#    #+#              #
#    Updated: 2022/08/18 15:24:53 by amenadue         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME	=	minitalk

OUTPUT	=	server \
			client

CC		=	gcc

LIBS	=	libft

INC		=	-I./ $(foreach lib,$(LIBS),-I$(lib) -L$(lib) -l$(subst lib,,$(lib)))

CCFLAGS	=  -Wall -Werror -Wextra

re: fclean all

all:libs server client
	@printf "\e[92mBoth '\e[94mserver\e[92m' and '\e[94mclient\e[92m' are ready.\e[0m\n"

libs:
	@printf "\e[94m"
	@$(MAKE) all -s -C libft || $$(printf "\e[0m"; exit)
	@printf "\e[0m"

$(OUTPUT):
	@printf "\e[92mCreating '$@'.\e[0m\n"
	@$(CC) $(CCFLAGS) $@.c $(INC) -o $@ || { printf "\e[91mError compiling '\e[92m$@\e[91m'.\e[0m\n"; exit 1; }

clean:
	@printf "\e[92mCleaning libft.\e[0m\n"
	@$(MAKE) clean -s -C libft

fclean:
	@printf "\e[92mFull cleaning libft.\e[0m\n"
	@$(MAKE) fclean -s -C libft 
	@printf "\e[92mClearing '\e[94mserver\e[92m' and '\e[94mclient\e[92m'.\e[0m\n"
	@rm -f $(OUTPUT)

.PHONY: all libs clean fclean re