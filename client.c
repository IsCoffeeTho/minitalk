/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   client.c                                           :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: amenadue <amenadue@student.42adel.org.a    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2022/08/08 09:25:48 by amenadue          #+#    #+#             */
/*   Updated: 2022/08/18 15:21:24 by amenadue         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "libft.h"
#include <stdlib.h>
#include <signal.h>

char	g_buf;
char	g_i;

void	send_string(int pid, char *str, size_t len)
{
	int		ibit;
	size_t	i;

	i = 0;
	while (i <= len)
	{
		ibit = 0;
		while (ibit < 8)
		{
			if ((str[i] << ibit) & 0x80)
				kill(pid, SIGUSR2);
			else
				kill(pid, SIGUSR1);
			ibit++;
			usleep(350);
		}
		i++;
	}
}

int	main(int c, char **v)
{
	int		pid;
	char	*str;

	if (c == 3)
	{
		pid = ft_atoi(v[1]);
		str = v[2];
		send_string(pid, str, ft_strlen(str));
		return (0);
	}
	else if (c == 2)
		ft_printf("Missing \"word\" argument:\n%s <pid> <word>\n", v[0]);
	else
		ft_printf("Missing \"pid\" argument:\n%s <pid> <word>\n", v[0]);
	return (1);
}
