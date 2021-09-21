SET SERVEROUTPUT ON
DECLARE
    /*
        ':=' Inicializa v�riaveis
         'DBMS_OUTPUT.PUT_LINE' imprime algo no console
         'SQLCODE' mostra o c�digo do erro
         'SQLERRM' mostra a descri��o do erro
         ':variavel ' mostra pro compilador que a vari�vel foi declarada fora da sess�o DECLARE
        
    */

    vTexto VARCHAR2(100) := 'Seja bem vindo ao PL/SQL';
BEGIN
    DBMS_OUTPUT.PUT_LINE(vTexto);
EXCEPTION
    WHEN OTHERS
    THEN
        DBMS_OUTPUT.PUT_LINE('Erro Oracle ' || SQLCODE || SQLERRM);
END;

----------------------------------------------------------
--Aula 08

SET SERVEROUTPUT ON
DECLARE
    vNumero1  NUMBER(11,2) := 500;
    vNumero2  NUMBER(11,2) := 400;
    vMedia NUMBER(11,2);
BEGIN 
    vMedia := (vNumero1 + vNumero2) / 2;
    DBMS_OUTPUT.PUT_LINE('Media = ' || vMedia);
END;

----------------------------------------------------------
--Aula 09

SET SERVEROUTPUT ON
DECLARE 
    vNumero number(11,2) := 1200.50;
BEGIN
    DBMS_OUTPUT.PUT_LINE('Numero = ' || vNumero);
END;

-----

DECLARE
    vCaracterTamFixo char(2) := 'RS';
    vCaracterTamVariavel varchar2(100) := 'Porto Alegre, RS';
BEGIN
    DBMS_OUTPUT.PUT_LINE('String Caracteres Tam Fixo = ' || vCaracterTamFixo);
    DBMS_OUTPUT.PUT_LINE('String Caracteres Tam V�riavel = ' || vCaracterTamVariavel);
END;

----

DECLARE 
    vData1 Date := '29/04/20';
    vData2 Date := '29/04/2020';
BEGIN
    DBMS_OUTPUT.PUT_LINE('Data1 = ' || vData1);
    DBMS_OUTPUT.PUT_LINE('Data2 = ' || vData2);
END;

----------------------------------------------------------
--Aula 10

SET SERVEROUTPUT ON 
DECLARE 
    vP1 CONSTANT NUMBER(38,15) := 3.141592653589793;
BEGIN
    DBMS_OUTPUT.PUT_LINE('P1 = ' || vP1);
END;


DECLARE 
    vCaracterTamFixo CONSTANT CHAR(2) := 'RS';
    vCaracterTamVariavel CONSTANT VARCHAR2(100) := 'Porto Alegre, RS';
BEGIN 
    DBMS_OUTPUT.PUT_LINE('String Caracteres Tam Fixo' || vCaracterTamFixo);
    DBMS_OUTPUT.PUT_LINE('String Caracteres Tam Fixo' || vCaracterTamVariavel);
END;

----------------------------------------------------------
--Aula 11

SET SERVEROUTPUT ON

DECLARE 
    vNumero NUMBER(11,2) := 1200.50;
    vCaracterTamFixo CHAR(100) := 'Texto de Tamanho Fixo de at� 32767 bytes';
    vCaracterTamVariavel Varchar2(100) := 'Texto de Tamanho vari�vel de at� 32767 bytes';
    vBooleano BOOLEAN := TRUE;
    vData date := SYSDATE;
    vLong Long := 'Texto de tamanho vari�vel de at� 32760 bytes';
    vRowid Rowid;
    vTimestamp timestamp := systimestamp;
    vTimestampz timestamp with time zone := systimestamp;
    vCaracterTamFixoUniversal nchar(100) := 'Texto de Tamanho Fixo Universal de at� 32767 bytes';
    vCaracterTamVariavelUniversal nvarchar2(100) := 'Texto Taamanho vari�vel Universal de at� 32767 bytes';
    vNumeroInteiro binary_integer := 1200;
    vNumeroFloat binary_float := 15000000;
    vNumeroDouble binary_double := 15000000;
