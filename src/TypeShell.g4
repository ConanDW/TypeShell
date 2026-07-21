grammar TypeShell;


//Operators

element
    : OP_EQ | OP_NE | OP_LT | OP_GT | OP_LE | OP_GE
    | STRING
    | COMMENT
    | WORD
    | WS
    | ANY
    ;

OP_EQ: '-eq';
OP_NE: '-ne';
OP_LT: '-lt';
OP_GT: '-gt';
OP_LE: '-le';
OP_GE: '-ge';

STRING: '"' .*? '"'
        | '\'' .*? '\''
        ;
COMMENT: '#' ~[\r\n]*
        | '//' ~[\r\n]*
        ;
WORD: [a-zA-Z0-9_$]+;
WS: [ \t\r\n]+;
ANY: .;
