---
layout: page
permalink: /java/ht-viikko3
title: Harjoitustyö viikko 3
---

**⚠️ Palautuksen deadline {{site.wk3dl}}.**

Muista pushata harjoitustyöhön liittyvät asiat GitHubiin ennen viikkodeadlinea.

- Klo 00 jälkeen tulevia repositorion päivityksiä ei huomioida pisteytyksessä, eli ne tuovat 0 pistettä.

**HUOM! Saadaksesi harjoitustyöstä viikkokohtaiset pisteet, sovelluksen tulee toimia laitoksen koneella ja ohjaajien pitää pystyä se niiltä aukaisemaan!!** Voit testata tätä esim. [virtuaalityöasemassa](https://vdi.helsinki.fi).

Kurssilla käytetään Javan versiota 11. Ohjeet sen asentamiseen ovat [täällä](https://www.mooc.fi/fi/installation/netbeans).

Palautuksesta on tarjolla 2 kurssipistettä.

Arvostelussa kiinnitetään huomiota seuraaviin seikkoihin

- Repositorion juuresta löytyy Maven-projekti
  - [ohje](/java/harjoitustyon-aloittaminen#harjoitusty%C3%B6n-aloitus) projektin luomiseen ja sen sijoittamiseen palautusrepositorioon
- Projektin koodin pystyy suorittamaan NetBeansin vihreällä napilla _tai/ja_ komennolla ```mvn compile exec:java -Dexec.mainClass=pakkaus.Paaohjelma```
  - komennon parametrina on metodin _main_ sisältävän luokan täydellinen, eli myös pakkauksen sisältävä, nimi
  - [referenssisovelluksen](https://github.com/mluukkai/OtmTodoApp) tapauksessa parametri olisi ```-Dexec.mainClass=todoapp.ui.TodoUi```
- Edellytys pisteille suoritettavissa oleva versio, joka toteuttaa ainakin osan jostain viikolla 2 tekemäsi määrittelydokumentin toiminnallisuudesta
  - pelkät gettereitä ja settereitä sisältävät, täysin ilman toiminnallisuutta olevat luokat eivät tuo pisteitä
- Sovelluksella on oltava _vähintään yksi testi_ jonka voi suorittaa komennolla ```mvn test```
  - Testin tulee olla mielekäs, eli sen on testattava jotain ohjelman kannalta merkityksellistä asiaa
  - Testin tulee mennä läpi
- Sovellukselle tulee pystyä generoimaan testikattavuusraportti komennolla ```mvn test jacoco:report```
- Tuntikirjanpito on ajantasalla
  - Tuntikirjanpitoon ei merkitä laskareihin käytettyä aikaa
- Repositorion README.md kunnossa
  - tiedosto on kurssin tämän vaiheen osalta relevantin sisällön suhteen samankaltainen kuin [referenssisovelluksen](https://github.com/mluukkai/OtmTodoApp) README.md
  - kaikki ylimääräinen, mm linkit laskareihin on poistettu
- Repositorio siisti
  - ei ylimääräistä tavaraa (mm. hakemistoa target/ tai tietokantatiedostoja)
  - laskarit jätetään hakemiston _laskarit_ alle
  - järkevä .gitignore-tiedosto olemassa

Ohjelman tulee edistyä jokaisella viikolla tasaisesti. Jos ohjelma tulee valmiiksi jo ennen loppupalautusta valmistaudu laajentamaan sitä saadaksesi ohjelman edistymisestä pisteet. Tarkoitus on edistää projektia tasaisesti kurssiviikkojen aikana.

{% include harjoitustyon_toimivuus.md %}

{% include ala_plagioi.md %}
