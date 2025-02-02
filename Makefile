# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: pleoma <pleoma@student.42.fr>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/04/03 09:51:48 by pleoma            #+#    #+#              #
#    Updated: 2022/04/03 16:30:00 by pleoma           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME	=	minishell

CC		=	cc
FLAGS	=	-Wall -Wextra -Werror -g
FLAGS_O	=	-O2

RDFLAG	=	-lreadline
TCFLAG	=	-ltermcap
RL_LIB	=	readline/libreadline.a
HS_LIB	=	readline/libhistory.a
FLAGS_R =	$(RL_LIB) $(HS_LIB) $(RDFLAG) $(TCFLAG)

LIBDIR	=	libft
LIBFT	=	libft/libft.a

OBJDIR	=	obj
SRCDIR	=	src
HEADER	=	includes/minishell.h

OBJ		=	$(addprefix $(OBJDIR)/, $(SOURCES:.c=.o))
SRC 	= 	$(addprefix $(SRCDIR)/, $(SOURCES))
SOURCES	=	main.c				ft_parser.c\
			minishell.c			ft_sigil.c\
			ft_errors.c			ft_quotes_pipes.c\
			ft_free.c			ft_quotes_remove.c\
			ft_init_envp.c		ft_execute.c\
			ft_executor.c		ft_executor_2.c\
			ft_signals.c		ft_get_cmd.c\
			ft_dicts.c			ft_get_cmd_2.c\
			utils1.c			ft_redir.c\
			ft_redir_heredoc.c	ft_exec_children.c\
			ft_bins.c			ft_cmds.c\
			ft_bins_cd_1.c\
			ft_bins_cd_2.c\
			ft_bins_export_1.c\
			ft_bins_export_2.c\
			ft_bins_export_3.c\
			ft_bins_unset.c\

all		: $(NAME)

$(OBJDIR)/%.o: $(SRCDIR)/%.c $(HEADER)
	${CC} ${FLAGS} ${FLAGS_O} -c $< -o $@

$(NAME)	: $(OBJ) $(HEADER)
	@make -C $(LIBDIR)/
	@$(CC) $(FLAGS) $(FLAGS_R) $(LIBFT) $(OBJ) -o $@
	@echo "compiled $@"
	
$(OBJDIR):
		@mkdir $@

$(OBJ): | $(OBJDIR)

clean :
	@rm -rf $(OBJDIR)
	@make fclean -C $(LIBDIR)/
	@echo "Removing obj"

fclean : clean
	@rm -f $(NAME)
	@rm -f $(LIBFT)
	@echo "Removing all"

re : fclean all

.PHONY : all clean fclean re
