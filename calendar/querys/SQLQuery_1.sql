SELECT
    B1_COD,
    B1_DESC,
    SALDO,
    SALDO_10,
    SALDO_02,
    SALDO_11,
    VENDA,
    IIF(VENDA>0,SALDO_10/VENDA*10,999)
FROM (
    SELECT 
        B.B1_COD,
        B.B1_DESC,
        SUM(A.B2_QATU) SALDO,
        SUM(IIF(A.B2_LOCAL='10',A.B2_QATU,0)) SALDO_10,
        SUM(IIF(A.B2_LOCAL='02',A.B2_QATU,0)) SALDO_02,
        SUM(IIF(A.B2_LOCAL='11',A.B2_QATU,0)) SALDO_11,
        ISNULL((SELECT SUM(C.D2_QUANT)
                FROM  SD2010 C (NOLOCK) 
                WHERE   C.D_E_L_E_T_='' 
                        AND A.B2_FILIAL='15' 
                        AND  C.D2_LOCAL='10'  
                        AND C.D2_COD=A.B2_COD 
                        AND D2_EMISSAO > GETDATE()-11),0) AS VENDA
    FROM SB2010 A (NOLOCK)
    INNER JOIN SB1010 B (NOLOCK) ON B.D_E_L_E_T_=''  AND  B.B1_COD=A.B2_COD
    WHERE   A.D_E_L_E_T_='' 
            AND A.B2_FILIAL='15' 
            AND  A.B2_LOCAL IN ('10','02','11')
            AND A.B2_QATU>0
    GROUP BY B.B1_COD,B.B1_DESC,A.B2_COD,A.B2_FILIAL ) AS T
WHERE   SALDO_02+SALDO_11 > 0 
       AND IIF(VENDA>0,SALDO_10/VENDA*10,999) < 15
ORDER BY B1_COD