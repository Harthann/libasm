#include <unistd.h>
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <fcntl.h>

unsigned long int	ft_strlen(char *str);
unsigned long int	ft_write(int fd, char *str, int len);
unsigned long int	ft_read(int fildes, void *buf, size_t nbyte);
char				*ft_strcpy(char *dst, const char * src);
int					ft_strcmp(const char *s1, const char *s2);
char				*ft_strdup(const char *s1);

int main(int ac, char **av)
{
	int fd;
	char *dest;
	char *dest2;
	char buffer[50];

	if (ac == 3)
		fd = open(av[2], O_RDONLY);
	else
		fd = 0;
	if (ac >= 2)
	{
		int w_res;
		int ftw_res;

		w_res = 0;
		ftw_res = 0;
		if (!(dest = malloc(sizeof(char) * ft_strlen(av[1]) + 1)))
			return (0);
		dest = ft_strcpy(dest, av[1]);
		printf("strlen : [%zu] resultat copy : [%s]\n", ft_strlen(av[1]), dest);
		free(dest);
		dest2 =   strdup(av[1]);
		dest = ft_strdup(av[1]);
		printf("ft_strdup : [%s] [%p]\n", dest, dest);
		printf("   strdup : [%s] [%p]\n", dest2, dest2);
		w_res += write(-1, dest, ft_strlen(dest));
		w_res += write(-1, "\n", 1);
		ftw_res += ft_write(-1, dest, ft_strlen(dest));
		ftw_res += ft_write(-1, "\n", 1);
		printf("ftw_res : [%d]\tw_res : [%d]\n", ftw_res, w_res);

	}
	int res;
	res = read(fd, buffer, 50);
	if (res >= 0)
		buffer[res] = '\0';
	printf("read : [%s] [%d]\n", buffer, res);
	close(fd);
	if (ac == 3)
		fd = open(av[2], O_RDONLY);
	else
		fd = 0;
	res = ft_read(fd, buffer, 50);
	if(res >= 0)
		buffer[res] = '\0';
	printf("ft_read : [%s] [%d] [%d]\n", buffer, res, fd);
	return (0);
}
