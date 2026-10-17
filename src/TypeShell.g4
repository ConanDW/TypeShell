grammar TypeShell;

options { caseInsensitive = true; }

program
    : (declaration | assignment | .)*? EOF
    ;

declaration
    : LBRACK TYPE RBRACK WS? VARIABLE WS? ASSIGN
    ;

assignment
    : VARIABLE WS? ASSIGN
    ;

PIPE: '|';
SEMI: ';';
//brackets are for strong typing the vars
LBRACK: '[';
RBRACK: ']';
ASSIGN: '=';

OP_EQ: '-eq';
OP_NE: '-ne';
OP_LT: '-lt';
OP_GT: '-gt';
OP_LE: '-le';
OP_GE: '-ge';

PARAMETER: '-' [a-z] [a-z0-9_]*;

TYPE: 'string' | 'int' | 'bool' | 'float' | 'double';

STRING
    : '"' ( '`' . | '""' | ~["`] )* '"'
    | '\'' ( '\'\'' | ~['] )* '\''
    ;

// catches for encapsulationg, like ${var}, $(), pervents pwsh encapsulation game
VARIABLE
    : '$' [a-z_] [a-z0-9_:]*
    | '${' ~[}]* '}'
    ;

NUMBER: [0-9]+ ('.' [0-9]+)?;

MLINE_CMMT: '///' .*? '///';
CMMT: '//' ~[\r\n]*;

WORD: [a-z_] [a-z0-9_]* ('-' [a-z0-9_]+)*;
WS: [ \t\r\n]+;
ANY: .;