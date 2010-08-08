#include "bff.h"

#define yych (*yycursor)

char *filename = NULL, *cfilename = NULL, *ofilename = NULL;
bool write_to_file = false;
FILE *input, *output;

char *indent, *indent_start;
char *yytext, *yycursor, *yylimit;

int main(int argc, char **argv, char **env)
{
	if (argc < 2 || argv[1] == NULL) {
		input = stdin;
		cfilename = stralloc(L_tmpnam);
		tmpnam(cfilename);
	} else {
		write_to_file = true;
		filename = argv[1];
		populateFilenames();
		input = fopen(filename, "r");
	}

	init();

	output = fopen(cfilename, "w");

	file_get_contents(input, &yytext);
	yyfill_str(yytext);

	fputs(intro, output);

	yylex();

	fputc('}', output);

	fflush(output);
	fclose(output);

	fclose(input);

	call_gcc();

	xfree(yytext);
	xfree(cfilename);
	xfree(ofilename);

	return 0;
}

#define BUFFER_SIZE 65536

void file_get_contents(FILE *fd, char **data)
{
	*data = (char *) malloc(BUFFER_SIZE);
	size_t len = fread(*data, 1, BUFFER_SIZE, fd);
	fputs(*data, stdout);
	printf("len: %d\nlen2: %d\n", (int)strlen(*data), (int)len);
	/*char *buffer = (char *) malloc(BUFFER_SIZE),
		 *buffer_end = buffer;
	size_t read = 0, buffer_len = 0, buffer_size = 0;
	while (read = fread(buffer_end, 1, BUFFER_*/
}


void populateFilenames(void)
{
	size_t len = strlen(filename);
	char *tmp, *ext;

	ofilename = stralloc(len);
	cfilename = stralloc(len);

	tmp = ofilename;
	strcpy(tmp, filename);
	ext = tmp + len - 3;

	ext[2] = '\0';
	ext[1] = 'c';
	strcpy(cfilename, tmp);

	ext[0] = '\0';
}


void call_gcc(void)
{
	char cmd[1024];
	sprintf(cmd, "gcc -O3 -g -o %s %s", ofilename, cfilename);
	system(cmd);
}


void yylex() {
	char tmp[128],
		 *cmd = NULL,
		 *start = NULL;
	size_t count = 1;
	while (yynext())
	{
		switch (yych) {
			//case '/': if (yypeek() == '/' && yyscan('\n')) emit("/* comment detected */"); break;
			//case '#': emit("/* hash detected */"); break;

			case ',': emit("GET"); break;
			case '.': emit("PUT"); break;

					// indenting is backward
			case '[': emit("LOOP {"); indent--; break;
			case ']': indent++; emit("}"); break;

			case '+':
			case '-':
			case '<':
			case '>': {
				//char *start = yycursor;
				//yyscan(yych);
				//size_t count = yycursor - start + 1;

				switch (yych) {
					case '+': cmd = "INC";  break;
					case '-': cmd = "DEC";  break;
					case '<': cmd = "MOVL"; break;
					case '>': cmd = "MOVR"; break;
				}

				if (cmd != NULL) {
					//if (count > 1) {
						//sprintf(tmp, "%s(%d)", cmd, (int)count);
					//} else {
						sprintf(tmp, "%s1", cmd);
					//}
					emit(tmp);
				}

				break;
			 }
		}
	}
}


void init(void)
{
	indent_start = stralloc(127);
	memset(indent_start, '\t', 127);
	indent_start[127] = '\0';
	indent = indent_start + 126;
}


void yyfill_str(char *str)
{
	yytext = str;
	yycursor = yytext - 1;
	yylimit = yycursor + strlen(yytext);
}


void emit(char *str)
{
	fputs(indent, output);
	fputs(str, output);
	fputc('\n', output);
}


int yynext()
{
	if (yycursor + 1 < yylimit) {
		++yycursor;
		return 1;
	}
	return 0;
}


char yypeek()
{
	if (yycursor + 1 < yylimit) {
		return yycursor[1];
	}
	return 0;
}

int yyscan(char ch)
{
	while (yycursor + 1 < yylimit && ++yycursor && yych != ch);
	return yych == ch;
}
