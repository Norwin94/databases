CREATE TABLE Druzyna
(
ID_Druzyny NUMBER(2,0) PRIMARY KEY,
Nazwa_Druzyny VARCHAR2(32) NOT NULL,
Rok_Zalozenia NUMBER(4,0) CHECK (Rok_Zalozenia <= 2018 and Rok_Zalozenia>=1850));
commit;


CREATE TABLE Uzytkownik(
ID_Uzytkownika NUMBER(4,0) PRIMARY KEY,
ID_Druzyny NUMBER(2,0),
Imie VARCHAR2(16) NOT NULL,
Nazwisko VARCHAR2(32) NOT NULL,
Data_ur DATE,
Rodzaj VARCHAR2(10) NOT NULL CHECK (Rodzaj = 'Bramkarz' or Rodzaj = 'Obronca' or Rodzaj = 'Pomocnik' or Rodzaj = 'Napastnik' or Rodzaj = 'Sedzia'or Rodzaj = 'Uzytkownik'),
FOREIGN KEY (ID_Druzyny) REFERENCES Druzyna(ID_Druzyny));

CREATE TABLE Przebieg_meczu
(
ID_Meczu NUMBER(3,0) PRIMARY KEY,
ID_Uzytkownika NUMBER(4,0) NOT NULL,
Data DATE ,
    FOREIGN KEY  (ID_Uzytkownika) REFERENCES Uzytkownik(ID_Uzytkownika)
);

CREATE TABLE Mecze_Druzyny(
ID_Druzyny NUMBER(2,0) NOT NULL,
ID_Meczu NUMBER(3,0) NOT NULL,
Typ_Druzyny VARCHAR(10) NOT NULL CHECK (Typ_Druzyny like 'Gospodarz' or Typ_Druzyny like 'Gosc'),
Data DATE ,
    FOREIGN KEY  (ID_Druzyny) REFERENCES Druzyna(ID_Druzyny),
    FOREIGN KEY  (ID_Meczu) REFERENCES Przebieg_meczu(ID_Meczu));

CREATE TABLE Gol(
ID_Bramki NUMBER(4,0) PRIMARY KEY,
ID_Uzytkownika NUMBER(4,0) NOT NULL CHECK( ID_Uzytkownika > 2300),
ID_Meczu NUMBER(3,0) NOT NULL,
Minuta NUMBER(3,0) NOT NULL CHECK (Minuta < 100 and Minuta > 0),
    FOREIGN KEY (ID_Uzytkownika) REFERENCES Uzytkownik(ID_Uzytkownika),
    FOREIGN KEY (ID_Meczu) REFERENCES Przebieg_meczu(ID_Meczu));

CREATE TABLE Ocena(
ID_Oceny NUMBER(3,0) PRIMARY KEY,
ID_Uzytkownika NUMBER(4,0) NOT NULL,
ID_Meczu NUMBER(3,0) NOT NULL,
Ocena NUMBER(2,0) CHECK (Ocena <= 10 and Ocena > 0),
    FOREIGN KEY (ID_Uzytkownika) REFERENCES Uzytkownik(ID_Uzytkownika),
    FOREIGN KEY  (ID_Meczu) REFERENCES Przebieg_meczu(ID_Meczu));



Insert ALL
INTO DRUZYNA (ID_DRUZYNY,NAZWA_DRUZYNY,ROK_ZALOZENIA) values ('1','FC Barcelona','1899')
 into DRUZYNA (ID_DRUZYNY,NAZWA_DRUZYNY,ROK_ZALOZENIA) values ('2','Real Madryt','1902')
 into DRUZYNA (ID_DRUZYNY,NAZWA_DRUZYNY,ROK_ZALOZENIA) values ('3','Sevilla FC','1890')
 into DRUZYNA (ID_DRUZYNY,NAZWA_DRUZYNY,ROK_ZALOZENIA) values ('4','Valencia CF','1919')
 into DRUZYNA (ID_DRUZYNY,NAZWA_DRUZYNY,ROK_ZALOZENIA) values ('5','Villareal CF','1923')
 into DRUZYNA (ID_DRUZYNY,NAZWA_DRUZYNY,ROK_ZALOZENIA) values ('6','Atletico Madryt','1903')
 into DRUZYNA (ID_DRUZYNY,NAZWA_DRUZYNY,ROK_ZALOZENIA) values ('7','Atletic Bilbao','1898')
 into DRUZYNA (ID_DRUZYNY,NAZWA_DRUZYNY,ROK_ZALOZENIA) values ('8','Celta de Vigo','1923')
 into DRUZYNA (ID_DRUZYNY,NAZWA_DRUZYNY,ROK_ZALOZENIA) values ('9','Eibar','1940')
 into DRUZYNA (ID_DRUZYNY,NAZWA_DRUZYNY,ROK_ZALOZENIA) values ('10','Leganes','1928')
 SELECT * FROM DUAL;



INSERT ALL  --Barcelona
 into UZYTKOWNIK (ID_UZYTKOWNIKA,ID_DRUZYNY,IMIE,NAZWISKO,DATA_UR,RODZAJ) values ('2360','1','Jasper','Cillessen',to_date('89/04/22','RR/MM/DD'),'Bramkarz')
 into UZYTKOWNIK (ID_UZYTKOWNIKA,ID_DRUZYNY,IMIE,NAZWISKO,DATA_UR,RODZAJ) values ('2361','1','Marc-Andre','ter Stegen',to_date('92/04/30','RR/MM/DD'),'Bramkarz')
 into UZYTKOWNIK (ID_UZYTKOWNIKA,ID_DRUZYNY,IMIE,NAZWISKO,DATA_UR,RODZAJ) values ('2362','1','Jordi','Alba',to_date('89/03/21','RR/MM/DD'),'Obronca')
 into UZYTKOWNIK (ID_UZYTKOWNIKA,ID_DRUZYNY,IMIE,NAZWISKO,DATA_UR,RODZAJ) values ('2363','1','Samuel','Umtiti',to_date('93/11/14','RR/MM/DD'),'Obronca')
 into UZYTKOWNIK (ID_UZYTKOWNIKA,ID_DRUZYNY,IMIE,NAZWISKO,DATA_UR,RODZAJ) values ('2364','1','Aleix','Vidal',to_date('89/08/21','RR/MM/DD'),'Obronca')
 into UZYTKOWNIK (ID_UZYTKOWNIKA,ID_DRUZYNY,IMIE,NAZWISKO,DATA_UR,RODZAJ) values ('2365','1','Thomas','Vermalaen',to_date('85/11/14','RR/MM/DD'),'Obronca')
 into UZYTKOWNIK (ID_UZYTKOWNIKA,ID_DRUZYNY,IMIE,NAZWISKO,DATA_UR,RODZAJ) values ('2366','1','Gerard','Pique',to_date('87/02/02','RR/MM/DD'),'Obronca')
 into UZYTKOWNIK (ID_UZYTKOWNIKA,ID_DRUZYNY,IMIE,NAZWISKO,DATA_UR,RODZAJ) values ('2367','1','Jose','Paulinho',to_date('88/07/25','RR/MM/DD'),'Pomocnik')
 into UZYTKOWNIK (ID_UZYTKOWNIKA,ID_DRUZYNY,IMIE,NAZWISKO,DATA_UR,RODZAJ) values ('2368','1','Denis','Suarez',to_date('94/01/01','RR/MM/DD'),'Pomocnik')
 into UZYTKOWNIK (ID_UZYTKOWNIKA,ID_DRUZYNY,IMIE,NAZWISKO,DATA_UR,RODZAJ) values ('2369','1','Sergi','Roberto',to_date('92/02/07','RR/MM/DD'),'Pomocnik')
 into UZYTKOWNIK (ID_UZYTKOWNIKA,ID_DRUZYNY,IMIE,NAZWISKO,DATA_UR,RODZAJ) values ('2370','1','Ivan','Rakitic',to_date('88/03/10','RR/MM/DD'),'Pomocnik')
INTO Uzytkownik (ID_Uzytkownika, ID_Druzyny, Imie, Nazwisko, Data_ur, Rodzaj) VALUES (2371, 1, 'Ivan', 'Rakitic', '88/03/10', 'Pomocnik')
INTO Uzytkownik (ID_Uzytkownika, ID_Druzyny, Imie, Nazwisko, Data_ur, Rodzaj) VALUES (2372, 1, 'Philipe', 'Coutinho', '92/06/12', 'Pomocnik')
INTO Uzytkownik (ID_Uzytkownika, ID_Druzyny, Imie, Nazwisko, Data_ur, Rodzaj) VALUES (2373, 1, 'Sergio', 'Busquets', '88/07/16', 'Pomocnik')
INTO Uzytkownik (ID_Uzytkownika, ID_Druzyny, Imie, Nazwisko, Data_ur, Rodzaj) VALUES (2374, 1, 'Lionel', 'Messi', '87/06/24', 'Napastnik')
INTO Uzytkownik (ID_Uzytkownika, ID_Druzyny, Imie, Nazwisko, Data_ur, Rodzaj) VALUES (2375, 1, 'Luis', 'Suarez', '87/01/24', 'Napastnik')
INTO Uzytkownik (ID_Uzytkownika, ID_Druzyny, Imie, Nazwisko, Data_ur, Rodzaj) VALUES (2376, 1, 'Ousmane', 'Dembele', '97/05/15', 'Napastnik')
SELECT * FROM DUAL;


INSERT ALL   --Atlethic Bilbao  
 into UZYTKOWNIK (ID_UZYTKOWNIKA,ID_DRUZYNY,IMIE,NAZWISKO,DATA_UR,RODZAJ) values ('2377','7','Kepa','Arrizabalga',to_date('94/10/03','RR/MM/DD'),'Bramkarz')
 into UZYTKOWNIK (ID_UZYTKOWNIKA,ID_DRUZYNY,IMIE,NAZWISKO,DATA_UR,RODZAJ) values ('2378','7','Iago','Herrerin',to_date('88/06/12','RR/MM/DD'),'Bramkarz')
 into UZYTKOWNIK (ID_UZYTKOWNIKA,ID_DRUZYNY,IMIE,NAZWISKO,DATA_UR,RODZAJ) values ('2379','7','Enric','Saborit',to_date('93/07/16','RR/MM/DD'),'Obronca')
 into UZYTKOWNIK (ID_UZYTKOWNIKA,ID_DRUZYNY,IMIE,NAZWISKO,DATA_UR,RODZAJ) values ('2380','7','Ingino','Martinez',to_date('91/06/24','RR/MM/DD'),'Obronca')
 into UZYTKOWNIK (ID_UZYTKOWNIKA,ID_DRUZYNY,IMIE,NAZWISKO,DATA_UR,RODZAJ) values ('2381','7','Unai','Nunez',to_date('97/05/24','RR/MM/DD'),'Obronca')
 into UZYTKOWNIK (ID_UZYTKOWNIKA,ID_DRUZYNY,IMIE,NAZWISKO,DATA_UR,RODZAJ) values ('2382','7','Eray','Alvarez',to_date('95/05/24','RR/MM/DD'),'Obronca')
 into UZYTKOWNIK (ID_UZYTKOWNIKA,ID_DRUZYNY,IMIE,NAZWISKO,DATA_UR,RODZAJ) values ('2383','7','Mikel','San Jose',to_date('88/03/10','RR/MM/DD'),'Pomocnik')
 into UZYTKOWNIK (ID_UZYTKOWNIKA,ID_DRUZYNY,IMIE,NAZWISKO,DATA_UR,RODZAJ) values ('2384','7','Benat','Etxebarria',to_date('87/04/12','RR/MM/DD'),'Pomocnik')
 into UZYTKOWNIK (ID_UZYTKOWNIKA,ID_DRUZYNY,IMIE,NAZWISKO,DATA_UR,RODZAJ) values ('2385','7','Markel','Susaeta',to_date('87/07/12','RR/MM/DD'),'Pomocnik')
 into UZYTKOWNIK (ID_UZYTKOWNIKA,ID_DRUZYNY,IMIE,NAZWISKO,DATA_UR,RODZAJ) values ('2386','7','Ander','Iturraspe',to_date('89/02/24','RR/MM/DD'),'Pomocnik')
 into UZYTKOWNIK (ID_UZYTKOWNIKA,ID_DRUZYNY,IMIE,NAZWISKO,DATA_UR,RODZAJ) values ('2387','7','Raúl','Garcia',to_date('86/01/24','RR/MM/DD'),'Pomocnik')
 into UZYTKOWNIK (ID_UZYTKOWNIKA,ID_DRUZYNY,IMIE,NAZWISKO,DATA_UR,RODZAJ) values ('2388','7','Aritz','Aduriz',to_date('81/05/15','RR/MM/DD'),'Napastnik')
 into UZYTKOWNIK (ID_UZYTKOWNIKA,ID_DRUZYNY,IMIE,NAZWISKO,DATA_UR,RODZAJ) values ('2389','7','Sabin','Merino',to_date('92/08/24','RR/MM/DD'),'Napastnik')
 into UZYTKOWNIK (ID_UZYTKOWNIKA,ID_DRUZYNY,IMIE,NAZWISKO,DATA_UR,RODZAJ) values ('2390','7','Iker','Muniain',to_date('92/01/21','RR/MM/DD'),'Napastnik')
 into UZYTKOWNIK (ID_UZYTKOWNIKA,ID_DRUZYNY,IMIE,NAZWISKO,DATA_UR,RODZAJ) values ('2391','7','Inaki','Williams',to_date('94/05/11','RR/MM/DD'),'Napastnik')
SELECT * FROM DUAL;



INSERT ALL  --Celta de Vigo
INTO Uzytkownik (ID_Uzytkownika, ID_Druzyny, Imie, Nazwisko, Data_ur, Rodzaj) VALUES (2392, 8, 'Sergio', 'Alvarez', '86/10/03', 'Bramkarz')
INTO Uzytkownik (ID_Uzytkownika, ID_Druzyny, Imie, Nazwisko, Data_ur, Rodzaj) VALUES (2393, 8, 'Ruben', 'Blanco', '95/06/12', 'Bramkarz')
INTO Uzytkownik (ID_Uzytkownika, ID_Druzyny, Imie, Nazwisko, Data_ur, Rodzaj) VALUES (2394, 8, 'Diego', 'Alende', '97/01/16', 'Obronca')
INTO Uzytkownik (ID_Uzytkownika, ID_Druzyny, Imie, Nazwisko, Data_ur, Rodzaj) VALUES (2395, 8, 'Gustavo', 'Cabral', '91/06/15', 'Obronca')
INTO Uzytkownik (ID_Uzytkownika, ID_Druzyny, Imie, Nazwisko, Data_ur, Rodzaj) VALUES (2396, 8, 'Jonathan', 'Castro', '94/05/24', 'Obronca')
INTO Uzytkownik (ID_Uzytkownika, ID_Druzyny, Imie, Nazwisko, Data_ur, Rodzaj) VALUES (2397, 8, 'Andreu', 'Fontas', '89/05/24', 'Obronca')
INTO Uzytkownik (ID_Uzytkownika, ID_Druzyny, Imie, Nazwisko, Data_ur, Rodzaj) VALUES (2398, 8, 'Pedro', 'Hernandez', '86/03/10', 'Pomocnik')
INTO Uzytkownik (ID_Uzytkownika, ID_Druzyny, Imie, Nazwisko, Data_ur, Rodzaj) VALUES (2399, 8, 'Stanislaw', 'Lobotka', '94/04/12', 'Pomocnik')
INTO Uzytkownik (ID_Uzytkownika, ID_Druzyny, Imie, Nazwisko, Data_ur, Rodzaj) VALUES (2400, 8, 'Braiz', 'Mendez', '97/08/12', 'Pomocnik')
INTO Uzytkownik (ID_Uzytkownika, ID_Druzyny, Imie, Nazwisko, Data_ur, Rodzaj) VALUES (2401, 8, 'Dani', 'Molina', '96/02/14', 'Pomocnik')
INTO Uzytkownik (ID_Uzytkownika, ID_Druzyny, Imie, Nazwisko, Data_ur, Rodzaj) VALUES (2402, 8, 'Victor', 'Pastrana', '96/03/23', 'Pomocnik')
INTO Uzytkownik (ID_Uzytkownika, ID_Druzyny, Imie, Nazwisko, Data_ur, Rodzaj) VALUES (2403, 8, 'Iago', 'Aspas', '87/12/05', 'Napastnik')
INTO Uzytkownik (ID_Uzytkownika, ID_Druzyny, Imie, Nazwisko, Data_ur, Rodzaj) VALUES (2404, 8, 'Sabin', 'Merino', '92/08/24', 'Napastnik')
INTO Uzytkownik (ID_Uzytkownika, ID_Druzyny, Imie, Nazwisko, Data_ur, Rodzaj) VALUES (2405, 8, 'Lucas', 'Boye', '86/01/21', 'Napastnik')
INTO Uzytkownik (ID_Uzytkownika, ID_Druzyny, Imie, Nazwisko, Data_ur, Rodzaj) VALUES (2406, 8, 'Dejan', 'Drazic', '95/06/01', 'Napastnik')
SELECT * FROM DUAL;



