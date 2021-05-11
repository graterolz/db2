-- Retorna 10 Registros
SELECT * FROM LIB.FILE FECTH FIRST 10 ROWS ONLY;

-- Multimiembros IB
SELECT 	diobli,
		diobnm,
		diobtp,
		diobsz SizeKB,
		CAST((Sum(diobsz)/(power(1024,3))) as int) SizeGB
FROM QUSRSYS.QAEZDISK
WHERE diobli = 'QUSRSYS'
AND diobnm LIKE '%E2%'
GROUP BY diobli,diobnm,diobtp,diobsz
ORDER BY 4 DESC

-- Top librerias SYSBAS - IBS/IB
SELECT	diobli,
		SUM(diobsz) SizeKB,
		CAST((Sum(diobsz)/(power(1024,3))) as int) SizeGB
FROM QUSRSYS.QAEZDISK
WHERE diobli<>' ' 
AND DIOBAS='00001'
GROUP BY diobli
ORDER BY 2 DESC

-- Top librerias IASP - IBS/IB
SELECT 	diobli,
		SUM(diobsz) SizeKB,
		CAST((Sum(diobsz)/(power(1024,3))) as int) SizeGB
FROM ADMONBD.QPIB151115 
WHERE diobli<>' '
AND DIOBAS='00033'
GROUP BY diobli
ORDER BY 2 DESC