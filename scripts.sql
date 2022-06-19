SET SERVEROUTPUT ON
DECLARE
    /*
        ':=' Inicializa váriaveis
         'DBMS_OUTPUT.PUT_LINE' imprime algo no console
         'SQLCODE' mostra o código do erro
         'SQLERRM' mostra a descrição do erro
         ':variavel ' mostra pro compilador que a variável foi declarada fora da sessão DECLARE
         'ACCEPT vai exibir uma mensagem no console pedindo para que o usuário digite algo, assim que digitar
         sera atribuido o valor apra a variavel 
         '&Nome da variavel => variavel de substituição 
        
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
    DBMS_OUTPUT.PUT_LINE('String Caracteres Tam Váriavel = ' || vCaracterTamVariavel);
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
    vCaracterTamFixo CHAR(100) := 'Texto de Tamanho Fixo de até 32767 bytes';
    vCaracterTamVariavel Varchar2(100) := 'Texto de Tamanho variável de até 32767 bytes';
    vBooleano BOOLEAN := TRUE;
    vData date := SYSDATE;
    vLong Long := 'Texto de tamanho variável de até 32760 bytes';
    vRowid Rowid;
    vTimestamp timestamp := systimestamp;
    vTimestampz timestamp with time zone := systimestamp;
    vCaracterTamFixoUniversal nchar(100) := 'Texto de Tamanho Fixo Universal de até 32767 bytes';
    vCaracterTamVariavelUniversal nvarchar2(100) := 'Texto Taamanho variável Universal de até 32767 bytes';
    vNumeroInteiro binary_integer := 1200;
    vNumeroFloat binary_float := 15000000;
    vNumeroDouble binary_double := 15000000;
BEGIN 
    DBMS_OUTPUT.PUT_LINE('Numero = ' || vNumero);
    DBMS_OUTPUT.PUT_LINE('String Caracteres Tam Fixo ' || vcaractertamfixo);
    DBMS_OUTPUT.PUT_LINE('String Caracteres Tam Variável ' || vcaractertamvariavel);
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
    DBMS_OUTPUT.PUT_LINE('String Caracteres Tam Váriável ' || vcaractertamvariaveluniversal ); 
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
    vNumero1 Number(13,2); --Declaração de variável para o primeiro número
    vNumero2 Number(13,2); --Declaração de variável para o Segundo número
    vMedia Number(13,2); --Declaração de variável para a Média.
BEGIN
    vNumero1 := 5000.8888;
    vNumero2 := 3000.4444;
    vMedia := Round((vNumero1 + vNumero2)/2,2); --Round Arredonda o valor   
    DBMS_OUTPUT.PUT_LINE('vnumero1 ' || vnumero1);     
    DBMS_OUTPUT.PUT_LINE('vnumero2 ' || vnumero2);     
    DBMS_OUTPUT.PUT_LINE('media = ' || TO_CHAR(vMedia,99G999G99));         
END;

----------------------------------------------------------
--Aula 15

SET SERVEROUTPUT ON 
DECLARE 
    vBloco1 varchar2(20) := 'Bloco 1';
BEGIN
    DBMS_OUTPUT.PUT_LINE('Referencia variável Bloco 1: ' || vBloco1);
    
    DECLARE 
        vBloco2 varchar2(20) := 'Bloco 2';
    BEGIN
        DBMS_OUTPUT.PUT_LINE('Referencia variável Bloco 1: ' || vBloco1);
        DBMS_OUTPUT.PUT_LINE('Referencia variável Bloco 2: ' || vBloco2);
    END;
    
    DBMS_OUTPUT.PUT_LINE('Referencia variável Bloco 1: ' || vBloco1);
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
    vEmployee_id  employees.employee_id%type := 199;
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
    DBMS_OUTPUT.PUT_LINE('Média: ' || vAvg_salary);
    DBMS_OUTPUT.PUT_LINE('Somatório: ' || vSum_salary);
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
    DBMS_OUTPUT.PUT_LINE('Média: ' || vAvg_salary);
    DBMS_OUTPUT.PUT_LINE('Somatório: ' || vSum_salary);
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
--Aula 24 - Operadores (Regra de precedência)


SET SERVEROUTPUT ON 
DECLARE
    vNota1  Number(11,2) := 7.0;
    vNota2  Number(11,2) := 6.0;
    vNota3  Number(11,2) := 9.0;
    vNota4  Number(11,2) := 6.0;
    vMedia  Number(11,2);
BEGIN 
    vMedia := (vNota1 + vNota2 + vNota3 + vNota4) / 4;
    DBMS_OUTPUT.PUT_LINE('Média: ' || vMedia);             
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
    --Imprimindo números 
    LOOP
        DBMS_OUTPUT.PUT_LINE('Número = ' || to_char(vNumero));
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
        DBMS_OUTPUT.PUT_LINE('Número = ' || to_char(i));
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
        DBMS_OUTPUT.PUT_LINE('Número = ' || to_char(vNumero));
        vNumero := vNumero + 1;
    END LOOP;
END;

----------------------------------------------------------
--Aula 29   - Controlando Loop's aninhados

SET SERVEROUTPUT ON
DECLARE
    vTotal Number(38) := 1;
BEGIN
    --Lable, indica uma posição no código
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
--Aula 31 - Variáveis Tipos record

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

    --Exceção Generica
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
    --Armazena número de 1 a 10 em um Associative Array
    
    FOR I IN 1..10 LOOP
        Numero_Table(I) := (I * 3)+I;
    END LOOP;
    
    --Lê o Associative Array e imrpime os números armazenados
    FOR I IN 1..10 LOOP
        DBMS_OUTPUT.PUT_LINE('Associative Array: Indice = ' || To_char(i) ||', Valor = ' || To_char(Numero_table(i)));
    END LOOP;
END; 

----------------------------------------------------------
--Aula 34 - Associative Array de Records (Não funcionando)

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
            DBMS_OUTPUT.PUT_LINE(
                employees_table(i).employee_id  || ' - ' ||
                employees_table(i).first_name   || ' - ' || 
                employees_table(i).last_name    || ' - ' ||
                employess_table(i).phone_number || ' - ' ||
                employees_table(i).job_id       || ' - ' );
           
        END LOOP;
END;

----------------------------------------------------------
--Aula 35 - Collections Nested Table (Não funcionando)



SET SERVEROUTPUT ON
SET VERIFY OFF
DECLARE
  TYPE Numero_Table_Type IS TABLE OF INTEGER(2);
  Numero_table numero_table_type := numero_table_type();
BEGIN
  -- Armazena números de 1 a 10 em um Nested Table
  FOR i IN 1..10
  LOOP
    Numero_Table.extend;
    Numero_Table(i) := i;
  END LOOP;
  -- O programa vai fazer muitas coisas...
  -- Lê o Nested Table e imprime os números armazenados
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
    --Lê o Varray e imprime os números armazenados
    
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
            employees_table(I).employee_id  || ' - ' ||
            employees_table(I).first_name   || ' - ' ||
            employees_table(I).last_name    || ' - ' ||
            employees_table(I).phone_number || ' - ' ||
            employees_table(I).job_id       || ' - ' ||
            To_char(employees_table(I).salary, '99G999G999D9')
        );
    END LOOP;
END;

----------------------------------------------------------
--Aula 39 - Ultilizando métodos para controlar collections

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
--Aula 40 - Controlando um cursor explícito 


SET SERVEROUTPUT ON
SET VERIFY OFF
DECLARE
  CURSOR  employees_cursor  IS
  SELECT  *
  FROM    employees;  -- Declaração do Cursor
  
  employees_record  employees_cursor%rowtype; 
BEGIN
  /* Inicializa */
  
  OPEN  employees_cursor;  -- Abrindo o Cursor
  
  /* Loop */
  
  LOOP  -- Loop Básico
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


