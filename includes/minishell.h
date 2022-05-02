/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   minishell.h                                        :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: pleoma <pleoma@student.42.fr>              +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2022/04/03 09:56:20 by pleoma            #+#    #+#             */
<<<<<<< HEAD
/*   Updated: 2022/05/02 14:45:38 by pleoma           ###   ########.fr       */
=======
/*   Updated: 2022/05/02 13:47:26 by pleoma           ###   ########.fr       */
>>>>>>> 6ed10b9d91b59b76dbc49e67ae50f7e674cbeffd
/*                                                                            */
/* ************************************************************************** */

#ifndef MINISHELL_H
# define MINISHELL_H

# include <stdio.h>
# include <errno.h>
# include <unistd.h>
# include <stdlib.h>
# include <stdbool.h>

# include "../readline/tilde.h"
# include "../readline/rlconf.h"
# include "../readline/rlstdc.h"
# include "../readline/history.h"
# include "../readline/keymaps.h"
# include "../readline/readline.h"
# include "../readline/chardefs.h"
# include "../readline/rltypedefs.h"

# include "../libft/libft.h"

# define RED "\033[0;31m"
# define GREEN "\033[0;32m"
# define BLUE "\033[0;34m"
# define YELW "\033[1;33m"
# define WTH "\033[0;37m"

# define EXIT_FLAG 1

typedef struct s_child
{
	int		current;
	pid_t	pid;
	int		pipe[2][2];
	int		i;
	int		len;
}	t_child;

typedef struct s_dict
{
	char			*key;
	char			*value;
	struct s_dict	*next;
}	t_dict;

typedef struct s_cmd
{
	char			*name;
	char			**args;
	char			*i;
	t_dict			*infd;
	t_dict			*outfd;
	int				tmpfile;
	int				count;
	struct s_cmd	*next;
}	t_cmd;

typedef struct s_shell
{
	int		fd[3][2];
	int		status;
	char	*line;
	char	**envp;
	t_list	*list;
	t_cmd	*cmd;
}	t_shell;

/* one global var */
t_shell	g_shell;

/*	minishell.c */
void	minishell(void);
void	ft_readline(void);
<<<<<<< HEAD

/*	utils1.c */
unsigned int	len_of_mass(char **mass);
void			ft_new_envp(char **envp);

/*	ft_free.c */
void	ft_free_mass(char **arr);
=======
>>>>>>> 6ed10b9d91b59b76dbc49e67ae50f7e674cbeffd

/*	ft_errors.c */
void	ft_error(char *argv, int exit_code);
void 	ft_shell_error(char *argv, int exit_code, int exit_flag);


#endif