################################################
#                                              #
# 99 bottles of beer in 976 bytes of Brainfuck #
# Composed by Aki Rossi                        #
# aki dot rossi at iki dot fi                  #
#                                              #
################################################

#
# Set beer counter to 99
#
>>>>>>>>>
>++++++++++[-<++++++++++>]<-
<<<<<<<<<

#
# Create output registers
#
++++++++++[->++++>++++>++++>++++<<<<]	add 0x28 to all from (1) to (4)
++++++++[->>>++++++++>++++++++<<<<]	add 0x40 to all from (3) and (4)
++++[->>>>++++<<<<]			add 0x10 to (4)
++++++++++				set (0) to LF
>--------				set (1) to SP
>++++					set (2) to comma

>>>>>>>			go to beer counter (9)
[
	# Verse init
	<<<<
	+++	state 1 in (5)
	>+	state 2 in (6)
	>++	state 3 in (7)
	<<	go to (5)
	[
		#####################
		# N bottles of beer #
		#####################
		>>>>		go to (9)
		[
			# Print the number in (9)
			# (conversion routine uncommented to save space)
			[->+>+<<]>>[-<<+>>]<[>++++++++++[->>+>+<<<]
			<[>>>[-<<<-[>]>>>>[<[>]>[---------->>]<++++
			++[-<++++++++>]<<[<->[->-<]]>->>>[>]+[<]<<[
			->>>[>]<+[<]<<]<>>]<<]<+>>[->+<<+>]>[-<+>]<
			<<<<]>>[-<<+>>]<<]>[-]>>>>>>[>]<[.[-]<]
			<<<<<<
			# and remain in (10) which is empty
		]>+<<	inc (11) and go to (9)
		[>]>>	if (9) empty go to (11) else (12)
		[
			<<<<<<<		go to (3)
			++++++.+.	no
			-------		reset (3)
			>>>>>>>		go to (11)
			>>		go to (12)
		]
		<[-]<[-]<		empty (11) and go to (9)
		<<<<<<<<.	SP
		>>------.	b
		+++++++++++++.	o
		>----..		tt
		<---.		l
		-------.	e
		>>>>>>->>>+<<<	dec (9) inc (11)
		[>]>>
		[	now in (12)
			<<<<<<<<	go to (4)
			-.+		s
			>>>>>>>		go to (11)
		]
		>-<<<+<<<<<
		<<<.		SP
		>>>-----.	o
		<+.		f
		<<.		SP
		>>----.		b
		+++..		ee
		>+++.		r
		<+++>++++++	reset registers

		>>		go to (6)

		###############
		# on the wall #
		###############
		[
			<<<<<.		SP
			>>+++++++.-.	on
			<<.		SP
			>>>----.	t
			<------.---.	he
			<<.		SP
			>>>+++.		w
			<----.		a
			+++++++++++..	ll
			---->+>>	reset and go to (6)
			-		dec (6)
		]

		#
		# comma LF
		#
		<<<<.
		<<.
		
		####################################
		# take one down and pass it around #
		####################################
		>>>>>>>		go to (7)
		-		dec (7)
		[>]>>		if not blank then skip loop
		[
			-		dec (9)
			<<<<<		go to (4)
			----.		t
			<-------.	a
			>---------.	k
			<++++.		e
			<<.		SP
			>>>++++.-.<.	one
			<<.		SP
			>>-.>+.		do
			++++++++.	w
			---------.	n
			<<<.		SP
			>>---.>.<+++.	and
			<<.		SP
			>>>++.<---.	pa
			>+++..		ss
			<<<.		SP
			>>++++++++.>+.	it
			<<<.		SP
			>>--------.	a
			>--.---.	ro
			++++++.		u
			-------.	n
			<+++.		d
			++++>++++++++++	reset registers
			<<.		comma
			<<.		LF
			>>-----------	set (2) to excl mark
			>>>>+		inc (6)
			>>>>		go to (10)
		]
		<<<
		<<		go to (5)
		-		dec (5)
	]
	>>+		inc (7)
	<<<<<<<.	LF
	>>+++++++++++	reset comma
	>>>>>>>		go to beer counter (9)
]

