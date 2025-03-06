%{
  #include "parser.tab.h";
  extern void yyerror (char const *s);
%}

%option noyywrap

identifier  [a-zA-Z_][0-9a-zA-Z_]*
typeref     `{identifier}`(\.`{identifier}`)*
integer     [1-9][0-9]*
string      \'[.*]\'

%%

[[:space:]]+  /* ignored */;

{typeref}     { return T_TYPEREF; }
{string}      { return T_STRING; }
{integer}     { return T_INTEGER; }

type          { return T_KEYWORD_TYPE; }
has           { return T_KEYWORD_HAS; }
field         { return T_KEYWORD_FIELD; }
of            { return T_KEYWORD_OF; }
limit         { return T_KEYWORD_LIMIT; }
is            { return T_KEYWORD_IS; }
identifying   { return T_KEYWORD_IDENTIFYING; }
required      { return T_KEYWORD_REQUIRED; }
unique        { return T_KEYWORD_UNIQUE; }
protected     { return T_KEYWORD_PROTECTED; }
hashed        { return T_KEYWORD_HASHED; }
transient     { return T_KEYWORD_TRANSIENT; }
auto          { return T_KEYWORD_AUTO; }

\{            { return T_OPENBRACE; }
\}            { return T_CLOSEBRACE; }
\;            { return T_SEMICOLON; }
\.            { return T_PERIOD; }
\,            { return T_COMMA; }

.             { yyerror(yytext); }

%%
