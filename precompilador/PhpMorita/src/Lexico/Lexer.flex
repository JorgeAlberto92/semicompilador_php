package Lexico;
import static Lexico.Token.*;
%% 
%public
%class Lexer
%type Token

LineaNueva = (\n|\r)
EspacioEnBlanco = ([\ |\t|\f])
TerminoDeLinea = \r|\n|\r\n

L = [a-zA-Z_]
D = [0-9]
STRING = {L}[A-Za-z0-9_]*
variable = ({P}({L}[A-Za-z0-9_]*))
INT = [-+]?{D}*
S = [/]
P = [$]
MEN = [<]
MAY = [>]
WHITE = [ \t\r\n]
HTMLC = {MEN}({S}(html){MAY})
HTMLA = {MEN}((html){MAY})
HEADA = {MEN}((head){MAY})
HEADC = {MEN}({S}(head){MAY})
TITLEA = {MEN}((title){MAY})
TITLEC = {MEN}({S}(title){MAY})
BODYA = {MEN}((body){MAY})
BODYC = {MEN}({S}(body){MAY})
Comentario = [/*] [L][L]*[D]* [*/]
%{
public String lexeme;
%}
%%
{WHITE} {/*Ignore*/;}
/* OPERADORES Y SIGNOS */
"<"     {lexeme=yytext(); return MENOR;}
">"     {lexeme=yytext(); return MAYOR;}
"<="    {lexeme=yytext(); return MENOR_IGUAL;}
">="    {lexeme=yytext(); return MAYOR_IGUAL;}
"_"     {lexeme=yytext(); return GUIONBAJO;}
"'"     {lexeme=yytext(); return COMILLA;}
";"     {lexeme=yytext(); return PUNTOCOMA;}
":"     {lexeme=yytext(); return DOSPUNTOS;}
","     {lexeme=yytext(); return COMA;}
"{"     {lexeme=yytext(); return LLAVE_ABIERTA;}
"}"     {lexeme=yytext(); return LLAVE_CIERRA;}
"("     {lexeme=yytext(); return PARENTESIS_ABRE;}
")"     {lexeme=yytext(); return PARENTESIS_CIERRA;}
"+"     {lexeme=yytext(); return SUMA;}
"-"     {lexeme=yytext(); return RESTA;}
"*"     {lexeme=yytext(); return MULTIPLICACION;}
"/"     {lexeme=yytext(); return DIAGONAL;}
"="     {lexeme=yytext(); return IGUAL;}
"=="    {lexeme=yytext(); return ASIGNACION;}
"&="    {lexeme=yytext(); return AND_IGUAL;}
"&&"    {lexeme=yytext(); return AND_BOOLEANO;}
"||"    {lexeme=yytext(); return OR_BOOLEANO;}
"$"     {lexeme=yytext(); return DECLARACION;}
"!"     {lexeme=yytext(); return NOT;}
"."     {lexeme=yytext(); return PUNTO;}
"?"     {lexeme=yytext(); return INTERROGACION;}

