SET SERVEROUTPUT ON
DECLARE
    /*
        ':=' Inicializa v�riaveis
         'DBMS_OUTPUT.PUT_LINE' imprime algo no console
         'SQLCODE' mostra o c�digo do erro
         'SQLERRM' mostra a descri��o do erro
         ':variavel ' mostra pro compilador que a vari�vel foi declarada fora da sess�o DECLARE
         'ACCEPT vai exibir uma mensagem no console pedindo para que o usu�rio digite algo, assim que digitar
         sera atribuido o valor apra a variavel 
         '&Nome da variavel => variavel de substitui��o 
        
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


----------------------------------------------------------
--Aula 18

SET SERVEROUTPUT ON 
DECLARE
    vFirst_name   employees.first_name%type;
    vLast_name    employees.last_name%type;
    vSalary       employees.salary%type;
    vEmployee_id  employees.employee_id%type := 100;
BEGIN 
    SELECT
        first_name, last_name, salary
    INTO 
        vFirst_name, vLast_name, vSalary
    FROM 
        employees
    WHERE 
        employee_id = vEmployee_id;
     DBMS_OUTPUT.PUT_LINE('Employee Id: ' || vEmployee_id);
     DBMS_OUTPUT.PUT_LINE('First Name: ' || vFirst_name);     
     DBMS_OUTPUT.PUT_LINE('Last Name: ' || vLast_name);     
     DBMS_OUTPUT.PUT_LINE('Salary: ' || vSalary);     
END;

-- Erro ORA-01403 - No data Found

SET SERVEROUTPUT ON 
DECLARE
    vFirst_name   employees.first_name%type;
    vLast_name    employees.last_name%type;
    vSalary       employees.salary%type;
    vEmployee_id  employees.employee_id%type := 230;
BEGIN 
    SELECT
        first_name, last_name, salary
    INTO 
        vFirst_name, vLast_name, vSalary
    FROM 
        employees
    WHERE 
        employee_id = vEmployee_id;
     DBMS_OUTPUT.PUT_LINE('Employee Id: ' || vEmployee_id);
     DBMS_OUTPUT.PUT_LINE('First Name: ' || vFirst_name);     
     DBMS_OUTPUT.PUT_LINE('Last Name: ' || vLast_name);     
     DBMS_OUTPUT.PUT_LINE('Salary: ' || vSalary);     
END;

DECLARE
    vJob_id     employees.job_id%type := 'IT_PROG';
    vAvg_salary employees.salary%type;
    vSum_salary employees.salary%type;
BEGIN 
    SELECT 
        ROUND(AVG(salary),2),
        ROUND(SUM(salary),2)
    INTO
        vAvg_salary,
        vSum_salary
    FROM 
        employees
    WHERE 
        job_id = vJob_id;
    DBMS_OUTPUT.PUT_LINE('Cargo: ' || vJob_id);
    DBMS_OUTPUT.PUT_LINE('M�dia: ' || vAvg_salary);
    DBMS_OUTPUT.PUT_LINE('Somat�rio: ' || vSum_salary);
END;

-- to many row exception


SET SERVEROUTPUT ON 
DECLARE
    vJob_id     employees.job_id%type;
    vAvg_salary employees.salary%type;
    vSum_salary employees.salary%type;
BEGIN 
    SELECT 
        ROUND(AVG(salary),2),
        ROUND(SUM(salary),2)
    INTO
        vJob_id,
        vAvg_salary,
        vSum_salary
    FROM 
        employees
    group by job_id;
    DBMS_OUTPUT.PUT_LINE('Cargo: ' || vJob_id);
    DBMS_OUTPUT.PUT_LINE('M�dia: ' || vAvg_salary);
    DBMS_OUTPUT.PUT_LINE('Somat�rio: ' || vSum_salary);
END;

----------------------------------------------------------
--Aula 19


SET SERVEROUTPUT ON
DECLARE
    vfirst_name employees.first_name%type;
    vlast_name  employees.last_name%type;
    vsalary     employees.salary%type;
BEGIN
    INSERT INTO employees
    (employee_id,first_name, last_name, email, phone_number, hire_date, 
        job_id, salary, commission_pct, manager_id, department_id
    )
    VALUES
    (
        employees_seq.nextval, 'Kobe', 'Bryant', 'KBRYANT', '55.123.45568', SYSDATE,
        'IT_PROG', 15000,0.4,103,60
    );
    COMMIT;
END;


----------------------------------------------------------
--Algumas aulas perdidas 

----------------------------------------------------------


----------------------------------------------------------
--Aula 24 - Operadores (Regra de preced�ncia)


SET SERVEROUTPUT ON 
DECLARE
    vNota1  Number(11,2) := 7.0;
    vNota2  Number(11,2) := 6.0;
    vNota3  Number(11,2) := 9.0;
    vNota4  Number(11,2) := 6.0;
    vMedia  Number(11,2);
BEGIN 
    vMedia := (vNota1 + vNota2 + vNota3 + vNota4) / 4;
    DBMS_OUTPUT.PUT_LINE('M�dia: ' || vMedia);             
END;

----------------------------------------------------------
--Aula 25 - Comando IF


SET SERVEROUTPUT ON
ACCEPT pdepartment_id PROMPT 'Digite o Id do departamento: '
DECLARE
    vpercentual number(3);
    vDepartment_id employees.employee_id%type := &pdepartment_id;
BEGIN
    IF vDepartment_id = 80 THEN
        vpercentual := 10; --Sales
    ELSE
        IF vDepartment_id = 20 THEN
            vpercentual := 15; --Marketing
        ELSE
            IF vDepartment_id = 60 THEN
                vpercentual := 20; --IT
            ELSE
                vpercentual := 5;
            END IF;
        END IF;
    END IF;
    DBMS_OUTPUT.PUT_LINE('Id do Departamento: ' || vdepartment_id);                         
    DBMS_OUTPUT.PUT_LINE('Percentual: ' || vpercentual);        
    
    UPDATE employees
    SET salary = salary * (1 + vpercentual / 100)
    where department_id = &pdepartment_id;
    COMMIT;   
END;


---- COMANDO IF ELSE IF 

SET SERVEROUTPUT ON 
ACCEPT pdepartment_id PROMPT 'Digite o Id do departamento: '
DECLARE 
    vpercentual number(3);
    vDepartment_id employees.employee_id%type := &pdepartment_id;
BEGIN
    IF vDepartment_id = 80 THEN
        vpercentual := 10; -- Sales
    ELSIF vDepartment_id = 20 THEN
        vpercentual := 15; --Marketing
    ELSIF vDepartment_id = 60 then
        vpercentual := 20; --IT
    ELSE
        vpercentual := 5;    
    END IF;
    DBMS_OUTPUT.PUT_LINE('Id do departamento: ' || vDepartment_id);
    DBMS_OUTPUT.PUT_LINE('Percentual: ' || vpercentual);
    
    UPDATE employees
    SET salary = salary * (1 + vpercentual / 100)
    WHERE department_id = vDepartment_id;
    COMMIT;
END;

----------------------------------------------------------
--Aula 26 - Comando CASE

SET SERVEROUTPUT ON
ACCEPT pdepartment_id PROMPT 'Digite o Id do departamento: '
DECLARE
    vpercentual     number(3);
    vDepartment_id  employees.employee_id%type := &pdepartment_id;
BEGIN
    CASE vDepartment_id
    
    WHEN 80 
    THEN vpercentual := 10; -- Sales
    
    WHEN 20
    THEN vpercentual := 15; --Marketing
    
    WHEN 60
    THEN vpercentual := 20; --TI
    
    ELSE vpercentual := 5;
    
    END CASE;
    DBMS_OUTPUT.PUT_LINE('Id do Departamento: '|| &pdepartment_id);
    DBMS_OUTPUT.PUT_LINE('Percentual: '|| vpercentual);
    
    
    UPDATE employees
    SET salary = salary * (1 + vpercentual / 100)
    WHERE department_id = &pdepartment_id;
    --COMMIT;
END;

----------------------------------------------------------
--Aula 27 - Comando LOOP

SET SERVEROUTPUT ON
ACCEPT pLimite PROMPT 'Digite o valor do limite: '
DECLARE 
    vNumero   Number(38) := 1;
    vLimite   Number(38) := &pLimite;
BEGIN
    --Imprimindo n�meros 
    LOOP
        DBMS_OUTPUT.PUT_LINE('N�mero = ' || to_char(vNumero));
    EXIT WHEN vNumero = vLimite;
        vNumero := vNumero +1;
    END LOOP;
END;

----------------------------------------------------------
--Aula 28   - Comando FOR LOOP


SET SERVEROUTPUT ON
ACCEPT pLimite PROMPT 'Digite o valor do limite: '
DECLARE
    vInicio Integer(3) := 1;
    vFim    Number(38) := &pLimite;
BEGIN
    FOR i in vInicio..vFim LOOP
        DBMS_OUTPUT.PUT_LINE('N�mero = ' || to_char(i));
    END LOOP;

END;

----------------------------------------------------------
--Aula 29   - Comando WHILE LOOP

SET SERVEROUTPUT ON
ACCEPT pLimite PROMPT 'Digite o valor do limite: '
DECLARE
    vNumero Number(38) := 1;
    vLimite Number(38) := &pLimite;
BEGIN
    WHILE vNumero <= vLimite LOOP
        DBMS_OUTPUT.PUT_LINE('N�mero = ' || to_char(vNumero));
        vNumero := vNumero + 1;
    END LOOP;
END;

----------------------------------------------------------
--Aula 29   - Controlando Loop's aninhados

SET SERVEROUTPUT ON
DECLARE
    vTotal Number(38) := 1;
BEGIN
    --Lable, indica uma posi��o no c�digo
    <<LOOP1>>
    FOR i in 1..8 LOOP
        DBMS_OUTPUT.PUT_LINE('I = '|| to_char(i));
        <<LOOP2>>
        FOR j in 1..8 LOOP
            DBMS_OUTPUT.PUT_LINE('J = ' || to_char(j));
            vTotal := vTotal * 2;
            DBMS_OUTPUT.PUT_LINE('Total = ' || to_char(vTotal));
            EXIT LOOP1 WHEN vTotal > 100000000000;
        END LOOP;
    END LOOP;
END;

----------------------------------------------------------
--Aula 31 - Vari�veis Tipos record

SET SERVEROUTPUT ON
SET VERIFY OFF
ACCEPT pemployee_id PROMPT 'Digite o Id do empregado: '
DECLARE
    TYPE employee_record_type IS RECORD
        (
            employee_id   employees.employee_id%type,
            first_name    employees.first_name%type,
            last_name     employees.last_name%type,
            email         employees.email%type,
            phone_number  employees.phone_number%type
        );
        employee_record employee_record_type;
BEGIN
    SELECT 
        employee_id,
        first_name,
        last_name,
        email,
        phone_number
    INTO 
        employee_record
    FROM
        employees
    WHERE 
        employee_id = &pemployee_id;
    DBMS_OUTPUT.PUT_LINE(
        employee_record.employee_id || ' - ' || 
        employee_record.first_name || ' - ' ||
        employee_record.last_name || ' - ' ||
        employee_record.phone_number
    );
END;

----------------------------------------------------------
--Aula 32 - %RowType


SET SERVEROUTPUT ON 
SET VERIFY OFF
ACCEPT pemployee_id PROMPT 'Digite o Id do empregado: '
DECLARE
    employee_record   employees%rowtype;
    vEmployee_id      employees.employee_id%type := &pemployee_id;
BEGIN
    SELECT *
    INTO employee_record
    FROM employees
    WHERE employee_id = vEmployee_id;
    
    DBMS_OUTPUT.PUT_LINE(
        employee_record.employee_id   || ' - ' ||
        employee_record.first_name    || ' - ' ||
        employee_record.last_name     || ' - ' ||
        employee_record.phone_number  || ' - ' ||
        employee_record.job_id
    );
EXCEPTION

    --Exce��o Generica
    WHEN OTHERS THEN
     DBMS_OUTPUT.PUT_LINE('Ooops, aconteceu um erro!!!');    
END;


----------------------------------------------------------
--Aula 33 - Associative Array

SET SERVEROUTPUT ON 
SET VERIFY OFF
DECLARE
    TYPE Numero_Table_Type IS TABLE OF NUMBER(2)
    INDEX BY BINARY_INTEGER;
    Numero_table Numero_Table_Type;
BEGIN
    --Armazena n�mero de 1 a 10 em um Associative Array
    
    FOR I IN 1..10 LOOP
        Numero_Table(I) := (I * 3)+I;
    END LOOP;
    
    --L� o Associative Array e imrpime os n�meros armazenados
    FOR I IN 1..10 LOOP
        DBMS_OUTPUT.PUT_LINE('Associative Array: Indice = ' || To_char(i) ||', Valor = ' || To_char(Numero_table(i)));
    END LOOP;
END; 

----------------------------------------------------------
--Aula 34 - Associative Array de Records (N�o funcionando)

SET SERVEROUTPUT ON
SET VERIFY OFF
DECLARE
    TYPE employees_table_type IS TABLE OF employees%rowtype
    INDEX BY BINARY_INTEGER; --Type associative Array
    employees_table employees_table_type;
BEGIN
    SELECT *
        BULK COLLECT INTO employees_table -- bulk Collection todos (order_id) para a Collection (vorder_id)
    FROM employees;
        FOR i IN employees_table.first..employees_table.last 
        LOOP
            /*DBMS_OUTPUT.PUT_LINE(
                employees_table(i).employee_id  || ' - ' ||
                employees_table(i).first_name   || ' - ' || 
                employees_table(i).last_name    || ' - ' ||
                employess_table(i).phone_number || ' - ' ||
                employees_table(i).job_id       || ' - ' ||
                to_char(employees_table(i).salary,'99G999G999D99')*/
            );
        END LOOP;
