

FL_LIB := $(shell test -f /opt/homebrew/opt/flex/lib/libfl.a && echo /opt/homebrew/opt/flex/lib/libfl.a || echo -lfl)

.PHONY: all run clean

all: cleanlang

cleanlang: parser.tab.c lex.yy.c
	@gcc -o cleanlang parser.tab.c lex.yy.c $(FL_LIB)
	@echo "✅ Compilação concluída: cleanlang gerado."

parser.tab.c parser.tab.h: parser.y
	@bison -d parser.y

lex.yy.c: lexer.l parser.tab.h
	@flex lexer.l

run: all
	@if [ -f exemplo.clean ]; then \
	  echo "▶️  Executando cleanlang com exemplo.clean..."; \
	  ./cleanlang < exemplo.clean; \
	else \
	  echo "⚠️  Arquivo exemplo.clean não encontrado. Crie um arquivo de teste e rode 'make run' novamente."; \
	fi

clean:
	rm -f cleanlang parser.tab.c parser.tab.h lex.yy.c