INSERT ALL  --Eibar
INTO Uzytkownik (ID_Uzytkownika, ID_Druzyny, Imie, Nazwisko, Data_ur, Rodzaj) VALUES (2407, 9, 'Yoel', 'Oternio', '88/11/04', 'Bramkarz')
INTO Uzytkownik (ID_Uzytkownika, ID_Druzyny, Imie, Nazwisko, Data_ur, Rodzaj) VALUES (2408, 9, 'Asier', 'Riesgo', '83/01/12', 'Bramkarz')
INTO Uzytkownik (ID_Uzytkownika, ID_Druzyny, Imie, Nazwisko, Data_ur, Rodzaj) VALUES (2409, 9, 'Ivan', 'Ramis', '84/02/16', 'Obronca')
INTO Uzytkownik (ID_Uzytkownika, ID_Druzyny, Imie, Nazwisko, Data_ur, Rodzaj) VALUES (2410, 9, 'Vucasin', 'Jovanovic', '96/01/15', 'Obronca')
INTO Uzytkownik (ID_Uzytkownika, ID_Druzyny, Imie, Nazwisko, Data_ur, Rodzaj) VALUES (2411, 9, 'Ander', 'Capa', '92/05/12', 'Obronca')
INTO Uzytkownik (ID_Uzytkownika, ID_Druzyny, Imie, Nazwisko, Data_ur, Rodzaj) VALUES (2412, 9, 'Jose', 'Angel', '89/05/24', 'Obronca')
INTO Uzytkownik (ID_Uzytkownika, ID_Druzyny, Imie, Nazwisko, Data_ur, Rodzaj) VALUES (2413, 9, 'Fabien', 'Orellana', '86/03/10', 'Pomocnik')
INTO Uzytkownik (ID_Uzytkownika, ID_Druzyny, Imie, Nazwisko, Data_ur, Rodzaj) VALUES (2414, 9, 'Takashi', 'Innui', '88/01/12', 'Pomocnik')
INTO Uzytkownik (ID_Uzytkownika, ID_Druzyny, Imie, Nazwisko, Data_ur, Rodzaj) VALUES (2415, 9, 'Ruben', 'Pena', '91/08/11', 'Pomocnik')
INTO Uzytkownik (ID_Uzytkownika, ID_Druzyny, Imie, Nazwisko, Data_ur, Rodzaj) VALUES (2416, 9, 'Fran', 'Rico', '87/03/10', 'Pomocnik')
INTO Uzytkownik (ID_Uzytkownika, ID_Druzyny, Imie, Nazwisko, Data_ur, Rodzaj) VALUES (2417, 9, 'Joan', 'Jordan', '94/03/21', 'Pomocnik')
INTO Uzytkownik (ID_Uzytkownika, ID_Druzyny, Imie, Nazwisko, Data_ur, Rodzaj) VALUES (2418, 9, 'Charles', 'Dias', '84/11/05', 'Napastnik')
INTO Uzytkownik (ID_Uzytkownika, ID_Druzyny, Imie, Nazwisko, Data_ur, Rodzaj) VALUES (2419, 9, 'Enrique', 'Garcia', '89/08/14', 'Napastnik')
INTO Uzytkownik (ID_Uzytkownika, ID_Druzyny, Imie, Nazwisko, Data_ur, Rodzaj) VALUES (2420, 9, 'Sergio', 'Enrich', '90/02/22', 'Napastnik')
INTO Uzytkownik (ID_Uzytkownika, ID_Druzyny, Imie, Nazwisko, Data_ur, Rodzaj) VALUES (2421, 9, 'Francesc', 'Regis', '96/06/01', 'Napastnik')
SELECT * FROM DUAL;


INSERT ALL  --Leganes
INTO Uzytkownik (ID_Uzytkownika, ID_Druzyny, Imie, Nazwisko, Data_ur, Rodzaj) VALUES (2436, 10, 'Pichu', 'Cuellar', '84/11/04', 'Bramkarz')
INTO Uzytkownik (ID_Uzytkownika, ID_Druzyny, Imie, Nazwisko, Data_ur, Rodzaj) VALUES (2422, 10, 'Nereo', 'Champagne', '85/01/11', 'Bramkarz')
INTO Uzytkownik (ID_Uzytkownika, ID_Druzyny, Imie, Nazwisko, Data_ur, Rodzaj) VALUES (2423, 10, 'Diego', 'Rico', '93/10/16', 'Obronca')
INTO Uzytkownik (ID_Uzytkownika, ID_Druzyny, Imie, Nazwisko, Data_ur, Rodzaj) VALUES (2424, 10, 'Dimitrios', 'Siovas', '88/02/15', 'Obronca')
INTO Uzytkownik (ID_Uzytkownika, ID_Druzyny, Imie, Nazwisko, Data_ur, Rodzaj) VALUES (2425, 10, 'Mauro', 'Dos Santps', '89/05/12', 'Obronca')
INTO Uzytkownik (ID_Uzytkownika, ID_Druzyny, Imie, Nazwisko, Data_ur, Rodzaj) VALUES (2426, 10, 'Raul', 'Garcia', '89/01/24', 'Obronca')
INTO Uzytkownik (ID_Uzytkownika, ID_Druzyny, Imie, Nazwisko, Data_ur, Rodzaj) VALUES (2427, 10, 'Javier', 'Eraso', '90/04/11', 'Pomocnik')
INTO Uzytkownik (ID_Uzytkownika, ID_Druzyny, Imie, Nazwisko, Data_ur, Rodzaj) VALUES (2428, 10, 'Nabil', 'El Zhar', '86/01/12', 'Pomocnik')
INTO Uzytkownik (ID_Uzytkownika, ID_Druzyny, Imie, Nazwisko, Data_ur, Rodzaj) VALUES (2429, 10, 'Gerrard', 'Gumbau', '94/01/11', 'Pomocnik')
INTO Uzytkownik (ID_Uzytkownika, ID_Druzyny, Imie, Nazwisko, Data_ur, Rodzaj) VALUES (2430, 10, 'Omar', 'Ramos', '88/03/17', 'Pomocnik')
INTO Uzytkownik (ID_Uzytkownika, ID_Druzyny, Imie, Nazwisko, Data_ur, Rodzaj) VALUES (2431, 10, 'Gabriel', 'Pires', '93/01/11', 'Pomocnik')
INTO Uzytkownik (ID_Uzytkownika, ID_Druzyny, Imie, Nazwisko, Data_ur, Rodzaj) VALUES (2432, 10, 'Nordin', 'Amrabat', '87/11/05', 'Napastnik')
INTO Uzytkownik (ID_Uzytkownika, ID_Druzyny, Imie, Nazwisko, Data_ur, Rodzaj) VALUES (2433, 10, 'Miguel', 'Guerrero', '87/07/17', 'Napastnik')
INTO Uzytkownik (ID_Uzytkownika, ID_Druzyny, Imie, Nazwisko, Data_ur, Rodzaj) VALUES (2434, 10, 'Claudio', 'Beauvue', '88/01/24', 'Napastnik')
INTO Uzytkownik (ID_Uzytkownika, ID_Druzyny, Imie, Nazwisko, Data_ur, Rodzaj) VALUES (2435, 10, 'Jose', 'Naranjo', '94/06/11', 'Napastnik')
SELECT * FROM DUAL;


INSERT ALL  --Atletico Madryt
INTO Uzytkownik (ID_Uzytkownika, ID_Druzyny, Imie, Nazwisko, Data_ur, Rodzaj) VALUES (2437, 6, 'Jan', 'Oblak', '93/11/04', 'Bramkarz')
INTO Uzytkownik (ID_Uzytkownika, ID_Druzyny, Imie, Nazwisko, Data_ur, Rodzaj) VALUES (2438, 6, 'Axel', 'Werner', '96/02/21', 'Bramkarz')
INTO Uzytkownik (ID_Uzytkownika, ID_Druzyny, Imie, Nazwisko, Data_ur, Rodzaj) VALUES (2439, 6, 'Diego', 'Godin', '86/11/16', 'Obronca')
INTO Uzytkownik (ID_Uzytkownika, ID_Druzyny, Imie, Nazwisko, Data_ur, Rodzaj) VALUES (2440, 6, 'Stefan', 'Saviæ', '91/02/11', 'Obronca')
INTO Uzytkownik (ID_Uzytkownika, ID_Druzyny, Imie, Nazwisko, Data_ur, Rodzaj) VALUES (2441, 6, 'Lucas', 'Hernandez', '96/11/12', 'Obronca')
INTO Uzytkownik (ID_Uzytkownika, ID_Druzyny, Imie, Nazwisko, Data_ur, Rodzaj) VALUES (2442, 6, 'Jose', 'Gimenez', '95/11/22', 'Obronca')
INTO Uzytkownik (ID_Uzytkownika, ID_Druzyny, Imie, Nazwisko, Data_ur, Rodzaj) VALUES (2443, 6, 'Thomas', 'Partey', '93/04/21', 'Pomocnik')
INTO Uzytkownik (ID_Uzytkownika, ID_Druzyny, Imie, Nazwisko, Data_ur, Rodzaj) VALUES (2444, 6, 'Saul', 'Niguez', '94/11/21', 'Pomocnik')
INTO Uzytkownik (ID_Uzytkownika, ID_Druzyny, Imie, Nazwisko, Data_ur, Rodzaj) VALUES (2445, 6, 'Gabi', 'Fernandez', '83/01/11', 'Pomocnik')
INTO Uzytkownik (ID_Uzytkownika, ID_Druzyny, Imie, Nazwisko, Data_ur, Rodzaj) VALUES (2446, 6, 'Jorge', 'Koke', '92/01/23', 'Pomocnik')
INTO Uzytkownik (ID_Uzytkownika, ID_Druzyny, Imie, Nazwisko, Data_ur, Rodzaj) VALUES (2447, 6, 'Victor', 'Vitolo', '89/08/01', 'Pomocnik')
INTO Uzytkownik (ID_Uzytkownika, ID_Druzyny, Imie, Nazwisko, Data_ur, Rodzaj) VALUES (2448, 6, 'Antoine', 'Griezmann', '91/03/21', 'Napastnik')
INTO Uzytkownik (ID_Uzytkownika, ID_Druzyny, Imie, Nazwisko, Data_ur, Rodzaj) VALUES (2449, 6, 'Fernando', 'Torres', '84/03/20', 'Napastnik')
INTO Uzytkownik (ID_Uzytkownika, ID_Druzyny, Imie, Nazwisko, Data_ur, Rodzaj) VALUES (2450, 6, 'Diego', 'Costa', '88/01/24', 'Napastnik')
INTO Uzytkownik (ID_Uzytkownika, ID_Druzyny, Imie, Nazwisko, Data_ur, Rodzaj) VALUES (2451, 6, 'Kevin', 'Gameiro', '87/06/11', 'Napastnik')
SELECT * FROM DUAL;


INSERT ALL  --Villareal  
INTO Uzytkownik (ID_Uzytkownika, ID_Druzyny, Imie, Nazwisko, Data_ur, Rodzaj) VALUES (2452, 5, 'Sergio', 'Asensjo', '89/11/04', 'Bramkarz')
INTO Uzytkownik (ID_Uzytkownika, ID_Druzyny, Imie, Nazwisko, Data_ur, Rodzaj) VALUES (2453, 5, 'Mariano', 'Barbosa', '84/02/21', 'Bramkarz')
INTO Uzytkownik (ID_Uzytkownika, ID_Druzyny, Imie, Nazwisko, Data_ur, Rodzaj) VALUES (2454, 5, 'Mario', 'Gaspar', '90/01/16', 'Obronca')
INTO Uzytkownik (ID_Uzytkownika, ID_Druzyny, Imie, Nazwisko, Data_ur, Rodzaj) VALUES (2455, 5, 'Alvaro', 'Gonzales', '90/01/11', 'Obronca')
INTO Uzytkownik (ID_Uzytkownika, ID_Druzyny, Imie, Nazwisko, Data_ur, Rodzaj) VALUES (2456, 5, 'Victor', 'Ruiz', '89/11/12', 'Obronca')
INTO Uzytkownik (ID_Uzytkownika, ID_Druzyny, Imie, Nazwisko, Data_ur, Rodzaj) VALUES (2457, 5, 'Jaume', 'Costa', '88/11/22', 'Obronca')
INTO Uzytkownik (ID_Uzytkownika, ID_Druzyny, Imie, Nazwisko, Data_ur, Rodzaj) VALUES (2458, 5, 'Denis', 'Cheryshev', '90/04/21', 'Pomocnik')
INTO Uzytkownik (ID_Uzytkownika, ID_Druzyny, Imie, Nazwisko, Data_ur, Rodzaj) VALUES (2459, 5, 'Manuel', 'Trigueros', '91/12/21', 'Pomocnik')
INTO Uzytkownik (ID_Uzytkownika, ID_Druzyny, Imie, Nazwisko, Data_ur, Rodzaj) VALUES (2460, 5, 'Samuel', 'Castillejo', '95/01/11', 'Pomocnik')
INTO Uzytkownik (ID_Uzytkownika, ID_Druzyny, Imie, Nazwisko, Data_ur, Rodzaj) VALUES (2461, 5, 'Rodrigo', 'Hernandez', '96/11/13', 'Pomocnik')
INTO Uzytkownik (ID_Uzytkownika, ID_Druzyny, Imie, Nazwisko, Data_ur, Rodzaj) VALUES (2462, 5, 'Pablo', 'Vornals', '96/01/05', 'Pomocnik')
INTO Uzytkownik (ID_Uzytkownika, ID_Druzyny, Imie, Nazwisko, Data_ur, Rodzaj) VALUES (2463, 5, 'Carlos', 'Bacca', '86/09/08', 'Napastnik')
INTO Uzytkownik (ID_Uzytkownika, ID_Druzyny, Imie, Nazwisko, Data_ur, Rodzaj) VALUES (2464, 5, 'Enes', 'Unal', '97/12/22', 'Napastnik')
INTO Uzytkownik (ID_Uzytkownika, ID_Druzyny, Imie, Nazwisko, Data_ur, Rodzaj) VALUES (2465, 5, 'Nicola', 'Sansone', '91/01/24', 'Napastnik')
INTO Uzytkownik (ID_Uzytkownika, ID_Druzyny, Imie, Nazwisko, Data_ur, Rodzaj) VALUES (2466, 5, 'Dani', 'Raba', '95/02/11', 'Napastnik')
SELECT * FROM DUAL;


INSERT ALL  --Valencia
INTO Uzytkownik (ID_Uzytkownika, ID_Druzyny, Imie, Nazwisko, Data_ur, Rodzaj) VALUES (2468, 4, 'Ruben', 'Vezo', '94/01/04', 'Bramkarz')
INTO Uzytkownik (ID_Uzytkownika, ID_Druzyny, Imie, Nazwisko, Data_ur, Rodzaj) VALUES (2469, 4, 'Norberto', 'Neto', '90/08/21', 'Bramkarz')
INTO Uzytkownik (ID_Uzytkownika, ID_Druzyny, Imie, Nazwisko, Data_ur, Rodzaj) VALUES (2467, 4, 'Ezequiel', 'Garay', '86/02/15', 'Obronca')
INTO Uzytkownik (ID_Uzytkownika, ID_Druzyny, Imie, Nazwisko, Data_ur, Rodzaj) VALUES (2470, 4, 'Martin', 'Montoya', '91/11/01', 'Obronca')
INTO Uzytkownik (ID_Uzytkownika, ID_Druzyny, Imie, Nazwisko, Data_ur, Rodzaj) VALUES (2471, 4, 'Nemanja', 'Maksimoviæ', '95/12/02', 'Obronca')
INTO Uzytkownik (ID_Uzytkownika, ID_Druzyny, Imie, Nazwisko, Data_ur, Rodzaj) VALUES (2472, 4, 'Dani', 'Parejo', '89/05/12', 'Obronca')
INTO Uzytkownik (ID_Uzytkownika, ID_Druzyny, Imie, Nazwisko, Data_ur, Rodzaj) VALUES (2473, 4, 'Geoffrey', 'Kondogbia', '93/04/06', 'Pomocnik')
INTO Uzytkownik (ID_Uzytkownika, ID_Druzyny, Imie, Nazwisko, Data_ur, Rodzaj) VALUES (2474, 4, 'Carlos', 'Soler', '97/02/21', 'Pomocnik')
INTO Uzytkownik (ID_Uzytkownika, ID_Druzyny, Imie, Nazwisko, Data_ur, Rodzaj) VALUES (2475, 4, 'Andreas', 'Perreira', '96/10/01', 'Pomocnik')
INTO Uzytkownik (ID_Uzytkownika, ID_Druzyny, Imie, Nazwisko, Data_ur, Rodzaj) VALUES (2476, 4, 'Simone', 'Zaza', '91/03/13', 'Pomocnik')
INTO Uzytkownik (ID_Uzytkownika, ID_Druzyny, Imie, Nazwisko, Data_ur, Rodzaj) VALUES (2477, 4, 'Ferran', 'Torres', '00/05/04', 'Pomocnik')
INTO Uzytkownik (ID_Uzytkownika, ID_Druzyny, Imie, Nazwisko, Data_ur, Rodzaj) VALUES (2478, 4, 'Rodrigo', 'Morreno', '91/08/08', 'Napastnik')
INTO Uzytkownik (ID_Uzytkownika, ID_Druzyny, Imie, Nazwisko, Data_ur, Rodzaj) VALUES (2479, 4, 'Santi', 'Mina', '95/11/02', 'Napastnik')
INTO Uzytkownik (ID_Uzytkownika, ID_Druzyny, Imie, Nazwisko, Data_ur, Rodzaj) VALUES (2480, 4, 'Jaume', 'Domenech', '90/01/24', 'Napastnik')
INTO Uzytkownik (ID_Uzytkownika, ID_Druzyny, Imie, Nazwisko, Data_ur, Rodzaj) VALUES (2481, 4, 'Gabriel', 'Paulista', '95/02/11', 'Napastnik')
SELECT * FROM DUAL;


