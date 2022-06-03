USE [DADOSADVP12]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

DECLARE @tableHTML  NVARCHAR(MAX) 
BEGIN
            SET @tableHTML = 
                N'	<head> '+
                N'<style>*{font-family:Helvetica;font-size:10pt}.main{width:100%;margin:0 auto}.main .section{height:auto;border-radius:10px;border-width:1px;position:relative;padding:20px;background-color:#fcfcfd;box-shadow:0 2px 10px rgba(0,0,0,.3)}.venda{background-color:#cececf}.main .section .table{width:100%;height:auto}.table thead{background-color:#008b8b;color:#fff;font-weight:100}.table th{font-size:.7em;padding:5px;text-transform:uppercase}.table td{border-bottom:1px dotted #d3d3d3}.center{text-align:center}.right{text-align:right}.left{text-align:left}.ok{background-color:#90ee90;color:green}.nok{background-color:#f08080;color:#fff}.header{position:relative;padding:20px;margin:20px 0;border-radius:10px;border:1px dotted #d3d3d3;padding:15px;background-color:#d3d3d3}.header span{font-weight:bolder}</style>'+
                N'</head> '+
                N'<body>'+
                N'<div class="main">'+
                N'<h1>WORKFLOW TOTVS QUEIROZ - COBERTURA DE ESTOQUE MENOR DE 10 DIAS</h1>' +
                N'<div class="section venda">'+
                N'<table class="table">' +
                N'<thead>'+
                N'<th>CODIGO</th>' +
                N'<th>DECRICAO</th>' +
                N'<th>SALDO</th>' +
                N'<th>SALDO 10</th>' +
                N'<th>SALDO 02</th>' + 
                N'<th>SALDO 11</th>'  +
                N'<th>VENDA </th>'  +
                N'<th>COBERTURA </th>'  +
                N'</thead>'+
                N'<tbody>'+
                CAST ( ( SELECT 
                            "td/@align" = 'Center', td =    B1_COD,     '',
                            "td/@align" = 'left'  , td =    B1_DESC,    '',
                            "td/@align" = 'right', td =    Format(SALDO, 'N', 'pt-br'),      '',
                            "td/@align" = 'right', td =    Format(SALDO_10, 'N', 'pt-br'),   '',
                            "td/@align" = 'right', td =    Format(SALDO_02, 'N', 'pt-br'),   '',
                            "td/@align" = 'right', td =    Format(SALDO_11, 'N', 'pt-br'),   '',
                            "td/@align" = 'right', td =    Format(VENDA, 'N', 'pt-br'),      '',
                            "td/@align" = 'right', td =    Format(IIF(VENDA>0,SALDO_10/VENDA*10,999) , 'N', 'pt-br')
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
                        FOR XML PATH('tr'), TYPE 
                ) AS NVARCHAR(MAX) ) +
                N'</tbody>'+
                N'</table>'+
                N'</div>'+
                N'</div>'+
                N'</body>'

EXEC msdb.dbo.sp_send_dbmail 
@profile_name = 'suporte',
@recipients='edson.sales@comercialqueiroz.com.br' ,
    @subject = 'WORKFLOW TOTVS QUEIROZ - COBERTURA DE ESTOQUE MENOR DE 10 DIAS',
    @body = @tableHTML,
    @body_format = 'HTML' ;
END