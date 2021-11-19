---
layout: page
title: Harjoitustyö viikko 3
permalink: /python/ht-viikko3
---

{% include java_materiaali_info.md %}

**⚠️ Palautuksen deadline on {{site.wk3dl}}.**

{% include poetry_fix.md %}

Muista pushata harjoitustyöhön liittyvät asiat GitHubiin ennen viikkodeadlinea.

- Klo 00 jälkeen tulevia repositorion päivityksiä ei huomioida pisteytyksessä, eli ne tuovat 0 pistettä.

{% include harjoitustyon_toimivuus_info.md %}

{% include virtuaalityoasema_python_versio.md %}

Palautuksesta on tarjolla 2 kurssipistettä.

Arvostelussa kiinnitetään huomiota seuraaviin seikkoihin:

- Repositorion juuresta löytyy _src_-hakemisto projektin koodille
- Projekti on alustettu [Poetry-ohjeiden](/python/poetry) mukaisesti
- Projektin koodin pystyy suorittamaan komentoriviltä komennolla `poetry run invoke start`. Kertaa [Invoke-ohjeet](/python/invoke), jos tämä tuottaa hankaluuksia
- Edellytys pisteille suoritettavissa oleva versio, joka toteuttaa ainakin osan jostain viikolla 2 tekemäsi määrittelydokumentin toiminnallisuudesta
  - Pelkät tyhjät luokat tai funktiot ilman toiminallisuutta eivät tuo pisteitä
- Sovelluksella on oltava _vähintään yksi testi_ jonka voi suorittaa komennolla `poetry run invoke test`. Kertaa [testauksen ohjeet](/python/unittest), jos tämä tuottaa hankaluuksia
  - Testin tulee olla mielekäs, eli sen on testattava jotain ohjelman kannalta merkityksellistä asiaa
  - Testin tulee mennä läpi
- Sovellukselle tulee pystyä generoimaan testikattavuusraportti komennolla `poetry run invoke coverage-report`. Kertaa [testikattavuuden ohjeet](/python/coverage), jos tämä tuottaa hankaluuksia
- Tuntikirjanpito on ajantasalla
  - Tuntikirjanpitoon ei merkitä laskareihin käytettyä aikaa
- Repositorion _README.md_-tiedosto kunnossa
  - Tiedosto on kurssin tämän vaiheen osalta relevantin sisällön suhteen samankaltainen kuin [referenssisovelluksen]({{site.python_reference_app_url}}) _README.md_-tiedosto
  - Kaikki ylimääräinen, mm. linkit laskareihin on poistettu
- Repositorio siisti
  - Ei ylimääräistä tavaraa (esim. `pytest`-, tai `coverage`-komentojen generoimia hakemistoja ja tiedostoja)
  - Laskarit jätetään hakemiston _laskarit_ alle
  - Järkevä _.gitignore_-tiedosto olemassa. Mallia voi ottaa [referenssisovelluksesta]({{site.python_reference_app_url}})

Ohjelman tulee edistyä jokaisella viikolla tasaisesti. Jos ohjelma tulee valmiiksi jo ennen loppupalautusta valmistaudu laajentamaan sitä saadaksesi ohjelman edistymisestä pisteet. Tarkoitus on edistää projektia tasaisesti kurssiviikkojen aikana.

{% include harjoitustyon_toimivuus.md %}

{% include ala_plagioi.md %}