END;

----------------------------------------------------------
--Aula 35 - Collections Nested Table (N�o funcionando)



SET SERVEROUTPUT ON
SET VERIFY OFF
DECLARE
  TYPE Numero_Table_Type IS TABLE OF INTEGER(2);
  Numero_table numero_table_type := numero_table_type();
BEGIN
  -- Armazena n�meros de 1 a 10 em um Nested Table
  FOR i IN 1..10
  LOOP
    Numero_Table.extend;
    Numero_Table(i) := i;
  END LOOP;
  -- O programa vai fazer muitas coisas...
  -- L� o Nested Table e imprime os n�meros armazenados
  FOR I IN 1..10
  LOOP
    DBMS_OUTPUT.PUT_LINE('Nested Table: Indice = ' || TO_CHAR(i) || ', Valor = ' || TO_CHAR(Numero_Table(i)));
  END LOOP;
END;

----------------------------------------------------------
--Aula 36 - Nested Table of Records 

SET SERVEROUTPUT ON
SET VERIFY OFF
DECLARE
    TYPE employees_table_type IS TABLE OF employees%rowtype;
    employees_table employees_table_type := employees_table_type();
BEGIN
    SELECT *
        BULK COLLECT INTO employees_table
    FROM employees;
    FOR i IN employees_table.first..employees_table.last LOOP
        DBMS_OUTPUT.PUT_LINE(
            employees_table(i).employee_id   || ' - ' ||
            employees_table(i).first_name    || ' - ' ||
            employees_table(i).last_name     || ' - ' || 
            employees_table(i).phone_number  || ' - ' || 
            employees_table(i).job_id        || ' - ' || 
            to_char(employees_table(i).salary, '99G999G999D99')
        );
    END LOOP;