-- Controlando um Cursor Explícito com WHILE LOOP

SET SERVEROUTPUT ON
SET VERIFY OFF
DECLARE
  CURSOR  employees_cursor  IS
  SELECT  *
  FROM    employees; -- Declaração do Cursor
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
--Aula 41 - Controlando um Cursor Explícito ultilizando Cursor FOR LOOP


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
--Aula 42 Cursor Explícito com Parâmetros

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

----------------------------------------------------------
--Aula 43 Cursor Explícito com SELECT FOR UPDATE


SET SERVEROUTPUT ON 
SET VERIFY OFF
DECLARE
    CURSOR employees_cursor (pjob_id VARCHAR2)
    IS 
    SELECT * 
    FROM employees
    WHERE job_id = pjob_id
    FOR UPDATE;
BEGIN 
    FOR employees_record IN employees_cursor ('AD_VP')
    LOOP
        UPDATE employees
        SET salary = salary *(1 + 10 / 100)
        WHERE CURRENT OF employees_cursor;
    END LOOP;
    --COMMIT;
    ROLLBACK; 
END;


----------------------------------------------------------
--Aula 44 - Tratamento de Exceções

SET SERVEROUTPUT ON
SET VERIFY OFF
ACCEPT pEmployee_id PROMPT 'Digite o Id do Empregado: '
DECLARE
    vFirst_name   employees.first_name%TYPE;
    vLast_name    employees.last_name%TYPE;
    vEmployee_id  employees.employee_id%TYPE := &pEmployee_id;
BEGIN
    SELECT 
        first_name, last_name 
    INTO
        vFirst_name, vLast_name
    FROM 
        employees
    WHERE 
        employee_id = vEmployee_id;
        
        
    DBMS_OUTPUT.PUT_LINE('Empregado: ' || vFirst_name || ' ' || vLast_name);

EXCEPTION
    WHEN NO_DATA_FOUND THEN 
        RAISE_APPLICATION_ERROR(-20001, 'Empregado não encontrado, id = ' || TO_CHAR(vEmployee_id));
    WHEN OTHERS THEN
        RAISE_APPLICATION_ERROR(-20002, 'Erro Oracle - ' || SQLCODE || SQLERRM);
END;

----------------------------------------------------------
--Aula 45 - Exceções Definidas pelo Dev

SET SERVEROUTPUT ON 
SET VERIFY OFF
ACCEPT pEmployee_id PROMPT 'Digite o Id do Empregado: '
DECLARE 
    vFirst_name  employees.first_name%Type;                                                                                                                                                                                                                                                 
    vLast_name   employees.last_name%Type;
    vJob_id      employees.job_id%Type;
    vEmployee_id employees.employee_id%Type;
    ePresident   EXCEPTION ;
BEGIN
    SELECT 
        first_name, last_name, job_id
    INTO
        vFirst_name, vLast_name, vJob_id
    FROM employees
    WHERE employee_id = vEmployee_id;
    
    IF vJob_id = 'AD_PRES' THEN
        RAISE ePresident;
    END IF;
    
EXCEPTION
    WHEN NO_DATA_FOUND THEN
     RAISE_APPLICATION_ERROR(-20001, 'Empregado não encontrado, id = '
     || TO_CHAR(vEmployee_id)
     );
    WHEN ePresident THEN
        UPDATE employees
        SET salary = salary * 1.5
        WHERE employee_id = vEmployee_id;
        --COMMIT;
    WHEN OTHERS THEN
        RAISE_APPLICATION_ERROR(-20002, 'Erro Oracle ' || SQLCODE || SQLERRM);
END;
 
----------------------------------------------------------
--Aula 46 - Pragma Exception Init

DECLARE
    vFirst_name   employees.first_name%Type := 'Robert';
    vLast_name    employees.last_name%Type  := 'Ford';
    vJob_id       employees.job_id%Type := 'XX_YYYY';
    vPhone_number employees.phone_number%Type := '650.511.9844';
    vEmail        employees.email%Type := 'RFORD';
    eFk_inexistente  EXCEPTION;
    PRAGMA EXCEPTION_INIT(eFk_inexistente,-2291);
BEGIN
    INSERT INTO employees (employee_id, first_name, last_name, phone_number, email, hire_date, job_id)
    VALUES (employees_seq.nextval, vfirst_name, vlast_name, vPhone_number, vemail, sysdate, vjob_id);
    COMMIT;
EXCEPTION   
    WHEN eFk_inexistente THEN
        RAISE_APPLICATION_ERROR(-20003, 'Job inexistente!');
    WHEN OTHERS THEN
        RAISE_APPLICATION_ERROR(-20002, 'Erro Oracle' || SQLCODE || SQLERRM);
END;

----------------------------------------------------------
--Aula 47 - Criando Procedures de banco 


CREATE OR REPLACE PROCEDURE PRC_INSERE_EMPREGADO
    (
        pfirst_name     IN VARCHAR2,
        plast_name      IN VARCHAR2,
        pemail          IN VARCHAR2,
        pphone_number   IN VARCHAR2,
        phire_date      IN DATE DEFAULT SYSDATE,
        pjob_id         IN VARCHAR2,
        pSALARY         IN NUMBER,
        pCOMMICION_PCT  IN NUMBER, 
        pMANAGER_ID     IN NUMBER,
        pDEPARTMENT_ID  IN NUMBER
    )
IS
    --Nenhuma váriavel declarada
BEGIN
    INSERT INTO employees(
        employee_id,
        first_name,
        last_name,
        email,
        phone_number,
        hire_date,
        job_id,
        salary,
        commission_pct,
        manager_id,
        department_id        
    )
    VALUES
    (
        EMPLOYEES_SEQ.nextval,
        pfirst_name,
        plast_name,
        pemail,
        pphone_number,
        phire_date,
        pjob_id,
        psalary,
        pcommicion_pct,
        pMANAGER_ID,
        pdepartment_id
    );
EXCEPTION
    WHEN OTHERS THEN 
        RAISE_APPLICATION_ERROR(-20001, 'Erro Oracle' || SQLCODE || SQLERRM);
END; 

-- Executando a procedure pelo Bloco PL/SQL

BEGIN
    PRC_INSERE_EMPREGADO('David','Bowie', 'DBOWIE', '515.127.4861', 
    SYSDATE, 'IT_PROG', 1500,NULL, 103,60);
    COMMIT;
END;

-- Executando procedure com o comando EXECUTE do SQL*PUBLUS

EXEC PRC_INSERE_EMPREGADO('Greg','Lake', 'GLAKE', '515.127.4961',SYSDATE,'IT_PROG', 15000, NULL,103,60);

COMMIT;

----------------------------------------------------------
--Aula 48 - Ultilizando parâmetros tipo IN

CREATE OR REPLACE PROCEDURE PRC_AUMENTA_SALARIO_EMPREGO(
    p_employee_id  IN NUMBER,
    p_percentual   IN NUMBER
)
IS 
-- Nunhuma váriavel declarada 
BEGIN
    UPDATE employees
    SET salary = salary * (1 + p_percentual / 100)
    WHERE employee_id = p_employee_id;
EXCEPTION
    WHEN OTHERS THEN
        RAISE_APPLICATION_ERROR(-20001, 'Erro Oracle' || SQLCODE || SQLERRM);
END;

BEGIN 
    PRC_AUMENTA_SALARIO_EMPREGO(109,10);
    ROLLBACK;
END;

----------------------------------------------------------
--Aula 49 - Ultilizando parâmetros tipo IN e IN OUT

