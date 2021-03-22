---
layout: page
permalink: /python/pylint
title: Pylint ja koodin laaduun staattinen analyysi
---

Koodin testauksen lisäksi koodin luettavuuden ylläpitäminen on tärkeää. Tässä hyvänä apuvälineenä on staattisen analyysin työkalu [pylint](https://www.pylint.org/). Pylintin avulla pystytään määrittelemään joukko sääntöjä, joita koodin tulisi noudattaa, ja automaisoidusti tarkastaa noudatetaanko näitä sääntöjä.

> Pylint is a tool that checks for errors in Python code, tries to enforce a coding standard and looks for code smells. It can also look for certain type errors, it can recommend suggestions about how particular blocks can be refactored and can offer you details about the code's complexity.

## Pylintin käyttöönotto projektissa

Pylint on helppo ottaa käyttöön Poetry-projektissa. Aloitetaan asentamalla pylint projektimme kehityksen aikaiseksi riippuvuudeksi:

```
poetry add pylint --dev
```

Pylintille tulee määritellä joukko tarkistettavia [sääntöjä](http://pylint.pycqa.org/en/2.6/technical_reference/features.html). Säännöt määritellään projektin juurihakemiston _.pylintrc_-tiedostossa. Luo kyseinen tiedosto ja kopioi sinne [tämän]({{site.repo_url}}/tree/master/materiaali/python/.pylintrc) tiedoston sisältö. Tiedosto sisältää hieman muunnellun version pylintin suosittelemasta konfiguraatiosta, jota voi katsella komennolla `pylint --generate-rcfile`.

Pylintin laatutarkitukset voi suorittaa komentoriviltä siirtymällä ensin virtuaaliympäristöön komennolla `poetry shell` ja sen jälkeen suorittamalla komennon `pylint src`. Kyseinen komento suorittaa laatutarkitukset _src_ hakemistossa. Pylint antaa koodille "arvosanan" sen laadun mukaan, joka löytyy tulosteen lopusta:

```
Your code has been rated at 10.00/10 (previous run: 10.00/10, +0.00)
```

## Laatutarkistuksien kytkeminen pois päältä

Lähtökohtaisesti pylintin huomauttamat laatuvirheet kannattaa yrittää kaikin keinoin korjata. Tämä johtaa lähes aina laadukkaampaan koodin. Joissain tilanteissa voimme kuitenkin hyväksyä laatuvirheet ja kytkeä tarkastukset pois päältä. Tähän löytyy erilaisia keinoja.

Otetaan esimerkiksi seuraava _src/index.py_-tiedosto:

```python
x = 3
print(x)
```

Komennon `pylint src` suorittaminen paljastaa, että pylint löytää tiedostosta seuraavan virheen:

```
src/index.py:1:0: C0103: Constant name "x" doesn't conform to UPPER_CASE naming style (invalid-name)
```

Eli tiedoston _src/index.py_-riviltä yksi löytyy väärin nimetty muuttuja. Rikottavan säännön nimi on tässä tilanteessa `invalid-name`. Järkevintä olisi vain antaa muuttujalle nimeksi `X`, mutta havainnollistetaan, kuinka säännön tarkistuksen voi ottaa riviltä pois päältä. Lisätään riville seuraava kommentti:

```python
x = 3 # pylint: disable=invalid-name
print(x)
```

Nyt `pylint src`-komennon suorittaminen pitäisi kertoa, ettei virheitä enää löydy.

Voimme myös jättää tarkistuksien ulkopuolelle kokonaisia hakemistoja ja tiedostoja. Muokkaamalla [tätä]({{site.repo_url}}/tree/master/materiaali/python/.pylintrc#L13) riviä _.pylintrc_ tiedossa. Voimme esimerkiksi jättää käyttöliittymästä vastaavan koodin hakemistossa _src/ui_ ja testit hakemistossa _src/tests_ tarkistuksien ulkopuolle:

```
ignore=CVS,ui,tests
```

Älä jätä tarkistamatta mitään muuta kuin käyttöliittymän tai testeihin liittyvää koodia! 

Korjaa ohjelmastasi kaikki pylintin ilmoittavat virheet. Vain harvoissa poikkeustilanteissa säännön kytkeminen pois päältä kommentin avulla on hyvä ratkaisu.

## Laatutarkistuksille oma tehtävä

[Invoke-ohjeessa](/python/invoke) ohjeistetaan, miten projektille voi määritellä uudelleenkäytettäviä tehtäviä ja miten niitä voi suorittaa komentoriviltä. Määritellään laatuvaatimusten tarkistamista varten oma tehtävä, `lint`. Tämä onnistuu määrittelemällä tehtävä projektin juurihakemiston _tasks.py_-tiedostossa:

```python
from invoke import task

@task
def lint(ctx):
    ctx.run("pylint src")

# ...
```

Nyt laatuvaatimusten tarkistaminen pitäisi onnistua komennolla:

```bash
poetry run invoke lint
```

## Integrointi editoriin

Monissa editoreissa on lisäosia, jotka huomauttavat laatuvirheistä suoraan koodissa. Tämä tekee niiden huomaamisesta ja korjaamisesta nopeampaa. Jos käytössäsi on [Visual Studio Code](https://code.visualstudio.com/), riittää että varmistat, että [Python](https://marketplace.visualstudio.com/items?itemName=ms-python.python) lisäosa on asennettu:

![Visual Studio Code Python lisäosa](/assets/images/python/vscode-python-lisaosa.png)

Tämän jälkeen Visual Studio Coden tulisi huomauttaa laatuvirheistä suoraan koodissa punaisella alleviivauksessa. Viemällä hiiren ongelmallisen koodin päälle pitäisi aueta tarkempaa tietoa virheestä:

![Visual Studio Code pylint](/assets/images/python/vscode-pylint.png)

Jos integroinnin kanssa ilmenee ongelmia, tutustu Visual Studio Coden [ohjeisiin](https://code.visualstudio.com/docs/python/linting).

## Automaattinen formatointi

Tiettyjen laatukorjausten, kuten sisennysten ja liian pitkien koodirivien korjaaminen tuottaa välillä turhaa manuaalista työtä. Koodin automaattisessa formatoinnissa auttaa [autopep8](https://pypi.org/project/autopep8/)-kirjasto. Kirjasto formatoi koodin automaattisesti [PEP 8](https://www.python.org/dev/peps/pep-0008/)-tyyliohjeiden mukaisesti. Aloitetaan sen käyttö asentamalle se projektin riippuvuudeksi:

```bash
poetry add autopep8 --dev
```

Tämän jälkeen voimme virtuaaliympäristössä formatoida _src_ hakemiston koodin komennolla:

```bash
autopep8 --in-place --recursive src
```

Komennolle voi myös tehdä oman tehtävänsä, jolloin suoritus onnistuu esimerkiksi komennolla `poetry run invoke format`.

Koodin formatointi onnistuu myös monissa editoreissa kätevästi yhdellä näppäinkomennolla. Ohje koodin formatointiin Visual Studio Codessa löytyy [täältä](https://code.visualstudio.com/docs/editor/codebasics#_formatting).
