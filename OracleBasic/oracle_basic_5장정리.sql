/*
    5�� ���� => ���α׷�
    
    = ����Ŭ ���� ���α׷�
       = �������α׷��� ������ �� �ִ� ��� => PL/SQL => ������ PL / ����� SQL
         PL => ���α׷� ���
                ----------
                  ����
                  ������
                  ���
                   ���ǹ� THEN
                   ó������
                   END IF;
                   ---------------------
                   IF ���ǹ� THEN
                     ó������
                    ELSIF ���ǹ� THEN
                         ó������
                    ELSIF ���ǹ� THEN
                         ó������
                    ELSIF ���ǹ� THEN
                         ó������
                    ELS ���ǹ� THEN
                         ó������
                    END IF;
                ---------------------------
                �ݺ���
                    FOR ������ IN lo..hi LOOP
                        ó������
                    END LOOP;
                    
                    FOR ������ IN cursor�� LOOP
                        ó������
                    END LOOP;
                  ------javaScript
                  �ڹ�
                    �������� ������ =��
                    int a=10;
                  ����Ŭ
                    ������ ��������:=��
                    name VARFHAR(20):=' ' => ��Į�󺯼�
                    %TYPE : �ش� ���̺��� �÷����� ���� �������� �б�
                    %ROWTYPE : ���̺� ��ü �÷��� ���� ��������
                    RECORD : ����� ����, �ʿ��� �÷� ����
                    CURSOR : ��� => SELECT ���忡�� ����� �����͸� �����մ�
                  �ڹٽ�ũ��Ʈ
                    �ڵ��������� ������=��;
                    let a=10; // a:NUMBER
                    let a='aaa'; a:String
                    let a=10.0; a:Number
                    let a=[]; a:Array
                    let a=(); a:Object => *** JSON (Vue, Ajax, React_
       = ���ν���
        CREATE [OR REPLACE] PROCEDURE pro_name(
            �Ű�����
        )
        IS|AS
            ��������
        BEGIN
            ����
        END;
        /
       = �Լ�
       CREATE [OR REPLACE] FUNCTION func_name(
            �Ű�����
        ) RETURN ��������
        IS|AS
            ��������
        BEGIN
            ����
            RETURN ��
        END;
        /
       = Ʈ����
        CREATE [OR REPLACE] TRIGGER tri_name
        AFTER|BEFORE (INSERT|UPDATE|DELETE) ON table_name
        FOR EACH ROW
        DECLARE
            �������� ����
        BEGIN
          �ڵ�ó�� ����
        END;
        /
    = �ڹٿ��� ���α׷�
        ===== �ڹ� �ڵ�
             --------------------------------
              1) �ѹ� ���� : *** ������
              2) �ݺ� ����
              3) �Ѱ��� ��� => ����
             -------------------------------- �޼ҵ�ȭ ó�� (������ ���α׷�, ������, ����ó��, �ܶ�)
        1. ����Ŭ ����Ǵ� ����
           1) ����̹� ��� : �ѹ��� ���� => ������
              Class.forName(����̹���) com.mysql.cj.Driver
           2) ����Ŭ ���� : ��û�ø��� �ڵ� -> �޼ҵ�ȭ ó�� (�ݺ�) => getConnection()
              conn=DriverManager.getConnection(URL,USER,PWD)
           3) SQL���� ����
             => DML, DQL
             => ������ ���� ���� => VIEW
             => ���� => INDEX => ORDER BY ASC (INDEX_ASC()), ORDER BY DESC (INDEX_DESC())
             => �ݺ��� ���� SQL => ���ν���
             => �ٸ� ���̺��� ������ �䱸 => Ʈ����
             => ����¡ ��� => �ζ��κ� 
             => ����ȭ => ���̺��� ���� �������� (JOIN)
           4) SQL���� ����
              ps=conn.preparedStatement(sql);
           5) SQL�� ����Ŭ���� ���� �Ŀ� ������� ������ �´�
              ResultSet rs=ps.executeQuery();
              ResultSet ����
              SELECT empno, ename, job FROM emp;
              ------------------------------------------
                empno        ename        job
              ------------------------------------------
                              BOF
              ------------------------------------------
                11111          hong       ������  | next()  => ���� ��ü �б�
                -----         ------      ------
                getInt(1)    getString(2) getString(3)
              ------------------------------------------
                22222          shim       ���ߺ�
              ------------------------------------------
                33333          park       �ѹ���  | previous()
              ------------------------------------------
                               EOF => Ŀ���� ��ġ
              ------------------------------------------
                   getInt(), getString(), getDouble, getDate()
           6) VO, ArrayList�� ��Ƶд�
           7) ����Ŭ �ݱ� => ��û�ø��� �ڵ� => �޼ҵ�ȭ ó��(�ݺ�) => disConnection()
        2. ���� �ľ�
        3. Ŭ������ �޼ҵ�
    = �� ���� ���α׷� (�� ���α׷���)
        1. ����Ŭ SQL���� ====> DAO
        2. ����Ŭ ������ ��Ī ===> VO
        3. JSP  => JAVA Server Page
        4. HTML/CSS
*/