END;


----------------------------------------------------------
--Aula 37 - Collection vArray

SET SERVEROUTPUT ON
SET VERIFY OFF
DECLARE
    TYPE Numero_Table_Type IS VARRAY(10) OF INTEGER(2);
    Numero_table numero_table_type := numero_table_type();
BEGIN
    FOR i IN 1..10 LOOP
        Numero_table.extend;
        Numero_table(i) := i;
    END LOOP;
    --O programa vai fazer muitas coisas...
    --L� o Varray e imprime os n�meros armazenados
    
    FOR i in 1..10 LOOP
        DBMS_OUTPUT.PUT_LINE('Varray: Indice = ' || To_char(i) || ',Valor = ' || To_char(Numero_table(i)));
    END LOOP;
    
END;

----------------------------------------------------------
--Aula 38 - Varray of Records - Bulk Collect

SET SERVEROUTPUT ON
SET VERIFY OFF
DECLARE 
    TYPE employees_table_type IS VARRAY(100) OF employees%rowtype;
    employee_table employees_table_type := employees_table_type();
BEGIN 
    SELECT *
        BULK COLLECT INTO employees_table
    FROM employees;
    FOR I in employees_table.first..employees_table.last LOOP
        DBMS_OUTPUT.PUT_LINE(
            employees_table(I).employee_id  || ' - '
            employees_table(I).first_name   || ' - '
            employees_table(I).last_name    || ' - '
            employees_table(I).phone_number || ' - '
            employees_table(I).job_id       || ' - '
            To_char(employees_table(I).salary, '99G999G999D9')
        );
    END LOOP;
