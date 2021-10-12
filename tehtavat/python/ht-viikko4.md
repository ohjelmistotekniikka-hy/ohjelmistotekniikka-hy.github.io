---
layout: page
title: Harjoitustyö viikko 4
permalink: /python/ht-viikko4
---

{% include java_materiaali_info.md %}

**⚠️ Palautuksen deadline on {{site.wk4dl}}.**

Muista pushata harjoitustyöhön liittyvät asiat GitHubiin ennen viikkodeadlinea.

- Klo 00 jälkeen tulevia repositorion päivityksiä ei huomioida pisteytyksessä, eli ne tuovat 0 pistettä.

{% include harjoitustyon_toimivuus_info.md %}

Palautuksesta on tarjolla 3 kurssipistettä.

Arvostelussa kiinnitetään huomiota seuraaviin seikkoihin:

- Ohjelma on kasvanut edellisestä viikosta (0.75p)
  - Projektin koodin pystyy suorittamaan komentoriviltä komennolla `poetry run invoke start`
  - Suoritettava versio on kasvanut edellisestä viikosta _ja_ toteuttaa edellisen viikon versiota suuremman osan määrittelydokumentin toiminnallisuuksista eli ohjelmaan on lisätty jotain käyttäjälle näkyvää hyödyllistä toiminnallisuutta. Merkitse lisäksi tarkastusta varten määrittelydokumenttiin valmiit toiminnallisuudet "tehty" merkinnällä.
- Testaus on edennyt (0.5p)
  - Sovellukselle tulee pystyä generoimaan testikattavuusraportti komennolla `poetry run invoke coverage-report`
  - Käyttöliittymään ja testeihin liittyvä koodi [jätetään pois](/python/coverage#tiedostojen-jättäminen-raportin-ulkopuolelle) testikattavuusraportista
  - Projektin _src_-hakemiston alahakemistoissa tulee olla tyhjät <i>\_\_init\_\_.py</i>-tiedostot [ohjeiden](/python/coverage#testikattavuusraportti) mukaisesti, jotta kaikki halutut tiedostot sisällytetään testikattavuusraporttiin
  - Sovelluksen testien haarautumakattavuuden tulee olla vähintään 20%
  - Testien tulee olla mielekkäitä, eli niiden on testattava jotain ohjelman kannalta merkityksellistä asiaa
- Koodin laatu (1p)
  - Sovelluslogiikka on riittävissä määrin eriytetty käyttöliittymästä
    - Vihjeitä [täällä](/python/toteutus) ja [referenssisovelluksessa](https://github.com/ohjelmistotekniikka-hy/python-todo-app/blob/master/dokumentaatio/arkkitehtuuri.md)
  - Ohjelman [rakenne](/python/koodin-laatuvaatimukset#5-rakenne) heijastaa ohjelman loogista rakennetta ja on nimennältään järkevä
  - Pylint on otettu käyttöön
    - Ohje pylintin käyttöönottoon [täällä](/python/pylint)
    - Täydet pisteet pylintistä ainoastaan jos pylintin antama arvosana koodille on vähintään 7.00/10
    - Käyttöliittymään tai testeihin liittyvän koodin ei tarvitse olla pylint-tarkastelun alla
    - `pylint: disable`-kommenttien käyttö on kiellettyä ilman erittäin perusteltua syytä
- Ohjelman alustava rakenne luokka/pakkauskaaviona (0.75p)
  vastaavalla mekanismilla
  - Kaavion ei tarvitse merkitä kuin sovelluslogiikan kannalta oleelliset luokat
  - Voit tarvittaessa tehdä kaavion, josta ilmenee myös sovelluksen [pakkausrakenne](/python/materiaali#pakkauskaavio)
  - Mallia voi ottaa [referenssisovelluksesta](https://github.com/ohjelmistotekniikka-hy/python-todo-app/blob/master/dokumentaatio/arkkitehtuuri.md#sovelluslogiikka)
  - Tee repositorioosi hakemisto _dokumentaatio_ ja sen sisälle tiedosto _arkkitehtuuri.md_ ja upota kuva tiedostoon, tiedoston sisältö voi olla muilta osin tyhjä
  - Tiedostoon _arkkitehtuuri.md_ tulee olla linkki repositorion README:stä [referenssisovelluksen](https://github.com/ohjelmistotekniikka-hy/python-todo-app) tavoin

**Seuraavien kohtien puutteet vähentävät pisteitä:**

- Tuntikirjanpito on ajantasalla
  - Tuntien summan tulee olla merkittynä
  - Tuntikirjanpitoon ei merkitä laskareihin käytettyä aikaa
- Repositorion _README.md_-tiedosto kunnossa
  - Tiedosto on kurssin tämän vaiheen osalta relevantin sisällön suhteen samankaltainen kuin [referenssisovelluksen](https://github.com/ohjelmistotekniikka-hy/python-todo-app) README.md
  - Kaikki ylimääräinen, mm. linkit laskareihin on poistettu
- Repositorio siisti
  - Ei ylimääräistä tavaraa (mm. `pytest`- ja `coverage`-komentojen generoimia tiedostoja)
  - Laskarit jätetään hakemiston _laskarit_ alle
  - Järkevä _.gitignore_-tiedosto olemassa

{% include harjoitustyon_toimivuus.md %}

{% include ala_plagioi.md %}
