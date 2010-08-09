#include <stdio.h>
#include <string.h>

#define MEM_SIZE 32768

char const jmp[] = {
	0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
	0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
	0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,0,
	0,0,0,0,0,0,0,0,0,0,0,0,1,0,1,0,
	0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
	0,0,0,0,0,0,0,0,0,0,0,2,0,2,0,0,
	0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
	0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
};

typedef struct _instr_t instr_t;

struct _instr_t {
	int jump;
	char instr;
	int execcount;
	int pushcount;
	int popcount;
	int jumpcount;
};

char raw[MEM_SIZE];
instr_t instr[MEM_SIZE];
int stack[MEM_SIZE];
char tape[MEM_SIZE];
int  instrp, stackp, tapep, proglen;

int main()
{
	int tmp;
	proglen = fread(raw, 1, MEM_SIZE, stdin);

#ifdef DEBUG
	int __ctr = 0;
	int tapemax = 0;
	printf("source:\n%s\n\nlen: %d chars (%d)\n\n", raw, (int)proglen, (int)strlen(raw));
#endif

	while (instrp < proglen)
	{
		instr[instrp].instr = raw[instrp];
		switch (raw[instrp])
		{
			case '[':
				stack[stackp++] = instrp;
				break;
			case ']':
				tmp = stack[--stackp];
				instr[tmp].jump = instrp;
				instr[instrp].jump = tmp;
				break;
		}
		++instrp;
	}

	if (stackp) {
		fputs("Unmatched bracket.\n", stderr);
		return 1;
	}

	instrp = 0;
	while (instrp < proglen)
	{

#ifdef DEBUG
		__ctr++;
		instr[instrp].execcount++;
		if (tapep > tapemax) tapemax = tapep;
#endif

		switch (instr[instrp].instr)
		{
			case '>':
				tapep++;
				break;

			case '<':
				tapep--;
				break;

			case '+':
				tape[tapep]++;
				break;

			case '-':
				tape[tapep]--;
				break;

			case ',':
				tape[tapep] = getchar();
				break;

			case '.':
				putchar(tape[tapep]);
				break;

#ifdef DEBUG
			case '#':
				{
					int x=0;
					puts("");
					for (;x <= tapemax; ++x) {
						printf(" %2X", tape[x]);
					}
					puts("");
				}
				break;
#endif

			case '[':
				if (tape[tapep])
				{
#ifdef DEBUG
					instr[instrp].pushcount++;
#endif
					stack[stackp++] = instrp;
				}
				else
				{
#ifdef DEBUG
					instr[instrp].jumpcount++;
#endif
					instrp = instr[instrp].jump;
				}
				break;

			case ']':
#ifdef DEBUG
				instr[instrp].popcount++;
#endif
				instrp = stack[--stackp];
				continue;
				break;
		}
		++instrp;
	}

#ifdef DEBUG
	instrp = 0;
	while (instrp < proglen)
	{
		printf("\n%4d %c", instrp, instr[instrp].instr);
		switch (instr[instrp].instr)
		{
			case '[':
			case ']':
				printf("\tpair %4d; exec %4d; jump %4d; push %4d; pop %4d;", instr[instrp].jump, instr[instrp].execcount, instr[instrp].jumpcount, instr[instrp].pushcount, instr[instrp].popcount);
				break;
			case '>':
			case '<':
			case '+':
			case '-':
			case ',':
			case '.':
				printf("\texec %4d;", instr[instrp].execcount);
				break;
		}
		++instrp;
	}

	printf("\n\n__ctr = %d\ntapemax = %d\n", __ctr, tapemax);
#endif
}
