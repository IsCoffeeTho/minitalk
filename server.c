/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   server.c                                           :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: amenadue <amenadue@student.42adel.org.a    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2022/08/08 09:25:51 by amenadue          #+#    #+#             */
/*   Updated: 2022/08/18 15:20:22 by amenadue         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "libft.h"
#include <signal.h>

char	g_buf;
char	g_i;

void	app_buf(int bit)
{
	g_buf <<= 1;
	if (bit == SIGUSR2)
		g_buf |= 0x1;
	g_i++;
	if (g_i == 8)
	{
		if (g_buf == 0)
			ft_printf("\n");
		else
			ft_printf("%c", g_buf);
		g_buf = 0;
		g_i = 0;
	}
}

int	main(void)
{
	ft_printf("[Server] Initialising.\n");
	ft_printf("[Server] PID: %d\n", getpid());
	g_buf = 0;
	g_i = 0;
	while (1)
	{
		signal(SIGUSR2, app_buf);
		signal(SIGUSR1, app_buf);
		pause();
	}
	return (0);
}
