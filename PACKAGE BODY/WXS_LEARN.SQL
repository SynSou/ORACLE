CREATE OR REPLACE PACKAGE BODY                 WXS_LEARN
AS
FUNCTION INSERT_TEST(
PI_SEQ IN TW_LLLLLLLLLLLLLL.UPD_SEQ%TYPE
) RETURN NUMBER
IS
           varNowDT varchar2(14);
           rowTEMP  TW_LLLLLLLLLLLLLL%ROWTYPE;
           varSQL   varchar2(1000);
BEGIN
        ------------------------------------------------------------------------
        DBMS_OUTPUT.PUT_LINE(1);
	rowTEMP.UPD_SEQ  := PI_SEQ;
	rowTEMP.USER_CD  := '1';
	rowTEMP.HOUSE_CD := '2';
	rowTEMP.LOC_A    := '3';
	rowTEMP.LOC_H    := '4';
        ------------------------------------------------------------------------
        BEGIN
        INSERT INTO TW_LLLLLLLLLLLLLL VALUES rowTEMP;
        EXCEPTION 
               WHEN DUP_VAL_ON_INDEX THEN
                       UPDATE TW_LLLLLLLLLLLLLL
                       SET  ROW = rowTEMP
                       WHERE UPD_SEQ = rowTEMP.UPD_SEQ;
                       COMMIT;
                       RETURN 1;
               WHEN OTHERS THEN
                    NULL;
        END;
        DBMS_OUTPUT.PUT_LINE(2);
	rowTEMP.USER_CD  := '1';
	rowTEMP.HOUSE_CD := '2';
	rowTEMP.LOC_A    := '33';
	rowTEMP.LOC_H    := '4';
        ------------------------------------------------------------------------
        DBMS_OUTPUT.PUT_LINE(3);
        varSQL := ' UPDATE TW_LLLLLLLLLLLLLL '   ||
                  ' SET HOUSE_CD = :1  '         ||
                  ' WHERE UPD_SEQ = :2 ';
        ------------------------------------------------------------------------
	EXECUTE IMMEDIATE varSQL USING
				 9
				,rowTEMP.UPD_SEQ;
        ------------------------------------------------------------------------
        DBMS_OUTPUT.PUT_LINE(varSQL);
        ------------------------------------------------------------------------
	rowTEMP.USER_CD  := '1';
	rowTEMP.HOUSE_CD := '222';
	rowTEMP.LOC_A    := '332';
	rowTEMP.LOC_H    := '444';
        UPDATE TW_LLLLLLLLLLLLLL
        SET  ROW = rowTEMP
        WHERE UPD_SEQ = rowTEMP.UPD_SEQ;
        ------------------------------------------------------------------------
        COMMIT;
        ------------------------------------------------------------------------
        DBMS_OUTPUT.PUT_LINE('OK');
        RETURN 0;
EXCEPTION
    WHEN OTHERS THEN
    ROLLBACK;
    dbms_output.put_line('-- デバッグメッセージ --');
    dbms_output.put_line('SQL コード = ' || sqlcode);
    dbms_output.put_line('エラー内容 = ' || sqlerrm(sqlcode));
    RETURN 100;
END INSERT_TEST;
END WXS_LEARN;
/
