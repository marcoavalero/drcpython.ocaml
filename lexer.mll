(* File lexer.mll *)
           {
   	        open Parser        (* The type token is defined in parser.mli *)
        exception Eof
        }
        rule token = parse
            [' ' '\t']     { token lexbuf }     (* skip blanks *)
          | ['\n' ]          {EOL}
          | 'and'            {AND}
          | 'or'             {OR}
          | '|'              {BAR}
          | '{'              {LBRACE}
          |  '}'             {RBRACE}
          | '('              {LPAREN }
          | ')'              {RPAREN }
          |'exists'          {EXISTS}
          |'forall'          {FORALL}
          |'comparison'      {COMPARISON}
          |'name'            {NAME}
          |eof               {raise  Eof}
