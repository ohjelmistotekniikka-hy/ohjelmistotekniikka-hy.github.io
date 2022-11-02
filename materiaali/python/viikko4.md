---
layout: page
title: Viikko 4
permalink: /python/viikko4
---

{% include java_materiaali_info.md %}

{% include deadline_info.md deadline=site.wk4dl %}

Tämän viikon harjoitustyön palautuksesta on tarjolla 3 pistettä.

## Pylint ja koodin laaduun staattinen analyysi

Koodin testauksen lisäksi koodin laadun ylläpitäminen on tärkeää. Laadun ylläpitäminen on mahdollista erilaisilla manuaalisilla menetelmillä, kuten laatuvaatimusten dokumentoinnilla ja koodikatselmoinneilla. Monet manuaaliset laadunhallinnan menetelmät osoittautuvat kuitenkin laajoissa ohjelmistoprojekteissa usein turhan aikaavieviksi ja virhealttiiksi. _Staattinen analyysi_ on menetelmä, jonka avulla koodia voidaan analysoida automatisoidusti ilman, että sitä tarvitsee suorittaa. Staattista analyysia hyödynnetään ohjelmistokehityksessä laajasti mm. ohjelmointivirheiden huomaamiseen ja laatutarkistuksien tekemiseen. Eräs Python-koodin staattisessa analyysissä laajasti käytetty työkalu on [pylint](https://www.pylint.org/). Pylintin avulla voimme määrittä koodin laadulle erilaisia vaatimuksia ja automatisoidusti tarkastaa, noudattaako tarkastettava koodi näitä sääntöjä.

> Pylint is a tool that checks for errors in Python code, tries to enforce a coding standard and looks for code smells. It can also look for certain type errors, it can recommend suggestions about how particular blocks can be refactored and can offer you details about the code's complexity.

### Pylintin käyttöönotto projektissa

Pylint on helppo ottaa käyttöön Poetry-projektissa. Aloitetaan asentamalla pylint projektimme kehityksen aikaiseksi riippuvuudeksi:

```
poetry add pylint --group dev
```

Pylintille tulee määritellä joukko tarkistettavia [sääntöjä](http://pylint.pycqa.org/en/2.6/technical_reference/features.html). Säännöt määritellään projektin juurihakemiston _.pylintrc_-tiedostossa. Luo kyseinen tiedosto ja kopioi sinne [tämän]({{site.repo_url}}/tree/master/materiaali/python/.pylintrc) tiedoston sisältö. Tiedosto sisältää hieman muunnellun version pylintin suosittelemasta konfiguraatiosta, jota voi katsella komennolla `pylint --generate-rcfile`.

Pylintin laatutarkitukset voi suorittaa komentoriviltä siirtymällä ensin virtuaaliympäristöön komennolla `poetry shell` ja sen jälkeen suorittamalla komennon `pylint src`. Komento tulee suorittaa projektin juurihakemistossa, eli samassa hakemistossa missä _pyproject.toml_-tiedosto sijaitsee. Kyseinen komento suorittaa laatutarkitukset _src_ hakemistossa. Pylint antaa koodille "arvosanan" sen laadun mukaan, joka löytyy tulosteen lopusta:

```
Your code has been rated at 10.00/10 (previous run: 10.00/10, +0.00)
```

### Laatutarkistuksien kytkeminen pois päältä

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

Älä jätä tarkistamatta mitään muuta kuin käyttöliittymään tai testeihin liittyvää koodia!

Korjaa ohjelmastasi kaikki pylintin ilmoittamat virheet. Vain harvoissa poikkeustilanteissa säännön kytkeminen pois päältä kommentin avulla on hyvä ratkaisu.

### Integrointi editoriin

Monissa editoreissa on lisäosia, jotka huomauttavat laatuvirheistä suoraan koodissa. Tämä tekee niiden huomaamisesta ja korjaamisesta nopeampaa. Jos käytössäsi on [Visual Studio Code](https://code.visualstudio.com/), riittää että varmistat, että [Python](https://marketplace.visualstudio.com/items?itemName=ms-python.python) lisäosa on asennettu:

![Visual Studio Code Python lisäosa](/assets/images/python/vscode-python-lisaosa.png)

Tämän jälkeen Visual Studio Coden tulisi huomauttaa laatuvirheistä suoraan koodissa punaisella alleviivauksessa. Viemällä hiiren ongelmallisen koodin päälle pitäisi aueta tarkempaa tietoa virheestä:

![Visual Studio Code pylint](/assets/images/python/vscode-pylint.png)

Jos integroinnin kanssa ilmenee ongelmia, tutustu Visual Studio Coden [ohjeisiin](https://code.visualstudio.com/docs/python/linting).

### Automaattinen formatointi

Tiettyjen laatukorjausten, kuten sisennysten ja liian pitkien koodirivien korjaaminen tuottaa välillä turhaa manuaalista työtä. Koodin automaattisessa formatoinnissa auttaa [autopep8](https://pypi.org/project/autopep8/)-kirjasto. Kirjasto formatoi koodin automaattisesti [PEP 8](https://www.python.org/dev/peps/pep-0008/)-tyyliohjeiden mukaisesti. Aloitetaan sen käyttö asentamalle se projektin riippuvuudeksi:

```bash
poetry add autopep8 --group dev
```

Tämän jälkeen voimme virtuaaliympäristössä formatoida _src_ hakemiston koodin komennolla:

```bash
autopep8 --in-place --recursive src
```

Komennolle voi myös tehdä oman tehtävänsä, jolloin suoritus onnistuu esimerkiksi komennolla `poetry run invoke format`.

Koodin formatointi onnistuu myös monissa editoreissa kätevästi yhdellä näppäinkomennolla. Ohje koodin formatointiin Visual Studio Codessa löytyy [täältä](https://code.visualstudio.com/docs/editor/codebasics#_formatting).

### Ratkaisuja yleisiin ongelmiin

- Jos pylint ilmoittaa virheestä `pygame has no X member`, ongelman saa korjattua etsimällä _.pylintrc_-tiedostosta rivin `extension-pkg-whitelist` ja muokkaamalla sen muotoon `extension-pkg-whitelist=pygame`

## Harjoitustyö

Tämän viikon aikana harjoitustyöhön toteutetaan uutta toiminallisuutta, parannetaan sen dokumentaatiota ja kiinnitetään tarkempi huomio koodin laatuun.

**Tämän viikon harjoitustyön palautuksesta on tarjolla 3 pistettä.** Viikkopisteiden lisäksi kannattaa pitää mielessä harjoitustyön lopullisen palautuksen [arvosteluperusteet](/python/arvosteluperusteet).

### Harjoitustyö 1: Uutta toiminallisuutta

Kasvata ohjelmaa edellisestä viikosta (0.75p):

- Ohjelman pystyy suorittamaan komentoriviltä komennolla `poetry run invoke start`
- Suoritettava versio on kasvanut edellisestä viikosta _ja_ toteuttaa edellisen viikon versiota suuremman osan määrittelydokumentin toiminnallisuuksista eli ohjelmaan on lisätty jotain käyttäjälle näkyvää hyödyllistä toiminnallisuutta
- Merkitse lisäksi tarkastusta varten määrittelydokumenttiin valmiit toiminnallisuudet "tehty" merkinnällä

Ohjeita toteutukseen löydät [täältä](/python/toteutus).

### Harjoitustyö 2: Testaaminen

Edistä ohjelman testaamista (0.5p):

- Sovellukselle tulee pystyä generoimaan testikattavuusraportti komennolla `poetry run invoke coverage-report`
- Projektin juurihakemistossa tulee olla _.coveragerc_-tiedosto, jossa määritellään, mistä hakemistosta testikattavuus kerätään. Käyttöliittymään ja testeihin liittyvä koodi [jätetään testikattavuusraportin ulkopuolle](/python/viikko2#tiedostojen-jättäminen-raportin-ulkopuolelle)
- Projektin _src_-hakemiston alahakemistoissa tulee olla tyhjät <i>\_\_init\_\_.py</i>-tiedostot [ohjeiden](/python/viikko2#testikattavuusraportti) mukaisesti, jotta kaikki halutut tiedostot sisällytetään testikattavuusraporttiin
- Ohjelman testien haarautumakattavuuden tulee olla vähintään 20%
- Testien tulee olla mielekkäitä, eli niiden on testattava jotain ohjelman kannalta merkityksellistä asiaa

### Harjoitustyö 3: Koodin laatu

Kiinnitä koodin laadussa huomio seuraaviin seikkoihin (1p):

- Sovelluslogiikka on riittävissä määrin eriytetty käyttöliittymästä
  - Vihjeitä [täällä](/python/toteutus) ja [referenssisovelluksessa]({{site.python_reference_app_url}}/blob/master/dokumentaatio/arkkitehtuuri.md)
- Ohjelman [rakenne](/python/koodin-laatuvaatimukset#rakenne) heijastaa ohjelman loogista rakennetta ja on nimennältään järkevä
- Pylint on otettu käyttöön
  - Käytössä on [tämä]({{site.repo_url}}/tree/master/materiaali/python/.pylintrc) _.pylintrc_-tiedosto
  - Täydet pisteet saa, jos pylint-virheitä on alle 10
  - Käyttöliittymään tai testeihin liittyvän koodin voi jättää pylint-tarkistuksien ulkopuolelle
  - `pylint: disable`-kommenttien käyttö on kiellettyä ilman erittäin perusteltua syytä
- Pylint-tarkistuksien suorittamista varten on toteutettu Invoke-tehtävä, jonka voi suorittaa komennolla `poetry run invoke lint`

### Harjoitustyö 4: Dokumentaatio

Laadi ohjelman alustava rakenne luokka, tai pakkauskaaviona (0.75p):

- Kaavion ei tarvitse merkitä kuin sovelluslogiikan kannalta oleelliset luokat
- Voit tarvittaessa tehdä kaavion, josta ilmenee myös sovelluksen [pakkausrakenne](/python/viikko3#pakkauskaavio)
- Mallia voi ottaa [referenssisovelluksesta]({{site.python_reference_app_url}}/blob/master/dokumentaatio/arkkitehtuuri.md#sovelluslogiikka)
- Lisää repositorion _dokumentaatio_-hakemistoon tiedosto _arkkitehtuuri.md_ ja upota kuva tiedostoon. Tiedoston sisältö voi olla muilta osin tyhjä
- Tiedostoon _arkkitehtuuri.md_ tulee olla linkki repositorion _README.md_-tiedostosta [referenssisovelluksen]({{site.python_reference_app_url}}) tavoin

### Harjoitustyö 5: Changelog

{% include changelog_info.md %}

### Harjoitustyö 6: Pistevähennykset

Seuraavien kohtien puutteet **vähentävät** pisteitä:

- Tuntikirjanpito on ajantasalla
  - Tuntien summan tulee olla merkittynä
  - Tuntikirjanpitoon ei merkitä laskareihin käytettyä aikaa
- Viikolle on tehty changelog-merkintä _changelog.md_-tiedostoon
- Repositorion _README.md_-tiedosto kunnossa
  - Tiedosto on kurssin tämän vaiheen osalta relevantin sisällön suhteen samankaltainen kuin [referenssisovelluksen]({{site.python_reference_app_url}}) README.md
  - Kaikki ylimääräinen, mm. linkit laskareihin on poistettu
- Repositorio siisti
  - Ei ylimääräistä tavaraa (mm. `pytest`- ja `coverage`-komentojen generoimia tiedostoja)
  - Laskarit jätetään hakemiston _laskarit_ alle
  - Järkevä _.gitignore_-tiedosto olemassa

{% include harjoitustyon_toimivuus_info.md %}

{% include ala_plagioi.md %}
