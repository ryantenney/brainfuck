#ifndef __BFF_H
#define __BFF_H

#ifdef __cplusplus
#define BEGIN_EXTERN_C extern "C" {
#define END_EXTERN_C }
#else
#define BEGIN_EXTERN_C
#define END_EXTERN_C
#endif

BEGIN_EXTERN_C

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stddef.h>
#include <stdbool.h>

#define xfree(__x) do { if ((__x) != NULL) { free(__x); (__x) = NULL; } } while (0)
#define stralloc(__len) ((char *) malloc((__len) + 1))

void populateFilenames(void);
void file_get_contents(FILE *, char **);

void init(void);
void yyinit(void);
void yyfill_str(char *);
void yylex(void);
int yynext(void);
int yyscan(char);
char yypeek(void);
void emit(char *);
void call_gcc(void);


char const * const intro =
"#define MOVL1     ptr--;\n\
#define MOVL(__v) ptr -= (__v);\n\
#define MOVR1     ptr++;\n\
#define MOVR(__v) ptr += (__v);\n\
#define INC1      (*ptr)++;\n\
#define INC(__v)  (*ptr) += (__v);\n\
#define DEC1      (*ptr)--;\n\
#define DEC(__v)  (*ptr) -= (__v);\n\
#define GET       (*ptr) = getchar();\n\
#define PUT       putchar(*ptr);\n\
#define LOOP      while (*ptr)\n\
\n\
char st[32768];\n\
int main(void) {\n\
	char *ptr = st;\n\n";


END_EXTERN_C

#endif /* __BFF_H */
