{ brainfuck-program }

the array consists of alternating tag and value cells

fill the array with ABCDE
>+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++>
>++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++>
>+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++>
>++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++>
>+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++>
<<<<<<<<<<

first put the desired index in front of the array
++++

we are done if there is a zero in the current tag cell
[

decrement the current tag cell
-

move the value in the current tag cell to the next if it is not zero
[>>+<<-]

move to next tag cell
>>

we found it: print the desired element
]>.

now print another
<<<<<<<<<
++
[-[>>+<<-]>>]>.
