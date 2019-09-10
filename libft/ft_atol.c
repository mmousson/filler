/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_atol.c                                          :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: mmousson <mmousson@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2018/12/20 03:08:58 by mmousson          #+#    #+#             */
/*   Updated: 2019/06/19 14:28:13 by mmousson         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

long int	ft_atol(const char *s, int *error)
{
	int				neg;
	long long int	res;

	neg = 1;
	res = 0;
	while (*s == 32 || (*s >= 9 && *s <= 13))
		s++;
	if (*s == '-' || *s == '+')
	{
		if (*s == '-')
			neg = -1;
		s++;
	}
	while (*s >= '0' && *s <= '9')
	{
		res = (res * 10LL) + (long long)(*s - '0');
		s++;
		if (res > 2147483647LL || res < -2147483648LL)
			*error = 1;
	}
	return ((long int)(res * neg));
}