/* PALABRAS RESERVADAS */
"__halt_compiler();"    {lexeme=yytext(); return HALTCOM;}
"abstract"              {lexeme=yytext(); return ABSTRACT;}
"and"                   {lexeme=yytext(); return AND;}
"array"                 {lexeme=yytext(); return ARRAY;}
"as"                    {lexeme=yytext(); return AS;}
"break"                 {lexeme=yytext(); return BREAK;}
"callable"              {lexeme=yytext(); return CALLABLE;}
"case"                  {lexeme=yytext(); return CASE;}
"catch"                 {lexeme=yytext(); return CATCH;}
"class"                 {lexeme=yytext(); return CLASS;}
"clone"                 {lexeme=yytext(); return CLONE;}
"const"                 {lexeme=yytext(); return CONST;}
"continue"              {lexeme=yytext(); return CONTINUE;}
"declare"               {lexeme=yytext(); return DECLARE;}
"default"               {lexeme=yytext(); return DEFAULT;}
"die"                   {lexeme=yytext(); return DIE;}
"do"                    {lexeme=yytext(); return DO;}
"echo"                  {lexeme=yytext(); return ECHO;}
"else"                  {lexeme=yytext(); return ELSE;}
"elseif"                {lexeme=yytext(); return ELSEIF;}
"empty"                 {lexeme=yytext(); return EMPTY;}
"enddeclare"            {lexeme=yytext(); return ENDDECLARE;}
"endfor"                {lexeme=yytext(); return ENDFOR;}
"endforeach"            {lexeme=yytext(); return ENDFOREACH;}
"endif"                 {lexeme=yytext(); return ENDIF;}
"endswitch"             {lexeme=yytext(); return ENDSWITCH;}
"endwhile"              {lexeme=yytext(); return ENDWHILE;}
"eval"                  {lexeme=yytext(); return EVAL;}
"exit"                  {lexeme=yytext(); return EXIT;}
"extends"               {lexeme=yytext(); return EXTENDS;}
"final"                 {lexeme=yytext(); return FINAL;}
"for"                   {lexeme=yytext(); return FOR;}
"foreach"               {lexeme=yytext(); return FOREACH;}
"function"              {lexeme=yytext(); return FUNCTION;}
"global"                {lexeme=yytext(); return GLOBAL;}
"goto"                  {lexeme=yytext(); return GOTO;}
"if"                    {lexeme=yytext(); return IF;}
"implements"            {lexeme=yytext(); return IMPLEMENTS;}
"include"               {lexeme=yytext(); return INCLUDE;}
"include_once"          {lexeme=yytext(); return INCLUDE_ONCE;}
"instanceof"            {lexeme=yytext(); return INSTANCEOF;}
"insteadof"             {lexeme=yytext(); return INSTEADOF;}
"interface"             {lexeme=yytext(); return INTERFACE;}
"isset"                 {lexeme=yytext(); return ISSET;}
"list"                  {lexeme=yytext(); return LIST;}
"or"                    {lexeme=yytext(); return OR;}
"protected"             {lexeme=yytext(); return PROTECTED;}
"public"                {lexeme=yytext(); return PUBLIC;}
"require"               {lexeme=yytext(); return REQUIRE;}
"require_once"          {lexeme=yytext(); return REQUIRE_ONCE;}
"return"                {lexeme=yytext(); return RETURN;}
"static"                {lexeme=yytext(); return STACTIC;}
"switch"                {lexeme=yytext(); return SWITCH;}
"throw"                 {lexeme=yytext(); return THROW;}
"trait"                 {lexeme=yytext(); return TRAIT;}
"try"                   {lexeme=yytext(); return TRY;}
"unset"                 {lexeme=yytext(); return UNSET;}
"use"                   {lexeme=yytext(); return USE;}
"var"                   {lexeme=yytext(); return VAR;}
"while"                 {lexeme=yytext(); return WHILE;}
"xor"                   {lexeme=yytext(); return XOR;}
"yield"                 {lexeme=yytext(); return YIELD;}
"print"                 {lexeme=yytext(); return PRINT;}
"<?php"                 {lexeme=yytext(); return ABRE_PHP;}
"?>"                    {lexeme=yytext(); return CIERRA_PHP;} 

/* EXPRESIONES */
{HTMLA}             {lexeme=yytext(); return ABRE_HTML;}
{HTMLC}             {lexeme=yytext(); return CIERRA_HTML;}
{HEADA}             {lexeme=yytext(); return ABRE_HEAD;}
{HEADC}             {lexeme=yytext(); return CIERRA_HEAD;} 
{TITLEA}            {lexeme=yytext(); return ABRE_TITLE;}
{TITLEC}            {lexeme=yytext(); return CIERRA_TITLE;}
{BODYA}             {lexeme=yytext(); return ABRE_BODY;}
{BODYC}             {lexeme=yytext(); return CIERRA_BODY;}
{STRING}            {lexeme=yytext(); return STRING;}
{INT}               {lexeme=yytext(); return INT;}
{variable}          {lexeme=yytext(); return VARIABLE;}

.                   {lexeme=yytext(); return ERROR;}