CREATE OR REPLACE PROCEDURE PRC_CONSULTA_EMPREGADO(
    pemployee_id    IN NUMBER,
    pfirst_name     OUT VARCHAR2,
    plast_name      OUT VARCHAR2,
    pemail          OUT VARCHAR2,
    pphone_number   OUT VARCHAR2,
    phire_date      OUT DATE,
    pjob_id         OUT VARCHAR2,
    pSalary         OUT NUMBER,
    pCommission_PCT OUT NUMBER,
    pManager_id     OUT NUMBER,
    pDepartment_id  OUT NUMBER
)
IS 
-- DECLARAÇÃO DE VÁRIAVEIS
BEGIN
    SELECT 
        first_name,
        last_name,
        email,
        phone_number,
        hire_date,
        job_id,
        salary,
        commission_pct,
        manager_id,
        department_id
INTO
    pfirst_name,
    plast_name,
    pemail,
    pphone_number,
    phire_date,
    pjob_id,
    pSalary,
    pCommission_PCT,
    pManager_id,
    pDepartment_id
FROM employees
WHERE employee_id = pemployee_id;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RAISE_APPLICATION_ERROR(-20001,'Empregado não existe: '|| pemployee_id);
    WHEN OTHERS THEN
        RAISE_APPLICATION_ERROR(-20002,'Erro Oracle: '|| SQLCODE || SQLERRM);
END;

-- Executando procedure parametrop Tipo Out

SET SERVEROUTPUT ON 
SET VERIFY OFF
DECLARE 
    employees_record employees%ROWTYPE;
BEGIN
    PRC_CONSULTA_EMPREGADO(100,employees_record.first_name, employees_record.last_name, employees_record.email,
    employees_record.phone_number, employees_record.hire_date, employees_record.job_id, employees_record.salary,
    employees_record.commission_pct, employees_record.manager_id, employees_record.department_id);
    DBMS_OUTPUT.PUT_LINE(
        employees_record.first_name || ' ' ||
        employees_record.last_name || ' ' ||
        employees_record.department_id || ' ' ||
        employees_record.job_id || ' ' ||
        employees_record.phone_number || ' ' ||
        LTRIM(TO_CHAR(employees_record.salary, 'L99G999G999D99'))
    );
END;


CREATE OR REPLACE PROCEDURE PRC_CONSULTA_EMPREGADO(
    pemployee_id    IN NUMBER,
    pfirst_name     OUT NOCOPY VARCHAR2,
    plast_name      OUT NOCOPY VARCHAR2,
    pemail          OUT NOCOPY VARCHAR2,
    pphone_number   OUT NOCOPY VARCHAR2,
    phire_date      OUT NOCOPY DATE,
    pjob_id         OUT NOCOPY VARCHAR2,
    pSalary         OUT NOCOPY NUMBER,
    pCommission_PCT OUT NOCOPY NUMBER,
    pManager_id     OUT NOCOPY NUMBER,
    pDepartment_id  OUT NOCOPY NUMBER
)
IS 
-- DECLARAÇÃO DE VÁRIAVEIS
BEGIN
    SELECT 
        first_name,
        last_name,
        email,
        phone_number,
        hire_date,
        job_id,
        salary,
        commission_pct,
        manager_id,
        department_id
INTO
    pfirst_name,
    plast_name,
    pemail,
    pphone_number,
    phire_date,
    pjob_id,
    pSalary,
    pCommission_PCT,
    pManager_id,
    pDepartment_id
FROM employees
WHERE employee_id = pemployee_id;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RAISE_APPLICATION_ERROR(-20001,'Empregado não existe: '|| pemployee_id);
    WHEN OTHERS THEN
        RAISE_APPLICATION_ERROR(-20002,'Erro Oracle: '|| SQLCODE || SQLERRM);
END;

----------------------------------------------------------
--Aula 50 - Métodos de passagem de Parâmetros 

SET SERVEROUTPUT ON
SET VERIFY OFF
DECLARE 
    V_EMPLOYEE_ID     NUMBER := 100;
    V_FIRST_NAME      VARCHAR2(200);
    V_LAST_NAME       VARCHAR2(200);
    V_EMAIL           VARCHAR2(200);
    V_PHONE_NUMBER    VARCHAR2(200);
    V_HIRE_DATE       DATE;
    V_JOB_ID          VARCHAR2(200);
    V_SALARY          NUMBER;
    V_COMMISSION_PCT  NUMBER;
    V_MANAGER_ID      NUMBER;
    V_DEPARTMENT_ID   NUMBER;
BEGIN 
     PRC_CONSULTA_EMPREGADO(
        P_EMPLOYEE_ID    => V_EMPLOYEE_ID,
        P_FIRST_NAME     => V_FIRST_NAME,
        P_LAST_NAME      => V_LAST_NAME,
        P_EMAIL          => V_EMAIL,
        P_PHONE_NUMBER   => V_PHONE_NUMBER,
        P_HIRE_DATE      => V_HIRE_DATE,
        P_JOB_ID         => V_JOB_ID,
        P_SALARY         => V_SALARY,
        P_COMMISSION_PCT => V_COMMISSION_PCT,
        P_MANAGER_ID     => V_MANAGER_ID,
        P_DEPARTMENT_ID  => V_DEPARTMENT_ID
    );
END;

----------------------------------------------------------
--Aula 51 - Recompilando procedures de banco de dados


ALTER PROCEDURE PRC_INSERE_EMPREGADO COMPILE;

----------------------------------------------------------
--Aula 57 - Criando Funções de Banco de Dados

CREATE OR REPLACE FUNCTION FNC_CONSULTA_SALARIO
(
    pEmployee_id IN NUMBER
)
RETURN NUMBER
IS 
  vSalary  employees.salary%TYPE;
BEGIN
    SELECT salary
    INTO   vSalary
    FROM   employees
    WHERE  employee_id = pEmployee_id;
    RETURN (vSalary);
EXCEPTION
    WHEN NO_DATA_FOUND THEN
      RAISE_APPLICATION_ERROR(-20001, 'Empregado inexistente');
    WHEN OTHERS THEN
      RAISE_APPLICATION_ERROR(-20001, 'Erro Oracle' || SQLCODE || SQLERRM);
END;


--Executando a Função pelo Bloco PL/SQL


SET SERVEROUTPUT ON
SET VERIFY OFF
ACCEPT pEmployee_id PROMPT 'Digite o Id do empregado: '
DECLARE
    vEmployee_id  employees.employee_id%TYPE := &pEmployee_id;
    vSalary       employees.salary%TYPE;
    vNome         employees.first_name%TYPE;
BEGIN
    vSalary := FNC_CONSULTA_SALARIO(vEmployee_id);
    SELECT first_name
    INTO vNome
    FROM employees
    WHERE employee_id = vEmployee_id;
    DBMS_OUTPUT.PUT_LINE('O colaborador ' || vNome || ' tem o salario de: ' || LTRIM(TO_CHAR(vSalary, 'L99G999G999D99')));
END;


----------------------------------------------------------
--Aula 58 - Ultilizando Funções em comandos SQL



/*
    Regras para o uso de Funções em comandos SQL
    
    * As funções devem ser armazenadas no servidor de banco de dados 
    * A função deve ser do tipo Single-Row
    * No corpo da função, não podem gaver comandos DML
    * A função deve conter apenas parâmetros do tipo "IN"
    * Tipos PL/SQL, tais como BOOLEAN, RECORD ou Table não são aceitos como tipo de retorno da função
    * No corpo da função, não são permitidas chamadas à subrotinas que desobedeçam quaisquer das restrições anteriores
*/


CREATE OR REPLACE FUNCTION FNC_CONSULTA_TITULO_CARGO_EMPREGADO
(  pJob_id   IN   jobs.job_id%TYPE  )
RETURN VARCHAR2
IS 
    vJob_title  jobs.job_title%TYPE;
BEGIN
    SELECT job_title
    INTO   vJob_title
    FROM jobs
    WHERE job_id = pJob_id;
    RETURN (vJob_title);
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RAISE_APPLICATION_ERROR(-20001,'Job inexistente');
    WHEN OTHERS THEN
        RAISE_APPLICATION_ERROR(-20002,'Erro Oracle: '|| SQLCODE || SQLERRM);
