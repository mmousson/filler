# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    engine.mk                                          :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: mmousson <mmousson@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2019/09/10 11:35:33 by mmousson          #+#    #+#              #
#    Updated: 2019/09/10 11:36:14 by mmousson         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

ENGINE_PATH = ./src/engine/
ENGINE =	engine.c

ENGINE_SRCS = $(addprefix $(ENGINE_PATH),$(ENGINE))
SRCS += $(ENGINE_SRCS)