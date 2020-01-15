#include <unistd.h>
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <fcntl.h>

unsigned long int	ft_strlen(char *str);
unsigned long int	ft_write(int fd, char *str, int len);
unsigned long int	ft_read(int fildes, void *buf, size_t nbyte);
char				*ft_strcpy(char * dst, const char * src);
int					ft_strcmp(const char *s1, const char *s2);
char				*ft_strdup(const char *s1);

int main(void)
{
	int fd;
	char *str =  "test";
	char *str2 = "test";
	char *dest;
	char *dest2;
	fd = open("ft_write.s", O_RDONLY);
	// ft_write(1, str, strlen(str));
	// printf("ft_strcpy : [%s]\n", ft_strcpy(dest, str));
	// printf("   read : [%zd] [%s]\n",  read(fd, dest2, 0), dest2);
	// printf("ft_read : [%zd] [%s]\n",  ft_read(fd, dest, 0), dest);
	// fd = ft_strlen("");
	// printf("[%d]\n", fd);
	dest2 =   strdup("bonjour");
	dest = ft_strdup("tre");
	write(1, "oui", 3);
	printf("ft_strdup : [%s] [%p]\n", NULL, dest);
	// free(dest);
	printf("   strdup : [%s] [%p]\n", dest2, dest2);
	// free(dest2);
}