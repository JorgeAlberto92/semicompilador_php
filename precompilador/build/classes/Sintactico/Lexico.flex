/* primera parte: no hace falta poner nada */
package Sintactico;
import java_cup.runtime.*;
import javax.swing.*;
import java.util.*;
import phpmorita.*;
%%

/* segunda parte: declaramos las directivas y los macros */
%class AnalizadorLexico

%{
    String literal;
    String temp_include;
%}

%{
    int columna=1;
%}

%public
%cup
%line
%full
%unicode
%ignorecase
%char

%{
    public String sourceFilename;
    StringBuffer string = new StringBuffer();
    int ultimoEstado = 0;
    public void init(){};
%}
%eofval{
    {return new Symbol(sym.EOF, null); }
%eofval}

LineaNueva = (\n|\r)
EspacioEnBlanco = ([\ |\t|\f])
TerminoDeLinea = \r|\n|\r\n

L = [a-zA-Z_]
D = [0-9]
STRING = {L}[A-Za-z0-9_]*
P = [$]
INT = [-+]?{D}*
S = [/]
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
variable = ({P}({L}[A-Za-z0-9_]*))

%%
/*ESPACIOS EN BLANCO*/
[\n]            { yychar=0;}
[ \t\r\n\f]     { /* Ignorar espacios en blanco. */ }
{EspacioEnBlanco} { /* Aumenta la columna. */ yychar++;}
{LineaNueva} {yychar=0; yyline=0}

%%
/* OPERADORES Y SIGNOS */
"<"     {return new Symbol(sym.MENQUE, new token(yycolumn, yyline, yytext()));}
">"     {return new Symbol(sym.MAYQUE, new token(yycolumn, yyline, yytext()));}
"<="    {return new Symbol(sym.MENIGU, new token(yycolumn, yyline, yytext()));}
">="    {return new Symbol(sym.MAYIGU, new token(yycolumn, yyline, yytext()));}
"_"     {return new Symbol(sym.GBAJO, new token(yycolumn, yyline, yytext()));}
"'"     {return new Symbol(sym.COMILLA, new token(yycolumn, yyline, yytext()));}
";"     {return new Symbol(sym.PCOMA, new token(yycolumn, yyline, yytext()));}
","     {return new Symbol(sym.COMA, new token(yycolumn, yyline, yytext()));}
"{"     {return new Symbol(sym.ABRIRLLA, new token(yycolumn, yyline, yytext()));}
"}"     {return new Symbol(sym.CERRARLLA, new token(yycolumn, yyline, yytext()));}
"("     {return new Symbol(sym.ABRIRPAR, new token(yycolumn, yyline, yytext()));}
")"     {return new Symbol(sym.CERRARPAR, new token(yycolumn, yyline, yytext()));}
"+"     {return new Symbol(sym.SUMA, new token(yycolumn, yyline, yytext()));}
"-"     {return new Symbol(sym.RESTA, new token(yycolumn, yyline, yytext()));}
"*"     {return new Symbol(sym.MULTIPLICACION, new token(yycolumn, yyline, yytext()));}
"/"     {return new Symbol(sym.SLASH, new token(yycolumn, yyline, yytext()));}
"="     {return new Symbol(sym.ASIGNACION, new token(yycolumn, yyline, yytext()));}
"=="    {return new Symbol(sym.IGUAL, new token(yycolumn, yyline, yytext()));}
"&="    {return new Symbol(sym.ANDEQUAL, new token(yycolumn, yyline, yytext()));}
"&&"    {return new Symbol(sym.ANDBOOLEANO, new token(yycolumn, yyline, yytext()));}
"||"    {return new Symbol(sym.ORBOOLEANO, new token(yycolumn, yyline, yytext()));}
"$"     {return new Symbol(sym.DECLARA, new token(yycolumn, yyline, yytext()));}
"!"     {return new Symbol(sym.NOT, new token(yycolumn, yyline, yytext()));}
"."     {return new Symbol(sym.PUNTO, new token(yycolumn, yyline, yytext()));}


