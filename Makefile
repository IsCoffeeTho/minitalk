# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: amenadue <amenadue@student.42adel.org.a    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/07/13 20:06:31 by amenadue          #+#    #+#              #
#    Updated: 2022/08/08 10:43:57 by amenadue         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME	=	MiniTalk

FILES	=	server.c \
			client.c

LIBS	=	libft

INC		=	$(foreach lib,$(LIBS), -I$(lib) $(lib).a)

CC		=	gcc

CCFLAGS	=	-Wall -Werror -Wextra$(INC)

init: re

all:libs server client
	@printf "Both 'server' and 'client' are ready.\n"

libs:
	@$(foreach lib,$(LIBS),make all -s -C $(lib);)

client:
	$(CC) $(CCFLAGS) client.c -o client

server:
	$(CC) $(CCFLAGS) server.c -o server

clean:
	@$(foreach lib,$(LIBS),make clean -s -C $(lib);)

fclean:
	@$(foreach lib,$(LIBS),make fclean -s -C $(lib);)
	@rm -f client
	@rm -f server

re: fclean all

.PHONY: all libs error clean fclean re