PROGRAM = haskell
CC = g++
CFLAGS  = -Wall -pedantic -ansi
YFLAGS = -d -v
LEX = flex
YACC = bison

$(PROGRAM) : lex.yy.o parser.o haskell.o
	$(CC) $(CFLAGS) -o $@ $^
lex.yy.o: lex.yy.c
	$(CC) -Wno-sign-compare $(CFLAGS) -c -o $@ $<
lex.yy.c: lexer.l parser.tab.hpp
	$(LEX) $<
parser.o: parser.tab.cpp
	$(CC) $(CFLAGS) -c -o $@ $<
parser.tab.cpp parser.tab.hpp : parser.ypp
	$(YACC) $(YFLAGS) $<
haskell.o: haskell.cpp haskell.hpp
	$(CC) $(CFLAGS) -c -o $@ $<


.PHONY: clean

clean:
	-rm -f *~ *.o parser.tab.* *.output lex.* haskell