/* PALABRAS RESERVADAS */
"__halt_compiler();"    {return new Symbol(sym.HALTCOM, new token(yycolumn, yyline, yytext()));}
"abstract"              {return new Symbol(sym.ABSTRACT, new token(yycolumn, yyline, yytext()));}
"and"                   {return new Symbol(sym.AND, new token(yycolumn, yyline, yytext()));}
"array"                 {return new Symbol(sym.ARRAY, new token(yycolumn, yyline, yytext()));}
"as"                    {return new Symbol(sym.AS, new token(yycolumn, yyline, yytext()));}
"break"                 {return new Symbol(sym.BREAK, new token(yycolumn, yyline, yytext()));}
"callable"              {return new Symbol(sym.CALLABLE, new token(yycolumn, yyline, yytext()));}
"case"                  {return new Symbol(sym.CASE, new token(yycolumn, yyline, yytext()));}
"catch"                 {return new Symbol(sym.CATCH, new token(yycolumn, yyline, yytext()));}
"class"                 {return new Symbol(sym.CLASS, new token(yycolumn, yyline, yytext()));}
"clone"                 {return new Symbol(sym.CLONE, new token(yycolumn, yyline, yytext()));}
"const"                 {return new Symbol(sym.CONST, new token(yycolumn, yyline, yytext()));}
"continue"              {return new Symbol(sym.CONTINUE, new token(yycolumn, yyline, yytext()));}
"declare"               {return new Symbol(sym.DECLARE, new token(yycolumn, yyline, yytext()));}
"default"               {return new Symbol(sym.DEFAULT, new token(yycolumn, yyline, yytext()));}
"die"                   {return new Symbol(sym.DIE, new token(yycolumn, yyline, yytext()));}
"do"                    {return new Symbol(sym.DO, new token(yycolumn, yyline, yytext()));}
"echo"                  {return new Symbol(sym.ECHO, new token(yycolumn, yyline, yytext()));}
"else"                  {return new Symbol(sym.ELSE, new token(yycolumn, yyline, yytext()));}
"elseif"                {return new Symbol(sym.ELSEIF, new token(yycolumn, yyline, yytext()));}
"empty"                 {return new Symbol(sym.EMPTY, new token(yycolumn, yyline, yytext()));}
"enddeclare"            {return new Symbol(sym.ENDDECLARE, new token(yycolumn, yyline, yytext()));}
"endfor"                {return new Symbol(sym.ENDFOR, new token(yycolumn, yyline, yytext()));}
"endforeach"            {return new Symbol(sym.ENDFOREACH, new token(yycolumn, yyline, yytext()));}
"endif"                 {return new Symbol(sym.ENDIF, new token(yycolumn, yyline, yytext()));}
"endswitch"             {return new Symbol(sym.ENDSWITCH, new token(yycolumn, yyline, yytext()));}
"endwhile"              {return new Symbol(sym.ENDWHILE, new token(yycolumn, yyline, yytext()));}
"eval"                  {return new Symbol(sym.EVAL, new token(yycolumn, yyline, yytext()));}
"exit"                  {return new Symbol(sym.EXIT, new token(yycolumn, yyline, yytext()));}
"extends"               {return new Symbol(sym.EXTENDS, new token(yycolumn, yyline, yytext()));}
"final"                 {return new Symbol(sym.FINAL, new token(yycolumn, yyline, yytext()));}
"for"                   {return new Symbol(sym.FOR, new token(yycolumn, yyline, yytext()));}
"foreach"               {return new Symbol(sym.FOREACH, new token(yycolumn, yyline, yytext()));}
"function"              {return new Symbol(sym.FUNCTION, new token(yycolumn, yyline, yytext()));}
"global"                {return new Symbol(sym.GLOBAL, new token(yycolumn, yyline, yytext()));}
"goto"                  {return new Symbol(sym.GOTO, new token(yycolumn, yyline, yytext()));}
"if"                    {return new Symbol(sym.IF, new token(yycolumn, yyline, yytext()));}
"implements"            {return new Symbol(sym.IMPLEMENTS, new token(yycolumn, yyline, yytext()));}
"include"               {return new Symbol(sym.INCLUDE, new token(yycolumn, yyline, yytext()));}
"include_once"          {return new Symbol(sym.INCLUDE_ONCE, new token(yycolumn, yyline, yytext()));}
"instanceof"            {return new Symbol(sym.INSTANCEOF, new token(yycolumn, yyline, yytext()));}
"insteadof"             {return new Symbol(sym.INSTEADOF, new token(yycolumn, yyline, yytext()));}
"interface"             {return new Symbol(sym.INTERFACE, new token(yycolumn, yyline, yytext()));}
"isset"                 {return new Symbol(sym.ISSET, new token(yycolumn, yyline, yytext()));}
"list"                  {return new Symbol(sym.LIST, new token(yycolumn, yyline, yytext()));}
"or"                    {return new Symbol(sym.OR, new token(yycolumn, yyline, yytext()));}
"protected"             {return new Symbol(sym.PROTECTED, new token(yycolumn, yyline, yytext()));}
"public"                {return new Symbol(sym.PUBLIC, new token(yycolumn, yyline, yytext()));}
"require"               {return new Symbol(sym.REQUIRE, new token(yycolumn, yyline, yytext()));}
"require_once"          {return new Symbol(sym.REQUIRE_ONCE, new token(yycolumn, yyline, yytext()));}
"return"                {return new Symbol(sym.RETURN, new token(yycolumn, yyline, yytext()));}
"static"                {return new Symbol(sym.STATIC, new token(yycolumn, yyline, yytext()));}
"switch"                {return new Symbol(sym.SWITCH, new token(yycolumn, yyline, yytext()));}
"throw"                 {return new Symbol(sym.THROW, new token(yycolumn, yyline, yytext()));}
"trait"                 {return new Symbol(sym.TRAIT, new token(yycolumn, yyline, yytext()));}
"try"                   {return new Symbol(sym.TRY, new token(yycolumn, yyline, yytext()));}
"unset"                 {return new Symbol(sym.UNSET, new token(yycolumn, yyline, yytext()));}
"use"                   {return new Symbol(sym.USE, new token(yycolumn, yyline, yytext()));}
"var"                   {return new Symbol(sym.VAR, new token(yycolumn, yyline, yytext()));}
"while"                 {return new Symbol(sym.WHILE, new token(yycolumn, yyline, yytext()));}
"xor"                   {return new Symbol(sym.XOR, new token(yycolumn, yyline, yytext()));}
"yield"                 {return new Symbol(sym.YIELD, new token(yycolumn, yyline, yytext()));}
"print_r"               {return new Symbol(sym.PRINT, new token(yycolumn, yyline, yytext()));}
"<?php"                 {return new Symbol(sym.ABRE_PHP, new token(yycolumn, yyline, yytext()));} 
"?>"                    {return new Symbol(sym.CIERRA_PHP, new token(yycolumn, yyline, yytext()));} 


