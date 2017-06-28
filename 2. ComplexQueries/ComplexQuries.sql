SELECT nazwisko, (SUBSTR(etat,1,2)||ID_PRAC) as KOD 
FROM pracownicy;


SELECT nazwisko, 
TRANSLATE(nazwisko,'KkLlMm','XXXXXX') AS wojna_literom 
FROM pracownicy ORDER BY wojna_literom;


SELECT nazwisko 
FROM pracownicy 
WHERE INSTR(UPPER(SUBSTR(nazwisko,1, LENGTH(nazwisko)/2)),'L',1,1) > 0;


SELECT nazwisko, 
CEIL((placa_pod + (placa_pod*0.15))) AS podwyzka 
FROM pracownicy;


SELECT nazwisko, placa_pod, (placa_pod * 0.2) AS inwestycja, 
ROUND(((placa_pod * 0.2)*POWER((1+(0.1/1)),10)),2) AS kapital,
(ROUND(((placa_pod * 0.2)*POWER((1+(0.1/1)),10)),2)-(placa_pod * 0.2)) AS zysk
FROM pracownicy;


SELECT nazwisko, zatrudniony, 
FLOOR((TRUNC(MONTHS_BETWEEN('2000-01-01', zatrudniony)))/12) AS staz 
FROM pracownicy ORDER BY staz DESC;


SELECT nazwisko, 
TO_CHAR(zatrudniony, 'MONTH, DD YYYY') AS data_zatrudnienia 
FROM pracownicy WHERE id_zesp = '20';


SELECT TO_CHAR(SYSDATE, 'DAY') AS dzis FROM DUAL;


SELECT nazwa, adres, 
CASE WHEN adres LIKE 'Strzelecka%' OR adres LIKE 'Mielzynskiego%' 
		THEN 'stare miasto' WHEN adres LIKE 'Piotrowo%' 
		THEN 'nowe miasto' ELSE 'Solacz' END AS dzielnica
FROM zespoly;


SELECT nazwisko, placa_pod, 
CASE 
	WHEN placa_pod < '1590' THEN 'Poni¿ej 1590 z³'
	WHEN placa_pod = '1590' THEN 'Dok³adnie 1590 z³'
	ELSE 'Powy¿ej 1590 z³' END AS próg
FROM pracownicy;


SELECT etat 
FROM pracownicy 
WHERE EXTRACT ( YEAR FROM zatrudniony) IN ('1992') 
	INTERSECT 
SELECT etat 
FROM pracownicy 
WHERE EXTRACT ( YEAR FROM zatrudniony) IN ('1993');


SELECT id_zesp 
FROM zespoly 
	MINUS 
SELECT id_zesp 
FROM pracownicy;


SELECT nazwisko, placa_pod, 'Powy¿ej 1590 z³' AS prog 
FROM pracownicy WHERE placa_pod > '1590' 
	UNION  
SELECT nazwisko, placa_pod, 'Dok³adnie 1590 z³' AS prog 
FROM pracownicy 
WHERE placa_pod = '1590' 
	UNION 
SELECT nazwisko, placa_pod, 'Poni¿ej 1590 z³' AS prog 
FROM pracownicy WHERE placa_pod < '1590' 
	ORDER BY placa_pod DESC;


