#include <stdlib.h>
#include <string.h>
#include <stdio.h>

int main(void)
{
  int	len;
  char	c;
  char	*rslt;
  char	*test;
  char	*toast;

  test = strdup("test string");
  toast = strdup("lol toast");

  /* STRCHR TEST */
  c = 'i';
  rslt = strchr(test, c);
  if (rslt == NULL)
    printf("strchr -> rslt is [NULL] for [%s, %c]\n", test, c);
  else
    printf("strchr -> rslt is [%s] for [%s, %c]\n", rslt, test, c);
  c = 'o';
  rslt = strchr(test, c);
  if (rslt == NULL)
    printf("strchr -> rslt is [NULL] for [%s, %c]\n", test, c);
  else
    printf("strchr -> rslt is [%s] for [%s, %c]\n", rslt, test, c);
  c = '\0';
  rslt = strchr(test, c);
  if (rslt == NULL)
    printf("strchr -> rslt is [NULL] for [%s, %c]\n", test, c);
  else
    printf("strchr -> rslt is [%s] for [%s, %c]\n", rslt, test, c);

  printf("\n");

  /* STRLEN TEST */
  len = strlen(test);
  printf("strlen -> len is [%d] for [%s]\n", len, test);
  len = strlen("");
  printf("strlen -> len is [%d] for [EMPTY]\n", len);

  printf("\n");

  /* STRCMP TEST */
  printf("strcmp -> [%d] for [NULL, NULL]\n", strcmp(NULL, NULL));
  printf("strcmp -> [%d] for [%s, %s]\n", strcmp(test, toast), test, toast);
  toast = strdup("zzz");
  printf("strcmp -> [%d] for [%s, %s]\n", strcmp(test, toast), test, toast);
  toast = strdup("test string");
  printf("strcmp -> [%d] for [%s, %s]\n", strcmp(test, toast), test, toast);
  toast = strdup("test stringok");
  printf("strcmp -> [%d] for [%s, %s]\n", strcmp(test, toast), test, toast);
  toast = strdup("00AHAHtest string");
  printf("strcmp -> [%d] for [%s, %s]\n", strcmp(test, toast), test, toast);
  printf("strcmp -> [%d] for [%s, EMPTY]\n", strcmp(test, ""), test);
  printf("strcmp -> [%d] for [EMPTY, %s]\n", strcmp("", toast), toast);
  printf("strcmp -> [%d] for [EMPTY, EMPTY]\n", strcmp("", ""));

  printf("\n");

  /* MEMCPY_TEST */
  toast = strdup("other test string");
  rslt = memcpy(NULL, NULL, 5);
  if (rslt == NULL)
    printf("memcpy -> rslt is [NULL] for [NULL, NULL, 5]\n");
  else
    printf("memcpy -> rslt is [%s] for [NULL, NULL, 5]\n", rslt);
  rslt = memcpy(NULL, toast, 0);
  if (rslt == NULL)
    printf("memcpy -> rslt is [NULL] for [NULL, %s, 0]\n", toast);
  else
    printf("memcpy -> rslt is [%s] for [NULL, %s, 0]\n", rslt, toast);
  rslt = memcpy(test, toast, 0);
  if (rslt == NULL)
    printf("memcpy -> rslt is [NULL] for [%s, %s, 0]\n", test, toast);
  else
    printf("memcpy -> rslt is [%s] for [%s, %s, 0]\n", rslt, test, toast);
  rslt = memcpy(test, toast, 50);
  test[50] = '\0';
  if (rslt == NULL)
    printf("memcpy -> rslt is [NULL] for [%s, %s, 0]\n", test, toast);
  else
    printf("memcpy -> rslt is [%s] for [%s, %s, 0]\n", rslt, test, toast);
  rslt = memcpy(test, toast, 5);
  test[5] = '\0';
  if (rslt == NULL)
    printf("memcpy -> rslt is [NULL] for [%s, %s, 5]\n", test, toast);
  else
    printf("memcpy -> rslt is [%s] for [%s, %s, 5]\n", rslt, test, toast);

  printf("\n");

  /* MEMSET_TEST */
  rslt = memset(NULL, 0, 0);
  if (rslt == NULL)
    printf("memset -> rslt is [NULL] for [NULL, 0, 0]\n");
  else
    printf("memset -> rslt is [%s] for [NULL, 0, 0]\n", rslt);
  rslt = memset(test, 0, 11);
  if (rslt == NULL)
    printf("memset -> rslt is [NULL] for [%s, 0, 11]\n", test);
  else
    printf("memset -> rslt is [%s] for [%s, 0, 11]\n", rslt, test);
  rslt = memset(test, 48, 5);
  if (rslt == NULL)
    printf("memset -> rslt is [NULL] for [%s, 48, 5]\n", test);
  else
    printf("memset -> rslt is [%s] for [%s, 48, 5]\n", rslt, test);
  rslt = memset(test, 48, 50);
  test[50] = '\0';
  if (rslt == NULL)
    printf("memset -> rslt is [NULL] for [%s, 48, 5]\n", test);
  else
    printf("memset -> rslt is [%s] for [%s, 48, 5]\n", rslt, test);
  rslt = memset(test, 484575, 5);
  test[5] = '\0';
  if (rslt == NULL)
    printf("memset -> rslt is [NULL] for [%s, 484575, 5]\n", test);
  else
    printf("memset -> rslt is [%s] for [%s, 484575, 5]\n", rslt, test);
  rslt = memset(test, 0, 0);
  if (rslt == NULL)
    printf("memset -> rslt is [NULL] for [%s, 0, 0]\n", test);
  else
    printf("memset -> rslt is [%s] for [%s, 0, 0]\n", rslt, test);

  printf("\n");

  /* MEMMOVE_TEST */
  test = strdup("test string");
  toast = strdup("lol toast");
  rslt = memmove(NULL, NULL, 5);
  if (rslt == NULL)
    printf("memmove -> rslt is [NULL] for [NULL, NULL, 5]\n");
  else
    printf("memmove -> rslt is [%s] for [NULL, NULL, 5]\n", rslt);
  rslt = memmove(NULL, toast, 0);
  if (rslt == NULL)
    printf("memmove -> rslt is [NULL] for [NULL, %s, 0]\n", toast);
  else
    printf("memmove -> rslt is [%s] for [NULL, %s, 0]\n", rslt, toast);
  rslt = memmove(test, toast, 0);
  if (rslt == NULL)
    printf("memmove -> rslt is [NULL] for [%s, %s, 0]\n", test, toast);
  else
    printf("memmove -> rslt is [%s] for [%s, %s, 0]\n", rslt, test, toast);
  rslt = memmove(test, toast, 50);
  test[50] = '\0';
  if (rslt == NULL)
    printf("memmove -> rslt is [NULL] for [%s, %s, 0]\n", test, toast);
  else
    printf("memmove -> rslt is [%s] for [%s, %s, 0]\n", rslt, test, toast);
  rslt = memmove(test, toast, 5);
  test[5] = '\0';
  if (rslt == NULL)
    printf("memmove -> rslt is [NULL] for [%s, %s, 5]\n", test, toast);
  else
    printf("memmove -> rslt is [%s] for [%s, %s, 5]\n", rslt, test, toast);

  printf("\n");

  /* STRNCMP TEST */
  test = strdup("test string");
  toast = strdup("test toast");
  printf("strncmp -> [%d] for [NULL, NULL, 0]\n", strncmp(NULL, NULL, 0));
  printf("strncmp -> [%d] for [%s, %s, 0]\n", strncmp(test, toast, 0), test, toast);
  printf("strncmp -> [%d] for [%s, %s, 4]\n", strncmp(test, toast, 4), test, toast);
  printf("strncmp -> [%d] for [%s, %s, -1]\n", strncmp(test, toast, -1), test, toast);
  printf("strncmp -> [%d] for [%s, %s, 50]\n", strncmp(test, toast, 50), test, toast);
  toast = strdup("test string");
  printf("strncmp -> [%d] for [%s, %s, 0]\n", strncmp(test, toast, 0), test, toast);
  printf("strncmp -> [%d] for [%s, %s, 4]\n", strncmp(test, toast, 4), test, toast);
  printf("strncmp -> [%d] for [%s, %s, -1]\n", strncmp(test, toast, -1), test, toast);
  printf("strncmp -> [%d] for [%s, %s, 50]\n", strncmp(test, toast, 50), test, toast);

  printf("\n");

  /* STRCASECMP TEST */
  test = strdup("test string");
  toast = strdup("TEST STRING");
  printf("strcasecmp -> [%d] for [%s, %s]\n", strcasecmp(test, toast), test, toast);
  toast = strdup("ZZZ");
  printf("strcasecmp -> [%d] for [%s, %s]\n", strcasecmp(test, toast), test, toast);
  toast = strdup("zzz");
  printf("strcasecmp -> [%d] for [%s, %s]\n", strcasecmp(test, toast), test, toast);
  toast = strdup("test TOAST");
  printf("strcasecmp -> [%d] for [%s, %s]\n", strcasecmp(test, toast), test, toast);
  toast = strdup("test string");
  printf("strcasecmp -> [%d] for [%s, %s]\n", strcasecmp(test, toast), test, toast);
  toast = strdup("test STRING");
  printf("strcasecmp -> [%d] for [%s, %s]\n", strcasecmp(test, toast), test, toast);
  printf("strcasecmp -> [%d] for [%s, EMPTY]\n", strcasecmp(test, ""), test);
  printf("strcasecmp -> [%d] for [EMPTY, %s]\n", strcasecmp("", toast), toast);
  printf("strcasecmp -> [%d] for [EMPTY, EMPTY]\n", strcasecmp("", ""));

  printf("\n");

  /* RINDEX TEST */
  toast = strdup("lol toast");
  c = 'i';
  rslt = rindex(test, c);
  if (rslt == NULL)
    printf("rindex -> rslt is [NULL] for [%s, %c]\n", test, c);
  else
    printf("rindex -> rslt is [%s] for [%s, %c]\n", rslt, test, c);
  c = 'o';
  rslt = rindex(test, c);
  if (rslt == NULL)
    printf("rindex -> rslt is [NULL] for [%s, %c]\n", test, c);
  else
    printf("rindex -> rslt is [%s] for [%s, %c]\n", rslt, test, c);
  rslt = rindex(toast, c);
  if (rslt == NULL)
    printf("rindex -> rslt is [NULL] for [%s, %c]\n", toast, c);
  else
    printf("rindex -> rslt is [%s] for [%s, %c]\n", rslt, toast, c);
  c = '\0';
  rslt = rindex(test, c);
  if (rslt == NULL)
    printf("rindex -> rslt is [NULL] for [%s, %c]\n", test, c);
  else
    printf("rindex -> rslt is [%s] for [%s, %c]\n", rslt, test, c);

  printf("\n");

  /* STRSTR TEST */
  toast = strdup("str");
  rslt = strstr(test, toast);
  if (rslt == NULL)
    printf("strstr -> rslt is [NULL] for [%s, %s]\n", test, toast);
  else
    printf("strstr -> rslt is [%s] for [%s, %s]\n", rslt, test, toast);
  toast = strdup("");
  rslt = strstr(test, toast);
  if (rslt == NULL)
    printf("strstr -> rslt is [NULL] for [%s, %s]\n", test, toast);
  else
    printf("strstr -> rslt is [%s] for [%s, %s]\n", rslt, test, toast);
  toast = strdup("zerbt");
  rslt = strstr(test, toast);
  if (rslt == NULL)
    printf("strstr -> rslt is [NULL] for [%s, %s]\n", test, toast);
  else
    printf("strstr -> rslt is [%s] for [%s, %s]\n", rslt, test, toast);
  toast = strdup("i");
  rslt = strstr(test, toast);
  if (rslt == NULL)
    printf("strstr -> rslt is [NULL] for [%s, %s]\n", test, toast);
  else
    printf("strstr -> rslt is [%s] for [%s, %s]\n", rslt, test, toast);
  toast = strdup("test string");
  rslt = strstr(test, toast);
  if (rslt == NULL)
    printf("strstr -> rslt is [NULL] for [%s, %s]\n", test, toast);
  else
    printf("strstr -> rslt is [%s] for [%s, %s]\n", rslt, test, toast);
  test = strdup("");
  rslt = strstr(test, toast);
  if (rslt == NULL)
    printf("strstr -> rslt is [NULL] for [%s, %s]\n", test, toast);
  else
    printf("strstr -> rslt is [%s] for [%s, %s]\n", rslt, test, toast);
  toast = strdup("");
  rslt = strstr(test, toast);
  if (rslt == NULL)
    printf("strstr -> rslt is [NULL] for [%s, %s]\n", test, toast);
  else
    printf("strstr -> rslt is [%s] for [%s, %s]\n", rslt, test, toast);

  printf("\n");

  /* STRPBRK TEST */
  toast = strdup("azyiuop");
  test = strdup("test string");
  rslt = strpbrk(test, toast);
  if (rslt == NULL)
    printf("strpbrk -> rslt is [NULL] for [%s, %s]\n", test, toast);
  else
    printf("strpbrk -> rslt is [%s] for [%s, %s]\n", rslt, test, toast);
  toast = strdup("");
  rslt = strpbrk(test, toast);
  if (rslt == NULL)
    printf("strpbrk -> rslt is [NULL] for [%s, %s]\n", test, toast);
  else
    printf("strpbrk -> rslt is [%s] for [%s, %s]\n", rslt, test, toast);
  toast = strdup("azyuop");
  rslt = strpbrk(test, toast);
  if (rslt == NULL)
    printf("strpbrk -> rslt is [NULL] for [%s, %s]\n", test, toast);
  else
    printf("strpbrk -> rslt is [%s] for [%s, %s]\n", rslt, test, toast);
  toast = strdup("azyuope");
  rslt = strpbrk(test, toast);
  if (rslt == NULL)
    printf("strpbrk -> rslt is [NULL] for [%s, %s]\n", test, toast);
  else
    printf("strpbrk -> rslt is [%s] for [%s, %s]\n", rslt, test, toast);
  toast = strdup("i");
  rslt = strpbrk(test, toast);
  if (rslt == NULL)
    printf("strpbrk -> rslt is [NULL] for [%s, %s]\n", test, toast);
  else
    printf("strpbrk -> rslt is [%s] for [%s, %s]\n", rslt, test, toast);
  toast = strdup("test string");
  rslt = strpbrk(test, toast);
  if (rslt == NULL)
    printf("strpbrk -> rslt is [NULL] for [%s, %s]\n", test, toast);
  else
    printf("strpbrk -> rslt is [%s] for [%s, %s]\n", rslt, test, toast);
  test = strdup("");
  rslt = strpbrk(test, toast);
  if (rslt == NULL)
    printf("strpbrk -> rslt is [NULL] for [%s, %s]\n", test, toast);
  else
    printf("strpbrk -> rslt is [%s] for [%s, %s]\n", rslt, test, toast);
  toast = strdup("");
  rslt = strpbrk(test, toast);
  if (rslt == NULL)
    printf("strpbrk -> rslt is [NULL] for [%s, %s]\n", test, toast);
  else
    printf("strpbrk -> rslt is [%s] for [%s, %s]\n", rslt, test, toast);
  rslt = strpbrk(NULL, toast);
  if (rslt == NULL)
    printf("strpbrk -> rslt is [NULL] for [NULL, %s]\n", toast);
  else
    printf("strpbrk -> rslt is [%s] for [NULL, %s]\n", rslt, toast);

  printf("\n");

  /* STRCSPN TEST */
  test = strdup("test string");
  toast = strdup("ring");
  printf("strcspn -> [%d] for [%s, %s]\n", strcspn(test, toast), test, toast);
  toast = strdup("ZZZ");
  printf("strcspn -> [%d] for [%s, %s]\n", strcspn(test, toast), test, toast);
  toast = strdup("g");
  printf("strcspn -> [%d] for [%s, %s]\n", strcspn(test, toast), test, toast);
  toast = strdup("t");
  printf("strcspn -> [%d] for [%s, %s]\n", strcspn(test, toast), test, toast);
  toast = strdup("");
  printf("strcspn -> [%d] for [%s, %s]\n", strcspn(test, toast), test, toast);
  toast = strdup("test string");
  printf("strcspn -> [%d] for [%s, %s]\n", strcspn(test, toast), test, toast);
  printf("strcspn -> [%d] for [%s, EMPTY]\n", strcspn(test, ""), test);
  printf("strcspn -> [%d] for [EMPTY, %s]\n", strcspn("", toast), toast);
  printf("strcspn -> [%d] for [EMPTY, EMPTY]\n", strcspn("", ""));

  return (0);
}
