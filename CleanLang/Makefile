all: cleanlang

cleanlang: parser.tab.c lex.yy.c
	gcc -o cleanlang parser.tab.c lex.yy.c /opt/homebrew/opt/flex/lib/libfl.a

parser.tab.c parser.tab.h: parser.y
	bison -d parser.y

lex.yy.c: lexer.l parser.tab.h
	flex lexer.l

clean:
	rm -f cleanlang parser.tab.c parser.tab.h lex.yy.c