INSERT ALL  --Sevilla
INTO Uzytkownik (ID_Uzytkownika, ID_Druzyny, Imie, Nazwisko, Data_ur, Rodzaj) VALUES (2482, 3, 'Sergio', 'Rico', '93/11/10', 'Bramkarz')
INTO Uzytkownik (ID_Uzytkownika, ID_Druzyny, Imie, Nazwisko, Data_ur, Rodzaj) VALUES (2483, 3, 'David', 'Soria', '93/07/11', 'Bramkarz')
INTO Uzytkownik (ID_Uzytkownika, ID_Druzyny, Imie, Nazwisko, Data_ur, Rodzaj) VALUES (2484, 3, 'Nicolas', 'Pareja', '84/02/15', 'Obronca')
INTO Uzytkownik (ID_Uzytkownika, ID_Druzyny, Imie, Nazwisko, Data_ur, Rodzaj) VALUES (2485, 3, 'Gabriel', 'Mercado', '87/11/01', 'Obronca')
INTO Uzytkownik (ID_Uzytkownika, ID_Druzyny, Imie, Nazwisko, Data_ur, Rodzaj) VALUES (2486, 3, 'Sergio', 'Escudero', '89/02/02', 'Obronca')
INTO Uzytkownik (ID_Uzytkownika, ID_Druzyny, Imie, Nazwisko, Data_ur, Rodzaj) VALUES (2487, 3, 'Clément', 'Lenglet', '95/05/12', 'Obronca')
INTO Uzytkownik (ID_Uzytkownika, ID_Druzyny, Imie, Nazwisko, Data_ur, Rodzaj) VALUES (2488, 3, 'Pablo', 'Sarabia', '95/06/06', 'Pomocnik')
INTO Uzytkownik (ID_Uzytkownika, ID_Druzyny, Imie, Nazwisko, Data_ur, Rodzaj) VALUES (2489, 3, 'Franco', 'Vazquez', '89/02/21', 'Pomocnik')
INTO Uzytkownik (ID_Uzytkownika, ID_Druzyny, Imie, Nazwisko, Data_ur, Rodzaj) VALUES (2490, 3, 'Steven', 'NZonzi', '88/10/01', 'Pomocnik')
INTO Uzytkownik (ID_Uzytkownika, ID_Druzyny, Imie, Nazwisko, Data_ur, Rodzaj) VALUES (2491, 3, 'Ever', 'Banega', '88/06/29', 'Pomocnik')
INTO Uzytkownik (ID_Uzytkownika, ID_Druzyny, Imie, Nazwisko, Data_ur, Rodzaj) VALUES (2492, 3, 'Guido', 'Pizzaro', '90/05/04', 'Pomocnik')
INTO Uzytkownik (ID_Uzytkownika, ID_Druzyny, Imie, Nazwisko, Data_ur, Rodzaj) VALUES (2493, 3, 'Wissam', 'Ben Yedder', '90/06/08', 'Napastnik')
INTO Uzytkownik (ID_Uzytkownika, ID_Druzyny, Imie, Nazwisko, Data_ur, Rodzaj) VALUES (2494, 3, 'Luis', 'Muriel', '91/04/02', 'Napastnik')
INTO Uzytkownik (ID_Uzytkownika, ID_Druzyny, Imie, Nazwisko, Data_ur, Rodzaj) VALUES (2495, 3, 'Manuel', 'Nolito', '86/01/24', 'Napastnik')
INTO Uzytkownik (ID_Uzytkownika, ID_Druzyny, Imie, Nazwisko, Data_ur, Rodzaj) VALUES (2496, 3, 'Sandro', 'Ramirez', '95/02/11', 'Napastnik')
SELECT * FROM DUAL;



INSERT ALL  --Real Madryt
INTO Uzytkownik (ID_Uzytkownika, ID_Druzyny, Imie, Nazwisko, Data_ur, Rodzaj) VALUES (2497, 2, 'Keylor', 'Navas', '86/12/15', 'Bramkarz')
INTO Uzytkownik (ID_Uzytkownika, ID_Druzyny, Imie, Nazwisko, Data_ur, Rodzaj) VALUES (2498, 2, 'Kiko', 'Casilla', '86/10/02', 'Bramkarz')
INTO Uzytkownik (ID_Uzytkownika, ID_Druzyny, Imie, Nazwisko, Data_ur, Rodzaj) VALUES (2499, 2, 'Daniel', 'Carvajal', '92/01/11', 'Obronca')
INTO Uzytkownik (ID_Uzytkownika, ID_Druzyny, Imie, Nazwisko, Data_ur, Rodzaj) VALUES (2500, 2, 'Sergio', 'Ramos', '86/03/30', 'Obronca')
INTO Uzytkownik (ID_Uzytkownika, ID_Druzyny, Imie, Nazwisko, Data_ur, Rodzaj) VALUES (2501, 2, 'Raphael', 'Varane', '93/04/25', 'Obronca')
INTO Uzytkownik (ID_Uzytkownika, ID_Druzyny, Imie, Nazwisko, Data_ur, Rodzaj) VALUES (2502, 2, 'Junior', 'Marcelo', '88/05/12', 'Obronca')
INTO Uzytkownik (ID_Uzytkownika, ID_Druzyny, Imie, Nazwisko, Data_ur, Rodzaj) VALUES (2503, 2, 'Toni', 'Kroos', '90/01/04', 'Pomocnik')
INTO Uzytkownik (ID_Uzytkownika, ID_Druzyny, Imie, Nazwisko, Data_ur, Rodzaj) VALUES (2504, 2, 'Luka', 'Modriæ', '85/08/09', 'Pomocnik')
INTO Uzytkownik (ID_Uzytkownika, ID_Druzyny, Imie, Nazwisko, Data_ur, Rodzaj) VALUES (2505, 2, 'Carlos', 'Casemiro', '92/02/23', 'Pomocnik')
INTO Uzytkownik (ID_Uzytkownika, ID_Druzyny, Imie, Nazwisko, Data_ur, Rodzaj) VALUES (2506, 2, 'Franc', 'Isco', '92/04/21', 'Pomocnik')
INTO Uzytkownik (ID_Uzytkownika, ID_Druzyny, Imie, Nazwisko, Data_ur, Rodzaj) VALUES (2507, 2, 'Marco', 'Asensio', '96/01/21', 'Pomocnik')
INTO Uzytkownik (ID_Uzytkownika, ID_Druzyny, Imie, Nazwisko, Data_ur, Rodzaj) VALUES (2508, 2, 'Cristiano', 'Ronaldo', '85/02/05', 'Napastnik')
INTO Uzytkownik (ID_Uzytkownika, ID_Druzyny, Imie, Nazwisko, Data_ur, Rodzaj) VALUES (2509, 2, 'Gareth', 'Bale', '89/07/16', 'Napastnik')
INTO Uzytkownik (ID_Uzytkownika, ID_Druzyny, Imie, Nazwisko, Data_ur, Rodzaj) VALUES (2510, 2, 'Karim', 'Benzema', '87/12/19', 'Napastnik')
INTO Uzytkownik (ID_Uzytkownika, ID_Druzyny, Imie, Nazwisko, Data_ur, Rodzaj) VALUES (2511, 2, 'Borja', 'Mayoral', '97/04/05', 'Napastnik')
SELECT * FROM DUAL;




INSERT ALL  --Uzytkownicy i sedziowie
INTO Uzytkownik (ID_Uzytkownika, ID_Druzyny, Imie, Nazwisko, Data_ur, Rodzaj) VALUES (100, 2,'Daniel', 'Dek', '80/12/25', 'Uzytkownik')
INTO Uzytkownik (ID_Uzytkownika, ID_Druzyny, Imie, Nazwisko, Data_ur, Rodzaj) VALUES (101, 3,'Marian', 'Opienia', '56/10/02', 'Uzytkownik')
INTO Uzytkownik (ID_Uzytkownika, ID_Druzyny, Imie, Nazwisko, Data_ur, Rodzaj) VALUES (102, 4,'Daniel', 'Burtujko', '92/01/11', 'Uzytkownik')
INTO Uzytkownik (ID_Uzytkownika, ID_Druzyny, Imie, Nazwisko, Data_ur, Rodzaj) VALUES (103, 1,'Lukasz', 'Ramirski', '86/12/20', 'Uzytkownik')
INTO Uzytkownik (ID_Uzytkownika, ID_Druzyny, Imie, Nazwisko, Data_ur, Rodzaj) VALUES (104, 1,'Aleksandra', 'Baran', '63/12/04', 'Uzytkownik')
INTO Uzytkownik (ID_Uzytkownika, ID_Druzyny, Imie, Nazwisko, Data_ur, Rodzaj) VALUES (105, 1,'Bartosz', 'Marcel', '78/02/12', 'Uzytkownik')
INTO Uzytkownik (ID_Uzytkownika, ID_Druzyny, Imie, Nazwisko, Data_ur, Rodzaj) VALUES (106, 2,'Szymon', 'Krosowski', '50/01/04', 'Uzytkownik')
INTO Uzytkownik (ID_Uzytkownika, ID_Druzyny, Imie, Nazwisko, Data_ur, Rodzaj) VALUES (107, 10,'Lukasz', 'Modrowski', '85/08/09', 'Uzytkownik')
INTO Uzytkownik (ID_Uzytkownika, ID_Druzyny, Imie, Nazwisko, Data_ur, Rodzaj) VALUES (108, 9,'Ignacy', 'Mosir', '52/12/03', 'Uzytkownik')
INTO Uzytkownik (ID_Uzytkownika, ID_Druzyny, Imie, Nazwisko, Data_ur, Rodzaj) VALUES (109, 8,'Franciszek', 'Pospieszalski', '92/04/21', 'Uzytkownik')
INTO Uzytkownik (ID_Uzytkownika, Imie, Nazwisko, Data_ur, Rodzaj) VALUES (45,'Pierr', 'Colina', '76/01/21', 'Sedzia')
INTO Uzytkownik (ID_Uzytkownika, Imie, Nazwisko, Data_ur, Rodzaj) VALUES (46, 'Mark', 'DeNiro', '75/02/05', 'Sedzia')
INTO Uzytkownik (ID_Uzytkownika, Imie, Nazwisko, Data_ur, Rodzaj) VALUES (47, 'Jesus', 'Narvaz', '69/07/16', 'Sedzia')
INTO Uzytkownik (ID_Uzytkownika, Imie, Nazwisko, Data_ur, Rodzaj) VALUES (48, 'Luca', 'Boncroir', '67/12/19', 'Sedzia')
INTO Uzytkownik (ID_Uzytkownika, Imie, Nazwisko, Data_ur, Rodzaj) VALUES (49, 'Borja', 'Mayoral', '67/04/10', 'Sedzia')
INTO Uzytkownik (ID_Uzytkownika, Imie, Nazwisko, Data_ur, Rodzaj) VALUES (50, 'Marcel', 'Daner', '76/01/20', 'Sedzia')
INTO Uzytkownik (ID_Uzytkownika, Imie, Nazwisko, Data_ur, Rodzaj) VALUES (51, 'Thomas', 'Redondo', '65/12/05', 'Sedzia')
SELECT * FROM DUAL;



INSERT ALL
INTO Przebieg_meczu(ID_Meczu, ID_Uzytkownika, Data) VALUES (2, 46,'17/09/22') --1 kolejka
INTO Przebieg_meczu(ID_Meczu, ID_Uzytkownika, Data) VALUES (3, 47, '17/09/22')
INTO Przebieg_meczu(ID_Meczu, ID_Uzytkownika, Data) VALUES (4, 48, '17/09/22')
INTO Przebieg_meczu(ID_Meczu, ID_Uzytkownika, Data) VALUES (5, 49,'17/09/22')
INTO Przebieg_meczu(ID_Meczu, ID_Uzytkownika, Data) VALUES (6, 50,'17/09/22')

INTO Przebieg_meczu(ID_Meczu, ID_Uzytkownika, Data) VALUES (12, 45, '17/09/29')--2 kolejka
INTO Przebieg_meczu(ID_Meczu, ID_Uzytkownika, Data) VALUES (13, 46, '17/09/29')
INTO Przebieg_meczu(ID_Meczu, ID_Uzytkownika, Data) VALUES (14, 47,'17/09/29')
INTO Przebieg_meczu(ID_Meczu, ID_Uzytkownika, Data) VALUES (15, 48, '17/09/29')
INTO Przebieg_meczu(ID_Meczu, ID_Uzytkownika, Data) VALUES (16, 49, '17/09/29')

INTO Przebieg_meczu(ID_Meczu, ID_Uzytkownika, Data) VALUES (22, 50, '17/10/06')--3 kolejka
INTO Przebieg_meczu(ID_Meczu, ID_Uzytkownika, Data) VALUES (23, 51, '17/10/06')
INTO Przebieg_meczu(ID_Meczu, ID_Uzytkownika, Data) VALUES (24, 46, '17/10/06')
INTO Przebieg_meczu(ID_Meczu, ID_Uzytkownika, Data) VALUES (25, 45, '17/10/06')
INTO Przebieg_meczu(ID_Meczu, ID_Uzytkownika, Data) VALUES (26, 47, '17/10/06')

INTO Przebieg_meczu(ID_Meczu, ID_Uzytkownika, Data) VALUES (32, 48, '17/10/13')--4 kolejka
INTO Przebieg_meczu(ID_Meczu, ID_Uzytkownika, Data) VALUES (33, 49, '17/10/13')
INTO Przebieg_meczu(ID_Meczu, ID_Uzytkownika, Data) VALUES (34, 50, '17/10/13')
INTO Przebieg_meczu(ID_Meczu, ID_Uzytkownika, Data) VALUES (35, 51, '17/10/13')
INTO Przebieg_meczu(ID_Meczu, ID_Uzytkownika, Data) VALUES (36, 45, '17/10/13')

INTO Przebieg_meczu(ID_Meczu, ID_Uzytkownika, Data) VALUES (42, 46, '17/10/20')--5 kolejka
INTO Przebieg_meczu(ID_Meczu, ID_Uzytkownika, Data) VALUES (43, 47, '17/10/20')
INTO Przebieg_meczu(ID_Meczu, ID_Uzytkownika, Data) VALUES (44, 48, '17/10/20')
INTO Przebieg_meczu(ID_Meczu, ID_Uzytkownika, Data) VALUES (45, 49, '17/10/20')
INTO Przebieg_meczu(ID_Meczu, ID_Uzytkownika, Data) VALUES (46, 50, '17/10/20')

INTO Przebieg_meczu(ID_Meczu, ID_Uzytkownika, Data) VALUES (52, 51, '17/10/27')--6 kolejka
INTO Przebieg_meczu(ID_Meczu, ID_Uzytkownika, Data) VALUES (53, 45, '17/10/27')
INTO Przebieg_meczu(ID_Meczu, ID_Uzytkownika, Data) VALUES (54, 47, '17/10/27')
INTO Przebieg_meczu(ID_Meczu, ID_Uzytkownika, Data) VALUES (55, 48, '17/10/27')
INTO Przebieg_meczu(ID_Meczu, ID_Uzytkownika, Data) VALUES (56, 49, '17/10/27')