/* EXPRESIONES */
"<html>"     {return new Symbol(sym.ABRIR_HTML, new token(yycolumn, yyline, yytext()));}
"</html>"     {return new Symbol(sym.CIERRA_HTML, new token(yycolumn, yyline, yytext()));}
"<head>"     {return new Symbol(sym.ABRE_HEAD, new token(yycolumn, yyline, yytext()));}
"</head>"     {return new Symbol(sym.CIERRA_HEAD, new token(yycolumn, yyline, yytext()));} 
"<title>"    {return new Symbol(sym.ABRE_TITLE, new token(yycolumn, yyline, yytext()));}
"</title>"    {return new Symbol(sym.CIERRA_TITLE, new token(yycolumn, yyline, yytext()));} 
"<body>"    {return new Symbol(sym.ABRE_BODY, new token(yycolumn, yyline, yytext()));} 
"</body>"     {return new Symbol(sym.CIERRA_BODY, new token(yycolumn, yyline, yytext()));} 
{STRING}    {return new Symbol(sym.STRING, new token(yycolumn, yyline, yytext()));}
{INT}       {return new Symbol(sym.INT, new token(yycolumn, yyline, yytext()));}
{variable}  {return new Symbol(sym.VARIABLE, new token(yycolumn, yyline, yytext()));}

. {
    System.out.println("Error léxico en la fila " + yyline + " y en la columna " + yychar);
    Interfaz.rotular("Error léxico: " + yytext() + " en la fila " + yyline + " y en la columna " + yychar);
}