END;


------- Ultilizando Funções em comandos SQL

SELECT 
    employee_id,
    first_name,
    last_name,
    job_id,
    FNC_CONSULTA_TITULO_CARGO_EMPREGADO(job_id) 
FROM 
    employees;

------- Executando a Função pelo comando SELECT

-- dual é uma tabela que sempre existe que só tem uma linha
SELECT FNC_CONSULTA_TITULO_CARGO_EMPREGADO('IT_PROG')
FROM dual;

----------------------------------------------------------
--Aula 59 - Recompilando funções de Banco de dados 


ALTER FUNCTION FNC_CONSULTA_TITULO_CARGO_EMPREGADO COMPILE;

----------------------------------------------------------
--Aula 60 - Removendo Funções do Banco de Dados

--DROP FUNCTION FNC_CONSULTA_TITULO_CARGO_EMPREGADO;

----------------------------------------------------------
--Aula 61 - Gerenciando procedures do banco de dados 

DESC USER_OBJECTS

SELECT object_name, object_type, las_ddl_time, timestamp, status
FROM user_objects
WHERE object_type IN ('PROCEDURE','FUNCTION');

-- Consultando objetos Inválidos do schema do seu usuário

DESC USER_OBJECTS

SELECT object_name, object_type, las_ddl_time, timestamp, status
FROM user_objects
WHERE status = 'INVALID';

-- Consultando o Código Fonte de procedures e Funções do seu usuário 

DESC user_source

SELECT line, text
FROM user_source
WHERE name = 'PRC_INSERE_EMPREGADO' AND 
      type = 'PROCEDURE'
ORDER BY line;

-- Consultando o Código Fonte Funções do seu usuário 

SELECT line, text
FROM user_source
WHERE name = 'FNC_CONSULTA_SALARIO' AND 
      type = 'FUNCTION'
ORDER BY line;


-- Consultado parâmetros da procedure ou função

DESC PRC_INSERE_EMPREGADO;

DESC FNC_CONSULTA_SALARIO;

--- CONSULTANDO ERROS DE COMPILAÇÃO

--- FORÇANDO UM ERRO DE COMPILAÇÃO


----------------------------------------------------------
--Aula 62 - Gerenciando Dependencias do Oracle

---Consultando dependencias Diretas dos objetos do seu schema ultilizando a visão USER_DEPENDENCIES

DESC  user_dependencies 

SELECT *
FROM user_dependencies
WHERE referenced_name = 'EMPLOYEES' 
AND   referenced_type = 'ITABLE';


--- Consultado Dependencia Diretas e Indiretas dos objetos do seu schema ultilizando a visão USER_DEPENDENCIES

SELECT *
FROM  user_dependencies
START WITH  referenced_name = 'EMPLOYEES'
    AND     referenced_type = 'TABLE'
CONNECT BY PRIOR name = referenced_name AND 
                 type = referenced_type;
                 
        
---- Consultando Dependencias Diretas e Indiretas dos ibjetos de todos schemas ultilizando a visão DBA_DEPENDENCIES
---  Conecte-se como SYS

DESC DBA_DEPENCIES

SELECT *
FROM dba_dependencies
START WITH referenced_owner = 'HR' AND 
           referenced_name  = 'EMPLOYEES' AND
           referenced_type  = 'TABLE'
CONNECT BY PRIOR  
           owner = referenced_owner AND
           name  = referenced_name AND 
           type  = referenced_type;
        
---- Consultando objetos Inválidos do schema do seu usuário

DESC USER_OBJECTS

SELECT 
    object_name, 
    object_type,
    last_ddl_time,
    timestamp,
    status
FROM 
    user_objects
WHERE STATUS = 'INVALID';



----------------------------------------------------------
--Aula 62 - Gerenciando Dependencias do Oracle


--Executando o script UTLDTREE

@C:\app\lucas\product\18.0.0\dbhomeXE\rdbms\admin\ult.sql


-- Executando a procedure DEPTREE_FILL

exec  DEPTREE_FILL('TABLE','HR','EMPLOYEES');

-- Ultilizando as Visões DEPTREE

DESC deptree;

SELECT *
FROM   deptree
ORDER BY seq#;



---- 64 - Debugando procedures e Funcions

--- Concedendo privilégios para o usuário HR
grant DEBUG CONNECT SESSION, DEBUG ANY PROCEDURE to hr;


---Liberando privilégios para o hr

BEGIN
    DBMS_NETWORK_ACL_ADMIN.APPEND_HOST_ACE(
        host => '127.0.0.1',
        lower_port     => null,
        upper_port     => null,
        ace            => xs$ace_type(privilege_list => xs$name_list('jdwp'),
        principal_name => 'hr',
        principal_type => xs_acl.ptype_db)
    );
END;

---- 66 - Criando o Package Specification
----

CREATE OR REPLACE PACKAGE PCK_EMPREGADOS
IS

    pMinSalary   employees.salary%type;
    
    PROCEDURE  PRC_INSERE_EMPREGADO
    (
        pfirst_name     IN VARCHAR2,
        plast_name      IN VARCHAR2,
        pemail          IN VARCHAR2,
        pphone_number   IN VARCHAR2,
        phire_date      IN DATE DEFAULT SYSDATE,
        pjob_id         IN VARCHAR2,
        pSALARY         IN NUMBER,
        pCOMMICION_PCT  IN NUMBER, 
        pMANAGER_ID     IN NUMBER,
        pDEPARTMENT_ID  IN NUMBER
    );
    
    PROCEDURE PRC_AUMENTA_SALARIO_EMPREGADO
    (
        pemployee_id     IN NUMBER,
        ppercentual      IN NUMBER
    );
    
    FUNCTION FNC_CONSULTA_SALARIO_EMPREGADO(pemployee_id IN NUMBER) RETURN NUMBER;
    
END PCK_EMPREGADOS;


---- 67 - Criando o Package body
----

CREATE OR REPLACE PACKAGE BODY PCK_EMPREGADOS
IS
    PROCEDURE  PRC_INSERE_EMPREGADO
        (
            pfirst_name     IN VARCHAR2,
            plast_name      IN VARCHAR2,
            pemail          IN VARCHAR2,
            pphone_number   IN VARCHAR2,
            phire_date      IN DATE DEFAULT SYSDATE,
            pjob_id         IN VARCHAR2,
            pSALARY         IN NUMBER,
            pCOMMICION_PCT  IN NUMBER, 
            pMANAGER_ID     IN NUMBER,
            pDEPARTMENT_ID  IN NUMBER
        )
        IS
            --Nenhuma váriavel declarada
        BEGIN
            IF pSalary < PCK_EMPREGADOS.pSalary THEN
                RAISE_APPLICARTION_ERROR(-20002,'Salário não pode ser inferior ao menor salario dos empregados!');
            END IF;
            INSERT INTO employees(
                employee_id,
                first_name,
                last_name,
                email,
                phone_number,
                hire_date,
                job_id,
                salary,
                commission_pct,
                manager_id,
                department_id        
            )
            VALUES
            (
                EMPLOYEES_SEQ.nextval,
                pfirst_name,
                plast_name,
                pemail,
                pphone_number,
                phire_date,
                pjob_id,
                psalary,
                pcommicion_pct,
                pMANAGER_ID,
                pdepartment_id
            );
        EXCEPTION
            WHEN OTHERS THEN 
                RAISE_APPLICATION_ERROR(-20001, 'Erro Oracle' || SQLCODE || SQLERRM);
        END; 
        
        PROCEDURE PRC_AUMENTA_SALARIO_EMPREGADO
        (
            pemployee_id IN NUMBER,
            ppercentual  IN NUMBER
        )
        IS 
        
        BEGIN 
            UPDATE employees
            SET    salary = salary * (1 + ppercentual/100)
            WHERE employee_id = pemployee_id;
        EXCEPTION
            WHEN OTHERS THEN
                RAISE_APPLICATION_ERROR(-20001,'Erro Oracle '|| SQLCODE || SQLERRM);
        END;
        
        FUNCTION FNC_CONSULTA_SALARIO_EMPREGADO
            (pemployee_id IN NUMBER)
        RETURN NUMBER
        IS 
            vsalary employees.salary%type;
        BEGIN 
            SELECT salary
            INTO   vsalary
            FROM   employees
            WHERE  employee_id = pemployee_id;
            RETURN (vsalary);
        EXCEPTION
            WHEN NO_DATA_FOUND THEN
                RAISE_APPLICATION_ERROR(-20001,'Empregado Inexistente');
            WHEN OTHERS THEN 
                RAISE_APPLICATION_ERROR(-20002,'Erro Oracle '|| SQLCODE || SQLERRM);
        END;