INTO Przebieg_meczu(ID_Meczu, ID_Uzytkownika, Data) VALUES (62, 50, '17/11/03')--7 kolejka
INTO Przebieg_meczu(ID_Meczu, ID_Uzytkownika, Data) VALUES (63, 51, '17/11/03')
INTO Przebieg_meczu(ID_Meczu, ID_Uzytkownika, Data) VALUES (64, 45, '17/11/03')
INTO Przebieg_meczu(ID_Meczu, ID_Uzytkownika, Data) VALUES (65, 46, '17/11/03')
INTO Przebieg_meczu(ID_Meczu, ID_Uzytkownika, Data) VALUES (66, 47, '17/11/03')

INTO Przebieg_meczu(ID_Meczu, ID_Uzytkownika, Data) VALUES (72, 48, '17/11/10')--8 kolejka
INTO Przebieg_meczu(ID_Meczu, ID_Uzytkownika, Data) VALUES (73, 49, '17/11/10')
INTO Przebieg_meczu(ID_Meczu, ID_Uzytkownika, Data) VALUES (74, 50, '17/11/10')
INTO Przebieg_meczu(ID_Meczu, ID_Uzytkownika, Data) VALUES (75, 51, '17/11/10')
INTO Przebieg_meczu(ID_Meczu, ID_Uzytkownika, Data) VALUES (76, 45, '17/11/10')

INTO Przebieg_meczu(ID_Meczu, ID_Uzytkownika, Data) VALUES (82, 46, '17/11/17')--9 kolejka
INTO Przebieg_meczu(ID_Meczu, ID_Uzytkownika, Data) VALUES (83, 47, '17/11/17')
INTO Przebieg_meczu(ID_Meczu, ID_Uzytkownika, Data) VALUES (84, 48, '17/11/17')
INTO Przebieg_meczu(ID_Meczu, ID_Uzytkownika, Data) VALUES (85, 49, '17/11/17')
INTO Przebieg_meczu(ID_Meczu, ID_Uzytkownika, Data) VALUES (86, 50, '17/11/17')

INTO Przebieg_meczu(ID_Meczu, ID_Uzytkownika, Data) VALUES (92, 51, '17/11/24')--10 kolejka
INTO Przebieg_meczu(ID_Meczu, ID_Uzytkownika, Data) VALUES (93, 45, '17/11/24')
INTO Przebieg_meczu(ID_Meczu, ID_Uzytkownika, Data) VALUES (94, 46, '17/11/24')
INTO Przebieg_meczu(ID_Meczu, ID_Uzytkownika, Data) VALUES (95, 47, '17/11/24')
INTO Przebieg_meczu(ID_Meczu, ID_Uzytkownika, Data) VALUES (96, 48, '17/11/24')

INTO Przebieg_meczu(ID_Meczu, ID_Uzytkownika, Data) VALUES (102, 49, '17/12/01')--11kolejka
INTO Przebieg_meczu(ID_Meczu, ID_Uzytkownika, Data) VALUES (103, 50, '17/12/01')
INTO Przebieg_meczu(ID_Meczu, ID_Uzytkownika, Data) VALUES (104, 51, '17/12/01')
INTO Przebieg_meczu(ID_Meczu, ID_Uzytkownika, Data) VALUES (105, 45, '17/12/01')
INTO Przebieg_meczu(ID_Meczu, ID_Uzytkownika, Data) VALUES (106, 46, '17/12/01')

INTO Przebieg_meczu(ID_Meczu, ID_Uzytkownika, Data) VALUES (112, 47, '17/12/08')--12 kolejka
INTO Przebieg_meczu(ID_Meczu, ID_Uzytkownika, Data) VALUES (113, 48, '17/12/08')
INTO Przebieg_meczu(ID_Meczu, ID_Uzytkownika, Data) VALUES (114, 49, '17/12/08')
INTO Przebieg_meczu(ID_Meczu, ID_Uzytkownika, Data) VALUES (115, 50, '17/12/08')
INTO Przebieg_meczu(ID_Meczu, ID_Uzytkownika, Data) VALUES (116, 51, '17/12/08')

INTO Przebieg_meczu(ID_Meczu, ID_Uzytkownika, Data) VALUES (122, 45, '17/12/15')--13 kolejka
INTO Przebieg_meczu(ID_Meczu, ID_Uzytkownika, Data) VALUES (123, 46, '17/12/15')
INTO Przebieg_meczu(ID_Meczu, ID_Uzytkownika, Data) VALUES (124, 47, '17/12/15')
INTO Przebieg_meczu(ID_Meczu, ID_Uzytkownika, Data) VALUES (125, 48, '17/12/15')
INTO Przebieg_meczu(ID_Meczu, ID_Uzytkownika, Data) VALUES (126, 49, '17/12/15')

INTO Przebieg_meczu(ID_Meczu, ID_Uzytkownika, Data) VALUES (132, 50, '17/12/22')--14 kolejka
INTO Przebieg_meczu(ID_Meczu, ID_Uzytkownika, Data) VALUES (133, 51, '17/12/22')
INTO Przebieg_meczu(ID_Meczu, ID_Uzytkownika, Data) VALUES (134, 45, '17/12/22')
INTO Przebieg_meczu(ID_Meczu, ID_Uzytkownika, Data) VALUES (135, 46, '17/12/22')
INTO Przebieg_meczu(ID_Meczu, ID_Uzytkownika, Data) VALUES (136, 47, '17/12/22')

INTO Przebieg_meczu(ID_Meczu, ID_Uzytkownika, Data) VALUES (142, 48, '17/12/29')--15 kolejka
INTO Przebieg_meczu(ID_Meczu, ID_Uzytkownika, Data) VALUES (143, 49, '17/12/29')
INTO Przebieg_meczu(ID_Meczu, ID_Uzytkownika, Data) VALUES (144, 50, '17/12/29')
INTO Przebieg_meczu(ID_Meczu, ID_Uzytkownika, Data) VALUES (145, 51, '17/12/29')
INTO Przebieg_meczu(ID_Meczu, ID_Uzytkownika, Data) VALUES (146, 45, '17/12/29')

INTO Przebieg_meczu(ID_Meczu, ID_Uzytkownika, Data) VALUES (152, 46, '18/01/05')--16kolejka
INTO Przebieg_meczu(ID_Meczu, ID_Uzytkownika, Data) VALUES (153, 47, '18/01/05')
INTO Przebieg_meczu(ID_Meczu, ID_Uzytkownika, Data) VALUES (154, 48, '18/01/05')
INTO Przebieg_meczu(ID_Meczu, ID_Uzytkownika, Data) VALUES (155, 49, '18/01/05')
INTO Przebieg_meczu(ID_Meczu, ID_Uzytkownika, Data) VALUES (156, 50, '18/01/05')

INTO Przebieg_meczu(ID_Meczu, ID_Uzytkownika, Data) VALUES (162, 51, '18/01/12')--17 kolejka
INTO Przebieg_meczu(ID_Meczu, ID_Uzytkownika, Data) VALUES (163, 45, '18/01/12')
INTO Przebieg_meczu(ID_Meczu, ID_Uzytkownika, Data) VALUES (164, 46, '18/01/12')
INTO Przebieg_meczu(ID_Meczu, ID_Uzytkownika, Data) VALUES (165, 47, '18/01/12')
INTO Przebieg_meczu(ID_Meczu, ID_Uzytkownika, Data) VALUES (166, 48, '18/01/12')

INTO Przebieg_meczu(ID_Meczu, ID_Uzytkownika, Data) VALUES (172, 49, '18/01/19')--18 kolejka
INTO Przebieg_meczu(ID_Meczu, ID_Uzytkownika, Data) VALUES (173, 50, '18/01/19')
INTO Przebieg_meczu(ID_Meczu, ID_Uzytkownika, Data) VALUES (174, 51, '18/01/19')
INTO Przebieg_meczu(ID_Meczu, ID_Uzytkownika, Data) VALUES (175, 45, '18/01/19')
INTO Przebieg_meczu(ID_Meczu, ID_Uzytkownika, Data) VALUES (176, 46, '18/01/19')
SELECT * FROM DUAL;



INSERT ALL 
INTO Mecze_Druzyny (ID_Druzyny, ID_Meczu, Typ_Druzyny) VALUES (2,2,'Gospodarz')--1 kolejka
INTO Mecze_Druzyny (ID_Druzyny, ID_Meczu, Typ_Druzyny) VALUES (8,3,'Gospodarz')
INTO Mecze_Druzyny (ID_Druzyny, ID_Meczu, Typ_Druzyny) VALUES (1,4,'Gospodarz')
INTO Mecze_Druzyny (ID_Druzyny, ID_Meczu, Typ_Druzyny) VALUES (5,5,'Gospodarz')
INTO Mecze_Druzyny (ID_Druzyny, ID_Meczu, Typ_Druzyny) VALUES (10,6,'Gospodarz')
INTO Mecze_Druzyny (ID_Druzyny, ID_Meczu, Typ_Druzyny) VALUES (7,2,'Gosc')
INTO Mecze_Druzyny (ID_Druzyny, ID_Meczu, Typ_Druzyny) VALUES (3,3,'Gosc')
INTO Mecze_Druzyny (ID_Druzyny, ID_Meczu, Typ_Druzyny) VALUES (6,4,'Gosc')
INTO Mecze_Druzyny (ID_Druzyny, ID_Meczu, Typ_Druzyny) VALUES (4,5,'Gosc')
INTO Mecze_Druzyny (ID_Druzyny, ID_Meczu, Typ_Druzyny) VALUES (9,6,'Gosc')

INTO Mecze_Druzyny (ID_Druzyny, ID_Meczu, Typ_Druzyny) VALUES (6,12,'Gospodarz')--2 kolejka
INTO Mecze_Druzyny (ID_Druzyny, ID_Meczu, Typ_Druzyny) VALUES (4,13,'Gospodarz')
INTO Mecze_Druzyny (ID_Druzyny, ID_Meczu, Typ_Druzyny) VALUES (7,14,'Gospodarz')
INTO Mecze_Druzyny (ID_Druzyny, ID_Meczu, Typ_Druzyny) VALUES (9,15,'Gospodarz')
INTO Mecze_Druzyny (ID_Druzyny, ID_Meczu, Typ_Druzyny) VALUES (5,16,'Gospodarz')
INTO Mecze_Druzyny (ID_Druzyny, ID_Meczu, Typ_Druzyny) VALUES (10,12,'Gosc')
INTO Mecze_Druzyny (ID_Druzyny, ID_Meczu, Typ_Druzyny) VALUES (3,13,'Gosc')
INTO Mecze_Druzyny (ID_Druzyny, ID_Meczu, Typ_Druzyny) VALUES (8,14,'Gosc')
INTO Mecze_Druzyny (ID_Druzyny, ID_Meczu, Typ_Druzyny) VALUES (1,15,'Gosc')
INTO Mecze_Druzyny (ID_Druzyny, ID_Meczu, Typ_Druzyny) VALUES (2,16,'Gosc')

INTO Mecze_Druzyny (ID_Druzyny, ID_Meczu, Typ_Druzyny) VALUES (3,22,'Gospodarz')--3 kolejka
INTO Mecze_Druzyny (ID_Druzyny, ID_Meczu, Typ_Druzyny) VALUES (10,23,'Gospodarz')
INTO Mecze_Druzyny (ID_Druzyny, ID_Meczu, Typ_Druzyny) VALUES (1,24,'Gospodarz')
INTO Mecze_Druzyny (ID_Druzyny, ID_Meczu, Typ_Druzyny) VALUES (2,25,'Gospodarz')
INTO Mecze_Druzyny (ID_Druzyny, ID_Meczu, Typ_Druzyny) VALUES (8,26,'Gospodarz')
INTO Mecze_Druzyny (ID_Druzyny, ID_Meczu, Typ_Druzyny) VALUES (9,22,'Gosc')
INTO Mecze_Druzyny (ID_Druzyny, ID_Meczu, Typ_Druzyny) VALUES (7,23,'Gosc')
INTO Mecze_Druzyny (ID_Druzyny, ID_Meczu, Typ_Druzyny) VALUES (5,24,'Gosc')
INTO Mecze_Druzyny (ID_Druzyny, ID_Meczu, Typ_Druzyny) VALUES (4,25,'Gosc')
INTO Mecze_Druzyny (ID_Druzyny, ID_Meczu, Typ_Druzyny) VALUES (6,26,'Gosc')

INTO Mecze_Druzyny (ID_Druzyny, ID_Meczu, Typ_Druzyny) VALUES (4,32,'Gospodarz')--4 kolejka
INTO Mecze_Druzyny (ID_Druzyny, ID_Meczu, Typ_Druzyny) VALUES (6,33,'Gospodarz')
INTO Mecze_Druzyny (ID_Druzyny, ID_Meczu, Typ_Druzyny) VALUES (7,34,'Gospodarz')
INTO Mecze_Druzyny (ID_Druzyny, ID_Meczu, Typ_Druzyny) VALUES (2,35,'Gospodarz')
INTO Mecze_Druzyny (ID_Druzyny, ID_Meczu, Typ_Druzyny) VALUES (5,36,'Gospodarz')
INTO Mecze_Druzyny (ID_Druzyny, ID_Meczu, Typ_Druzyny) VALUES (9,32,'Gosc')
INTO Mecze_Druzyny (ID_Druzyny, ID_Meczu, Typ_Druzyny) VALUES (3,33,'Gosc')
INTO Mecze_Druzyny (ID_Druzyny, ID_Meczu, Typ_Druzyny) VALUES (8,34,'Gosc')
INTO Mecze_Druzyny (ID_Druzyny, ID_Meczu, Typ_Druzyny) VALUES (1,35,'Gosc')
INTO Mecze_Druzyny (ID_Druzyny, ID_Meczu, Typ_Druzyny) VALUES (10,36,'Gosc')

INTO Mecze_Druzyny (ID_Druzyny, ID_Meczu, Typ_Druzyny) VALUES (9,42,'Gospodarz')--5 kolejka
INTO Mecze_Druzyny (ID_Druzyny, ID_Meczu, Typ_Druzyny) VALUES (3,43,'Gospodarz')
INTO Mecze_Druzyny (ID_Druzyny, ID_Meczu, Typ_Druzyny) VALUES (8,44,'Gospodarz')
INTO Mecze_Druzyny (ID_Druzyny, ID_Meczu, Typ_Druzyny) VALUES (1,45,'Gospodarz')
INTO Mecze_Druzyny (ID_Druzyny, ID_Meczu, Typ_Druzyny) VALUES (10,46,'Gospodarz')
INTO Mecze_Druzyny (ID_Druzyny, ID_Meczu, Typ_Druzyny) VALUES (6,42,'Gosc')
INTO Mecze_Druzyny (ID_Druzyny, ID_Meczu, Typ_Druzyny) VALUES (7,43,'Gosc')
INTO Mecze_Druzyny (ID_Druzyny, ID_Meczu, Typ_Druzyny) VALUES (5,44,'Gosc')
INTO Mecze_Druzyny (ID_Druzyny, ID_Meczu, Typ_Druzyny) VALUES (4,45,'Gosc')
INTO Mecze_Druzyny (ID_Druzyny, ID_Meczu, Typ_Druzyny) VALUES (2,46,'Gosc')

INTO Mecze_Druzyny (ID_Druzyny, ID_Meczu, Typ_Druzyny) VALUES (1,52,'Gospodarz')--6 kolejka
INTO Mecze_Druzyny (ID_Druzyny, ID_Meczu, Typ_Druzyny) VALUES (4,53,'Gospodarz')
INTO Mecze_Druzyny (ID_Druzyny, ID_Meczu, Typ_Druzyny) VALUES (7,54,'Gospodarz')
INTO Mecze_Druzyny (ID_Druzyny, ID_Meczu, Typ_Druzyny) VALUES (2,55,'Gospodarz')
INTO Mecze_Druzyny (ID_Druzyny, ID_Meczu, Typ_Druzyny) VALUES (5,56,'Gospodarz')
INTO Mecze_Druzyny (ID_Druzyny, ID_Meczu, Typ_Druzyny) VALUES (10,52,'Gosc')
INTO Mecze_Druzyny (ID_Druzyny, ID_Meczu, Typ_Druzyny) VALUES (6,53,'Gosc')
INTO Mecze_Druzyny (ID_Druzyny, ID_Meczu, Typ_Druzyny) VALUES (9,54,'Gosc')
INTO Mecze_Druzyny (ID_Druzyny, ID_Meczu, Typ_Druzyny) VALUES (8,55,'Gosc')
INTO Mecze_Druzyny (ID_Druzyny, ID_Meczu, Typ_Druzyny) VALUES (3,56,'Gosc')

