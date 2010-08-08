##########################
###
### Severely updated version!
### (now says "1 bottle" and
### contains no extra "0" verse)
### with further edits to not rely on typeover
###
##########################
### 99 Bottles of Beer ###
### coded in Brainfuck ###
### with explanations  ###
##########################
#
# This Bottles of Beer program
# was written by Andrew Paczkowski
# Coder Alias: thepacz
# three_halves_plus_one@yahoo.com
# Edited by Mark Hurd
# markehurd@gmail.com
#####

>                             0 in the zeroth cell
+++++++>++++++++++[<+++++>-] 57 in the first cell or "9"
+++++++>++++++++++[<+++++>-] 57 in second cell or "9"
++++++++++                   10 in third cell
>+++++++++                    9 in fourth cell

##########################################
### create ASCII chars in higher cells ###
##########################################

>>++++++++[<++++>-]               " "
>++++++++++++++[<+++++++>-]        b
+>+++++++++++[<++++++++++>-]       o
++>+++++++++++++++++++[<++++++>-]  t
++>+++++++++++++++++++[<++++++>-]  t
>++++++++++++[<+++++++++>-]        l
+>++++++++++[<++++++++++>-]        e
+>+++++++++++++++++++[<++++++>-]   s
>++++++++[<++++>-]                " "
+>+++++++++++[<++++++++++>-]       o
++>++++++++++[<++++++++++>-]       f
>++++++++[<++++>-]                " "
>++++++++++++++[<+++++++>-]        b
+>++++++++++[<++++++++++>-]        e
+>++++++++++[<++++++++++>-]        e
>+++++++++++++++++++[<++++++>-]    r
>++++++++[<++++>-]                " "
+>+++++++++++[<++++++++++>-]       o
>+++++++++++[<++++++++++>-]        n
>++++++++[<++++>-]                " "
++>+++++++++++++++++++[<++++++>-]  t
++++>++++++++++[<++++++++++>-]     h
+>++++++++++[<++++++++++>-]        e
>++++++++[<++++>-]                " "
++>+++++++++++++[<+++++++++>-]     w
+>++++++++++++[<++++++++>-]        a
>++++++++++++[<+++++++++>-]        l
>++++++++++++[<+++++++++>-]        l
>+++++[<++>-]                      LF
+++++++++++++>                     CR
++>+++++++++++++++++++[<++++++>-]  t
+>++++++++++++[<++++++++>-]        a
+++>+++++++++++++[<++++++++>-]     k
+>++++++++++[<++++++++++>-]        e
>++++++++[<++++>-]                " "
+>+++++++++++[<++++++++++>-]       o
>+++++++++++[<++++++++++>-]        n
+>++++++++++[<++++++++++>-]        e
>++++++++[<++++>-]                " "
>++++++++++[<++++++++++>-]         d
+>+++++++++++[<++++++++++>-]       o
++>+++++++++++++[<+++++++++>-]     w
>+++++++++++[<++++++++++>-]        n
>++++++++[<++++>-]                " "
+>++++++++++++[<++++++++>-]        a
>+++++++++++[<++++++++++>-]        n
>++++++++++[<++++++++++>-]         d
>++++++++[<++++>-]                " "
++>+++++++++++[<++++++++++>-]      p
+>++++++++++++[<++++++++>-]        a
+>+++++++++++++++++++[<++++++>-]   s
+>+++++++++++++++++++[<++++++>-]   s
>++++++++[<++++>-]                " "
+>+++++++++++++[<++++++++>-]       i
++>+++++++++++++++++++[<++++++>-]  t
>++++++++[<++++>-]                " "
+>++++++++++++[<++++++++>-]        a
>+++++++++++++++++++[<++++++>-]    r
+>+++++++++++[<++++++++++>-]       o
>+++++++++++++[<+++++++++>-]       u
>+++++++++++[<++++++++++>-]        n
>++++++++++[<++++++++++>-]         d
>+++++[<++>-]                      LF
+++++++++++++                      CR