END;

----------------------------------------------------------
--Aula 39 - Ultilizando m�todos para controlar collections

SET SERVEROUTPUT ON
SET VERIFY OFF
DECLARE
    TYPE employees_table_type IS TABLE OF employees%rowtype;
    employees_table employees_table_type := employees_table_type();
BEGIN
    SELECT *
        BULK COLLECT INTO employees_table
    FROM employees;
    FOR i in employees_table.first..employees_table.last LOOP
        DBMS_OUTPUT.PUT_LINE(
            employees_table(i).employee_id   || ' - '
            employees_table(i).first_name    || ' - '
            employees_table(i).last_name     || ' - '
            employees_table(i).phone_number  || ' - '
            employees_table(i).job_id        || ' - '
            to_char(employees_table(i).salary, '99G999G999D99')
        );
    END LOOP;
END;

----------------------------------------------------------
--Aula 40 - Controlando um cursor expl�cito 


SET SERVEROUTPUT ON
SET VERIFY OFF
DECLARE
  CURSOR  employees_cursor  IS
  SELECT  *
  FROM    employees;  -- Declara��o do Cursor
  
  employees_record  employees_cursor%rowtype; 
BEGIN
  /* Inicializa */
  
  OPEN  employees_cursor;  -- Abrindo o Cursor
  
  /* Loop */
  
  LOOP  -- Loop B�sico
    FETCH  employees_cursor  
    INTO  employees_record; -- Fetch do Cursor
    
    EXIT WHEN employees_cursor%notfound;
    
    DBMS_OUTPUT.PUT_LINE(employees_record.employee_id || ' - ' ||
                         employees_record.first_name || ' ' || 
                         employees_record.last_name || ' - ' ||
                         employees_record.department_id || ' - ' ||
                         employees_record.job_id || ' - ' ||
                         employees_record.phone_number || ' - ' ||
                         LTRIM(TO_CHAR(employees_record.salary, 'L99G999G999D99')));
    
  END LOOP;
  
  CLOSE employees_cursor; -- Close do Cursor