INTO Mecze_Druzyny (ID_Druzyny, ID_Meczu, Typ_Druzyny) VALUES (3,62,'Gospodarz')--7 kolejka
INTO Mecze_Druzyny (ID_Druzyny, ID_Meczu, Typ_Druzyny) VALUES (10,63,'Gospodarz')
INTO Mecze_Druzyny (ID_Druzyny, ID_Meczu, Typ_Druzyny) VALUES (9,64,'Gospodarz')
INTO Mecze_Druzyny (ID_Druzyny, ID_Meczu, Typ_Druzyny) VALUES (6,65,'Gospodarz')
INTO Mecze_Druzyny (ID_Druzyny, ID_Meczu, Typ_Druzyny) VALUES (8,66,'Gospodarz')
INTO Mecze_Druzyny (ID_Druzyny, ID_Meczu, Typ_Druzyny) VALUES (2,62,'Gosc')
INTO Mecze_Druzyny (ID_Druzyny, ID_Meczu, Typ_Druzyny) VALUES (4,63,'Gosc')
INTO Mecze_Druzyny (ID_Druzyny, ID_Meczu, Typ_Druzyny) VALUES (5,64,'Gosc')
INTO Mecze_Druzyny (ID_Druzyny, ID_Meczu, Typ_Druzyny) VALUES (7,65,'Gosc')
INTO Mecze_Druzyny (ID_Druzyny, ID_Meczu, Typ_Druzyny) VALUES (1,66,'Gosc')

INTO Mecze_Druzyny (ID_Druzyny, ID_Meczu, Typ_Druzyny) VALUES (10,72,'Gospodarz')--8 kolejka
INTO Mecze_Druzyny (ID_Druzyny, ID_Meczu, Typ_Druzyny) VALUES (1,73,'Gospodarz')
INTO Mecze_Druzyny (ID_Druzyny, ID_Meczu, Typ_Druzyny) VALUES (2,74,'Gospodarz')
INTO Mecze_Druzyny (ID_Druzyny, ID_Meczu, Typ_Druzyny) VALUES (5,75,'Gospodarz')
INTO Mecze_Druzyny (ID_Druzyny, ID_Meczu, Typ_Druzyny) VALUES (4,76,'Gospodarz')
INTO Mecze_Druzyny (ID_Druzyny, ID_Meczu, Typ_Druzyny) VALUES (8,72,'Gosc')
INTO Mecze_Druzyny (ID_Druzyny, ID_Meczu, Typ_Druzyny) VALUES (3,73,'Gosc')
INTO Mecze_Druzyny (ID_Druzyny, ID_Meczu, Typ_Druzyny) VALUES (9,74,'Gosc')
INTO Mecze_Druzyny (ID_Druzyny, ID_Meczu, Typ_Druzyny) VALUES (6,75,'Gosc')
INTO Mecze_Druzyny (ID_Druzyny, ID_Meczu, Typ_Druzyny) VALUES (7,76,'Gosc')

INTO Mecze_Druzyny (ID_Druzyny, ID_Meczu, Typ_Druzyny) VALUES (7,82,'Gospodarz')--9 kolejka
INTO Mecze_Druzyny (ID_Druzyny, ID_Meczu, Typ_Druzyny) VALUES (3,83,'Gospodarz')
INTO Mecze_Druzyny (ID_Druzyny, ID_Meczu, Typ_Druzyny) VALUES (8,84,'Gospodarz')
INTO Mecze_Druzyny (ID_Druzyny, ID_Meczu, Typ_Druzyny) VALUES (9,85,'Gospodarz')
INTO Mecze_Druzyny (ID_Druzyny, ID_Meczu, Typ_Druzyny) VALUES (6,86,'Gospodarz')
INTO Mecze_Druzyny (ID_Druzyny, ID_Meczu, Typ_Druzyny) VALUES (5,82,'Gosc')
INTO Mecze_Druzyny (ID_Druzyny, ID_Meczu, Typ_Druzyny) VALUES (10,83,'Gosc')
INTO Mecze_Druzyny (ID_Druzyny, ID_Meczu, Typ_Druzyny) VALUES (4,84,'Gosc')
INTO Mecze_Druzyny (ID_Druzyny, ID_Meczu, Typ_Druzyny) VALUES (1,85,'Gosc')
INTO Mecze_Druzyny (ID_Druzyny, ID_Meczu, Typ_Druzyny) VALUES (2,86,'Gosc')

INTO Mecze_Druzyny (ID_Druzyny, ID_Meczu, Typ_Druzyny) VALUES (7,92,'Gospodarz')--10 kolejka
INTO Mecze_Druzyny (ID_Druzyny, ID_Meczu, Typ_Druzyny) VALUES (3,93,'Gospodarz')
INTO Mecze_Druzyny (ID_Druzyny, ID_Meczu, Typ_Druzyny) VALUES (6,94,'Gospodarz')
INTO Mecze_Druzyny (ID_Druzyny, ID_Meczu, Typ_Druzyny) VALUES (4,95,'Gospodarz')
INTO Mecze_Druzyny (ID_Druzyny, ID_Meczu, Typ_Druzyny) VALUES (9,96,'Gospodarz')
INTO Mecze_Druzyny (ID_Druzyny, ID_Meczu, Typ_Druzyny) VALUES (2,92,'Gosc')
INTO Mecze_Druzyny (ID_Druzyny, ID_Meczu, Typ_Druzyny) VALUES (8,93,'Gosc')
INTO Mecze_Druzyny (ID_Druzyny, ID_Meczu, Typ_Druzyny) VALUES (1,94,'Gosc')
INTO Mecze_Druzyny (ID_Druzyny, ID_Meczu, Typ_Druzyny) VALUES (5,95,'Gosc')
INTO Mecze_Druzyny (ID_Druzyny, ID_Meczu, Typ_Druzyny) VALUES (10,96,'Gosc')

INTO Mecze_Druzyny (ID_Druzyny, ID_Meczu, Typ_Druzyny) VALUES (10,102,'Gospodarz')--11 kolejka
INTO Mecze_Druzyny (ID_Druzyny, ID_Meczu, Typ_Druzyny) VALUES (3,103,'Gospodarz')
INTO Mecze_Druzyny (ID_Druzyny, ID_Meczu, Typ_Druzyny) VALUES (8,104,'Gospodarz')
INTO Mecze_Druzyny (ID_Druzyny, ID_Meczu, Typ_Druzyny) VALUES (1,105,'Gospodarz')
INTO Mecze_Druzyny (ID_Druzyny, ID_Meczu, Typ_Druzyny) VALUES (2,106,'Gospodarz')
INTO Mecze_Druzyny (ID_Druzyny, ID_Meczu, Typ_Druzyny) VALUES (6,102,'Gosc')
INTO Mecze_Druzyny (ID_Druzyny, ID_Meczu, Typ_Druzyny) VALUES (4,103,'Gosc')
INTO Mecze_Druzyny (ID_Druzyny, ID_Meczu, Typ_Druzyny) VALUES (9,104,'Gosc')
INTO Mecze_Druzyny (ID_Druzyny, ID_Meczu, Typ_Druzyny) VALUES (7,105,'Gosc')
INTO Mecze_Druzyny (ID_Druzyny, ID_Meczu, Typ_Druzyny) VALUES (5,106,'Gosc')

INTO Mecze_Druzyny (ID_Druzyny, ID_Meczu, Typ_Druzyny) VALUES (9,112,'Gospodarz')--12 kolejka
INTO Mecze_Druzyny (ID_Druzyny, ID_Meczu, Typ_Druzyny) VALUES (7,113,'Gospodarz')
INTO Mecze_Druzyny (ID_Druzyny, ID_Meczu, Typ_Druzyny) VALUES (5,114,'Gospodarz')
INTO Mecze_Druzyny (ID_Druzyny, ID_Meczu, Typ_Druzyny) VALUES (4,115,'Gospodarz')
INTO Mecze_Druzyny (ID_Druzyny, ID_Meczu, Typ_Druzyny) VALUES (6,116,'Gospodarz')
INTO Mecze_Druzyny (ID_Druzyny, ID_Meczu, Typ_Druzyny) VALUES (3,112,'Gosc')
INTO Mecze_Druzyny (ID_Druzyny, ID_Meczu, Typ_Druzyny) VALUES (10,113,'Gosc')
INTO Mecze_Druzyny (ID_Druzyny, ID_Meczu, Typ_Druzyny) VALUES (1,114,'Gosc')
INTO Mecze_Druzyny (ID_Druzyny, ID_Meczu, Typ_Druzyny) VALUES (2,115,'Gosc')
INTO Mecze_Druzyny (ID_Druzyny, ID_Meczu, Typ_Druzyny) VALUES (8,116,'Gosc')

INTO Mecze_Druzyny (ID_Druzyny, ID_Meczu, Typ_Druzyny) VALUES (9,122,'Gospodarz')--13 kolejka
INTO Mecze_Druzyny (ID_Druzyny, ID_Meczu, Typ_Druzyny) VALUES (3,123,'Gospodarz')
INTO Mecze_Druzyny (ID_Druzyny, ID_Meczu, Typ_Druzyny) VALUES (8,124,'Gospodarz')
INTO Mecze_Druzyny (ID_Druzyny, ID_Meczu, Typ_Druzyny) VALUES (1,125,'Gospodarz')
INTO Mecze_Druzyny (ID_Druzyny, ID_Meczu, Typ_Druzyny) VALUES (10,126,'Gospodarz')
INTO Mecze_Druzyny (ID_Druzyny, ID_Meczu, Typ_Druzyny) VALUES (4,122,'Gosc')
INTO Mecze_Druzyny (ID_Druzyny, ID_Meczu, Typ_Druzyny) VALUES (6,123,'Gosc')
INTO Mecze_Druzyny (ID_Druzyny, ID_Meczu, Typ_Druzyny) VALUES (7,124,'Gosc')
INTO Mecze_Druzyny (ID_Druzyny, ID_Meczu, Typ_Druzyny) VALUES (2,125,'Gosc')
INTO Mecze_Druzyny (ID_Druzyny, ID_Meczu, Typ_Druzyny) VALUES (5,126,'Gosc')

INTO Mecze_Druzyny (ID_Druzyny, ID_Meczu, Typ_Druzyny) VALUES (6,132,'Gospodarz')--14 kolejka
INTO Mecze_Druzyny (ID_Druzyny, ID_Meczu, Typ_Druzyny) VALUES (7,133,'Gospodarz')
INTO Mecze_Druzyny (ID_Druzyny, ID_Meczu, Typ_Druzyny) VALUES (5,134,'Gospodarz')
INTO Mecze_Druzyny (ID_Druzyny, ID_Meczu, Typ_Druzyny) VALUES (4,135,'Gospodarz')
INTO Mecze_Druzyny (ID_Druzyny, ID_Meczu, Typ_Druzyny) VALUES (2,136,'Gospodarz')
INTO Mecze_Druzyny (ID_Druzyny, ID_Meczu, Typ_Druzyny) VALUES (9,132,'Gosc')
INTO Mecze_Druzyny (ID_Druzyny, ID_Meczu, Typ_Druzyny) VALUES (3,133,'Gosc')
INTO Mecze_Druzyny (ID_Druzyny, ID_Meczu, Typ_Druzyny) VALUES (8,134,'Gosc')
INTO Mecze_Druzyny (ID_Druzyny, ID_Meczu, Typ_Druzyny) VALUES (1,135,'Gosc')
INTO Mecze_Druzyny (ID_Druzyny, ID_Meczu, Typ_Druzyny) VALUES (10,136,'Gosc')

INTO Mecze_Druzyny (ID_Druzyny, ID_Meczu, Typ_Druzyny) VALUES (10,142,'Gospodarz')--15 kolejka
INTO Mecze_Druzyny (ID_Druzyny, ID_Meczu, Typ_Druzyny) VALUES (6,143,'Gospodarz')
INTO Mecze_Druzyny (ID_Druzyny, ID_Meczu, Typ_Druzyny) VALUES (9,144,'Gospodarz')
INTO Mecze_Druzyny (ID_Druzyny, ID_Meczu, Typ_Druzyny) VALUES (8,145,'Gospodarz')
INTO Mecze_Druzyny (ID_Druzyny, ID_Meczu, Typ_Druzyny) VALUES (3,146,'Gospodarz')
INTO Mecze_Druzyny (ID_Druzyny, ID_Meczu, Typ_Druzyny) VALUES (1,142,'Gosc')
INTO Mecze_Druzyny (ID_Druzyny, ID_Meczu, Typ_Druzyny) VALUES (4,143,'Gosc')
INTO Mecze_Druzyny (ID_Druzyny, ID_Meczu, Typ_Druzyny) VALUES (7,144,'Gosc')
INTO Mecze_Druzyny (ID_Druzyny, ID_Meczu, Typ_Druzyny) VALUES (2,145,'Gosc')
INTO Mecze_Druzyny (ID_Druzyny, ID_Meczu, Typ_Druzyny) VALUES (5,146,'Gosc')

INTO Mecze_Druzyny (ID_Druzyny, ID_Meczu, Typ_Druzyny) VALUES (2,152,'Gospodarz')--16 kolejka
INTO Mecze_Druzyny (ID_Druzyny, ID_Meczu, Typ_Druzyny) VALUES (4,153,'Gospodarz')
INTO Mecze_Druzyny (ID_Druzyny, ID_Meczu, Typ_Druzyny) VALUES (5,154,'Gospodarz')
INTO Mecze_Druzyny (ID_Druzyny, ID_Meczu, Typ_Druzyny) VALUES (7,155,'Gospodarz')
INTO Mecze_Druzyny (ID_Druzyny, ID_Meczu, Typ_Druzyny) VALUES (1,156,'Gospodarz')
INTO Mecze_Druzyny (ID_Druzyny, ID_Meczu, Typ_Druzyny) VALUES (3,152,'Gosc')
INTO Mecze_Druzyny (ID_Druzyny, ID_Meczu, Typ_Druzyny) VALUES (10,153,'Gosc')
INTO Mecze_Druzyny (ID_Druzyny, ID_Meczu, Typ_Druzyny) VALUES (9,154,'Gosc')
INTO Mecze_Druzyny (ID_Druzyny, ID_Meczu, Typ_Druzyny) VALUES (6,155,'Gosc')
INTO Mecze_Druzyny (ID_Druzyny, ID_Meczu, Typ_Druzyny) VALUES (8,156,'Gosc')

INTO Mecze_Druzyny (ID_Druzyny, ID_Meczu, Typ_Druzyny) VALUES (8,162,'Gospodarz')--17 kolejka
INTO Mecze_Druzyny (ID_Druzyny, ID_Meczu, Typ_Druzyny) VALUES (3,163,'Gospodarz')
INTO Mecze_Druzyny (ID_Druzyny, ID_Meczu, Typ_Druzyny) VALUES (9,164,'Gospodarz')
INTO Mecze_Druzyny (ID_Druzyny, ID_Meczu, Typ_Druzyny) VALUES (6,165,'Gospodarz')
INTO Mecze_Druzyny (ID_Druzyny, ID_Meczu, Typ_Druzyny) VALUES (7,166,'Gospodarz')
INTO Mecze_Druzyny (ID_Druzyny, ID_Meczu, Typ_Druzyny) VALUES (10,162,'Gosc')
INTO Mecze_Druzyny (ID_Druzyny, ID_Meczu, Typ_Druzyny) VALUES (1,163,'Gosc')
INTO Mecze_Druzyny (ID_Druzyny, ID_Meczu, Typ_Druzyny) VALUES (2,164,'Gosc')
INTO Mecze_Druzyny (ID_Druzyny, ID_Meczu, Typ_Druzyny) VALUES (5,165,'Gosc')
INTO Mecze_Druzyny (ID_Druzyny, ID_Meczu, Typ_Druzyny) VALUES (4,166,'Gosc')

INTO Mecze_Druzyny (ID_Druzyny, ID_Meczu, Typ_Druzyny) VALUES (5,172,'Gospodarz')--18 kolejka
INTO Mecze_Druzyny (ID_Druzyny, ID_Meczu, Typ_Druzyny) VALUES (10,173,'Gospodarz')
INTO Mecze_Druzyny (ID_Druzyny, ID_Meczu, Typ_Druzyny) VALUES (4,174,'Gospodarz')
INTO Mecze_Druzyny (ID_Druzyny, ID_Meczu, Typ_Druzyny) VALUES (1,175,'Gospodarz')
INTO Mecze_Druzyny (ID_Druzyny, ID_Meczu, Typ_Druzyny) VALUES (2,176,'Gospodarz')
INTO Mecze_Druzyny (ID_Druzyny, ID_Meczu, Typ_Druzyny) VALUES (7,172,'Gosc')
INTO Mecze_Druzyny (ID_Druzyny, ID_Meczu, Typ_Druzyny) VALUES (3,173,'Gosc')
INTO Mecze_Druzyny (ID_Druzyny, ID_Meczu, Typ_Druzyny) VALUES (8,174,'Gosc')
INTO Mecze_Druzyny (ID_Druzyny, ID_Meczu, Typ_Druzyny) VALUES (9,175,'Gosc')
INTO Mecze_Druzyny (ID_Druzyny, ID_Meczu, Typ_Druzyny) VALUES (6,176,'Gosc')

SELECT * FROM DUAL;

