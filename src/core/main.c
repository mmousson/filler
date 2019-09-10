/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   main.c                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: mmousson <mmousson@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2019/09/10 09:15:45 by mmousson          #+#    #+#             */
/*   Updated: 2019/09/10 11:37:36 by mmousson         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include <unistd.h>

#include "libft.h"

static char	get_player_piece(void)
{
	char	res;
	char	*line;

	if (get_next_line(STDIN_FILENO, &line) <= 0)
		res = 0;
	else
	{
		if (ft_strstr(line, "$$$ exec p") != NULL)
			res = (line[10] == '1' ? 'o' : 'x');
		else
			res = 0;
	}
	if (res == 0)
		ft_putendl_fd("Bad player info", STDERR_FILENO);
	ft_strdel(&line);
	return (res);
}

int			main(void)
{
	char	to_play;

	if ((to_play = get_player_piece()) == 0)
		return (1);
	launch_game();
	return (0);
}
