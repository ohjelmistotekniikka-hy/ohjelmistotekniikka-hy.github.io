---
layout: page
title: Harjoitustyö viikko 5
permalink: /python/ht-viikko5
---

**Palautuksen deadline {{site.wk5dl}}.**

**HUOM** jotta voisit osallistua viikolla 6 pidettävään koodikatselmointiin (josta tarjolla 2 kurssipistettä)

- viikon 5 deadlinen jälkeen tulee palautusrepositoriosta löytyä osan määrittelydokumentin käyttäjälle näkyvää toiminnallisuutta toteuttava toimiva versio harjoitustyöstä
- viikon 5 palautuksesta tulee saada enemmän kuin 0 pistettä
- palautusrepositorioistasi on GitHub-issuet saalittuna, katso [ohje](#issueiden-salliminen)

Muista pushata harjoitustyöhön liittyvät asiat GitHubiin ennen viikkodeadlinea.

- Klo 00 jälkeen tulevia repositorion päivityksiä ei huomioida pisteytyksessä, eli ne tuovat 0 pistettä.

**HUOM! Saadaksesi harjoitustyöstä viikkokohtaiset pisteet, sovelluksen tulee toimia laitoksen koneella ja ohjaajien pitää pystyä se niiltä aukaisemaan!!** Esim. [Virtuaalisessatyöasemassa](https://vdi.helsinki.fi) voit testata tätä.

Palautuksesta on tarjolla 3 kurssipistettä.

Arvostelussa kiinnitetään huomiota seuraaviin seikkoihin:

- Ohjelman pystyy suorittamaan komentoriviltä komennolla `poetry run invoke start` (0.5p)
- Projektista on tehty _GitHub release_ (0.25p)
  - Release sisältää ohjelman uusimman version lähdekoodin (GitHub-lisää tämän automaattisesti releasin tehdessä)
  - [Ohje](/release) releasen tekemiseen
  - Releaseen on linkki projektin README:stä
- Ohjelma on kasvanut edellisestä viikosta (0.75p)
  - Ohjelman suoritettavissa oleva versio on kasvanut edellisestä viikosta _ja_ toteuttaa edellisen viikon versiota suuremman osan määrittelydokumentin toiminnallisuudesta eli jotain käyttäjälle näkyvää hyödyllistä toiminnallisuutta.
    Merkitse lisäksi tarkastusta varten määrittelydokumenttiin tällä viikolla tekemäsi toiminnallisuudet "tehty" merkinnällä.
- Testaus on edennyt (0.5p)
  - Sovellukselle tulee pystyä generoimaan testikattavuusraportti komennolla `poetry run invoke coverage-report`
  - Käyttöliittymään ja testeihin liittyvä koodi [jätetään pois](/python/coverage#tiedostojen-jättäminen-raportin-ulkopuolelle) testikattavuusraportista
  - Sovelluksen testien haarautumakattavuuden tulee olla vähintään 40%
  - Testien tulee olla mielekkäitä, eli niiden on testattava jotain ohjelman kannalta merkityksellistä asiaa
- Koodin laatu (0.5p)
  - Sovelluslogiikka on riittävissä määrin eriytetty käyttöliittymästä
    - Vihjeitä [täällä](/python/toteutus) ja [referenssisovelluksessa](https://github.com/ohjelmistotekniikka-hy/python-todo-app/blob/master/dokumentaatio/arkkitehtuuri.md)
  - Ohjelman [rakenne](/python/koodin-laatuvaatimukset#5-rakenne) heijastaa ohjelman loogista rakennetta ja on nimennältään järkevä
  - Pylint on otettu käyttöön
    - Ohje pylintin käyttöönottoon [täällä](/python/pylint)
    - Täydet pisteet pylintistä ainoastaan jos pylintin antama arvosana koodille on vähintään 8.00/10
    - Käyttöliittymään tai testeihin liittyvän koodin ei tarvitse olla pylint-tarkastelun alla
    - `pylint: disable`-kommenttien käyttö on kiellettyä ilman erittäin perusteltua syytä
  - Ohjelma ei sisällä suurta määrää toisteista koodia
- Ohjelman dokumentaatiossa on ainakin yksi sen jotain oleellista toiminnallisuutta kuvaava sekvenssikaavio (0.5p)
  - Mallia voi ottaa [referenssisovelluksesta](https://github.com/ohjelmistotekniikka-hy/python-todo-app/blob/master/dokumentaatio/arkkitehtuuri.md#sovelluslogiikka)
  - Lisää kaavio [edellisellä viikolla](/python/ht-viikko4) tehtyyn dokumenttiin _arkkitehtuuri.md_
  - Tiedostoon _arkkitehtuuri.md_ tulee olla linkki repositorion README:stä [referenssisovelluksen](https://github.com/ohjelmistotekniikka-hy/python-todo-app) tavoin

**Seuraavien kohtien puutteet vähentävät pisteitä:**

- Koodin laatu
  - Rakenne on järkevä (esim. kaikki koodi on samassa hakemistossa)
  - Sovelluslogiikkaa on eriytetty riittävästi käyttöliittymästä
- Tuntikirjanpito on ajantasalla
  - **Tuntien summan tulee olla merkittynä**
  - Tuntikirjanpitoon ei merkitä laskareihin käytettyä aikaa
- Palautusrepositorioosi voi tehdä GitHub-issuieta, katso [ohje](#issueiden-salliminen)
- Repositorion _README.md_-tiedosto on kunnossa
  - Tiedosto on kurssin tämän vaiheen osalta relevantin sisällön suhteen samankaltainen kuin [referenssisovelluksen](https://github.com/ohjelmistotekniikka-hy/python-todo-app) README.md, eli siellä on ainakin seuraavat
    - Harjoitustyön aiheen lyhyt kuvaus
    - Linkit vaatimusmäärittelyyn, arkkitehtuuridokumenttiin ja tuntikirjanpitoon
    - Linkki releaseen
    - Ohjeet komentoriviltä suoritettaviin toimenpiteisiin (ohjelman käynnistys, testaus, testikattavuusraportin suoritus, pylint-tarkistuksien suorittaminen)
- Repositorio siisti
  - Ei ylimääräistä tavaraa (mm. `pytest`- ja `coverage`-komentojen generoimia tiedostoja)
  - Laskarit jätetään hakemiston _laskarit_ alle
  - Järkevä _.gitignore_-tiedosto olemassa

## Issueiden salliminen

Varmista, että palautusrepositorioosi on mahdollista tehdä issueita, eli repositorion _Settings_ näyttää seuraavalta

![](/assets/images/issuet.png)

{% include harjoitustyon_toimivuus.md %}

{% include ala_plagioi.md %}