END PCK_EMPREGADOS;



---- 68 - Referenciando componentes de uma Package
----

BEGIN
    PCK_EMPREGADOS.PRC_INSERE_EMPREGADO('John','Lenon','JLENON','515.258.4861',SYSDATE,'IT_PROG',20000,NULL,103,60);
END;

COMMIT;

---- 70 - Recompilando uma Package
----

ALTER PACKAGE PCK_EMPREGADOS COMPILE SPECIFICATION;

-- Recompilando Package Body de Dados 

ALTER PACKAGE PCK_EMPREGADOS COMPILE BODY;

---- 71 - Removendo uma Package
----

-- REMOVENDO PACKAGE BODY:
DROP PACKAGE BODY PCK_EMPREGADOS;

--REMOVENDO PACKAGE SPEC
DROP PACKAGE PCK_EMPREGADOS;


---74 - DATBASE DML TRIGGER
--


CREATE OR REPLACE TRIGGER B_I_EMPLOYEES_S_TRG
BEFORE INSERT 
ON employees
BEGIN 
    IF (TO_CHAR(SYSDATE,'DAY') IN ('SABADO','DOMINGO') OR
        TO_NUMBER(TO_CHAR(SYSDATE,'HH24')) NOT BETWEEN 8 AND 18)
    THEN
        RAISE_APPLICATION_ERROR(-20001,'O cadastro de Empregados só é permitido em dias de semana do horário comercial');
    END IF;
END;

DROP TRIGGER B_I_EMPLOYEES_S_TRG;

--Testando a validação da Trigger 

BEGIN 
    pck_empregados.prc_insere_empregado('George','Harrison','GHARRISON','515.258.5690',SYSDATE,'IT_PROG',25000,NULL,103,60);
    COMMIT;
END;


---Criando uma Trigger Combinando Vários Eventos

CREATE OR REPLACE TRIGGER B_I_VALIDA_HORARIO_EMPLOYEES_R_TRG
BEFORE INSERT OR UPDATE OR DELETE 
ON employees
BEGIN 
    IF (TO_CHAR(SYSDATE,'DAY') IN ('SABADO','DOMINGO') OR
        TO_NUMBER(TO_CHAR(SYSDATE,'HH24')) NOT BETWEEN 8 AND 18)
    THEN
        CASE 
            WHEN INSERTING
            THEN 
                RAISE_APPLICATION_ERROR(-20001,'O cadastro de Empregados só é permitido em dias de semana, dentro do horário comercial.');
            WHEN DELETING 
            THEN 
                RAISE_APPLICATION_ERROR(-20001,'O cadastro de Empregados só é permitido em dias de semana, dentro do horário comercial.');
            ELSE 
                RAISE_APPLICATION_ERROR(-20001,'O cadastro de Empregados só é permitido em dias de semana, dentro do horário comercial.');
            END CASE;
    END IF;
END;

DROP TRIGGER B_I_VALIDA_HORARIO_EMPLOYEES_R_TRG;

--Testando a validação da Trigger 

BEGIN 
    pck_empregados.prc_insere_empregado('George','Harrison','GHARRISON','515.258.5690',SYSDATE,'IT_PROG',25000,NULL,103,60);
    COMMIT;
END;





---75 - Mutatin Tables 
--

/*
    Regra 1 de Mutanting 
*/
/*
CREATE OR REPLACE TRIGGER A_I_EMPLOYEES_R_TRG
AFTER INSERT 
ON employees
FOR EACH ROW
BEGIN 
    UPDATE employees
    SET    email = UPPER(SUBSTR(:new.first_name,1,1)|| :new.last_name)
    WHERE  employee_id = :new.employee_id;
END;
*/
CREATE OR REPLACE TRIGGER A_I_EMPLOYEES_R_TRG
BEFORE INSERT 
ON employees
FOR EACH ROW
BEGIN 
    UPDATE employees
    SET    email = UPPER(SUBSTR(:new.first_name,1,1)|| :new.last_name)
    WHERE  employee_id = :new.employee_id;
END;

---Testando Violação da Regra 1

SET VERIFY OFF
BEGIN 
  prc_insere_empregado('Eric','Claption','ECLAPTION','515.188.4861',SYSDATE,'IT_PROG',15000,NULL,103,60);
  commit;
END;

CREATE OR REPLACE TRIGGER B_U_VALIDADE_SALARY_EMPLOYEES_R_TRG
BEFORE UPDATE OF salary
ON employees
FOR EACH ROW
DECLARE 
    vMaxSalary   employees.salary%TYPE;
BEGIN 
    SELECT MAX(salary)
    INTO   vMaxSalary
    FROM   employees;
    
    IF :new.salary > vMaxSalary * 1.2 THEN
        RAISE_APPLICATION_ERROR(-20001,'Salario não pode ser superior ao maior salario de + 20%');
    END IF;
END;

SET VERIFY OFF
UPDATE employees
SET    salary = 70000
WHERE  employee_id = 100;

DROP TRIGGER A_I_EMPLOYEES_R_TRG;

DROP TRIGGER B_U_VALIDADE_SALARY_EMPLOYEES_R_TRG;

CREATE OR REPLACE PACKAGE PKG_EMPLOYEES_DADOS
AS 
    TYPE max_salary_table_type IS TABLE OF NUMBER(10,2)
    INDEX BY BINARY_INTEGER;
    
    gmax_salary max_salary_table_type;
END PKG_EMPLOYEES_DADOS;


CREATE OR REPLACE TRIGGER B_IU_VALIDATE_SALARY_EMPLOYEES_S_TRG
BEFORE INSERT OR UPDATE OF salary
ON employees 
--FOR EACH ROW
DECLARE 
    vmax_salary  employees.salary%TYPE;
    BEGIN 
        SELECT max(salary)
        INTO   PKG_EMPLOYEES_DADOS.gmax_salary(1)
        FROM   employees;
        
END;


CREATE OR REPLACE TRIGGER B_IU_VALIDATE_SALARY_EMPLOYEES_R_TRG
BEFORE INSERT OR UPDATE OF salary
ON employees
FOR EACH ROW 
DECLARE 
    vmax_salary  employees.salary%TYPE;
    BEGIN 
        IF :new.salary > PKG_EMPLOYEES_DADOS.gmax_salary(1) * 1.2 THEN
            RAISE_APPLICATION_ERROR(-20001,'Novo salario não pode ser superior ao maiopr salario + 20%');
        END IF;
END;

SET VERIFY OFF
UPDATE employees
SET   SALARY = 70000
WHERE  employee_id = 100;

---- 77 - Desabilitando e Habilitando Trigger
----


--Desabilitando Database DML Trigger 

ALTER TRIGGER B_IUD_VALIDA_HORARIO_EMPLOYEES_S_TRG disable;

--Habilitando Database DML Triggers

