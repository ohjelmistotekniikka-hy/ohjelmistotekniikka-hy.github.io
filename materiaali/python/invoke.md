---
layout: page
permalink: /python/invoke
title: Tehtävien suorittaminen ja Invoke
---

Laajemmissa ohjelmistoprojekteissa on useimmiten monia erilaisia _tehtäviä_, joita suoritetaan komentoriviltä annettavien komentojen muodossa. Luultavasti tärkein näistä tehtävistä on sovelluksen käynnistäminen, joka saattaa tapahtua esimerkiksi komennolla `python3 src/index.py`.

Tehtäviin liittyvien komentojen kirjoittaminen käsin käy helposti työlääksi. Tämä tulee ilmi etenkin tilanteissa, joissa komennot ovat monimutkaisempia, tai vaativat muiden komentojen suorittamista. Ongelman ratkaisemiksi on toteutettu työkaluja, joiden avulla tehtäviä voi määritellä ja suorittaa komentoriviltä helposti. Python-maailmassa eräs suosittu työkalu tähän käyttötarkoitukseen on [Invoke](http://docs.pyinvoke.org/en/stable/).

## Asennus

Invoken asennus projektiin onnistuu komennolla:

```bash
poetry add invoke
```

## Tehtävien määritteleminen

Invoken avulla määritellyt tehtävät toteutetaan projektin juurihakemiston _tasks.py_-tiedostoon. Tehtävät ovat funktioita, joissa käytetään `@task`-[dekoraattoria](https://wiki.python.org/moin/PythonDecorators). Toteutetaan esimerkkinä _tasks.py_-tiedostoon tehtävä nimeltä _foo_, joka tulostaa tekstin "bar":

```python
from invoke import task

@task
def foo(ctx):
    print("bar")
```

Tämän erittäin hyödyllisen tehtävän voi suorittaa komentoriviltä komennolla:

```bash
poetry run invoke foo
```

Komennon suorittamisen pitäisi tulostaa komentoriville teksti "bar". Tehtävät voi siis suorittaa komentoriltä komennolla, joka on muotoa `poetry run invoke <tehtävä>`. Huomaa, että `poetry run`-komennon ansiosta tehtävät suoritetaan virtuaaliympäristössä.

Toteutetaan seuraavaksi _foo_-tehtävän lisäksi tehtävä, josta on oikeasti hyötyä. Tarvitsemme tehtävän, joka suorittaa sovelluksemme komennolla `python3 src/index.py`. Annetaan tälle tehtävälle nimeksi _start_:

```python
from invoke import task

@task
def foo(ctx):
    print("bar")

@task
def start(ctx):
    ctx.run("python3 src/index.py", pty=True)
```

Voimme suorittaa tehtävässä komentorivikomennon käyttämällä parametrina saadun [Context](http://docs.pyinvoke.org/en/stable/api/context.html#module-invoke.context)-olion metodia [run](http://docs.pyinvoke.org/en/stable/api/context.html#invoke.context.Context.run). Tehtävän suorittaminen onnistuu komennolla `poetry run invoke start`. Huomaa, että `pty=True`-argumentti on erityisen tärkeä komentorivikäyttöliittymässä, jotta sovelluksen syötteet ja tulosteet toimivat [odotetulla tavalla](https://www.pyinvoke.org/faq.html#why-is-my-command-behaving-differently-under-invoke-versus-being-run-by-hand).

Voimme listata kaikki projektissa käytössä olevat tehtävät komennolla:

```bash
poetry run invoke --list
```

## Huomioita tehtävien nimeämisestä

Jos tehtävän määrittelevän funktion nimi on [snake_case](https://en.wikipedia.org/wiki/Snake_case) -formaatissa, on komentoriviltä suoritettavan tehtävän nimi [kebab-case](https://en.wikipedia.org/wiki/Letter_case#Kebab_case) -formaatissa. Esimerkiksi seuraavasti nimetty tehtävä:

```python
from invoke import task

@task
def lorem_ipsum(ctx):
    print("Lorem ipsum")
```

Suoritettaisiin komennolla `poetry run invoke lorem-ipsum`. Jos olet epävarma käytössä olevien tehtävien nimistä, voit aina listata ne komennolla `poetry run invoke --list`.

## Toisistaan riippuvaiset tehtävät

[Coverage-ohjeissa](./coverage) tutustumme testikattavuuden keräämiseen ja raportin muodostamiseen sen perusteella. Jos haluamme muodostaa testikattavuusraportin, tulee testikattavuus olla ensin kerätty.

Menemättä tässä osiossa `coverage`-komennon yksityiskohtiin, tehtävillä voisi olla seuraavat määritelmät:

```python
from invoke import task

@task
def coverage(ctx):
    ctx.run("coverage run --branch -m pytest")

@task()
def coverage_report(ctx):
    ctx.run("coverage html")
```

Jos suoritamme tehtävän _coverage-report_ ennen _coverage_-tehtävän suorittamista, raportti sisältää joko vanhat testikattavuustiedot, tai kohtaamme virheen, joka valittaa testikattavuustietojen puutosta. Voisimme suorittaa komennot peräkkäin komennolla:

```bash
poetry run invoke coverage coverage-report
```

Helpompaa on kuitenkin määritellä _coverage-report_-tehtävän riippuvuus _coverage_-tehtävästä sen määrityksessä. Tämä onnistuu antamalla `@task`-dekoraattorille argumentiksi _coverage_-tehtävän funktio:

```python
from invoke import task

@task
def coverage(ctx):
    ctx.run("coverage run --branch -m pytest")

@task(coverage)
def coverage_report(ctx):
    ctx.run("coverage html")
```

Nyt komento `poetry run invoke coverage-report` suorittaa ensin tehtävän _coverage_, jonka jälkeen suoritetaan itse tehtävä _coverage-report_.
