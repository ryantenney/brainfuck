#!/usr/bin/php
<?php

$args = $argv;
$gcc_args = array();

$O = array(
	'combine' => true
);

array_shift($args);

while ($args[0][0] == '-') {
	if ($args[0] == 'nc') {
		$O['combine'] = false;
	} else {
		$gcc_args[] = array_shift($args);
	}
}

//$file = "php://stdin";
//if (count($args)) {
	$file = $args[0];
//}
//$stream = fopen($file, 'r');

$o_file = str_replace('.bf', '', $file);
$c_file = $o_file . '.c';

$code = file_get_contents($file);

init();
yyinit();
yyfill_str($code);

ob_start();

echo
"#define MOVL1     ptr--;
#define MOVL(__v) ptr -= (__v);
#define MOVR1     ptr++;
#define MOVR(__v) ptr += (__v);
#define INC1      (*ptr)++;
#define INC(__v)  (*ptr) += (__v);
#define DEC1      (*ptr)--;
#define DEC(__v)  (*ptr) -= (__v);
#define GET       (*ptr) = getchar();
#define PUT       putchar(*ptr);
#define LOOP      while (*ptr)

char st[32768];
int main(void) {
	char *ptr = st;\n\n";

yylex();

echo "}";

$src = ob_get_clean();
file_put_contents($c_file, $src);

$cmd = "gcc " . implode(" ", $gcc_args) . " -o " . escapeshellarg($o_file) . " " . escapeshellarg($c_file);

shell_exec($cmd);





function yylex() {
	global $yytext, $yych, $yycursor, $yylimit;
	global $O;

	while ($yych = yynext()) {
		if ($yych == '/' && yypeek('/')) {
			consumeToEOL();
		} else if ($yych == '[') {
			emit('LOOP {');
			indent(1);
		} else if ($yych == ']') {
			indent(-1);
			emit('}');
		} else if ($yych == ',') {
			emit(GET);
		} else if ($yych == '.') {
			emit(PUT);
		} else if ($yych == '#') {
			/* debug */
		} else {
			$count = $O['combine'] ? consumeChar($yych) : 1;
			$cmd = false;

			switch ($yych) {
				case '+': $cmd = INC;  break;
				case '-': $cmd = DEC;  break;
				case '<': $cmd = MOVL; break;
				case '>': $cmd = MOVR; break;
			}

			if ($cmd) {
				if ($count > 1) {
				emit($cmd, "(", $count, ")");
				} else {
					emit($cmd . '1');
				}
			}
		}
	}
}



function init() {
	global $_indent, $_indent_text;

	$_indent = 1;
	$_indent_text = "\t";
}

function yyinit() {
	global $yytext, $yych, $yycursor, $yylimit;

	$yytext = '';
	$yych = '';
	$yycursor = -1;
	$yylimit = 0;
}

function yyfill_str($str) {
	global $yytext, $yych, $yycursor, $yylimit;

	$yytext = $str;
	$yylimit = strlen($yytext);
}


function emit($args) {
	echo indent();

	if (!is_array($args)) {
		$args = func_get_args();
	}

	for ($i = 0, $l = count($args); $l > $i; ++$i) {
		echo $args[$i];
	}

	echo "\n";
}

function indent($delta = null) {
	global $_indent, $_indent_text;

	$argc = func_num_args();
	if ($argc == 0) {
		return $_indent_text;

	} else if ($delta < 0 && $delta <= $_indent) {
		$_indent += $delta;
		$_indent_text = substr($_indent_text, 0, $_indent);

	} else if ($delta > 0) {
		$_indent += $delta;
		$_indent_text .= str_repeat("\t", $delta);
	}
}

function yynext($assert = null) {
	global $yytext, $yych, $yycursor, $yylimit;

	if ($yycursor + 1 < $yylimit) {
		if (is_string($assert)) {
			if ($assert == $yytext[$yycursor + 1]) {
				++$yycursor;
				return true;
			}
		} else {
			++$yycursor;
			$yych = $yytext[$yycursor];
			return $yych;
		}
	}

	return false;
}

function yypeek() {
	global $yytext, $yych, $yycursor, $yylimit;

	$argv = func_get_args();
	$argc = count($argv);

	$offset = 1;
	$assert = null;

	if ($argc == 2 || is_int($argv[0])) {
		$offset = array_shift($argv);
	}

	$assert = array_shift($argv);

	if (is_string($arg1)) {
		$assert = $arg1;
	} else if (!is_null($arg1)) {
		$offset = $arg1;
		if (is_string($arg2)) {
			$assert = $args;
		}
	}

	$cursor = $yycursor + $offset;
	if ($cursor < $yylimit) {
		$ch = $yytext[$cursor];
		if (!is_null($assert)) {
			$ch = $assert === $ch;
		}
		return $ch;
	}

	return false;
}

function consumeChar($char) {
	global $yycursor;
	$start = $yycursor;
	while (yynext($char));
	return $yycursor - $start + 1;
}

function consumeToEOL() {
	global $yycursor;
	$offset = 0;
	while (!yypeek(++$offset, "\n"));
	$yycursor += $offset;
}