END;


-- Controlando um Cursor Expl�cito com WHILE LOOP

SET SERVEROUTPUT ON
SET VERIFY OFF
DECLARE
  CURSOR  employees_cursor  IS
  SELECT  *
  FROM    employees; -- Declara��o do Cursor
  employees_record  employees_cursor%rowtype; 
BEGIN
  /* Inicializa */
  
  OPEN  employees_cursor; -- Abrindo o Cursor
  
  FETCH  employees_cursor  
    INTO  employees_record; -- Fetch do Cursor
	
  /* Loop */
  
  WHILE  employees_cursor%found  LOOP
     DBMS_OUTPUT.PUT_LINE(employees_record.employee_id || ' - ' ||
                         employees_record.first_name || ' ' || 
                         employees_record.last_name || ' - ' ||
                         employees_record.department_id || ' - ' ||
                         employees_record.job_id || ' - ' ||
                         employees_record.phone_number || ' - ' ||
                         LTRIM(TO_CHAR(employees_record.salary, 'L99G999G999D99')));
    FETCH  employees_cursor  
      INTO  employees_record;
  END LOOP;
  
  CLOSE employees_cursor; -- Close do Cursor
END;

----------------------------------------------------------
--Aula 41 - Controlando um Cursor Expl�cito ultilizando Cursor FOR LOOP


