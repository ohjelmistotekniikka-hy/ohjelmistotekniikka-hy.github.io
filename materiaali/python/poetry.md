---
layout: page
permalink: /python/poetry
title: Poetry ja riippuvuuksien hallinta
---

Laajoissa ja monimutkaisissa ohjelmistoprojekteissa kaiken koodin tuottaminen itse ei ole enää käytännöllistä. Ei ole esimerkiksi järkevää, että jokaisessa ohjelmistoprojektissa toteutetaan oma ohjelmointirajapinta tietokantaoperaatioille, tai sovelluskehys koodin testaamiseen. Jotta pyörää ei tarvitsisi aina keksiä uudelleen, ovat ohjelmistokehittäjät kehittäneet valtavan määrän avoimen lähdekoodin _kirjastoja_, joita jokainen voi hyödyntää projekteissaan.

Kirjastojen lähdekoodi on usein luettavissa versionhallinta-alustoilla, kuten GitHubissa. Usein kirjastoja päivitetään jatkuvasti ja nämä päivitykset synnyttävät kirjastoista uusia _versioita_. Kirjastojen versioita julkaistaan erilaisiin rekistereihin, joista ne ovat helposti asennettavissa. [The Python Package Index](https://pypi.org/) (PyPI) on eräs tämän kaltainen, Python-kirjastoille tarkoitettu rekisteri.

Jotta kirjastoja olisi helppo asentaa projektiin, on kehitetty erilaisia pakettien asennukseen tarkoitettuja komentorivityökaluja. Pythonin kohdalla suosituin komentorivityökalu tähän tarkoitukseen on [pip](https://pypi.org/project/pip/). Pip tulee valmiiksi asennettuna uusimpien Python-asennusten mukana. Voit varmistaa sen löytymisen komentorivin komennolla:

```bash
pip3 --version
```

Komentoriville tulisi tulostua pipin versio. Jos `pip3`-komentoa ei löydy, kokeile komentoa `python3 -m pip --version`.

Kirjastojen asennus onnistuu pipin komennolla `pip3 install`. Jotta samalla tietokoneella olevien projektien riippuvuuksissa ei syntyisi ristiriitoja, on käytössä usein niin kutsuttaja projektikohtaisia _virtuaaliympäristöjä_. Näitä virtuaaliympäristöjä luodaan ja käytetään [venv](https://docs.python.org/3/library/venv.html) moduulin kautta. Jotta saisimme helposti käyttöömme pipin ja virtuaaliympäristön tuomat edut, voimme käyttää [Poetry](https://python-poetry.org/) komentorivityökalua.

## Huomioita komennoista

Monilla tietokoneilla Python-version kolme komennot suoritetaan `python3`- ja `pip3`-komennoilla komentojen `python` ja `pip` sijaan. Jos komentoja `python3` ja `pip3` ei jostain syystä löydy, tarkista `python`-komennon käyttämä versio komennolla:

```bash
python --version
```

Jos version on alle `3.8.0`, asenna tietokoneellesi [uusin Python-versio](https://www.python.org/downloads/). Muissa tapauksissa, voit käyttää `python`-komentoa `python3`-komennon sijaan.

## Asennus

Poetry tarjoaa dokumentaatiossaan useita [asennusvaihtoehtoja](https://python-poetry.org/docs/#installation). Valitse vaihtoehdoista käyttöjärjestelmällesi sopiva asennustapa ja asenna Poetry. Kun olet suorittanut asennuksen, tarkista vielä asennuksen onnistuminen komennolla:

```
poetry --version
```

Jos mikään esitetyistä asennusvaihtoehdoista ei onnistu, on asentaminen pipin avulla myös käyttökelpoinen vaihtoehto:

```bash
pip3 install poetry
```

Huomaa, että komennon suorittaminen vaatii pääkäyttäjän oikeudet. Jos näitä ei ole saatavilla, voi asennuksen tehdä käyttäjäkohtaisesti:

```bash
pip3 install --user poetry
```

Huomaa, että tämän asennustavan kanssa `poetry`-komento ei välttämättä ole suoritettavissa. Jos näin on, voit sen sijaan käyttää komentoa `python3 -m poetry`. Tämä tarkoittaa sitä, että kaikki materiaalin `poetry`-komennot tulee suorittaa muodossa `python3 -m poetry <komento>` (esimerkiksi `python3 -m poetry init`).

**HUOM:** kaikki asennustavat saattavat vaatia terminaali-ikkunan sulkemisen ja uudelleen avaamisen, jotta Poetryn komennot alkavat toimia. Joissain tapauksissa on vaadittu jopa tietokoneen uudelleenkäynnistys.

### Huomioita laitoksen melkki-palvelimen asennuksesta

Laitoksen melkki.cs.helsinki.fi-palvelimelle Poetryn asennus tulisi onnistua seuraamalla Poetryn [asennusohjeiden](https://python-poetry.org/docs/#installation) Linux-ohjeita. Huomaa, että asennuksen jälkeen polku Poetryn binääriin tulee asettaa `PATH`-muuttujaan. Tämä onnistuu komennolla:

```bash
source $HOME/.poetry/env
```

Huomaa, että tämä komento tulee suorittaa jokaisen kirjautumiskerran yhdeytessä, ellei _$HOME/.poetry/bin_-polkua aseteta `PATH`-muuttujaan muulla tavoin.

## Projektin alustaminen

Harjoitellaan Poetryn käyttöä tekemällä pieni esimerkkiprojekti. Luo hakemisto _poetry-testi_ haluamaasi hakemistoon. Hakemiston ei tarvitse löytyä Labtooliin rekisteröimästäsi repositoriosta. Avaa hakemisto komentoriviltä ja suorita siellä komento:

```bash
poetry init
```

Komennon suorittaminen alkaa kysymään kysymyksiä. Kun Poetry kysyy projektin tietoja varmista, että **yhteensopiva Python-versio asetaan oikein**. Jos Poetry ehdottaa kohdassaa _Compatible Python versions_ jotain Python 2 versiota, aseta versioksi `^3.8`. Muihin kysymyksiin voit vastata haluamallasi tavalla ja kaikkien kohtien vastauksia voi myös muokata myöhemmin. Tämän vuoksi kysymysten ohittaminen Enter-painikketta painamalla on ihan hyvä vaihtoehto.

Kun viimeiseen kysymykseen on vastattu, katso hakemiston sisältöä. Hakemistoon pitäisi ilmestyä _pyproject.toml_-tiedosto, jonka sisältö on kutakuinkin seuraava:

```
[tool.poetry]
name = "poetry-testi"
version = "0.1.0"
description = ""
authors = ["Kalle Ilves <kalle.ilves@helsinki.fi>"]

[tool.poetry.dependencies]
python = "^3.8"

[tool.poetry.dev-dependencies]

[build-system]
requires = ["poetry-core>=1.0.0"]
build-backend = "poetry.core.masonry.api"
```

Tiedoston `[tool.poetry]`-osio sisältää projektiin liittyviä yleistietoja, kuten sen nimi, kuvaus ja ylläpitäjät. Voit halutessasi muokata näitä tietoja. Osion alapuolella on osioita, jotka listaavat projektin riippuvuuksia. Muokkaa `[tool.poetry.dependencies]`-osiota niin, että Python-version vaatimus on muotoa `python = "^3.8"`. `^3.8`-merkintä tarkoittaa, että projektin käyttö vaatii vähintään Python-version `3.8.0`. Voit lukea lisää versiomerkinnöistä Poetryn [dokumentaatiosta](https://python-poetry.org/docs/dependency-specification/#version-constraints).

Kun _pyproject.toml_-tiedosto on tullut tutuksi, viimeistellään projektin alustaminen suorittamalla komento:

```bash
poetry install
```

Komennon suorittaminen tekee projektille vaadittavat alustustoimenpiteet, kuten virtuaaliympäristön alustamisen. Jos projektille olisi määritelty riippuvuuksia, komennon suorittaminen asentaisi myös ne. Tämän vuoksi _komento tulee suorittaa aina ennen kuin uutta projekti aletaan käyttämään_. Komento tulee myös suorittaa, jotta _pyproject.toml_-tiedostoon tehdyt muutokset tulevat voimaan.

Komennon suorittamisen seurauksena hakemistoon pitäisi ilmestyä tiedosto _poetry.lock_. Tiedosto sisältää kaikkien asennettujen riippuvuuksien versiotiedot. Sen tietojen avulla Poetry osaa aina asentaa riippuvuuksista täsmälleen oikeat versiot. Tästä syystä _tiedosto tulee lisätä versionhallintaan_. Huomaa, että tiedoston sisältöä ei tule _missään tapauksessa_ muuttaa, vaan se on täysin Poetryn ylläpitämä.

**HUOM:** jos törmäät seuraavaan virheilmoitukseen:

```
Python 2.7 will no longer be supported in the next feature release of Poetry (1.2).
You should consider updating your Python version to a supported one.

Note that you will still be able to manage Python 2.7 projects by using the env command.
See https://python-poetry.org/docs/managing-environments/ for more information.

The currently activated Python version 2.7.16 is not supported by the project (^3.8).
Trying to find and use a compatible version.
```

Eräs tapa korjata tilanne Macilla ja ehkä myös Linuxilla on editoida tiedoston `~/.poetry.bin/poetry` ensimmäisellä rivillä mainittu Pythonin polku. Oletusarvoinen polku on todennäköisesti seuraava:

```
#!/usr/bin/python
```

Polku tulee Macilla muuttaa (todennäköisesti) muotoon:

```
#!/usr/local/bin/python3
```

Oikea polku kannattaa varmistaa komennolla `which python3`.

## Riippuvuuksien asentaminen

Asennetaan seuraavaksi esimerkkiprojektimme ensimmäisen riippuvuus. Riippuvuuksien löytäminen onnistuu helpoiten Googlettamalla ja etsimällä hakutuloksista sopivia GitHub-repositorioita, tai PyPI-sivuja. Asennetaan esimerkkinä projektiimme erittäin hyödyllinen [cowsay](https://pypi.org/project/cowsay/)-kirjasto. Tämä onnistuu komennolla:

```bash
poetry add cowsay
```

Asennuksen komento on siis muotoa `poetry add <kirjasto>`. Komennon suorittamisen jälkeen huomaamme, että _pyproject.toml_-tiedoston `[tool.poetry.dependencies]`-osion alla on uutta sisältöä:

```
[tool.poetry.dependencies]
python = "^3.8"
cowsay = "^2.0.3"
```

`add`-komento asentaa projektiin kirjaston uusimman version, joka oli komennon suoritushetkellä `2.0.3`. Usein tämä on juuri se, mitä haluamme tehdä. Voimme kuitenkin asentaa halutessamme esimerkiksi cowsay-kirjaston version `1.0` komennolla:

```bash
poetry add cowsay==1.0
```

Jos haluaisimme poistaa kirjaston projektimme riippuvuuksien joukosta, se onnistuisi komennolla:

```bash
poetry remove cowsay
```

Pidetään kuitenkin cowsay-kirjasto toistaiseksi asennettuna.

## Komentojen suorittaminen virtuaaliympäristössä

Luodaan seuraavaksi _poetry-testi_-hakemistoon hakemisto _src_ ja luodaan sinne tiedosto _index.py_. Tiedoston sisältö on seuraava:

```python
import cowsay

cowsay.tux("Poetry is awesome!")
```

Jos suoritamme tiedoston komentoriviltä komennolla:

```bash
python3 src/index.py
```

On lopputuloksena seuravaa virheilmoitus:

```
ModuleNotFoundError: No module named 'cowsay'
```

Tämä johtuu siitä, että emme ole projektin virtuaaliympäristön sisällä, eli Python ei löydä projektimme riippuvuuksia. Asia korjaantuu käyttämällä [run](https://python-poetry.org/docs/cli/#run) komentoa:

```bash
poetry run python3 src/index.py
```

`poetry run`-komento siis suorittaa annetun komennon virtuaaliympäristössä, jonka sisällä Python löytää riippuvuutumme.

Kun projektia kehitetään aktiivisesti ja komentoja suoritetaan komentoriviltä jatkuvasti, on kätevintä olla koko ajan virtuaaliympäristön sisällä. Voimme siirtyä virtuaaliympäristön sisään kommennolla [shell](https://python-poetry.org/docs/cli/#shell):

```bash
poetry shell
```

Virtuaaliympäristön sisällä voimme suorittaa komennon "normaalisti", eli ilman `run`-komentoa:

```bash
python3 src/index.py
```

Voimme lähteä virtuaaliympäristöstä komennolla `exit`.

## Kehityksen aikaiset riippuvuudet

Jos olit tarkkana, huomasit, että _pyproject.toml_-tiedostosta löytyy `[tool.poetry.dependencies]`-osion lisäksi osio `[tool.poetry.dev-dependencies]`. Komennon `add` suorittaminen asentaa oletusarvoisesti riippuvuudet `[tool.poetry.dependencies]`-osion alle. Näiden riippuvuuksien lisäksi voimme asentaa projektiimme riippuvuuksia, joita tarvitsemme vain kehityksen aikana. Näitä riippuvuuksia ovat kaikki ne, joita itse sovelluksen käyttö (esimerkiksi `python3 src/index.py`-komennon suorittaminen) ei tarvitse.

Kehityksen aikaisten riippuvuuksien asentaminen onnistuu antamalla `add`-komennolle `--dev`-flagi. Esimerkiksi pian tutuksi tulevan [pytest](https://pytest.org/)-kirjaston voi asentaa kehityksen aikaiseksi riippuvuudeksi seuraavalla komennolla:

```bash
poetry add pytest --dev
```

Komennon suorittaminen lisää pytest-kirjaston riippuvuudeksi `[tool.poetry.dev-dependencies]`-osion alle:

```
[tool.poetry.dev-dependencies]
pytest = "^6.1.2"
```

Kehityksen aikaisten riippuvuuksien määritteleminen on kätevää, koska se vähentää asennettavien riippuvuuksien määrää tapauksessa, jossa haluamme vain käynnistää sovelluksen. Tässä tilanteessa riippuvuuksien asentamisen voi tehdä komennolla `poetry install --no-dev`.