ALTER TRIGGER B_IUD_VALIDA_HORARIO_EMPLOYEES_S_TRG disable;

--Desabilitando todas Database DML Triggers da tabela employees

ALTER TABLE employees DISABLE ALL TRIGGERS;

--Habilitando todas Database DML Triggers da tabela employees

ALTER TABLE employees ENABLE ALL TRIGGERS;

-----------------------------------------------------

--78 Consultando Database DML Triggers pelo dicionário de Dados
--

SELECT * 
FROM   user_triggers
WHERE  table_name  = 'EMPLOYEES' AND 
       table_owner = 'HR';



-- 79 - Removendo uma Database DML Trigger
--
DROP TRIGGER B_IUD_VALIDA_HORARIO_EMPLOYEES_S_TRG;



-- 81 Ultilizando SYSREFCURSOR
--

--
-- Seção 23 - PL/SQL Avançado - Utilizando SYS_REFCURSOR
--
-- Aula 1 - Utilizando SYS_REFCURSOR
--

-- Utilizando SYS_REFCURSOR

CREATE OR REPLACE PROCEDURE PRC_CURSOR_EMPLOYEES
  (pemployees_cursor OUT SYS_REFCURSOR)
IS
BEGIN
  OPEN pemployees_cursor 
  FOR
	SELECT first_name, last_name 
	FROM employees;
	
END PRC_CURSOR_EMPLOYEES;

-- Procedure referenciando o Parametro OUT SYS_REFCURSOR

CREATE OR REPLACE PROCEDURE PRC_DISPLAY_EMPOYEES
IS
  employees_cursor  SYS_REFCURSOR;
  vfirst_name  employees.first_name%TYPE;
  vlast_name   employees.last_name%TYPE;
BEGIN
  PRC_CURSOR_EMPLOYEES(employees_cursor);
  
  LOOP
    FETCH  employees_cursor
    INTO   vfirst_name, vlast_name;
    EXIT   WHEN employees_cursor%NOTFOUND;
	
    DBMS_OUTPUT.PUT_LINE(vfirst_name || ' ' || vlast_name);

  END LOOP;
  
  CLOSE employees_cursor;
  
END PRC_DISPLAY_EMPOYEES;

-- Executando a Procedure PRC_DISPLAY_EMPOYEES

SET SERVEROUTPUT ON
SET VERIFY OFF
execute PRC_DISPLAY_EMPOYEES

-- Variável Cursor e Reference Cursor 

CREATE OR REPLACE FUNCTION FNC_GET_EMPOYEES
  (pemployee_id  IN NUMBER)
  RETURN SYS_REFCURSOR
IS
  employees_cursor  SYS_REFCURSOR;
BEGIN
  OPEN employees_cursor  
  FOR
    SELECT first_name, last_name
    FROM   employees
    WHERE  employee_id = pemployee_id;
    
  RETURN employees_cursor;
  
END FNC_GET_EMPOYEES;

-- Referenciando a Função

CREATE OR REPLACE PROCEDURE PRC_DISPLAY_EMPOYEES2
  (pemployee_id IN NUMBER)
IS
  employees_cursor  SYS_REFCURSOR;
  vfirst_name  employees.first_name%TYPE;
  vlast_name   employees.last_name%TYPE;
BEGIN
  employees_cursor := FNC_GET_EMPOYEES(pemployee_id);
  
  LOOP
    FETCH  employees_cursor
    INTO   vfirst_name, vlast_name;
    EXIT WHEN employees_cursor%NOTFOUND;
	
    DBMS_OUTPUT.PUT_LINE(vfirst_name || ' ' || vlast_name);

  END LOOP;
  
  CLOSE employees_cursor;
END PRC_DISPLAY_EMPOYEES2;

-- Executando a procedure 

SET SERVEROUTPUT ON
SET VERIFY OFF
execute PRC_DISPLAY_EMPOYEES2(100)

--83 - Associative Array of Records Bulk Collect
--

SET SERVEROUTPUT ON
SET VERIFY OFF
DECLARE 
    TYPE employees_table_type IS TABLE OF employees%rowtype
    INDEX BY BINARY_INTEGER; --Type Associative Array
    employees_table employees_table_type;
BEGIN
    SELECT * 
        BULK COLLECT INTO employees_table --Bulk Collect de todos (order_id) para a Collection (vOrder_id)
    FROM 
        employees;
    FOR i IN employees_table.first..employees_table.last
    LOOP
        dbms_output.put_line(employees_table(i).employee_id || ' - ' || 
                             employees_table(i).first_name  || ' - ' || 
                             employees_table(i).last_name   || ' - ' || 
                             employees_table(i).phone_number || ' - ' || 
                             employees_table(i).job_id || ' - ' ||
                             TO_CHAR(employees_table(i).salary,'99g999g999d99')
                             );
                             
    END LOOP;
END;

--84  - Nested Table of Records - Bulk Collect
--

SET SERVEROUTPUT ON
SET VERIFY OFF
DECLARE
    TYPE employees_table_type IS TABLE OF employees%rowtype;
    employees_table employees_table_type := employees_table_type();
BEGIN
    SELECT * 
        BULK COLLECT INTO employees_table
    FROM employees;
    FOR i in employees_table.first..employees_table.last
    LOOP
        DBMS_OUTPUT.PUT_LINE(
            employees_table(i).employee_id || ' - ' ||
            employees_table(i).first_name || ' - ' ||
            employees_table(i).last_name || ' - ' || 
            employees_table(i).phone_number || ' - ' ||
            employees_table(i).job_id || ' - ' ||
            TO_CHAR(employees_table(i).salary,'99G999G999D99')
        );
    END LOOP;
END;


-- 85 - Varray of Records - Bulk Collect
--

SET SERVEROUTPUT ON 
SET VERIFY OFF
DECLARE 
     TYPE employees_table_type IS VARRAY(200) OF employees%rowtype;
     employees_table    employees_table_type := employees_table_type();
BEGIN 
    SELECT *
        BULK COLLECT INTO employees_table
    FROM employees;
    FOR i IN employees_table.first..employees_table.last
    LOOP
        DBMS_OUTPUT.PUT_LINE(
            employees_table(i).employee_id || ' - ' || 
            employees_table(i).first_name || ' - ' ||
            employees_table(i).last_name || ' - ' ||
            employees_table(i).phone_number || ' - ' ||
            employees_table(i).job_id || ' - ' ||
            TO_CHAR(employees_table(i).salary,'99G999G999D99')
        );
    END LOOP;
END;


--86 - Ultilizando Métodos para controlar Collections
--

SET SERVEROUTPUT ON 
SET VERIFY OFF
DECLARE 
     TYPE employees_table_type IS VARRAY(200) OF employees%rowtype;
     employees_table    employees_table_type := employees_table_type();
BEGIN 
    SELECT *
        BULK COLLECT INTO employees_table
    FROM employees;
    
    --retornando do primeiro ao ultimo elemento do array
    FOR i IN employees_table.first..employees_table.last
    LOOP
        DBMS_OUTPUT.PUT_LINE(
            employees_table(i).employee_id || ' - ' || 
            employees_table(i).first_name || ' - ' ||
            employees_table(i).last_name || ' - ' ||
            employees_table(i).phone_number || ' - ' ||
            employees_table(i).job_id || ' - ' ||
            TO_CHAR(employees_table(i).salary,'99G999G999D99')
        );
    END LOOP;
END;


--87 Bulk collect e For All
--


-- Bulk Collect 

SELECT count(*)
FROM   employees;

SET SERVEROUTPUT ON
SET VERIFY OFF
CREATE OR REPLACE PROCEDURE PRC_UPDATE_SALARY
  (ppercentual IN NUMBER)
AS
  TYPE employee_id_table_type IS TABLE OF employees.employee_id%TYPE 
  INDEX BY BINARY_INTEGER;  -- Type Associative Array
  employee_id_table  employee_id_table_type;
