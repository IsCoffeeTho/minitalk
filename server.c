/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   server.c                                           :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: amenadue <amenadue@student.42adel.org.a    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2022/08/08 09:25:51 by amenadue          #+#    #+#             */
/*   Updated: 2022/08/08 11:43:26 by amenadue         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "libft.h"
#include <signal.h>

char	g_prtclbuf;

void	app_prtclbuf(int bit)
{
	g_prtclbuf <<= 1;
	g_prtclbuf |= bit;
}

int	main(void)
{
	ft_printf("[Server] Initialising.\n");
	ft_printf("[Server] PID: %d\n", getpid());
	while (1)
	{
		signal(SIGUSR2, app_prtclbuf);
		signal(SIGUSR1, app_prtclbuf);
	}
	return (0);
}
