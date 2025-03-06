all: xschema

xschema:
	mkdir -p build/default bin
	cd src && flex -o ../build/default/lex.yy.c lexer.l
	cd src && bison -o ../build/default/parser.tab.c -d parser.y
	cd build/default && gcc -c -w parser.tab.c
	cd build/default && gcc -c -w lex.yy.c
	cd build/default && gcc *.o -o ../../bin/xschema
