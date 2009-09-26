     /* File parser.mly */
     	%token LBRACE RBRACE
        %token LPAREN RPAREN
	%token BAR
	%token COMMA
	%token NAME
	%token AND 
	%token OR
	%token NOT
	%token EXISTS
	%token FORALL
	%token COMPARISON
        %start query            /* the entry point */
        %%
        main:
	        query EOL {$1} 
	;
        query:  
		LBRACE varlist  BAR formula RBRACE  EOL 
	;
        varlist: NAME  { $2 }
		| varlist COMMA NAME	{ $1 };
	formula : 
		 atomicformula
		| formula AND formula
		| formula OR formula
		| NOT LPAREN formula RPAREN
		| LPAREN EXISTS varlist RPAREN LPAREN formula RPAREN
		| LPAREN FORALL varlist RPAREN LPAREN formula RPAREN
		;
	atomicformula  
		      : NAME LPAREN arglist RPAREN
		      | arg COMPARISON arg
		      ;
	arglist :
		 arg
		| arglist COMMA arg
		;
	
	arg :
	     NAME
	     | STRING
	     | NUMBER 
	     ;
	     

	    