BEGIN
  SELECT DISTINCT employee_id 
    BULK COLLECT INTO employee_id_table  
  FROM employees;
  
  DBMS_OUTPUT.PUT_LINE('Linhas recuperadas: ' || employee_id_table.COUNT);
  
  FOR indice IN 1..employee_id_table.COUNT  LOOP 
    UPDATE employees e
    SET    e.salary = e.salary * (1 + ppercentual / 100)
    WHERE  e.employee_id = employee_id_table(indice);   -- para cada UPDATE dentro do FOR LOOP Ocorrerá troca de contexto (Context Switch) 
	--
    -- outro comandos
    --
  END LOOP;
	
END;

-- Consultando antes

SELECT *
FROM employees;

--- Executando PRC_UPDATE_TAX 

exec PRC_UPDATE_SALARY(10)

-- Consultando depois

SELECT *
FROM employees;

ROLLBACK;

-- Bulk Collect - FOR ALL

SET SERVEROUTPUT ON
SET VERIFY OFF
CREATE OR REPLACE PROCEDURE PRC_UPDATE_SALARY
  (ppercentual IN NUMBER)
AS
  TYPE employee_id_table_type IS TABLE OF employees.employee_id%TYPE 
  INDEX BY BINARY_INTEGER;  -- Type Associative Array
  employee_id_table  employee_id_table_type;
BEGIN

  SELECT DISTINCT employee_id 
    BULK COLLECT INTO employee_id_table  
  FROM employees;
  
  DBMS_OUTPUT.PUT_LINE('Linhas recuperadas: ' || employee_id_table.COUNT);
  
  FORALL indice IN 1..employee_id_table.COUNT  -- FOR ALL empacota todos os UPDATES e envia o pacote em 1 única troca de contexto (Context Switch)
    UPDATE employees e
    SET    e.salary = e.salary * (1 + ppercentual / 100)
    WHERE  e.employee_id = employee_id_table(indice); 
	
END;

-- Consultando

SELECT *
FROM employees;

--- Executando PRC_UPDATE_TAX 

exec PRC_UPDATE_SALARY(10)

-- Consultando

SELECT *
FROM employees;

ROLLBACK;

--88 Bulk Collect com Limit
--

SELECT COUNT(*)
FROM employees;

SET SERVEROUTPUT ON
SET VERIFY OFF
CREATE OR REPLACE PROCEDURE PRC_UPDATE_SALARY2
  (ppercentual IN NUMBER)
AS
  vLimit CONSTANT INTEGER(2) := 30;
  TYPE employee_id_table_type IS TABLE OF employees.employee_id%TYPE 
  INDEX BY BINARY_INTEGER;  -- Type Associative Array
  employee_id_table  employee_id_table_type;
  CURSOR employees_cursor IS
    SELECT employee_id 
    FROM employees;
BEGIN

  OPEN employees_cursor;
  
  LOOP
    FETCH employees_cursor 
    BULK COLLECT INTO employee_id_table LIMIT vlimit;
    
    EXIT WHEN employee_id_table.COUNT = 0;
    
    DBMS_OUTPUT.PUT_LINE('Linhas recuperadas: ' || employee_id_table.COUNT);
    
    FORALL indice IN 1..employee_id_table.COUNT 
      
      UPDATE employees e
      SET    e.salary = e.salary * (1 + ppercentual / 100)
      WHERE  e.employee_id = employee_id_table(indice);  
    
  END LOOP;
  
  CLOSE employees_cursor;
  -- COMMIT;
  
END;

SELECT *
FROM employees;

--- Executando PRC_UPDATE_SALARY2 

exec PRC_UPDATE_SALARY2(10)

-- Consultando

SELECT *
FROM employees;

ROLLBACK;


--89 SQL Dinâmico -
--Execute Immediate

SET SERVEROUTPUT ON
SET VERIFY OFF 
CREATE OR REPLACE PROCEDURE PRC_FETCH_EMPLOEES_DYNAMIC
    (pmanager_id      IN employees.manager_id%type DEFAULT NULL,
     pdepartment_id   IN employees.department_id%TYPE DEFAULT NULL)
AS
    vemployees_record   employees%ROWTYPE;
    vsql                VARCHAR2(600) := ' SELECT *
                                           FROM employees
                                           WHERE 1=1 ';
                                           
    TYPE employees_table_type  IS TABLE OF employees%rowtype
    INDEX BY PLS_INTEGER;
    employees_table   employees_table_type;
BEGIN
    IF pmanager_id IS NOT NULL THEN
        vsql := vsql || ' AND manager_id = ' || pmanager_id;
    END IF;
    
    IF pdepartment_id IS NOT NULL THEN
        vsql := vsql  || ' AND department_id = ' || pdepartment_id;
    END IF;
    
    DBMS_OUTPUT.PUT_LINE(vsql);
    
    EXECUTE IMMEDIATE vsql
    BULK COLLECT INTO employees_table;
    
    FOR i IN 1..employees_table.COUNT LOOP

        DBMS_OUTPUT.PUT_LINE(
            employees_table(i).employee_id  || ' - ' ||
            employees_table(i).first_name   || ' - ' ||
            employees_table(i).last_name    || ' - ' ||
            employees_table(i).email        || ' - ' ||
            employees_table(i).manager_id   || ' - ' ||
            employees_table(i).department_id
        );

    END LOOP;
EXCEPTION
    WHEN OTHERS THEN
        RAISE_APPLICATION_ERROR(-20001,'Erro Oracle '|| SQLCODE || SQLERRM);
END;

--Executando a procedure

EXEC PRC_FETCH_EMPLOEES_DYNAMIC(pmanager_id => 103, pdepartment_id => 60)

EXEC PRC_FETCH_EMPLOEES_DYNAMIC(pmanager_id => 103)

EXEC PRC_FETCH_EMPLOEES_DYNAMIC(pdepartment_id => 60)


--- Alterando a senha de um usuário de banco de dados 

ALTER USER HR PASSWORD EXPIRE;
ALTER USER HR IDENTIFIED BY xyz123;


-- 90 - SQL Dinamico - Execute Immediate e váriaveis Bind
--

-- SQL Dinamico - EXECUTE IMMEDIATE e variáveis Bind


SET SERVEROUTPUT ON
SET VERIFY OFF
CREATE OR REPLACE PROCEDURE PRC_FETCH_EMPLOYEES_DYNAMIC_BIND
  (pmanager_id         IN employees.manager_id%TYPE DEFAULT NULL,
   pdepartment_id      IN employees.department_id%TYPE DEFAULT NULL)
AS
  vemployees_record  employees%ROWTYPE;
  vsql               VARCHAR2(600) := 'SELECT *
                                       FROM employees
                                       WHERE 1=1 ';
  TYPE  employees_table_type IS TABLE OF employees%ROWTYPE   -- Associative Array
  INDEX BY PLS_INTEGER;
  employees_table            employees_table_type;
  
BEGIN

  IF  pmanager_id IS NOT NULL THEN
      vsql := vsql || ' AND manager_id = :manager_id';
  END IF;
  
  IF  pdepartment_id IS NOT NULL THEN
      vsql := vsql || ' AND department_id = :department_id';
  END IF;
  
  DBMS_OUTPUT.PUT_LINE(vsql);
  
  CASE
    WHEN pmanager_id IS NOT NULL AND pdepartment_id IS NOT NULL THEN
         EXECUTE IMMEDIATE vsql BULK COLLECT INTO employees_table USING pmanager_id, pdepartment_id;
    WHEN pmanager_id IS NOT NULL AND pdepartment_id is NULL THEN
         EXECUTE IMMEDIATE vsql BULK COLLECT INTO employees_table USING pmanager_id;
    WHEN pmanager_id IS NULL AND pdepartment_id IS NOT NULL THEN
         EXECUTE IMMEDIATE vsql BULK COLLECT INTO employees_table USING pdepartment_id;
    ELSE
         EXECUTE IMMEDIATE vsql BULK COLLECT INTO employees_table;
  END CASE;    
  
  FOR i IN 1..employees_table.COUNT  LOOP
  
    DBMS_OUTPUT.PUT_LINE(employees_table(i).employee_id || ' - ' ||
                         employees_table(i).first_name || ' - ' ||
                         employees_table(i).last_name || ' - ' ||
                         employees_table(i).email || ' - ' ||
                         employees_table(i).manager_id || ' - ' ||
                         employees_table(i).department_id);
    
  END LOOP;
  
