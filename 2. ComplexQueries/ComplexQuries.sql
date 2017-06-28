SELECT  nazwa, cena
FROM	produkty
WHERE	cena > (SELECT  AVG(cena)
FROM	produkty);