[<]>>>>      go back to fourth cell

#################################
### initiate the display loop ###
#################################

[           loop
 <-          back to cell 3
 [+          loop
  [>]<<       go to last cell and back to LF
  .>.<.>.     output 2 newlines
  [<]>        go to first cell

 ###################################
 #### begin display of characters###
 ###################################
 #
  .>.>>>.>.>.>.>.>.>.>.>.>.>.>.>.>.>.>.>.>
 #X X     b o t t l e s   o f   b e e r  
  .>.>.>.>.>.>.>.>.>.>.>.>.
 #o n   t h e   w a l l N L
  [<]>    go to first cell
  .>.>>>.>.>.>.>.>.>.>.>.>.>.>.>.>.>.>.>>>>>>>>>>>>>.>.>
 #X X     b o t t l e s   o f   b e e r             N L
  .>.>.>.>.>.>.>.>.>.>.>.>.>.>.>.>.>.>.>.>.>.>.>
 #t a k e   o n e   d o w n   a n d   p a s s   
  .>.>.>.>.>.>.>.>.>.>.
 #i t   a r o u n d N L
 #####

  [<]>>      go to cell 2
  -          subtract 1 from cell 2
  <          go to cell 1

 ########################
 ### display last line ##
 ########################
 #
  .>.>>>.>.>.>.>.>.>.>.>.>.>.>.>.>.>.>.>.>
 #X X     b o t t l e s   o f   b e e r  
  .>.>.>.>.>.>.>.>.>.>.
 #o n   t h e   w a l l
 #####

  [<]>>>--    go to cell 3/subtract 1
 ]+           end loop when cell 3 is 0

 [>]<<       go to last cell and back to LF
 .>.<.>.     output 2 newlines
 [<]>        go to first cell

 ###################################
 #### begin display of characters###
 ###################################
 #
  .>.>>>.>.>.>.>.>.>.>.>.>.>.>.>.>.>.>.>.>
 #X X     b o t t l e s   o f   b e e r  
  .>.>.>.>.>.>.>.>.>.>.>.>.
 #o n   t h e   w a l l N L
  [<]>    go to first cell
  .>.>>>.>.>.>.>.>.>.>.>.>.>.>.>.>.>.>.>>>>>>>>>>>>>.>.>
 #X X     b o t t l e s   o f   b e e r             N L
  .>.>.>.>.>.>.>.>.>.>.>.>.>.>.>.>.>.>.>.>.>.>.>
 #t a k e   o n e   d o w n   a n d   p a s s   
  .>.>.>.>.>.>.>.>.>.>.
 #i t   a r o u n d N L
 #####

 [<]>-        cell 1 subtract 1
 >+++++++++   add 9 to cell 2
 >+++++++++   cell 3 add 9
 <<          go to first line

########################
### correct last line ##
########################
#
 .>.>>>.>.>.>.>.>.>.>.>.>.>.>.>.>.>.>.>.>
#X 9     b o t t l e s   o f   b e e r  
 .>.>.>.>.>.>.>.>.>.>.
#o n   t h e   w a l l
#####

 [<]>>>>-    go to cell 4/subtract 1
]           end loop when cell 4 is 0

##############################################################
### By this point verses 99\10 are displayed but to work   ###
### with the lower numbered verses in a more readable way  ###
### we initiate a new loop for verses 9{CODE} that will not    ###
### use the fourth cell at all                             ###
##############################################################

+           add 1 to cell four (to keep it non\zero)
<---        back to cell 3/subtract 2

