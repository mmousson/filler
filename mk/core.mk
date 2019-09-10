# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    core.mk                                            :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: mmousson <mmousson@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2019/09/10 09:16:55 by mmousson          #+#    #+#              #
#    Updated: 2019/09/10 09:17:24 by mmousson         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

CORE_PATH = ./src/core/
CORE =	main.c

CORE_SRCS = $(addprefix $(CORE_PATH),$(CORE))
SRCS += $(CORE_SRCS)