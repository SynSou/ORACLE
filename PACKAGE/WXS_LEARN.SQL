CREATE OR REPLACE PACKAGE                 WXS_LEARN AS
---------------------------------------------
--公開やつ宣言
---------------------------------------------
FUNCTION INSERT_TEST(
PI_SEQ IN TW_LLLLLLLLLLLLLL.UPD_SEQ%TYPE
) RETURN NUMBER;
---------------------------------------------
--グローバル変数宣言
---------------------------------------------
numRec NUMBER;
END WXS_LEARN;
/
