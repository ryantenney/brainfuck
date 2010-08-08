#include <stdlib.h>
#include <string.h>
#include <stdio.h>

#define TAPE_LEN (32768)
#define BUFFER_LEN (1024)


typedef unsigned char byte;

typedef struct {
	byte *tape;
	void *stack;
} vm_t;


vm_t *vm_init(void);
void vm_exec(vm_t *, const char *);
void vm_free(vm_t *);


int main(int argc, char **argv)
{
	FILE *file = NULL;
	char *code = (char *) malloc(BUFFER_LEN);
	size_t code_len = 0;
	size_t bytes_read = 0;

	if (argc >= 2) {
		file = fopen(argv[1], "r");
	} else {
		file = stdin;
	}

	if (file == NULL) {
		fputs("Must provide a file as the first argument, or piped into stdin.", stderr);
		exit(1);
	}

	while (bytes_read = fread((code + code_len), 1, BUFFER_LEN, file)) {
		code_len += bytes_read;
		code = (char *) realloc(code, code_len + BUFFER_LEN);
	}

	vm_init(
	vm_exec(code);

	fclose(file);
}

vm_t *vm_init(void) {
	BFVirtualMachine
	byte _tape[TAPE_LEN];
	void *stack = malloc(16, sizeof(void *));
}

void vm_exec(vm_t *vm, const char *code)
{
	register byte *ptr = _tape;
	while (*code) {
		switch (*code) {

			case '>':
				++ptr;
				break;


			case '<':
				--ptr;
				break;


			case '+':
				++*ptr;
				break;


			case '-':
				--*ptr;
				break;


			case '[':

				break;


			case ']':

				break;

		}
	}
}

void vm_free(vm_t *vm)
{
	if (vm != NULL)
	{
		free(vm);
	}
}