BEGIN 
    DBMS_OUTPUT.PUT_LINE('Numero = ' || vNumero);
    DBMS_OUTPUT.PUT_LINE('String Caracteres Tam Fixo ' || vcaractertamfixo);
    DBMS_OUTPUT.PUT_LINE('String Caracteres Tam Vari�vel ' || vcaractertamvariavel);
    if vbooleano = true then
        DBMS_OUTPUT.PUT_LINE(' booleano =' || vcaractertamvariavel);    
    else 
        DBMS_OUTPUT.PUT_LINE(' booleano =' || 'False or null');    
    end if;
    DBMS_OUTPUT.PUT_LINE('Data = ' || vData);    
    DBMS_OUTPUT.PUT_LINE('Long = ' || vLong);    
    select rowid
    into vRowid
    from employees
    where first_name = 'Steven' and last_name = 'King';
    DBMS_OUTPUT.PUT_LINE('Rowid ' || vRowid);    
    DBMS_OUTPUT.PUT_LINE('Timestamp ' || vTimestamp); 
    DBMS_OUTPUT.PUT_LINE('Timestamp with time zone ' || vTimestampz); 
    DBMS_OUTPUT.PUT_LINE('String Caracteres Tam Fixo ' || vcaractertamfixouniversal); 
    DBMS_OUTPUT.PUT_LINE('String Caracteres Tam V�ri�vel ' || vcaractertamvariaveluniversal ); 
    DBMS_OUTPUT.PUT_LINE('Numero Inteiro ' || vnumerointeiro ); 
    dbms_output.put_line('Numero Float ' || vNumeroFloat );
    DBMS_OUTPUT.PUT_LINE('Numero Double ' || vnumerodouble );     
END;

----------------------------------------------------------
--Aula 11

SET SERVEROUTPUT ON 
VARIABLE gmedia NUMBER
DECLARE
    vnumero1 NUMBER(11,2) := 2000;
    vnumero2 NUMBER(11,2) := 5000;
BEGIN 
    :gmedia := (vnumero1 + vnumero2) / 2;
    DBMS_OUTPUT.PUT_LINE('Media = ' || TO_CHAR(:gmedia) );     
EXCEPTION
    WHEN OTHERS 
    THEN
        DBMS_OUTPUT.PUT_LINE('Erro Oracle: ' || SQLCODE || SQLERRM );     
END;

----------------------------------------------------------
--Aula 14

SET SERVEROUTPUT ON 
DECLARE 
    vNumero1 Number(13,2); --Declara��o de vari�vel para o primeiro n�mero
    vNumero2 Number(13,2); --Declara��o de vari�vel para o Segundo n�mero
    vMedia Number(13,2); --Declara��o de vari�vel para a M�dia.
BEGIN
    vNumero1 := 5000.8888;
    vNumero2 := 3000.4444;
    vMedia := Round((vNumero1 + vNumero2)/2,2); --Round Arredonda o valor   
    DBMS_OUTPUT.PUT_LINE('vnumero1 ' || vnumero1);     
    DBMS_OUTPUT.PUT_LINE('vnumero2 ' || vnumero2);     
    DBMS_OUTPUT.PUT_LINE('media = ' || TO_CHAR(vMedia,99G999G999D99));         
END;

----------------------------------------------------------
--Aula 15

SET SERVEROUTPUT ON 
DECLARE 
    vBloco1 varchar2(20) := 'Bloco 1';
BEGIN
    DBMS_OUTPUT.PUT_LINE('Referencia vari�vel Bloco 1: ' || vnumero1);
    
    DECLARE 
        vBloco2 varchar2(20) := 'Bloco 2';
    BEGIN
        DBMS_OUTPUT.PUT_LINE('Referencia vari�vel Bloco 1: ' || vnumero1);
        DBMS_OUTPUT.PUT_LINE('Referencia vari�vel Bloco 2: ' || vBloco2);
    END;
    
    DBMS_OUTPUT.PUT_LINE('Referencia vari�vel Bloco 1: ' || vnumero1);
END;
