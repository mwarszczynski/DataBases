SELECT MIN(placa_pod) AS minimum, 
	   MAX(placa_pod) AS maksimum, 
	  (MAX(placa_pod) - MIN(placa_pod)) AS roznica 
FROM pracownicy;


SELECT etat, AVG(placa_pod) AS srednia 
FROM pracownicy 
GROUP BY etat 
ORDER BY AVG(placa_pod) 
DESC;


SELECT COUNT(*) AS profesorowie 
FROM pracownicy 
WHERE etat = 'PROFESOR';


SELECT COUNT(*) AS bez_zespolu 
FROM pracownicy
WHERE id_zesp IS NULL;


SELECT id_zesp, (SUM(placa_pod)+SUM(placa_dod)) AS sumaryczne_place, COUNT(*) AS liczba_pracownikow 
FROM pracownicy 
GROUP BY id_zesp 
ORDER BY id_zesp;


SELECT id_szefa, MIN(placa_pod) AS minimalna 
FROM pracownicy 
GROUP BY id_szefa 
ORDER BY MIN(placa_pod)DESC;


SELECT id_zesp,COUNT(*) AS ilu_pracuje 
FROM pracownicy 
GROUP BY ID_ZESP 
HAVING COUNT(*) > 2 
ORDER BY COUNT(*) DESC;


SELECT etat, AVG(placa_pod) AS srednia, COUNT(*) AS liczba 
FROM pracownicy 
WHERE zatrudniony < DATE '1990-01-01' 
GROUP BY etat;