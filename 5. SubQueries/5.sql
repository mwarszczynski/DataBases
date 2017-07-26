
--1--
select nazwisko,etat from pracownicy where id_zesp = (select id_zesp from pracownicy where nazwisko = 'Nowak')order by nazwisko;
--2--
select nazwisko,etat,zatrudniony from pracownicy where zatrudniony = (select max(zatrudniony) from pracownicy where etat = 'PROFESOR') AND etat = 'PROFESOR';
--3--
select nazwisko,zatrudniony,id_zesp from pracownicy where (id_zesp, zatrudniony) in (select id_zesp, MAX(zatrudniony) from pracownicy where id_zesp is not null group by id_zesp) order by zatrudniony asc;
--4--
select * from zespoly where id_zesp != ALL(select distinct id_zesp from pracownicy where id_zesp is not null);
--5--
select p.nazwisko, p.placa_pod, p.etat from pracownicy p where placa_pod>(select avg(placa_pod) from pracownicy where etat=p.etat);
--6--
select p.nazwisko, p.placa_pod from pracownicy p where placa_pod>0.75*(select placa_pod from pracownicy where id_prac=p.id_szefa) order by nazwisko;
--7--
select p.nazwisko from pracownicy p where etat='PROFESOR' AND p.id_prac <> all (select id_szefa from pracownicy where etat='DOKTORANT'); 
--8--
select z.id_zesp, z.nazwa, z.adres from zespoly z where not exists (select nazwisko from pracownicy where id_zesp=z.id_zesp);
--9--
select id_zesp, sum(placa_pod) from pracownicy group by id_zesp having sum(placa_pod)=(select max(sum(placa_pod)) from pracownicy group by id_zesp);
--10--
select p.nazwisko, p.placa_pod from pracownicy p where (select count(*) from pracownicy where placa_pod>p.placa_pod)<3 order by placa_pod desc;
--11--
select distinct extract(year from p.zatrudniony) as rok, count(nazwisko)as liczba from pracownicy p group by extract(year from p.zatrudniony) order by count(nazwisko) desc,  extract(year from p.zatrudniony) asc;
--12--
select distinct extract(year from p.zatrudniony) as rok, count(nazwisko) as liczba from pracownicy p group by extract(year from p.zatrudniony) having (select max(count(nazwisko)) from pracownicy group by extract(year from zatrudniony))=count(nazwisko);
--13--
select p.nazwisko,p.placa_pod, p.etat from pracownicy p, zespoly z where p.id_zesp=z.id_zesp and placa_pod<(select avg(placa_pod) from pracownicy where etat=p.etat) order by nazwisko;
--14--
select p.nazwisko,p.placa_pod, p.etat, z.nazwa, (select avg(placa_pod) from pracownicy where etat=p.etat) as srednia from pracownicy p, zespoly z where p.id_zesp=z.id_zesp and placa_pod<(select avg(placa_pod) from pracownicy where etat=p.etat) order by nazwisko;
--15--
SELECT NAZWISKO,(SELECT COUNT(*) FROM Pracownicy WHERE ID_SZEFA = p.ID_PRAC) AS PODWLADNI FROM Pracownicy p JOIN Zespoly z ON p.ID_ZESP = z.ID_ZESP WHERE etat = 'PROFESOR' AND adres LIKE 'PIOTROWO%' ORDER BY PODWLADNI desc; 
--16--
SELECT NAZWISKO, trunc((SELECT AVG(PLACA_POD) FROM Pracownicy WHERE ID_ZESP = p.ID_ZESP), 2) AS SREDNIA, (SELECT MAX(PLACA_POD) FROM Pracownicy) AS MAKSYMALNA FROM Pracownicy p WHERE ETAT = 'PROFESOR' ORDER BY NAZWISKO;
--17--
select nazwisko, (select nazwa from zespoly where id_zesp = p.id_zesp) as zespol from pracownicy p order by nazwisko;