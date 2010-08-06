#!/usr/bin/php
<?php

$args = $argv;
$gcc_args = array();

array_shift($args);

while ($args[0][0] == '-') {
	$gcc_args[] = array_shift($args);
}

$subs = array(
	">" => "++p;",
	"<" => "--p;",
	"+" => "++*p;",
	"-" => "--*p;",
	"." => "putchar(*p);",
	"," => "*p=getchar();",
	"[" => "while(*p){",
	"]" => "}"
);

$subs_keys = array_keys($subs);
$subs_values = array_values($subs);

$bf_file = $args[0];
$o_file = str_replace('.bf', '', $bf_file);
$c_file = $o_file . '.c';

$bf_src = file_get_contents($bf_file);
$bf_len = strlen($bf_src);

$i = 0;
$bf_c = array();

while ($i < $bf_len) {
	$char = $bf_src[$i];
	if (isset($subs[$char])) {
		$bf_c[] = $subs[$char];
	} else if ($char == '#') {
		consumeToEOL();
		continue;
	}
	++$i;
}

$bf_c = implode("\n\t", $bf_c);

$c_src =
"char st[32768];
int main(void) {
	char *p = st;

	$bf_c
}";

file_put_contents($c_file, $c_src);

echo("gcc " . implode(" ", $gcc_args) . " -o " . escapeshellarg($o_file) . " " . escapeshellarg($c_file) . "\n");
shell_exec("gcc " . implode(" ", $gcc_args) . " -o " . escapeshellarg($o_file) . " " . escapeshellarg($c_file));


function consumeToEOL() {
	global $bf_src, $bf_len, $i;
	while ($bf_src[++$i] != "\n");
}