INSERT ALL   --Real Madryt Goals
INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (54,2508,2,01)--1 kolejka
INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (55,2511,2,11)
INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (56,2508,2,43)
INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (57,2508,2,52)

INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (58,2500,16,78)--2 kolejka
INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (59,2506,16,90)
INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (60,2510,16,22)

INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (61,2508,25,38)--3 kolejka
INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (62,2509,25,79)
INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (63,2509,25,08)

INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (64,2509,35,58)--4 kolejka

INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (65,2508,46,07)
INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (66,2508,46,13)--5 kolejka

INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (67,2504,55,91)
INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (68,2505,55,02)--6 kolejka
INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (69,2505,55,06)
INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (70,2508,55,18)

INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (71,2510,62,28)
INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (72,2511,62,73)
INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (73,2508,62,03)--7 kolejka
INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (74,2506,62,18)
INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (75,2507,62,23)
INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (76,2508,62,24)
INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (77,2509,62,56)
INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (78,2511,62,65)

INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (79,2499,74,78)
INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (80,2501,74,80)
INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (81,2502,74,15)--8 kolejka
INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (82,2508,74,20)

INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (83,2509,86,35)
INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (84,2509,86,84)
INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (85,2510,86,78)--9 kolejka

INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (86,2508,92,05)--11 kolejka
INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (87,2511,92,14)

INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (88,2509,106,86)
INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (89,2507,106,78)--12 kolejka

INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (90,2507,115,79)
INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (91,2506,115,05)--13 kolejka
INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (92,2505,115,78)

INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (93,2505,125,18)--14 kolejka
INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (94,2509,125,28)
INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (95,2508,125,35)

INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (96,2508,136,08)--15 kolejka
INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (97,2510,136,09)
INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (98,2511,136,15)

INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (99,2499,145,36)--16 kolejka
INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (100,2500,145,47)
INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (101,2502,145,56)

INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (102,2503,152,78)
INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (103,2508,152,58)--17 kolejka
INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (104,2511,152,78)

INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (105,2509,164,22)

INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (106,2508,176,78)--18 kolejka
SELECT * FROM DUAL;


INSERT ALL   --Sevilla Goals
INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (107,2489,3,01)--1 kolejka
INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (108,2496,3,11)

INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (109,2496,13,43)
INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (110,2497,13,52)
INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (111,2492,13,78)--2 kolejka
INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (112,2492,13,90)

INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (113,2496,22,22)
INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (114,2495,22,38)--3 kolejka

INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (115,2495,33,79)
INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (116,2495,33,08)
INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (117,2492,33,58)--4 kolejka

INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (118,2491,43,07)
INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (119,2488,43,13)--5 kolejka

INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (120,2489,56,91)
INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (121,2490,56,02)--6 kolejka
INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (122,2490,56,06)
INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (123,2491,56,18)

INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (124,2485,62,28)
INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (125,2486,62,73)
INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (126,2496,62,03)--7 kolejka
INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (127,2496,62,18)
INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (128,2489,62,23)

INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (129,2490,73,24)
INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (130,2490,73,56)
INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (131,2496,73,65)--8 kolejka
INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (132,2495,73,78)

INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (133,2494,83,80)
INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (134,2494,83,15)
INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (135,2493,83,20)--9 kolejka
INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (136,2492,83,35)

INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (137,2493,93,84)
INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (138,2496,93,78)--10 kolejka
INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (139,2489,93,05)
INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (140,2488,93,14)

INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (141,2489,103,86)
INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (142,2494,103,78)--11 kolejka

INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (143,2493,112,79)
INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (144,2493,112,05)--12 kolejka
INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (145,2492,112,78)

INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (146,2490,123,18)--13 kolejka
INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (147,2496,123,28)
INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (148,2495,123,35)

INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (149,2492,133,08)--14 kolejka
INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (150,2492,133,09)
INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (151,2493,133,15)

INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (152,2494,146,36)--15 kolejka
INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (153,2495,146,47)
INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (154,2496,146,56)

INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (155,2488,152,78)
INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (156,2482,152,58)--16 kolejka
INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (157,2486,152,78)

INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (158,2496,163,22)
INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (159,2487,163,78)--17 kolejka
SELECT * FROM DUAL;





INSERT ALL   --Valencia CF Goals
INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (160,2470,5,01)--1 kolejka
INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (161,2481,5,11)
INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (162,2481,5,52)

INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (163,2471,13,78)--2 kolejka
INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (164,2472,13,90)

INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (165,2472,25,22)
INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (166,2475,25,38)--3 kolejka
INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (167,2476,25,79)

INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (168,2477,32,58)--4 kolejka

INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (169,2478,45,07)
INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (170,2479,45,13)
INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (171,2480,45,91)
INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (172,2480,45,02)--6 kolejka
INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (173,2481,45,06)
INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (174,2481,45,18)

INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (175,2470,63,73)
INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (176,2476,63,03)--7 kolejka
INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (177,2477,63,18)

INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (178,2477,76,24)--8 kolejka
INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (179,2477,76,56)

INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (180,2478,95,65)--10 kolejka
INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (181,2478,95,78)
INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (182,2479,95,80)
INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (183,2481,95,15)
INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (184,2481,95,20)

INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (185,2480,103,35)--11 kolejka

INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (186,2477,115,84)
INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (187,2476,115,78)--12 kolejka
INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (188,2476,115,05)
INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (189,2481,115,14)

INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (190,2480,122,86)
INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (191,2479,122,78)--13 kolejka

INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (192,2479,135,05)--14 kolejka
INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (193,2478,135,78)

INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (194,2480,143,18)--15 kolejka
INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (195,2481,143,28)
INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (196,2477,143,35)
INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (197,2475,143,08)
INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (198,2474,143,15)

INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (199,2480,153,36)--16 kolejka
INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (200,2481,153,47)

INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (201,2479,166,56)
INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (202,2477,166,78)
INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (203,2478,166,58)--17 kolejka

INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (204,2479,174,78)
INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (205,2480,174,22)
INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (206,2477,174,78)--18 kolejka
SELECT * FROM DUAL;




INSERT ALL   --Villareal  Goals
INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (207,2455,5,01)--1 kolejka
INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (208,2466,5,11)
INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (209,2465,5,52)

INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (210,2465,16,78)--2 kolejka
INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (211,2465,16,90)

INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (212,2465,24,22)
INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (213,2464,24,38)--3 kolejka
INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (214,2463,24,79)

INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (215,2460,36,58)--4 kolejka

INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (216,2460,44,07)
INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (217,2459,44,13)
INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (218,2458,44,91)
INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (219,2457,44,02)--6 kolejka
INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (220,2464,44,06)
INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (221,2464,44,18)

INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (222,2463,64,73)
INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (223,2466,64,03)--7 kolejka
INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (224,2465,64,18)

INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (225,2460,75,24)--8 kolejka
INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (226,2459,75,56)

INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (227,2458,95,65)--10 kolejka
INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (228,2457,95,78)
INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (229,2456,95,80)
INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (230,2455,95,15)
INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (231,2459,95,20)

INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (232,2458,106,35)--11 kolejka

INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (233,2457,114,84)
INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (234,2466,114,78)--12 kolejka
INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (235,2466,114,05)
INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (236,2466,114,14)

INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (237,2465,126,86)
INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (238,2464,126,78)--13 kolejka

INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (239,2463,134,05)--14 kolejka
INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (240,2462,134,78)

INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (241,2461,146,18)--15 kolejka
INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (242,2460,146,28)
INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (243,2463,146,35)
INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (244,2465,146,08)
INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (245,2466,146,15)

INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (246,2465,154,36)--16 kolejka
INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (247,2459,154,47)

INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (248,2455,165,56)
INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (249,2456,165,78)
INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (250,2457,165,58)--17 kolejka

INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (251,2458,172,78)
INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (252,2466,172,22)
INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (253,2465,172,78)--18 kolejka
SELECT * FROM DUAL;



INSERT ALL   --Atletico Madryt  Goals
INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (254,2451,4,01)--1 kolejka
INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (255,2451,4,11)
INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (256,2450,4,52)

INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (257,2449,12,78)--2 kolejka
INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (258,2449,12,90)

INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (259,2451,26,22)
INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (260,2451,26,38)--3 kolejka
INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (261,2440,26,79)

INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (262,2441,33,58)--4 kolejka

INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (263,2449,42,07)
INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (264,2450,42,13)
INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (265,2451,42,91)
INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (266,2447,42,02)--6 kolejka
INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (267,2446,42,06)
INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (268,2447,42,18)

INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (269,2445,65,73)
INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (270,2445,65,03)--7 kolejka
INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (271,2447,65,18)

INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (272,2450,75,24)--8 kolejka
INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (273,2451,75,56)

INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (274,2450,86,65)--9 kolejka
INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (275,2449,86,78)
INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (276,2448,86,80)

INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (277,2448,94,15)
INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (278,2447,94,20)
INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (279,2444,94,35)--10 kolejka

INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (280,2444,102,84)
INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (281,2443,102,78)--11 kolejka
INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (282,2440,102,05)
INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (283,2442,102,14)

INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (284,2450,116,86)
INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (285,2451,116,78)--12 kolejka

INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (286,2449,123,05)--13 kolejka
INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (287,2448,123,78)

INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (288,2447,132,18)--14 kolejka
INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (289,2447,132,28)
INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (290,2448,132,35)
INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (291,2448,132,08)
INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (292,2449,132,15)

INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (293,2450,143,36)--15 kolejka
INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (294,2451,143,47)

INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (295,2449,165,56)
INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (296,2450,165,78)
INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (297,2451,165,58)--16 kolejka

INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (298,2445,176,78)
INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (299,2445,176,22)
INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (300,2444,176,78)--18 kolejka
SELECT * FROM DUAL;



INSERT ALL   --Atlethic Bilbao  Goals
INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (301,2385,2,01)--1 kolejka

INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (302,2391,14,78)--2 kolejka

INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (303,2385,23,22)
INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (304,2386,23,38)--3 kolejka

INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (305,2387,34,58)--4 kolejka

INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (306,2390,54,91)
INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (307,2391,54,02)--6 kolejka
INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (308,2391,54,06)
INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (309,2391,54,18)

INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (310,2387,65,73)
INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (311,2388,65,03)--7 kolejka
INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (312,2388,65,18)

INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (313,2389,76,24)--8 kolejka
INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (314,2387,76,56)

INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (315,2390,82,65)--9 kolejka
INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (316,2390,82,78)
INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (317,2385,82,80)

INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (318,2380,92,35)--10 kolejka

INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (319,2382,105,84)
INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (320,2383,105,78)--11 kolejka
INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (321,2384,105,05)

INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (322,2385,113,86)
INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (323,2386,113,78)--12 kolejka

INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (324,2387,124,05)--13 kolejka
INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (325,2390,124,78)

INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (326,2383,133,18)--14 kolejka
INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (327,2391,133,28)
INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (328,2390,133,35)
INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (329,2391,133,15)

INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (330,2387,144,36)--15 kolejka

INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (331,2385,155,56)
INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (332,2387,155,78)
INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (333,2390,155,58)--16 kolejka


INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (334,2388,172,22)
INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (335,2389,172,78)--18 kolejka
SELECT * FROM DUAL;


INSERT ALL   --Celta de Vigo  Goals
INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (336,2395,3,01)--1 kolejka

INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (337,2406,14,78)--2 kolejka

INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (338,2405,26,22)
INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (339,2405,26,38)--3 kolejka

INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (340,2405,34,58)--4 kolejka

INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (341,2402,66,73)
INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (342,2401,66,03)--7 kolejka
INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (343,2400,66,18)

INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (344,2400,72,24)--8 kolejka
INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (345,2406,72,56)

INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (346,2406,84,65)--9 kolejka
INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (347,2397,84,78)
INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (348,2399,84,80)

INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (349,2399,93,35)--10 kolejka

INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (350,2400,104,84)
INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (351,2406,104,78)--11 kolejka
INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (352,2405,104,05)

INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (353,2404,116,86)
INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (354,2404,116,78)--12 kolejka

INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (355,2403,124,05)--13 kolejka
INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (356,2402,124,78)

INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (357,2401,134,18)--14 kolejka
INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (358,2398,134,28)
INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (359,2398,134,35)
INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (360,2398,134,15)

INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (361,2399,145,56)
INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (362,2402,145,78)
INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (363,2405,145,58)--15 kolejka

INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (364,2406,162,22)
INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (365,2405,162,78)--17 kolejka
SELECT * FROM DUAL;



INSERT ALL   --Eibar  Goals
INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (366,2410,6,01)--1 kolejka

INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (367,2410,15,78)--2 kolejka
INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (368,2410,15,22)
INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (369,2421,15,38)

INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (370,2420,32,58)--4 kolejka

INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (371,2419,64,73)
INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (372,2418,64,03)--7 kolejka
INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (373,2417,64,18)

INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (374,2421,74,24)--8 kolejka
INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (375,2420,74,56)

INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (376,2420,85,65)--9 kolejka
INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (377,2421,85,78)
INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (378,2420,85,80)


INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (379,2415,104,84)
INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (380,2416,104,78)--11 kolejka
INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (381,2417,104,05)

INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (382,2418,112,86)
INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (383,2419,112,78)--12 kolejka


INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (384,2412,132,18)--14 kolejka
INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (385,2413,132,28)
INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (386,2416,132,35)
INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (387,2417,132,15)

INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (388,2420,144,56)
INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (389,2410,144,78)
INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (390,2421,144,58)--15 kolejka

INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (391,2420,164,22)
INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (392,2419,164,78)--17 kolejka
SELECT * FROM DUAL;




INSERT ALL   --Leganes  Goals
INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (393,2436,6,11)--1 kolejka

INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (394,2435,12,28)--2 kolejka
INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (395,2435,12,26)
INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (396,2425,12,38)

INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (397,2425,36,55)--4 kolejka

INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (398,2425,63,70)
INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (399,2435,63,23)--7 kolejka
INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (400,2436,63,19)

INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (401,2436,72,26)--8 kolejka
INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (402,2435,72,26)

INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (403,2435,83,66)--9 kolejka
INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (404,2436,83,79)
INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (405,2427,83,89)

INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (406,2430,102,64)
INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (407,2430,102,88)--11 kolejka
INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (408,2431,102,95)

INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (409,2432,113,86)
INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (410,2433,113,92)--12 kolejka

INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (411,2429,136,18)--14 kolejka
INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (412,2429,136,29)
INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (413,2426,136,36)
INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (414,2426,136,45)

INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (415,2427,142,56)
INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (416,2427,142,78)
INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (417,2436,142,88)--15 kolejka

INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (418,2435,162,26)
INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (419,2434,162,79)--17 kolejka
SELECT * FROM DUAL;






INSERT ALL   --FC Barcelona Goals
INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (1,2374,15,01)--2 kolejka
INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (2,2376,15,11)
INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (3,2370,15,43)
INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (4,2376,15,52)
INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (5,2372,15,78)
INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (6,2376,15,90)

INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (7,2374,24,22)
INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (8,2374,24,38)--3 kolejka
INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (9,2365,24,79)

INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (10,2375,35,08)
INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (11,2375,35,58)--4 kolejka

INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (12,2364,45,07)
INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (13,2374,45,13)--5 kolejka
INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (14,2375,45,91)

INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (15,2374,52,02)--6 kolejka
INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (16,2375,52,06)
INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (17,2374,52,18)
INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (18,2370,52,28)
INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (19,2371,52,73)

INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (20,2374,66,03)--7 kolejka
INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (21,2375,66,18)
INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (22,2372,66,23)
INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (23,2372,66,24)
INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (24,2372,66,56)
INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (25,2373,66,65)
INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (26,2376,66,78)
INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (27,2363,66,80)

INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (28,2374,73,15)--8 kolejka
INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (29,2375,73,20)
INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (30,2374,73,35)
INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (31,2366,73,84)

INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (32,2360,85,78)--9 kolejka

INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (33,2368,105,05)--11 kolejka
INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (34,2369,105,14)
INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (35,2369,105,86)

INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (36,2374,114,78)--12 kolejka
INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (37,2374,114,79)

INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (38,2374,125,05)--13 kolejka
INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (39,2369,125,78)

INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (40,2374,135,18)--14 kolejka
INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (41,2376,135,28)
INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (42,2368,135,35)

INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (43,2374,142,08)--15 kolejka
INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (44,2368,142,09)
INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (45,2362,142,15)
INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (46,2362,142,36)
INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (47,2374,142,47)
INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (48,2375,142,56)

INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (49,2363,156,78)--16 kolejka

INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (50,2360,163,58)--17 kolejka
INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (51,2360,163,78)
INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (52,2369,163,22)

INTO Gol (ID_Bramki, ID_Uzytkownika, ID_Meczu, Minuta)  VALUES (53,2375,175,78)--18 kolejka
SELECT * FROM DUAL;






INSERT ALL--Uzytkownik 100
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(1,100,2,6)--1 kolejka
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(2,100,3,2)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(3,100,4,10)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(4,100,5,9)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(5,100,6,8)

INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(6,100,12,5)--2 kolejka
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(7,100,13,4)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(8,100,14,3)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(9,100,15,10)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(10,100,16,9)

INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(11,100,22,5)--3 kolejka
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(12,100,23,4)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(13,100,24,6)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(14,100,25,7)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(15,100,26,8)

INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(16,100,32,10)--4 kolejka
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(17,100,33,9)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(18,100,34,8)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(19,100,35,7)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(20,100,36,6)

INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(21,100,42,5)--5 kolejka
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(22,100,43,5)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(23,100,44,1)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(24,100,45,2)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(25,100,46,6)

INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(26,100,52,7)--6 kolejka
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(27,100,53,7)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(28,100,54,7)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(29,100,55,7)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(30,100,56,6)

INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(31,100,62,8)--7 kolejka
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(32,100,63,9)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(33,100,64,9)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(34,100,65,10)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(35,100,66,8)

INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(36,100,72,7)--8 kolejka
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(37,100,73,6)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(38,100,74,5)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(39,100,75,4)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(40,100,76,4)

INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(41,100,82,3)--9 kolejka
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(42,100,83,2)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(43,100,84,1)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(44,100,85,1)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(45,100,86,1)

INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(46,100,92,6)--10 kolejka
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(47,100,93,6)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(48,100,94,6)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(49,100,95,6)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(50,100,96,5)

INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(51,100,102,2)--11 kolejka
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(52,100,103,10)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(53,100,104,2)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(54,100,105,9)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(55,100,106,8)

INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(56,100,112,5)--12 kolejka
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(57,100,113,6)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(58,100,114,6)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(59,100,115,3)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(60,100,116,2)

INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(61,100,122,6)--13 kolejka
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(62,100,123,6)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(63,100,124,5)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(64,100,125,6)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(65,100,126,8)

INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(66,100,132,7)--14 kolejka
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(67,100,133,6)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(68,100,134,6)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(69,100,135,2)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(70,100,136,1)

INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(71,100,142,10)--15 kolejka
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(72,100,143,10)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(73,100,144,10)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(74,100,145,10)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(75,100,146,9)

INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(76,100,152,8)--16 kolejka
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(77,100,153,6)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(78,100,154,6)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(79,100,155,5)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(80,100,156,2)

INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(81,100,162,6)--17 kolejka
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(82,100,163,6)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(83,100,164,2)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(84,100,165,4)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(85,100,166,4)

INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(86,100,172,4)--18 kolejka
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(87,100,173,8)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(88,100,174,7)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(89,100,175,6)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(90,100,176,5)
SELECT * FROM DUAL;



INSERT ALL--Uzytkownik 101
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(91,101,2,2)--1 kolejka
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(92,101,3,6)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(93,101,4,10)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(94,101,5,8)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(95,101,6,7)

INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(96,101,12,2)--2 kolejka
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(97,101,13,6)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(98,101,14,9)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(99,101,15,1)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(100,101,16,2)

INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(101,101,22,5)--3 kolejka
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(102,101,23,6)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(103,101,24,6)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(104,101,25,7)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(105,101,26,8)

INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(106,101,32,9)--4 kolejka
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(107,101,33,5)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(108,101,34,4)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(109,101,35,2)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(110,101,36,1)

INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(111,101,42,6)--5 kolejka
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(112,101,43,8)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(113,101,44,9)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(114,101,45,1)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(115,101,46,10)

INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(116,101,52,10)--6 kolejka
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(117,101,53,6)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(118,101,54,5)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(119,101,55,7)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(120,101,56,6)

INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(121,101,62,8)--7 kolejka
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(122,101,63,9)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(123,101,64,9)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(124,101,65,10)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(125,101,66,8)

INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(126,101,72,7)--8 kolejka
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(127,101,73,6)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(128,101,74,5)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(129,101,75,4)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(130,101,76,4)

INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(131,101,82,3)--9 kolejka
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(132,101,83,2)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(133,101,84,1)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(134,101,85,1)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(135,101,86,1)

INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(136,101,92,6)--10 kolejka
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(137,101,93,6)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(138,101,94,6)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(139,101,95,5)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(140,101,96,4)

INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(141,101,102,2)--11 kolejka
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(142,101,103,10)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(143,101,104,2)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(144,101,105,6)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(145,101,106,8)

INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(146,101,112,9)--12 kolejka
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(147,101,113,1)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(148,101,114,1)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(149,101,115,1)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(150,101,116,1)

INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(151,101,122,10)--13 kolejka
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(152,101,123,10)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(153,101,124,10)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(154,101,125,9)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(155,101,126,8)

INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(156,101,132,6)--14 kolejka
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(157,101,133,5)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(158,101,134,2)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(159,101,135,3)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(160,101,136,4)

INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(161,101,142,6)--15 kolejka
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(162,101,143,10)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(163,101,144,9)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(164,101,145,8)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(165,101,146,2)

INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(166,101,152,5)--16 kolejka
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(167,101,153,6)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(168,101,154,2)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(169,101,155,1)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(170,101,156,10)

INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(171,101,162,4)--17 kolejka
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(172,101,163,3)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(173,101,164,2)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(174,101,165,6)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(175,101,166,5)

INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(176,101,172,8)--18 kolejka
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(177,101,173,9)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(178,101,174,7)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(179,101,175,2)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(180,101,176,4)
SELECT * FROM DUAL;


INSERT ALL--Uzytkownik 102
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(181,102,2,8)--1 kolejka
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(182,102,3,5)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(183,102,4,1)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(184,102,5,6)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(185,102,6,2)

INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(186,102,12,2)--2 kolejka
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(187,102,13,2)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(188,102,14,2)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(189,102,15,2)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(190,102,16,2)

INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(191,102,22,5)--3 kolejka
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(192,102,23,5)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(193,102,24,5)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(194,102,25,6)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(195,102,26,7)

INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(196,102,32,8)--4 kolejka
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(197,102,33,4)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(198,102,34,3)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(199,102,35,1)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(200,102,36,10)

INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(201,102,42,2)--5 kolejka
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(202,102,43,5)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(203,102,44,5)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(204,102,45,6)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(205,102,46,6)

INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(206,102,52,10)--6 kolejka
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(207,102,53,10)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(208,102,54,10)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(209,102,55,10)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(210,102,56,9)

INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(211,102,62,8)--7 kolejka
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(212,102,63,7)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(213,102,64,7)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(214,102,65,6)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(215,102,66,1)

INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(216,102,72,1)--8 kolejka
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(217,102,73,1)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(218,102,74,1)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(219,102,75,2)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(220,102,76,4)

INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(221,102,82,8)--9 kolejka
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(222,102,83,8)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(223,102,84,6)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(224,102,85,5)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(225,102,86,1)

INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(226,102,92,6)--10 kolejka
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(227,102,93,6)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(228,102,94,6)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(229,102,95,5)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(230,102,96,4)

INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(231,102,102,2)--11 kolejka
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(232,102,103,10)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(233,102,104,2)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(234,102,105,6)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(235,102,106,8)

INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(236,102,112,9)--12 kolejka
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(237,102,113,1)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(238,102,114,1)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(239,102,115,1)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(240,102,116,1)

INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(241,102,122,10)--13 kolejka
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(242,102,123,2)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(243,102,124,3)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(244,102,125,5)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(245,102,126,6)

INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(246,102,132,7)--14 kolejka
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(247,102,133,8)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(248,102,134,9)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(249,102,135,10)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(250,102,136,1)

INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(251,102,142,6)--15 kolejka
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(252,102,143,10)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(253,102,144,9)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(254,102,145,8)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(255,102,146,1)

INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(256,102,152,10)--16 kolejka
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(257,102,153,10)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(258,102,154,1)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(259,102,155,2)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(260,102,156,6)

INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(261,102,162,7)--17 kolejka
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(262,102,163,8)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(263,102,164,9)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(264,102,165,1)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(265,102,166,2)

INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(266,102,172,8)--18 kolejka
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(267,102,173,9)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(268,102,174,7)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(269,102,175,2)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(270,102,176,4)
SELECT * FROM DUAL;




INSERT ALL--Uzytkownik 103
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(271,103,2,8)--1 kolejka
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(272,103,3,4)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(273,103,4,1)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(274,103,5,6)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(275,103,6,2)

INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(276,103,12,10)--2 kolejka
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(277,103,13,10)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(278,103,14,8)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(279,103,15,9)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(280,103,16,6)

INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(281,103,22,5)--3 kolejka
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(282,103,23,2)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(283,103,24,1)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(284,103,25,10)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(285,103,26,8)

INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(286,103,32,9)--4 kolejka
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(287,103,33,9)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(288,103,34,6)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(289,103,35,7)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(290,103,36,1)

INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(291,103,42,1)--5 kolejka
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(292,103,43,1)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(293,103,44,1)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(294,103,45,2)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(295,103,46,2)

INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(296,103,52,2)--6 kolejka
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(297,103,53,2)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(298,103,54,3)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(299,103,55,4)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(300,103,56,5)

INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(301,103,62,8)--7 kolejka
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(302,103,63,9)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(303,103,64,9)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(304,103,65,9)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(305,103,66,9)

INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(306,103,72,8)--8 kolejka
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(307,103,73,5)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(308,103,74,6)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(309,103,75,2)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(310,103,76,4)

INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(311,103,82,7)--9 kolejka
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(312,103,83,8)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(313,103,84,2)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(314,103,85,1)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(315,103,86,1)

INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(316,103,92,9)--10 kolejka
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(317,103,93,6)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(318,103,94,10)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(319,103,95,10)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(320,103,96,5)

INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(321,103,102,5)--11 kolejka
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(322,103,103,5)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(323,103,104,3)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(324,103,105,6)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(325,103,106,8)

INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(326,103,112,9)--12 kolejka
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(327,103,113,9)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(328,103,114,9)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(329,103,115,8)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(330,103,116,7)

INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(331,103,122,6)--13 kolejka
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(332,103,123,5)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(333,103,124,4)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(334,103,125,5)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(335,103,126,2)

INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(336,103,132,4)--14 kolejka
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(337,103,133,8)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(338,103,134,9)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(339,103,135,10)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(340,103,136,1)

INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(341,103,142,6)--15 kolejka
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(342,103,143,10)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(343,103,144,9)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(344,103,145,8)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(345,103,146,1)

INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(346,103,152,10)--16 kolejka
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(347,103,153,10)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(348,103,154,1)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(349,103,155,2)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(350,103,156,2)

INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(351,103,162,5)--17 kolejka
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(352,103,163,8)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(353,103,164,9)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(354,103,165,1)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(355,103,166,2)

INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(356,103,172,6)--18 kolejka
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(357,103,173,9)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(358,103,174,2)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(359,103,175,2)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(360,103,176,10)
SELECT * FROM DUAL;



INSERT ALL--Uzytkownik 104
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(361,104,2,5)--1 kolejka
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(362,104,3,2)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(363,104,4,6)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(364,104,5,3)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(365,104,6,8)

INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(366,104,12,10)--2 kolejka
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(367,104,13,10)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(368,104,14,8)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(369,104,15,9)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(370,104,16,6)

INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(371,104,22,5)--3 kolejka
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(372,104,23,2)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(373,104,24,1)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(374,104,25,10)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(375,104,26,8)

INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(376,104,32,9)--4 kolejka
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(377,104,33,9)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(378,104,34,6)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(379,104,35,7)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(380,104,36,1)

INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(381,104,42,1)--5 kolejka
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(382,104,43,2)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(383,104,44,6)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(384,104,45,2)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(385,104,46,10)

INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(386,104,52,8)--6 kolejka
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(387,104,53,9)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(388,104,54,6)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(389,104,55,7)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(390,104,56,2)

INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(391,104,62,6)--7 kolejka
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(392,104,63,5)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(393,104,64,4)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(394,104,65,3)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(395,104,66,2)

INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(396,104,72,1)--8 kolejka
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(397,104,73,4)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(398,104,74,7)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(399,104,75,8)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(400,104,76,9)

INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(401,104,82,9)--9 kolejka
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(402,104,83,9)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(403,104,84,10)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(404,104,85,2)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(405,104,86,2)

INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(406,104,92,9)--10 kolejka
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(407,104,93,6)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(408,104,94,10)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(409,104,95,10)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(410,104,96,5)

INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(411,104,102,5)--11 kolejka
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(412,104,103,5)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(413,104,104,3)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(414,104,105,6)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(415,104,106,5)

INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(416,104,112,6)--12 kolejka
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(417,104,113,5)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(418,104,114,4)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(419,104,115,7)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(420,104,116,8)

INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(431,104,122,8)--13 kolejka
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(432,104,123,5)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(433,104,124,9)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(434,104,125,5)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(435,104,126,2)

INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(436,104,132,1)--14 kolejka
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(437,104,133,8)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(438,104,134,10)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(439,104,135,10)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(440,104,136,2)

INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(441,104,142,6)--15 kolejka
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(442,104,143,10)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(443,104,144,9)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(444,104,145,8)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(445,104,146,8)

INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(446,104,152,1)--16 kolejka
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(447,104,153,2)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(448,104,154,10)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(449,104,155,5)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(450,104,156,8)

INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(451,104,162,7)--17 kolejka
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(452,104,163,7)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(453,104,164,7)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(454,104,165,7)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(455,104,166,6)

INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(456,104,172,2)--18 kolejka
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(457,104,173,4)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(458,104,174,2)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(459,104,175,2)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(460,104,176,9)
SELECT * FROM DUAL;


INSERT ALL--Uzytkownik 105
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(501,105,2,1)--1 kolejka
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(502,105,3,8)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(503,105,4,9)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(504,105,5,4)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(505,105,6,6)

INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(506,105,12,4)--2 kolejka
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(507,105,13,2)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(508,105,14,6)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(509,105,15,8)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(510,105,16,10)

INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(511,105,22,6)--3 kolejka
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(512,105,23,2)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(513,105,24,3)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(514,105,25,4)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(515,105,26,8)

INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(516,105,32,7)--4 kolejka
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(517,105,33,7)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(518,105,34,7)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(519,105,35,6)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(520,105,36,8)

INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(521,105,42,10)--5 kolejka
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(522,105,43,9)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(523,105,44,10)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(524,105,45,1)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(525,105,46,5)

INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(526,105,52,7)--6 kolejka
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(527,105,53,7)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(528,105,54,7)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(529,105,55,7)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(530,105,56,6)

INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(531,105,62,8)--7 kolejka
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(532,105,63,9)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(533,105,64,9)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(534,105,65,10)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(535,105,66,8)

INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(536,105,72,7)--8 kolejka
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(537,105,73,5)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(538,105,74,2)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(539,105,75,8)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(540,105,76,9)

INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(541,105,82,10)--9 kolejka
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(542,105,83,4)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(543,105,84,8)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(544,105,85,8)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(545,105,86,9)

INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(546,105,92,7)--10 kolejka
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(547,105,93,7)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(548,105,94,7)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(549,105,95,7)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(550,105,96,7)

INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(551,105,102,7)--11 kolejka
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(552,105,103,7)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(553,105,104,7)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(554,105,105,6)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(555,105,106,8)

INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(556,105,112,4)--12 kolejka
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(557,105,113,4)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(558,105,114,3)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(559,105,115,6)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(560,105,116,6)

INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(561,105,122,8)--13 kolejka
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(562,105,123,5)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(563,105,124,9)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(564,105,125,7)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(565,105,126,10)

INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(566,105,132,8)--14 kolejka
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(567,105,133,4)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(568,105,134,6)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(569,105,135,6)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(570,105,136,2)

INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(571,105,142,1)--15 kolejka
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(572,105,143,8)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(573,105,144,9)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(574,105,145,2)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(575,105,146,10)

INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(576,105,152,2)--16 kolejka
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(577,105,153,6)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(578,105,154,6)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(579,105,155,5)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(580,105,156,2)

INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(581,105,162,6)--17 kolejka
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(582,105,163,6)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(583,105,164,2)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(584,105,165,4)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(585,105,166,4)

INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(586,105,172,4)--18 kolejka
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(587,105,173,8)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(588,105,174,7)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(589,105,175,6)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(590,105,176,5)
SELECT * FROM DUAL;




INSERT ALL--Uzytkownik 106
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(601,106,2,2)--1 kolejka
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(602,106,3,5)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(603,106,4,6)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(604,106,5,2)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(605,106,6,8)

INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(606,106,12,10)--2 kolejka
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(607,106,13,8)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(608,106,14,9)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(609,106,15,6)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(610,106,16,5)

INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(611,106,22,4)--3 kolejka
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(612,106,23,3)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(613,106,24,6)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(614,106,25,7)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(615,106,26,9)

INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(616,106,32,6)--4 kolejka
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(617,106,33,5)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(618,106,34,2)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(619,106,35,1)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(620,106,36,10)

INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(621,106,42,8)--5 kolejka
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(622,106,43,9)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(623,106,44,6)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(624,106,45,2)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(625,106,46,5)

INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(626,106,52,8)--6 kolejka
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(627,106,53,6)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(628,106,54,2)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(629,106,55,1)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(630,106,56,8)

INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(631,106,62,6)--7 kolejka
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(632,106,63,7)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(633,106,64,6)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(634,106,65,1)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(635,106,66,10)

INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(636,106,72,6)--8 kolejka
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(637,106,73,2)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(638,106,74,6)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(639,106,75,8)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(640,106,76,9)

INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(641,106,82,1)--9 kolejka
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(642,106,83,7)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(643,106,84,2)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(644,106,85,6)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(645,106,86,6)

INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(646,106,92,6)--10 kolejka
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(647,106,93,6)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(648,106,94,6)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(649,106,95,6)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(650,106,96,7)

INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(651,106,102,2)--11 kolejka
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(652,106,103,5)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(653,106,104,4)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(654,106,105,3)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(655,106,106,2)

INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(656,106,112,4)--12 kolejka
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(657,106,113,4)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(658,106,114,3)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(659,106,115,6)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(660,106,116,6)

INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(661,106,122,8)--13 kolejka
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(662,106,123,5)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(663,106,124,9)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(664,106,125,4)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(665,106,126,8)

INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(666,106,132,4)--14 kolejka
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(667,106,133,8)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(668,106,134,6)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(669,106,135,1)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(670,106,136,6)

INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(671,106,142,8)--15 kolejka
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(672,106,143,7)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(673,106,144,7)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(674,106,145,8)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(675,106,146,6)

INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(676,106,152,8)--16 kolejka
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(677,106,153,7)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(678,106,154,6)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(679,106,155,5)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(680,106,156,4)

INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(681,106,162,7)--17 kolejka
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(682,106,163,8)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(683,106,164,9)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(684,106,165,10)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(685,106,166,5)

INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(686,106,172,6)--18 kolejka
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(687,106,173,8)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(688,106,174,4)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(689,106,175,3)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(690,106,176,2)
SELECT * FROM DUAL;




INSERT ALL--Uzytkownik 107
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(701,107,2,8)--1 kolejka
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(702,107,3,6)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(703,107,4,7)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(704,107,5,9)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(705,107,6,10)

INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(706,107,12,8)--2 kolejka
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(707,107,13,2)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(708,107,14,5)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(709,107,15,6)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(710,107,16,7)

INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(711,107,22,8)--3 kolejka
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(712,107,23,4)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(713,107,24,2)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(714,107,25,8)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(715,107,26,9)

INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(716,107,32,4)--4 kolejka
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(717,107,33,6)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(718,107,34,10)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(719,107,35,9)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(720,107,36,1)

INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(721,107,42,9)--5 kolejka
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(722,107,43,4)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(723,107,44,7)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(724,107,45,6)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(725,107,46,2)

INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(726,107,52,2)--6 kolejka
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(727,107,53,2)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(728,107,54,2)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(729,107,55,1)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(730,107,56,8)

INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(731,107,62,9)--7 kolejka
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(732,107,63,9)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(733,107,64,9)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(734,107,65,6)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(735,107,66,5)

INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(736,107,72,4)--8 kolejka
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(737,107,73,4)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(738,107,74,5)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(739,107,75,8)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(740,107,76,9)

INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(741,107,82,6)--9 kolejka
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(742,107,83,7)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(743,107,84,8)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(744,107,85,9)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(745,107,86,10)

INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(746,107,92,5)--10 kolejka
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(747,107,93,6)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(748,107,94,7)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(749,107,95,8)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(750,107,96,9)

INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(751,107,102,1)--11 kolejka
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(752,107,103,4)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(753,107,104,5)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(754,107,105,5)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(755,107,106,5)

INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(756,107,112,6)--12 kolejka
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(757,107,113,6)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(758,107,114,6)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(759,107,115,7)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(760,107,116,9)

INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(761,107,122,10)--13 kolejka
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(762,107,123,10)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(763,107,124,8)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(764,107,125,7)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(765,107,126,6)

INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(766,107,132,2)--14 kolejka
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(767,107,133,5)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(768,107,134,4)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(769,107,135,1)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(770,107,136,1)

INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(771,107,142,2)--15 kolejka
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(772,107,143,6)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(773,107,144,6)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(774,107,145,8)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(775,107,146,6)

INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(776,107,152,8)--16 kolejka
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(777,107,153,7)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(778,107,154,6)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(779,107,155,5)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(780,107,156,4)

INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(781,107,162,6)--17 kolejka
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(782,107,163,5)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(783,107,164,4)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(784,107,165,2)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(785,107,166,5)

INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(786,107,172,6)--18 kolejka
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(787,107,173,8)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(788,107,174,4)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(789,107,175,3)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(790,107,176,2)
SELECT * FROM DUAL;



INSERT ALL--Uzytkownik 108
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(801,108,12,8)--1 kolejka
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(802,108,13,6)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(803,108,14,7)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(804,108,15,9)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(805,108,16,10)

INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(806,108,2,8)--2 kolejka
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(807,108,3,2)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(808,108,4,5)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(809,108,5,6)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(810,108,6,7)

INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(811,108,32,8)--3 kolejka
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(812,108,33,4)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(813,108,34,2)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(814,108,35,8)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(815,108,36,9)

INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(816,108,22,4)--4 kolejka
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(817,108,23,6)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(818,108,24,10)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(819,108,25,9)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(820,108,26,1)

INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(821,108,52,9)--5 kolejka
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(822,108,53,4)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(823,108,54,7)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(824,108,55,6)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(825,108,56,2)

INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(826,108,42,2)--6 kolejka
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(827,108,43,2)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(828,108,44,2)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(829,108,45,1)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(830,108,46,8)

INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(831,108,72,9)--7 kolejka
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(832,108,73,9)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(833,108,74,9)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(834,108,75,6)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(835,108,76,5)

INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(836,108,62,4)--8 kolejka
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(837,108,63,4)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(838,108,64,5)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(839,108,65,8)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(840,108,66,9)

INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(841,108,82,6)--9 kolejka
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(842,108,83,7)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(843,108,84,8)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(844,108,85,9)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(845,108,86,10)

INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(846,108,92,5)--10 kolejka
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(847,108,93,6)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(848,108,94,7)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(849,108,95,8)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(850,108,96,9)

INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(851,108,102,1)--11 kolejka
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(852,108,103,4)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(853,108,104,5)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(854,108,105,5)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(855,108,106,5)

INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(856,108,122,6)--12 kolejka
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(857,108,123,6)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(858,108,124,6)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(859,108,125,7)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(860,108,126,9)

INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(861,108,112,10)--13 kolejka
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(862,108,113,10)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(863,108,114,8)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(864,108,115,7)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(865,108,116,6)

INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(866,108,142,2)--14 kolejka
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(867,108,143,5)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(868,108,144,4)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(869,108,145,1)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(870,108,146,1)

INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(871,108,132,2)--15 kolejka
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(872,108,133,6)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(873,108,134,6)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(874,108,135,8)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(875,108,136,6)

INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(876,108,162,8)--16 kolejka
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(877,108,163,7)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(878,108,164,6)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(879,108,165,5)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(880,108,166,4)

INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(881,108,152,6)--17 kolejka
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(882,108,153,5)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(883,108,154,4)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(884,108,155,2)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(885,108,156,5)

INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(886,108,172,6)--18 kolejka
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(887,108,173,8)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(888,108,174,4)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(889,108,175,3)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(890,108,176,2)
SELECT * FROM DUAL;


INSERT ALL--Uzytkownik 109
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(901,109,12,7)--1 kolejka
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(902,109,13,6)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(903,109,14,2)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(904,109,15,9)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(905,109,16,1)

INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(906,109,2,10)--2 kolejka
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(907,109,3,5)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(908,109,4,6)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(909,109,5,8)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(910,109,6,9)

INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(911,109,32,5)--3 kolejka
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(912,109,33,3)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(913,109,34,6)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(914,109,35,7)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(915,109,36,10)

INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(916,109,22,2)--4 kolejka
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(917,109,23,6)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(918,109,24,10)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(919,109,25,9)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(920,109,26,1)

INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(921,109,52,9)--5 kolejka
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(922,109,53,4)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(923,109,54,7)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(924,109,55,6)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(925,109,56,2)

INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(926,109,42,8)--6 kolejka
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(927,109,43,7)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(928,109,44,7)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(929,109,45,6)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(930,109,46,5)

INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(931,109,72,6)--7 kolejka
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(932,109,73,4)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(933,109,74,4)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(934,109,75,2)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(935,109,76,10)

INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(936,109,62,8)--8 kolejka
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(937,109,63,9)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(938,109,64,7)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(939,109,65,6)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(940,109,66,6)

INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(941,109,82,5)--9 kolejka
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(942,109,83,5)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(943,109,84,2)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(944,109,85,2)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(945,109,86,1)

INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(946,109,92,6)--10 kolejka
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(947,109,93,7)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(948,109,94,8)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(949,109,95,9)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(950,109,96,9)

INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(951,109,102,10)--11 kolejka
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(952,109,103,4)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(953,109,104,5)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(954,109,105,6)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(955,109,106,7)

INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(956,109,122,8)--12 kolejka
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(957,109,123,8)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(958,109,124,8)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(959,109,125,9)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(960,109,126,9)

INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(961,109,112,1)--13 kolejka
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(962,109,113,8)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(963,109,114,8)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(964,109,115,6)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(965,109,116,5)

INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(966,109,142,8)--14 kolejka
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(967,109,143,7)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(968,109,144,6)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(969,109,145,5)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(970,109,146,1)

INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(971,109,132,4)--15 kolejka
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(972,109,133,3)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(973,109,134,6)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(974,109,135,1)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(975,109,136,6)

INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(976,109,162,8)--16 kolejka
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(977,109,163,9)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(978,109,164,5)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(979,109,165,4)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(980,109,166,3)

INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(981,109,152,2)--17 kolejka
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(982,109,153,4)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(983,109,154,5)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(984,109,155,7)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(985,109,156,8)

INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(986,109,172,6)--18 kolejka
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(987,109,173,8)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(988,109,174,9)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(989,109,175,4)
INTO Ocena (ID_Oceny, ID_Uzytkownika, ID_Meczu, Ocena) VALUES(990,109,176,4)
SELECT * FROM DUAL;
create view tabela_strzelcow as
SELECT u.nazwisko as "strzelec", count(g.id_bramki) as "bramki"
FROM uzytkownik u JOIN gol g ON u.id_uzytkownika = g.id_uzytkownika
join druzyna d ON d.id_druzyny = u.id_druzyny
group by u.nazwisko
order by count(g.id_bramki) desc;



CREATE VIEW sklad_fcbarcelona AS
SELECT d.nazwa_druzyny as "druzyna", u.imie, u.nazwisko
FROM druzyna d JOIN uzytkownik u ON d.id_druzyny=u.id_druzyny --JOIN gol g ON u.ID_uzytkownika=g.ID_uzytkownika
WHERE u.rodzaj NOT LIKE ('uzytkownik') AND d.ID_druzyny = 1;
CREATE VIEW sklad_realmadryt AS 
SELECT d.nazwa_druzyny as "druzyna", u.imie, u.nazwisko
FROM druzyna d JOIN uzytkownik u ON d.id_druzyny=u.id_druzyny --JOIN gol g ON u.ID_uzytkownika=g.ID_uzytkownika
WHERE u.rodzaj NOT LIKE ('uzytkownik') AND d.ID_druzyny = 2;
CREATE VIEW sklad_sevilla AS 
SELECT d.nazwa_druzyny as "druzyna", u.imie, u.nazwisko
FROM druzyna d JOIN uzytkownik u ON d.id_druzyny=u.id_druzyny --JOIN gol g ON u.ID_uzytkownika=g.ID_uzytkownika
WHERE u.rodzaj NOT LIKE ('uzytkownik') AND d.ID_druzyny = 3;
CREATE VIEW sklad_valenciacf AS 
SELECT d.nazwa_druzyny as "druzyna", u.imie, u.nazwisko
FROM druzyna d JOIN uzytkownik u ON d.id_druzyny=u.id_druzyny --JOIN gol g ON u.ID_uzytkownika=g.ID_uzytkownika
WHERE u.rodzaj NOT LIKE ('uzytkownik') AND d.ID_druzyny = 4;
CREATE VIEW sklad_villarealcf AS 
SELECT d.nazwa_druzyny as "druzyna", u.imie, u.nazwisko
FROM druzyna d JOIN uzytkownik u ON d.id_druzyny=u.id_druzyny
WHERE u.rodzaj NOT LIKE ('uzytkownik') AND d.ID_druzyny = 5;
CREATE VIEW sklad_atleticomadryt AS 
SELECT d.nazwa_druzyny as "druzyna", u.imie, u.nazwisko
FROM druzyna d JOIN uzytkownik u ON d.id_druzyny=u.id_druzyny 
WHERE u.rodzaj NOT LIKE ('uzytkownik') AND d.ID_druzyny = 6;
CREATE VIEW sklad_atleticbilbao AS 
SELECT d.nazwa_druzyny as "druzyna", u.imie, u.nazwisko
FROM druzyna d JOIN uzytkownik u ON d.id_druzyny=u.id_druzyny 
WHERE u.rodzaj NOT LIKE ('uzytkownik') AND d.ID_druzyny = 7;
CREATE VIEW sklad_celtadevigo AS 
SELECT d.nazwa_druzyny as "druzyna", u.imie, u.nazwisko
FROM druzyna d JOIN uzytkownik u ON d.id_druzyny=u.id_druzyny
WHERE u.rodzaj NOT LIKE ('uzytkownik') AND d.ID_druzyny = 8;
CREATE VIEW sklad_eibar AS 
SELECT d.nazwa_druzyny as "druzyna", u.imie, u.nazwisko
FROM druzyna d JOIN uzytkownik u ON d.id_druzyny=u.id_druzyny 
WHERE u.rodzaj NOT LIKE ('uzytkownik') AND d.ID_druzyny = 9;
CREATE VIEW sklad_leganes AS 
SELECT d.nazwa_druzyny as "druzyna", u.imie, u.nazwisko
FROM druzyna d JOIN uzytkownik u ON d.id_druzyny=u.id_druzyny 
WHERE u.rodzaj NOT LIKE ('uzytkownik') AND d.ID_druzyny = 10;
select * from tabela_strzelcow;


create table Druzyna_Log
(
ID_Druzyny NUMBER(2,0) NOT NULL,
Uzytkownik VARCHAR2(4) NOT NULL,
Aktywnosc VARCHAR2(20) NOT NULL,
Data DATE );


CREATE or REPLACE TRIGGER Druzyna_Trigger
  AFTER INSERT OR UPDATE OR DELETE ON Druzyna

BEGIN

IF DELETING THEN 
    INSERT into Druzyna_Log(Uzytkownik, Aktywnosc, Data) values (user, 'DELETE', sysdate);
END IF;

IF UPDATING THEN 
    INSERT into Druzyna_Log(Uzytkownik, Aktywnosc, Data) values (user, 'UPDATE', sysdate);
END IF;

IF INSERTING THEN 
    INSERT into Druzyna_Log(Uzytkownik, Aktywnosc, Data) values (user, 'INSERT', sysdate);
END IF; 

END;