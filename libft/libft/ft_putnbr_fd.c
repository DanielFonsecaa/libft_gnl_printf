/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_putnbr_fd.c                                     :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: dda-fons <dda-fons@student.42porto.com>    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2025/04/10 13:30:20 by dda-fons          #+#    #+#             */
/*   Updated: 2025/04/10 13:38:08 by dda-fons         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "libft.h"

void	ft_putnbr_fd(int n, int fd)
{
	long	i;

	i = n;
	if (i < 0)
	{
		i *= -1;
		ft_putchar_fd('-', fd);
	}
	if (i >= 10)
		ft_putnbr_fd((i / 10), fd);
	ft_putchar_fd(((i % 10) + '0'), fd);
}
/*
int	main()
{
	ft_putnbr_fd(1235, 2);
}
*/