[+           loop
 [>]<<       go to last cell and back to LF
 .>.<.>.     output 2 newlines
 [<]>        go to first cell

 ###################################
 #### begin display of characters###
 ###################################
 #
  >.>>>.>.>.>.>.>.>.>.>.>.>.>.>.>.>.>.>.>
 # X     b o t t l e s   o f   b e e r  
  .>.>.>.>.>.>.>.>.>.>.>.>.
 #o n   t h e   w a l l N L
  [<]>    go to first cell
  >.>>>.>.>.>.>.>.>.>.>.>.>.>.>.>.>.>.>>>>>>>>>>>>>.>.>
 # X     b o t t l e s   o f   b e e r             N L
  .>.>.>.>.>.>.>.>.>.>.>.>.>.>.>.>.>.>.>.>.>.>.>
 #t a k e   o n e   d o w n   a n d   p a s s   
  .>.>.>.>.>.>.>.>.>.>.
 #i t   a r o u n d N L
 #####

 [<]>>       go to cell 2
 -           subtract 1 from cell 2

 ########################
 ### display last line ##
 ########################
 #
  .>>>.>.>.>.>.>.>.>.>.>.>.>.>.>.>.>.>.>
 #X     b o t t l e s   o f   b e e r  
  .>.>.>.>.>.>.>.>.>.>.
 #o n   t h e   w a l l
 #####

 [<]>>>--    go to cell 3/subtract 1
]+           end loop when cell 3 is 0

 [>]<<       go to last cell and back to LF
 .>.<.>.     output 2 newlines
 [<]>        go to first cell

 ###################################
 #### begin display of characters###
 ###################################
 #
  >.>>>.>.>.>.>.>.>.>.>.>.>.>.>.>.>.>.>.>
 # 2     b o t t l e s   o f   b e e r  
  .>.>.>.>.>.>.>.>.>.>.>.>.
 #o n   t h e   w a l l N L
  [<]>    go to first cell
  >.>>>.>.>.>.>.>.>.>.>.>.>.>.>.>.>.>.>>>>>>>>>>>>>.>.>
 # 2     b o t t l e s   o f   b e e r             N L
  .>.>.>.>.>.>.>.>.>.>.>.>.>.>.>.>.>.>.>.>.>.>.>
 #t a k e   o n e   d o w n   a n d   p a s s   
  .>.>.>.>.>.>.>.>.>.>.
 #i t   a r o u n d N L
 #####

 [<]>>       go to cell 2
 -           subtract 1 from cell 2

#+            add 1 to cell 3 to keep it non\zero

#[>]<<.>.     go to last line/carriage return
<#[<]>         go to first line

########################
### correct last line ##
########################
#
 >.>>>.>.>.>.>.>.>.>>.>.>.>.>.>.>.>.>.>
# 1     b o t t l e    o f   b e e r  
 .>.>.>.>.>.>.>.>.>.>.<<<<.
#o n   t h e   w a l l
#####

[>]<<       go to last cell and back to LF
.>.<.>.     output 2 newlines
[<]>        go to first line

#########################
### the final verse    ##
#########################
#
 >.>>>.>.>.>.>.>.>.>>.>.>.>.>.>.>.>.>.>
# 1     b o t t l e    o f   b e e r  
 .>.>.>.>.>.>.>.>.>.>.>.>.
#o n   t h e   w a l l N L
 [<]>        go to first cell
 >.>>>.>.>.>.>.>.>.>>.>.>.>.>.>.>.>.>>>>>>>>>>>>>.>.>
# 1     b o t t l e    o f   b e e r             N L
 .>.>.>.>.> > > > > > > > > > > > > > > > > > >
#t a k e   (o n e   d o w n   a n d   p a s s  )
 .>.<<              < < < < < < < < < < < < < <
#i t
 .>.>.>.>.>.>.>.>.>.>.>.>.>.>.>
#  d o w n   a n d   p a s s   
 .>.>.>.>.>.>.>.>.>.>.
#i t   a r o u n d N L
 [>]<       go to last line
 <<<.<<.
#   n  o    
 [<]>>>>     go to fourth cell
 >.>.>.>.>.>.>.>.>.>.>.>.>.>.>.>.>.>
#   b o t t l e s   o f   b e e r  
 .>.>.>.>.>.>.>.>.>.>.>.>.
#o n   t h e   w a l l N L
#####fin##
