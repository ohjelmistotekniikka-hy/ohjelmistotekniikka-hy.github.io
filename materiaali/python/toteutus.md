---
layout: page
permalink: /python/toteutus
title: Ohjeita harjoitustyön toteutukseen
---

{% include java_materiaali_info.md %}

Tähän osioon on koottu vinkkejä, joista on luultavasti hyötyä harjoitustyön toteutuksessa.

- [Sovelluksen käyttöliittymä](#sovelluksen-käyttöliittymä)
  - [Tekstikäyttöliittymä](#tekstikäyttöliittymä)
  - [Graafinen käyttöliittymä](#graafinen-käyttöliittymä)
- [Pelien toteutus](#pelien-toteutus)
- [Riippuvuuksien injektointi](#riippuvuuksien-injektointi)
- [Tietojen tallennus](#tietojen-tallennus)
  - [Repository-suunnittelumalli](#repository-suunnittelumalli)
  - [Tiedostojen polut](#tiedostojen-polut)
  - [SQLite-tietokannan käyttö](#sqlite-tietokannan-käyttö)
  - [SQLite-tietokanta lukkiutuminen virtuaalityöasemalla](#sqlite-tietokanta-lukkiutuminen-virtuaalityöasemalla)
  - [Huomioita testaamisesta](#huomioita-testaamisesta)
- [Sovelluksen konfiguraatiot](#sovelluksen-konfiguraatiot)
- [Uuden tekniikan harjoittelu ja käyttöönotto](#uuden-tekniikan-harjoittelu-ja-käyttöönotto)
- [Python-versioiden hallinta](#python-versioiden-hallinta)

## Sovelluksen käyttöliittymä

Voit siis tehdä sovelluksellesi tekstikäyttöliittymän tai graafisen käyttöliittymän. Tekstikäyttöliittymän tekeminen on toki useimmiten huomattavasti helpompaa, mutta se voi olla hieman tylsää ja graafisen käyttöliittymän tekemättömyys saattaa [vaikuttaa arvosanaan](/python/arvosteluperusteet).

Pääasia on joka tapauksessa, että pyrit _eriyttämään mahdollisimman hyvin sovelluslogiikan käyttöliittymästä_. Käyttöliittymän roolin tulee siis olla ainoastaan käyttäjän kanssa tapahtuva interaktio, varsinaisen logiikan tulee tapahtua muissa oliossa.

### Tekstikäyttöliittymä

Tarkastellaan erästä mallia tekstikäyttöliittymän toteuttamiselle. Otetaan esimerkkisovellukseksi numerotiedustelusovellus, jonka avulla käyttäjä voi mm. lisätä, poistaa ja hakea henkilöiden puhelinnumeroita. Näitä toimintoja varten on toteutettu joukko komentoriviltä annettavia komentoja. Tässä on käyttöliittymälle yksi potentiaalinen toteutustapa:

```python
from numero_ja_osoite_palvelu import NumeroJaOsoitePalvelu
from konsoli_io import KonsoliIO

KOMENNOT = {
    "x": "x lopeta",
    "1": "1 lisää numero",
    "2": "2 hae numerot",
    "3": "3 hae puhelinnumeroa vastaava henkilö",
    "4": "4 lisää osoite",
    "5": "5 hae henkilön tiedot",
    "6": "6 poista henkilön tiedot",
    "7": "7 filtteröity listaus",
}


class Numerotiedustelu:
    def __init__(self):
        self._io = KonsoliIO()
        self._palvelu = NumeroJaOsoitePalvelu()

    def kaynnista(self):
        self._io.tulosta("numerotiedustelu")
        self._tulosta_ohje()

        while True:
            komento = self._io.lue("komento: ")

            if not komento in KOMENNOT:
                self._io.tulosta("virheellinen komento")
                self._tulosta_ohje()
                continue

            if komento == "x":
                break
            elif komento == "1":
                self._lisaa_numero()
            elif komento == "2":
                self._hae_numerot()
            elif komento == "3":
                self._hae_henkilo()
            elif komento == "4":
                self._lisaa_osoite()
            elif komento == "5":
                self._hae_tiedot()
            elif komento == "6":
                self._poista_henkilo()
            elif komento == "7":
                self._listaus()

    def _hae_numerot(self):
        nimi = self._io.tulosta("kenen: ")
        numerot = self._palvelu.hae_numerot(nimi)

        if len(numerot) == 0:
            self._io.tulosta("ei löytynyt")
            return

        for numero in numerot:
            self._io.tulosta(numero)

    def _lisaa_numero(self):
        nimi = self._io.lue("kenelle: ")
        numero = self._io.lue("numero: ")

        self.palvelu._lisaa_numero(nimi, numero)

    # lisää käyttöliittymäfunktioita...
```

Käytössäolevat komennot on tallennettu `KOMENNOT`-nimiseen [dictionaryyn](https://docs.python.org/3/tutorial/datastructures.html#dictionaries), jonka avaimina toimivat komentojen nimet ja arvoina niiden kuvaukset. Käyttöliittymää varten on toteutettu `Numerotiedustelu`-luokka. Luokan konstruktori alustaa oliomuuttujat `io` ja `palvelu`. Attribuuttiin `io` tallennetaan `KonsoliIO`-luokan olio, jonka avulla voimme lukea käyttäjän syötteitä ja tulostaa viestejä komentoriville. Attribuuttiin `palvelu` puolestaan tallenetaan `NumeroJaOsoitePalvelu`-luokan olio, jonka avulla voimme tehdä puhelinnumeroihin liittyviä operaatioita. Erilisen sovelluslogiikasta vastaavan luokan käyttö on tapa erottaa sovelluslogiikka käyttöliittymästä, joka on periaatteena erittäin tärkeä.

`Numerotiedustelu`-luokan `kaynnista`-metodi käynnistää käyttöliittymän. Metodi `tulosta_ohje` tulostaa käyttäjälle käytössäolevat komennot. Tämän jälkeen käyttäjältä aletaan pyytää komentoja `while True`-silmukassa.

Jos komentojen määrä kasvaa, voi harkita esimerkiksi [Command](https://en.wikipedia.org/wiki/Command_pattern)-suunnittelumallin käyttöä. Toteutuksessa komennot voisivat olla omia luokkiaan, kuten:

```python
class LisaaNumeroKomento:
    def __init__():
        self._io = KonsoliIO()
        self._palvelu = NumeroJaOsoitePalvelu()

    def tulosta_ohje():
        return "1 lisää numero"

    def suorita():
        nimi = self._io.lue("kenelle: ")
        numero = self._io.lue("numero: ")

        self._palvelu.lisaa_numero(nimi, numero)
```

Kaikilla komentoluokilla on siis metodit `tulosta_ohje` ja `suorita`. Komennot voi tallentaa dictionaryyn `Numerotiedustelu`-luokan konstruktorissa:

```python
class Numerotiedustelu:
    def __init__(self):
        self._io = KonsoliIO()
        self._palvelu = NumeroJaOsoitePalvelu()

        self._komennot = {
            "x": LopetaKomento()
            "1": LisaaNumeroKomento()
            # ...
        }

    # ...
```

Tämä yksinkertaistaa `Numerotiedustelu`-luokan `kaynnista`-metodia huomattavasti:

```python
def kaynnista(self):
    self._io.tulosta("numerotiedustelu")
    self._tulosta_ohje()

    while True:
        komento = self._io.lue("komento: ")

        if not komento in self._komennot:
            self._io.tulosta("virheellinen komento")
            self._tulosta_ohje()
            continue

        if komento == "x":
            break

        komento_olio = self._komennot[komento]
        komento_olio.suorita()
```

### Graafinen käyttöliittymä

Graafinen käyttöliittymä eroaa tekstikäyttöliittymästä siinä, että komentoriviltä annettavien tekstimuotoisten komentojen sijaan käyttäjä voi antaa sovellukselle syötteitä erilaisten graafisten komponenttien kautta. Tämä voi tarkoittaa esimerkiksi tekstikenttiin kirjoittamista, tai painikkeiden painelua.

[TkInter](https://wiki.python.org/moin/TkInter)-kirjasto on Pythonissa jo standardiksi muodostonut tapa toteuttaa graafisia käyttöliittymiä. Koska aihe on jonkin verran tekstikäyttöliittymää laajempi, on sille kirjoitettu erillinen [ohje](/python/tkinter).

## Pelien toteutus

Pelien toteutukseen soveltuvat kirjastot vaihtelevat tapauskohtaisesti. Erityisesti graafisten pelien toteutuksessa eräs hyväksi todettu kirjasto on [Pygame](https://www.pygame.org). Kirjaston käyttöön on kirjoittu erillinen ohje, joka on luettavissa [täällä](/python/pygame).

## Riippuvuuksien injektointi

Edellä esitetyn `Numerotiedustelu`-luokan attribuutit `io` ja `palvelu` alustettiin suoraan konstruktorissa:

```python
class Numerotiedustelu:
    def __init__(self):
        self._io = KonsoliIO()
        self._palvelu = NumeroJaOsoitePalvelu()

# ...
```

Näitä attribuutteja voidaan pitää luokan _riippuvuuksina_, eli toiminnallisuuksina, joita luokka käyttää. Nämä riippuvuudet ovat tällä hetkellä varsin _konkreettisia_, koska tiedämme esimerkiksi täsmälleen, miten syötteet luetaan. Jos haluaisimme lukea syötteitä esimerkiksi tiedostosta, vaatisi se muutoksia luokan koodiin.

_Riippuvuuksien injektointi_ on ohjelmointitekniikka, jonka avulla pyritään eroon konkreettisista riippuvuuksista. Tekniikan perusideana on, että riippuvuudet annetaan konstruktorille, metodille, tai funktiolle sen kutsun yhteydessä. Tällöin riippuvuuksien käyttäjä ei tiedä riippuvuuksien toteutuksesta mitään, eli ne ovat _abstrakteja_. `Numerotiedustelu`-luokan tapauksessa `io`- ja `palvelu`-attribuutit saisivat arvonsa konstruktorin parametrien kautta:

```python
class Numerotiedustelu:
    def __init__(io, palvelu):
        self._io = io
        self._palvelu = palvelu

    # ...
```

Voimme alustaa `Numerotiedustelu`-olion seuraavasti:

```python
palvelu = NumeroJaOsoitePalvelu()
io = KonsoliIO()
numerotiedustelu = Numerotiedustelu(io, palvelu)
numerotiedustelu.kaynnista()
```

Koska riippuvuudet eivät ole enää konkreettisia, voimme helposti vaihtaa riippuvuutena saadun palvelun toteutusta ilman, että se vaatisi muutoksia `Numerotiedustelu`-luokkaan. Sanotaan, että numerot tallennettaisiin ja luettaisiin tietokannasta seuraavan luokan avulla:

```python
class TietokantaNumeroJaOsoitePalvelu:
    def hae_numerot(self):
        # ...

    def lisaa_numero(self, nimi, numero):
        # ...

    # ...
```

Voimme yksinkertaisesti antaa `Numerotiedustelu`-luokalle riippuvuutena `TietokantaNumeroJaOsoitePalvelu`-luokan olion
`NumeroJaOsoitePalvelu`-luokan olion sijaan:

```python
palvelu = TietokantaNumeroJaOsoitePalvelu()
io = KonsoliIO()
numerotiedustelu = Numerotiedustelu(io, palvelu)
numerotiedustelu.kaynnista()
```

Riippuvuuksien injektointi osoittaa myös erittäin hyödylliseksi testaamisessa. `Numerotiedustelu`-luokan tapauksessa `KonsoliIO`-luokan käyttämät `input`- ja `output`-funktiot tekevät testaamisesta erittäin hankalaa. Koska injektoimme riippuvuudet, voimme antaa testeissä konstruktorin `io`-parametriksi helposti testattavan luokan olion:

```python
import unittest
from numerotiedustelu import Numerotiedustelu

class StubIO:
    def __init__(self, syotteet):
        self.syotteet = syotteet
        self.tulosteet = []

    def lue(self, teksti):
        return self.syotteet.pop(0)

    def tulosta(self, teksti):
        self.tulosteet.append(teksti)

class TestNumerotiedustelu(unittest.TestCase):
    def test_numeron_lisays_lisaa_tiedot_oikein(self):
        syotteet = ["1", "Kalle Ilves", "040-123456", "x"]
        io = StubIO(syotteet)

        palvelu = NumeroJaOsoitePalvelu()
        numerotiedustelu = Numerotiedustelu(lue, tulosta, palvelu)
        numerotiedustelu.kaynnista()

        # varmista assert-lauseella että io.tulosteet on halutun kaltainen
```

`StubIO`-luokka toteuttaa metodit `lue` ja `tulosta`, kuten `KonsoliIO`-luokka. Erona on, että `StubIO`-luokan syötteet määräytyvät konstruktorin kautta annetun listan perusteella, eikä komentoriviltä annettujen syötteiden perusteella. Lisäksi tulostetut arvot tallennetaan listaan, eikä niitä kirjoiteta komentoriville. Tämä mahdollistaa sen, että voimme helposti tarkastella sovelluksen tuottamia tulosteita annettujen syötteiden perusteella.

## Tietojen tallennus

Arvosteluperusteet [kannustavat](/python/arvosteluperusteet) siihen, että ohjelmasi käsittelisi johonkin muotoon pysyväistalletettua tietoa. Kannattaa kuitenkin pitää talletettavan tiedon määrä kohtuullisena, eeppisimmät tietoa käsittelevät aiheet sopivat paremmin kurssille Tietokantasovellus.

### Repository-suunnittelumalli

Riippumatta mihin tiedon tallennat, kannattaa tiedon haku ja tallentaminen eristää sovelluksen muista osista. Kun piilotamme näihin operaatioihin liittyvän koodin yksityiskohdat sovelluksen muulta koodilta, on esimerkiksi tiedon tallennustapaan helppo tehdä muutoksia ilman, että sillä on vaikutuksia muualla. Tämä onnistuu noudattamalla [repository](https://docs.microsoft.com/en-us/dotnet/architecture/microservices/microservice-ddd-cqrs-patterns/infrastructure-persistence-layer-design)-suunnittelumallia.

Repository-suunnittelumallin perusidea on se, että jokaisella tietokohteella (kuten todo-sovelluksen tehtävä) on oma repositorionsa (ei tule sekoittaa gitin repositorioihin). Repositorio tarjoaa tietokohteeseen erilaisia luku- ja kirjoitusoperaatioita. Käytetään esimerkkinä referenssisovelluksen `TodoRepository`-luokkaa:

```python
class TodoRepository:
    def __init__(self, file_path):
        self._file_path = file_path

    def find_all(self):
        return self._read()

    def find_by_username(self, username):
        todos = self.find_all()

        user_todos = filter(
            lambda todo: todo.user and todo.user.username == username, todos
        )

        return list(user_todos)

    def create(self, todo):
        todos = self.find_all()

        todos.append(todo)

        self._write(todos)

        return todo

    def _ensure_file_exists(self):
        Path(self._file_path).touch()

    def _read(self):
        todos = []

        self._ensure_file_exists()

        with open(self._file_path) as file:
            for row in file:
                row = row.replace("\n", "")
                parts = row.split(";")

                todo_id = parts[0]
                content = parts[1]
                done = parts[2] == "1"
                username = parts[3]

                user = user_repository.find_by_username(
                    username) if username else None

                todos.append(
                    Todo(content, done, user, todo_id)
                )

        return todos

    def _write(self, todos):
        self._ensure_file_exists()

        with open(self._file_path, "w") as file:
            for todo in todos:
                done_string = "1" if todo.done else "0"
                username = todo.user.username if todo.user else ""

                row = f"{todo.id};{todo.content};{done_string};{username}"

                file.write(row+"\n")
```

`TodoRepository`-luokka tarjoaa tiedon lukemista varten metodit `find_all` ja `find_by_username`. Nämä metodit hakevat tietoa CSV-tiedostosta ja muodostovat sen riveistä `Todo`-luokan olioita. Tiedon kirjoittamista varten luokka tarjoaa metodin `create`.

`TodoRepository`-luokasta voi tehdä olion seuraavasti:

```python
import os

dirname = os.path.dirname(__file__)

todo_repository = TodoRepository(os.path.join(dirname, "..", "data", "todos.csv"))
```

Annamme luokan konstruktorille polun CSV-tiedostolle. Tämän jälkeen voimme käyttää repositorion metodeja tietämättä, miten tieto tallennetaan tai haetaan:

```python
todo_repository.create(Todo("Learn the repository pattern"))

todos = todo_repository.find_all()

print(todos)
```

Huomaa, että luokan käyttäjä ei ole tietoinen, miten tieto haetaan. Tämä mahdollistaa tallennustapaan tehtävät muutokset vaivattomasti ilman muutoksia muuhun koodiin.

### Tiedostojen polut

Tiedostojen poluista kannattaa muodostaa niin kutsuttuja absoluuttisia polkuja, jotta ne toimivat riippumatta, mitä Python-tiedostoa suoritetaan. Kuvitellaan, että projektin rakenne on seuraava:

```
src/
  file_reader.py
  data.csv
  ...
```

<i>file_reader.py</i>-tiedostossa voidaan lukea <i>data.csv</i>-tiedosto seuraavasti:

```python
import os

dirname = os.path.dirname(__file__)
data_file_path = os.path.join(dirname, "data.csv")

with open(data_file_path) as file:
    for row in file:
        # Tehdään tiedoston riveillä jotain
```

Koodissa tallennetaan `dirname`-nimiseen muuttujaan absoluuttinen polku <i>file_reader.py</i>-tiedoston hakemistoon (<i>src</i>-hakemistoon). Tämän polun perusteella muodostetaan polku <i>data.csv</i>-tiedostoon.

Tiedosto voi hyvin sijaita myös oma hakemistossaan, esimerkiksi seuraavasti:

```
data/
  data.csv
src/
  file_reader.py
```

Tämä vaatii seuraavan muutoksen koodiin:

```python
import os

dirname = os.path.dirname(__file__)
data_file_path = os.path.join(dirname, "..", "data", "data.csv")

with open(data_file_path) as file:
    for row in file:
        # Tehdään tiedoston riveillä jotain
```

Kutsussa `path.join(dirname, "..", "data", "data.csv")` muodostetaan polku lähtemällä liikkeelle <i>file_reader.py</i>-tiedoston hakemistosta (<i>src</i>-hakemistosta), siirtymällä yksi hakemisto ylöspäin ja siirtymällä <i>data</i>-hakemistoon.

### SQLite-tietokannan käyttö

[SQLite-tietokanta](https://www.sqlite.org/index.html) on helppokäyttöinen SQL-tietokanta, joka tallentaa tietokannan tiedostoon käyttäjän tietokoneelle, jolloin erillistä tietokantapalvelinta ei tarvita. Sitä kannattaa käyttää sovelluksessa [sqlite3](https://docs.python.org/3/library/sqlite3.html)-moduulin kautta. Mikä tekee SQLite-tietokannan käytöstä hieman hankalampaa perinteiseen tiedostoon verrattuna on se, että sen käyttö vaatii tietokantaulujen alustuksen.

Tietokantayhteys kannattaa muodostaa omassa moduulissaan esimerkiksi <i>src/database_connection.py</i>-tiedostossa:

```python
import os
import sqlite3

dirname = os.path.dirname(__file__)

connection = sqlite3.connect(os.path.join(dirname, "..", "data", "database.sqlite"))
connection.row_factory = sqlite3.Row


def get_database_connection():
    return connection
```

Tietokantayhteyttä voi nyt hyödyntää esimerkiksi `UserRepository`-luokassa seuraavasti:

```python
class UserRepository:
    def __init__(self, connection):
        self._connection = connection

    def find_all(self):
        cursor = self._connection.cursor()

        cursor.execute("select * from users")

        rows = cursor.fetchall()

        return [User(row["username"], row["password"]) for row in rows]


user_repository = UserRepository(get_database_connection())
users = user_repository.find_all()
```

Ennen tietokantaulujen alustusta kannattaa entiset tietokantataulut poistaa. Näin esimerkiksi uuden sarakkeen lisääminen tauluun onnistuu helposti. Tietokannan alustustoimenpiteitä varten kannattaa toteuttaa oma moduulinsa esimerkiksi <i>src/initialize_database.py</i> tiedostoon:

```python
from database_connection import get_database_connection


def drop_tables(connection):
    cursor = connection.cursor()

    cursor.execute('''
        drop table if exists users;
    ''')

    connection.commit()


def create_tables(connection):
    cursor = connection.cursor()

    cursor.execute('''
        create table users (
            username text primary key,
            password text
        );
    ''')

    connection.commit()


def initialize_database():
    connection = get_database_connection()

    drop_tables(connection)
    create_tables(connection)


if __name__ == "__main__":
    initialize_database()
```

Moduulin `initialize_database`-funktion voi suorittaa joko projektin toisesta tiedostosta:

```python
from initialize_database import initialize_database

initialize_database()
```

Tai komentoriviltä:

```bash
python3 src/initialize_database.py
```

Etenkin tietokantaoperaatioita testaavien testien kanssa funktiokutsun avulla tapahtuva alustaminen on erittäin hyödyllinen. Ennen kuin testit suoritetaan `pytest`-komennolla, pytest tarkistaa, onko testihakemistossa _conftest.py_-tiedostoa. Jos kyseinen tiedosto löytyy, se kutsuu tiedostossa määriteltyä `pytest_configure`-funktiota ennen testien suorittamista. Tästä syystä funktion sisällä onkin hyödyllistä tehdä tietokannan alustus:

```python
from initialize_database import initialize_database


def pytest_configure():
    initialize_database()
```

Vaikka edellä esitelty tapa alustaa tietokanta `initialize_database`-funktion avulla on melko kätevä, on SQL-tietokannan skeemaa tapana ylläpitää niin kutsuttujen [tietokantamigraatioiden](https://en.wikipedia.org/wiki/Schema_migration) avulla. Eräs tähän käyttötarkoitukseen soveltuva työkalu on [Alembic](https://alembic.sqlalchemy.org/en/latest/).

### SQLite-tietokanta lukkiutuminen virtuaalityöasemalla

Kun suoritat SQLite-tietokantaa käyttävää sovellusta virtuaalityöasemalla, tai melkillä, saatat törmätä seuraavaan virheeseen:

```bash
database is locked
```

Ongelma johtuu verkkolevyn hitaudesta ja ratkaisu on suorittaa projektia `/tmp`-hakemistosta käsin. Siirry siis _tmp_-hakemistoon terminaalista komennolla `cd /tmp` ja kloonaa projektin repositorio sinne `git clone`-komennolla.

### Huomioita testaamisesta

[Testausohjeissa](/python/viikko2#unittest-ja-testaaminen) ohjeistettiin, että _kaikki testit tulee olla toisistaan riippumattomia_. Tämä tarkoittaa sitä, että tallennusta testaavan metodin tulee olettaa, ettei edellisiä tallennustietoja ole. Tämä onnistuu testiluokan `setUp`-metodissa kutsumalla repositorion metodia, joka tyhjentää tallennustiedot. Esimerkiksi referenssisovelluksessa toteutus on seuraava:

```python
class TestTodoRepository(unittest.TestCase):
    def setUp(self):
        todo_repository.delete_all()
        user_repository.delete_all()

    # ...
```

## Sovelluksen konfiguraatiot

Sovelluksen koodiin ei ole syytä kovakoodata mitään konfiguraatioita, kuten sen käyttämien tiedostojen tai tietokantojen nimiä. Eräs syy tähän on se, että jos konfiguraatiot ovat koodissa, ei ohjelman normaalin käyttäjän (jolla ei ole pääsyä koodiin) ole mahdollista tehdä muutoksia konfiguraatioihin.

Konfiguraatiot on syytä määritellä ohjelman ulkopuolella, esim. erillisissä konfiguraatiotiedostoissa. Ei siis välttämättä kannatta ottaa mallia edellisten esimerkkien tavasta kovakoodata tiedostojen polkuja esimerkiksi SQLite-tietokannan yhteyden muodostamisessa.

Eräs tapa sovelluksen konfigurointiin on käyttää niin kutsuttuja _ympäristömuuttujia_. Ympäristömuuttujiin pääsee koodissa käsiksi mm. [os](https://docs.python.org/3/library/os.html)-moduulin [getenv](https://docs.python.org/3/library/os.html#os.getenv)-funktion avulla. Yksinkertaisin tapa määritellä sovellukselle ympäristömuuttujia on määritellä ne sovelluksen suorituksen yhteydessä komentoriviltä:

```
FOO=bar poetry run python3 src/index.py
```

Esimerkissä sovellukselle määritellään ympäristömuuttuja `FOO`, jonka arvo on `bar`.

Jos ympäristömuuttujia on monta, on niiden määritteleminen usein järkevämpää tehdä erillisessä konfiguraatiotiedostossa. Ympäristömuuttujien lataaminen tiedostosta onnistuu helposti [python-dotenv](https://pypi.org/project/python-dotenv/)-kirjaston avulla. Sen asentaminen onnistuu tutulla `poetry add`-komennolla:

```bash
poetry add python-dotenv
```

Katsotaan, miten ympäristömuuttujia voi käyttää projektissa, jonka rakenne on seuraava:

```
src/
  index.py
  config.py
  ...
.env
poetry.lock
pyproject.toml
...
```

Projektin juurihakemiston _.env_-tiedosto sisältää projektin ympäristömuuttujat seuraavasti:

```
FOO=bar
LOREM=ipsum
```

Tiedostossa määritellään arvot `FOO` ja `LOREM` ympäristömuuttujille. Jokainen muuttuja määritellään omalla rivillään formaatissa `MUUTTUJAN_NIMI=muuttujan_arvo`. Voimme tulostaa muuttujien arvot _src/index.py_-tiedostossa seuraavalla tavalla:

```python
import os
from dotenv import load_dotenv

dirname = os.path.dirname(__file__)

try:
    load_dotenv(dotenv_path=os.path.join(dirname, "..", ".env"))
except FileNotFoundError:
    pass

print(os.getenv("FOO"))
print(os.getenv("LOREM"))
```

Koodissa `os.path.dirname(__file__)` palauttaa polun hakemistoon, jossa moduuli sijaitsee (esimerkin tapauksessa _src_-hakemistoon). Käytämme tätä polkua muodostaaksemme polun _.env_-tiedostoon, jonka annamme `load_dotenv`-funktion `dotenv_path`-parametrin arvoksi. Funktio lataa ympäristömuuttujat halutusta tiedostosta ja nostaa `FileNotFoundError`-virheen, jos tiedostoa ei löydy.

Jotta koodi pysyisi selkeänä, kannattaa ympäristömuuttujien arvot lukea erillisessä moduulissa, jonka voi toteuttaa esimerkiksi _src/config.py_ tiedostoon:

```python
import os
from dotenv import load_dotenv

dirname = os.path.dirname(__file__)

try:
    load_dotenv(dotenv_path=os.path.join(dirname, "..", ".env"))
except FileNotFoundError:
    pass

# jos os.getenv("FOO") palauttaa arvon None, FOO saa arvokseen "default bar"
FOO = os.getenv("FOO") or "default bar"
LOREM = os.getenv("LOREM") or "default ipsum"
```

Muuttujille on hyvä antaa oletusarvot, jos ympäristömuuttujalle ei ole annettu arvoa. Moduulissa alustetut muuttujat `FOO` ja `LOREM` voidaan importata projektin toisessa tiedostossa seuraavasti:

```python
from config import FOO, LOREM

print(FOO)
print(LOREM)
```

Testeille on usein käytössä eri konfiguraatio, kuin normaalisti suoritettavalle koodille. Esimerkiksi testien kannattaa käyttää SQLite-tietokannan kanssa eri tiedostoa. Tätä varten voimme tehdä projektin juurihakemistoon erillisen _.env.test_-tiedoston, jonne määritellään testien käyttämät ympäristömuuttujat.

Näiden ympäristömuuttujien lataaminen onnistuu pytestin [pytest-dotenv](https://pypi.org/project/pytest-dotenv/)-lisäosalla. Sen asentaminen onnistuu seuraavalla komennolla:

```bash
poetry add pytest-dotenv --dev
```

Asentamisen lisäksi tulee projektin juurihakemistoon luoda _pytest.ini_-tiedosto, jossa kerrotaan, mistä tiedostosta ympäristömuuttujat ladataan. Tiedoston sisältö on seuraava:

```
[pytest]
env_files =
    .env.test
```

Nyt testit, jotka suoritetaan `pytest`-komennolla, käyttävät _.env.test_-tiedostossa määriteltyjä ympäristömuuttujia.

Huomaa, että edellisen esimerkin `load_dotenv`-funktio lataa ympäristömuuttujat myös testeissä _.env_-tiedostosta, mutta se ei oletusarvoisesti ylikirjoita jo määriteltyjä muuttujia. Koska pytest-dotenv-lisäosa lataa ympäristömuuttujat ennen `load_dotenv`-funtiota, on testeissä ensisijaisesti käytössä _.env.test_-tiedostossa määritellyt ympäristömuuttujat.

Mallia oman projektin konfiguroimiseksi ympäristömuuttujilla voi ottaa edellä esitettyjen esimerkkien lisäksi myös [referenssisovelluksesta]({{site.python_reference_app_url}}).

## Uuden tekniikan harjoittelu ja käyttöönotto

Kun olet toteuttamassa jotain itsellesi uudella tekniikalla, esim. tkinter:illä, SQLite-tietokantaa hyödyntäen, tai teet ohjelmaasi laajennuksen hyödyntämällä kirjastoa, jota et vielä tunne, kannattaa ehdottomasti tehdä uudella tekniikalla erillisiä kokeiluja varsinaisen ohjelmasi ulkopuolella, omassa pienessä koesovelluksessa.

Jos yrität "montaa asiaa yhtä aikaa" eli ottaa esim. SQLite-tietokannan käyttöön omassa jo pitkälle edenneessä ohjelmassasi, on aika varmaa, että saat ainoastaan aikaan suuren määrän ongelmia. Silloin kun koodia ja liikkuvia osia on paljon, ei ole koskaan varmuutta missä ongelma on, ja sen takia on erittäin hyödyllistä, että teet harjoittelun ja kokeilut erillisessä "proof of concept"-sovelluksessa ja kun saat esim. SQLite-tietokannan toimimaan kokeilusovelluksessa, on usein sen jälkeen helppoa "copypasteta" koodi varsinaiseen sovellukseen.

## Python-versioiden hallinta

**HUOM:** tämä ohje toimii vain Linux- ja macOS-tietokoneilla.

Python-versioiden asennus ja käytössä olevan version vaihtaminen onnistuu vaivattomasti [pyenv](https://github.com/pyenv/pyenv)-työkalun avulla. Työkalun asennus Linux- ja macOS-tietokoneille onnistuu seuraavasti:

1. Avaa terminaali ja asenna [pyenv](https://github.com/pyenv/pyenv) komennolla `curl https://pyenv.run | bash`

2. Siirry kotihakemistoon komennolla `cd` ja lisää kotihakemiston _.bashrc_-tiedoston loppuun seuraavat rivit:

   ```bash
   export PATH="$HOME/.pyenv/bin:$PATH"
   eval "$(pyenv init --path)"
   ```

   Tämä onnistuu esimerkiksi nano-editorilla komennolla `nano .bashrc`

Käynnistä asennuksen jälkeen terminaali uudestaan. Halutun Python-version, kuten version 3.8.12, asennus ja käyttöönotto onnistuu seuraavasti:

1. Asenna Python-versio 3.8.12 komenolla:

   ```bash
   pyenv install 3.8.12
   ```

2. Ota käyttöön asennettu Python-versio komennolla:

   ```bash
   pyenv global 3.8.12
   ```

3. Varmista, että Python-versio on 3.8.12 komennolla `python3 --version`
