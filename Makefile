all: fin

fin: lex yacc bison
	gcc -o compilador lex.yy.c y.tab.c -ly -ll -lm

lex:
	lex lex.l

yacc:
	yacc -d yacc.y

bison:
	bison -d yacc.y

run:
	./compilador hw.txt

git:
	$ git add .
	$ git add -A
	$ git commit -m "last"
	$ git push origin master

clean:
	rm -rf *o compilador *.c *.h