EXCEPTION
  WHEN OTHERS THEN 
       RAISE_APPLICATION_ERROR(-20001,'Erro Oracle ' || SQLCODE || SQLERRM);
END;

-- Executando a procedure

exec PRC_FETCH_EMPLOYEES_DYNAMIC_BIND(pmanager_id => 103, pdepartment_id => 60)

exec PRC_FETCH_EMPLOYEES_DYNAMIC_BIND(pmanager_id => 103)

exec PRC_FETCH_EMPLOYEES_DYNAMIC_BIND(pdepartment_id => 60)

exec PRC_FETCH_EMPLOYEES_DYNAMIC_BIND;


-------------------------------------------------------------
---------------------


--
-- Oracle PL/SQL Avançado 
--
-- Seção 27 - SQL Dinâmico -  DBMS_SQL

-- Aula 1 - SQL Dinamico - DBMS_SQL

-- SQL Dinamico - DBMS_SQL

-- Comando DML

SET SERVEROUTPUT ON
SET VERIFY OFF
CREATE OR REPLACE PROCEDURE PRC_UPDATE_SALARY_EMPLOYEE
  (pemployee_id        IN employees.employee_id%TYPE,
   ppercentual         IN NUMBER)
IS
  vcursor_id       INTEGER;
  vrows_processed  INTEGER;
BEGIN

  -- OPEN Cursor
  vcursor_id  := DBMS_SQL.OPEN_CURSOR;
  
  -- Parsing comando SQL
  DBMS_SQL.PARSE(vcursor_id, 'UPDATE employees
                              SET    salary = salary * (1 + (:gpercentual/100))
                              WHERE  employee_id = :gemployee_id', DBMS_SQL.NATIVE);

  -- Binding Variáveis
  DBMS_SQL.BIND_VARIABLE(vcursor_id, ':gpercentual', ppercentual);
  DBMS_SQL.BIND_VARIABLE(vcursor_id, ':gemployee_id', pemployee_id);
  
  -- Executando o Cursor
  vrows_processed := DBMS_SQL.EXECUTE(vcursor_id);
  
  -- CLOSE Cursor
  DBMS_SQL.CLOSE_CURSOR(vcursor_id);
   
  --COMMIT;
  
EXCEPTION
   WHEN OTHERS THEN 
       RAISE_APPLICATION_ERROR(-20001,'Erro Oracle ' || SQLCODE || SQLERRM);
END;

-- Executando a procedure

SELECT *
FROM   employees;

exec PRC_UPDATE_SALARY_EMPLOYEE(pemployee_id => 109, ppercentual => 10)

SELECT *
FROM   employees;

ROLLBACK;		

-- SQL Dinamico - DBMS_SQL

-- Comando SELECT

SET SERVEROUTPUT ON
SET VERIFY OFF
DECLARE

  vcursor_id   INTEGER;
  vrowcount    NUMBER;
  vfirst_name  VARCHAR2(30);
  vlast_name   VARCHAR2(30);

BEGIN

  vcursor_id  :=  DBMS_SQL.OPEN_CURSOR;

  DBMS_SQL.PARSE(vcursor_id,'SELECT first_name,last_name FROM employees', DBMS_SQL.NATIVE);

  DBMS_SQL.DEFINE_COLUMN(vcursor_id,1,vfirst_name,30);

  DBMS_SQL.DEFINE_COLUMN(vcursor_id,2,vlast_name,30);

  vrowcount := DBMS_SQL.EXECUTE_AND_FETCH(vcursor_id);

  LOOP

    EXIT WHEN DBMS_SQL.FETCH_ROWS(vcursor_id) = 0;

    DBMS_SQL.COLUMN_VALUE(vcursor_id,1,vfirst_name);

    DBMS_SQL.COLUMN_VALUE(vcursor_id,2,vlast_name);

    DBMS_OUTPUT.PUT_LINE(vlast_name||', '||vfirst_name);

   END LOOP;

   DBMS_SQL.CLOSE_CURSOR(vcursor_id);

END;


-----------------------------------------------------------
--
-- Oracle PL/SQL Avançado 
--
-- Seção 28 - Cursor Explícito com SQL Dinâmico
--
-- Aula 1 - Cursor Explícito com SQL Dinâmico

-- SQL Dinamico com Cursor

SET SERVEROUTPUT ON
SET VERIFY OFF
CREATE OR REPLACE PROCEDURE PRC_FETCH_EMPLOYEES_CURSOR_DYNAMIC
  (pmanager_id         IN employees.manager_id%TYPE DEFAULT NULL,
   pdepartment_id      IN employees.department_id%TYPE DEFAULT NULL)
AS
  TYPE employees_cursor_type IS REF CURSOR;
  employees_cursor           employees_cursor_type;
  vemployees_record          employees%ROWTYPE;
  vsql                       VARCHAR2(600) := 'SELECT *
                                               FROM employees
                                               WHERE 1=1 ';
BEGIN
  IF  pmanager_id IS NOT NULL THEN
      vsql := vsql || ' AND manager_id = :manager_id';
  END IF;
  IF  pdepartment_id IS NOT NULL THEN
      vsql := vsql || ' AND department_id = :department_id';
  END IF;
  
  DBMS_OUTPUT.PUT_LINE(vsql);
  
  CASE
    WHEN pmanager_id IS NOT NULL AND pdepartment_id IS NOT NULL THEN
         OPEN employees_cursor FOR vsql USING pmanager_id, pdepartment_id;
    WHEN pmanager_id IS NOT NULL AND pdepartment_id is NULL THEN
         OPEN employees_cursor FOR vsql USING pmanager_id;
    WHEN pmanager_id IS NULL AND pdepartment_id IS NOT NULL THEN
         OPEN employees_cursor FOR vsql USING pdepartment_id;
    ELSE
         OPEN employees_cursor FOR vsql;
  END CASE;  
  
  LOOP
    FETCH  employees_cursor
    INTO   vemployees_record;
    
    EXIT WHEN employees_cursor%NOTFOUND;
    
    DBMS_OUTPUT.PUT_LINE(vemployees_record.employee_id || ' - ' ||
                         vemployees_record.first_name || ' - ' ||
                         vemployees_record.last_name || ' - ' ||
                         vemployees_record.email || ' - ' ||
                         vemployees_record.manager_id || ' - ' ||
                         vemployees_record.department_id);
    
  END LOOP;
  
  CLOSE employees_cursor;
  
EXCEPTION
   WHEN OTHERS THEN 
       RAISE_APPLICATION_ERROR(-20001,'Erro Oracle ' || SQLCODE || SQLERRM);
END;

-- Executando a procedure

exec PRC_FETCH_EMPLOYEES_CURSOR_DYNAMIC(pmanager_id => 103, pdepartment_id => 60);

exec PRC_FETCH_EMPLOYEES_CURSOR_DYNAMIC(pmanager_id => 103);

exec PRC_FETCH_EMPLOYEES_CURSOR_DYNAMIC(pdepartment_id => 60);

exec PRC_FETCH_EMPLOYEES_CURSOR_DYNAMIC;
	  

