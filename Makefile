# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: amenadue <amenadue@student.42adel.org.a    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/07/13 20:06:31 by amenadue          #+#    #+#              #
#    Updated: 2022/08/08 11:40:19 by amenadue         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME	=	minitalk

FILES	=	server.c \
			client.c

CC		=	gcc

CCFLAGS	= 	-Wall -Werror -Wextra -Ilibft -Llibft -lft

init: re

all:libs server client
	@printf "Both 'server' and 'client' are ready.\n"

libs:
	@$(MAKE) all -s -C libft

client:
	@printf "Creating 'client'.\n"
	@$(CC) $(CCFLAGS) client.c -o client

server:
	@printf "Creating 'server'.\n"
	@$(CC) $(CCFLAGS) server.c -o server

clean:
	@printf "Cleaning libft.\n"
	@$(MAKE) clean -s -C libft

fclean:
	@printf "Full cleaning libft.\n"
	@$(MAKE) fclean -s -C libft
	@rm -f client
	@rm -f server

re: fclean all

.PHONY: all libs error clean fclean re