SET SERVEROUTPUT ON
SET VERIFY OFF
DECLARE
    CURSOR employees_cursor IS
    SELECT *
    FROM employees;
BEGIN
    FOR employees_record IN employees_cursor LOOP
        DBMS_OUTPUT.PUT_LINE(
            employees_record.employee_id   || ' - ' ||
            employees_record.first_name    || ' - ' ||
            employees_record.last_name     || ' - ' ||
            employees_record.department_id || ' - ' ||
            employees_record.job_id        || ' - ' ||
            employees_record.phone_number  || ' - ' ||
            LTRIM(TO_CHAR(employees_record.salary, 'L99G999G999D99'))
        );
    END LOOP;
    
END;

--CURSOR FOR LOOP utilizando Sub-consulta

SET SERVEROUTPUT ON
SET VERIFY OFF
BEGIN
    FOR employees_record IN (SELECT * FROM employees) LOOP
        DBMS_OUTPUT.PUT_LINE(
            employees_record.employee_id   || ' - ' ||
            employees_record.first_name    || ' - ' ||
            employees_record.last_name     || ' - ' ||
            employees_record.department_id || ' - ' ||
            employees_record.job_id        || ' - ' ||
            employees_record.phone_number  || ' - ' ||
            LTRIM(TO_CHAR(employees_record.salary, 'L99G999G999D99'))
        );
    END LOOP;
END;

----------------------------------------------------------
--Aula 42 Cursor Expl�cito com Par�metros

SET SERVEROUTPUT ON 
SET VERIFY OFF 
DECLARE
    CURSOR employees_cursor
        (pdepartment_id number,
         pjob_id varchar2)
    IS
    SELECT *
    FROM employees e
    WHERE e.department_id = pdepartment_id
    AND   e.job_id = pjob_id;
BEGIN
    FOR employees_record IN employees_cursor(60,'IT_PROG') LOOP
        DBMS_OUTPUT.PUT_LINE(
            employees_record.employee_id   || ' - ' ||
            employees_record.first_name    || ' - ' ||
            employees_record.last_name     || ' - ' ||
            employees_record.department_id || ' - ' ||
            employees_record.job_id        || ' - ' ||
            employees_record.phone_number  || ' - ' ||
            LTRIM(TO_CHAR(employees_record.salary, 'L99G999G999D99'))
        );
    END LOOP;
END;























