---
layout: page
permalink: /java/viikko4
title: Viikko 4
---

{% include deadline_info.md deadline=site.wk4dl %}

Tämän viikon harjoitustyön palautuksesta on tarjolla 3 pistettä.

## Harjoitustyö

Harjoitustyön arvostelussa kiinnitetään huomiota seuraaviin seikkoihin:

- Ohjelma on kasvanut edellisestä viikosta (0.75p)
  - Projektin koodin pystyy suorittamaan NetBeansin vihreällä napilla _tai/ja_ komennolla <code>mvn compile exec:java -Dexec.mainClass=pakkaus.Paaohjelma</code>
  - Suoritettava oleva versio on kasvanut edellisestä viikosta _ja_ toteuttaa edellisen viikon versiota suuremman osan määrittelydokumentin toiminnallisuuksista eli ohjelmaan on lisätty jotain käyttäjälle näkyvää hyödyllistä toiminnallisuutta. Merkitse lisäksi tarkastusta varten määrittelydokumenttiin valmiit toiminnallisuudet "tehty" merkinnällä.
- Testaus on edennyt (0.5p)
  - Sovellukselle tulee pystyä generoimaan testikattavuusraportti komennolla <code>mvn test jacoco:report</code>
  - Käyttöliittymän rakentava koodi [jätetään pois](/java/maven#koodin-huomiotta-jättäminen-kattavuusraportissa) testikattavuusraportista
  - Sovelluksen testien rivikattavuuden tulee olla vähintään 20%
  - Testien tulee olla mielekkäitä, eli niiden on testattava jotain ohjelman kannalta merkityksellistä asiaa
- Koodin laatu (1p)
  - Sovelluslogiikka on riittävissä määrin eriytetty käyttöliittymästä
    - Vihjeitä [täällä](/java/toteutus) ja [referenssisovelluksessa](https://github.com/mluukkai/OtmTodoApp/blob/master/dokumentaatio/arkkitehtuuri.md)
  - Ohjelman [pakkausrakenne](/java/koodin-laatuvaatimukset#pakkaukset) heijastaa ohjelman loogista rakennetta ja on nimennältään järkevä
  - Checkstyle on otettu käyttöön
    - Ohje Checkstylen käyttöönottoon [täällä](/java/checkstyle)
    - Täydet pisteet Checkstylestä ainoastaan jos ohjelmassa on alle 10 Checkstyle-virhettä
    - Käyttöliittymän rakentavan koodin ei tarvitse olla Checkstyle-tarkastelun alla
- Ohjelman alustava rakenne luokka/pakkauskaaviona (0.75p)
  vastaavalla mekanismilla
  - Kaavion ei tarvitse merkitä kuin sovelluslogiikan kannalta oleelliset luokat
  - Voit tarvittaessa tehdä kaavion, josta ilmenee myös sovelluksen [pakkausrakenne](/java/materiaali#pakkauskaavio)
  - Mallia voi ottaa [referenssisovelluksesta](https://github.com/mluukkai/OtmTodoApp/blob/master/dokumentaatio/arkkitehtuuri.md#sovelluslogiikka)
  - Tee repositorioosi hakemisto _dokumentaatio_ ja sen sisälle tiedosto _arkkitehtuuri.md_ ja upota kuva tiedostoon, tiedoston sisältö voi olla muilta osin tyhjä
  - Tiedostoon _arkkitehtuuri.md_ tulee olla linkki repositorion README:stä [referenssisovelluksen](https://github.com/mluukkai/OtmTodoApp) tavoin

Seuraavien kohtien puutteet vähentävät pisteitä

- Tuntikirjanpito on ajantasalla
  - Tuntien summan tulee olla merkittynä
  - Tuntikirjanpitoon ei merkitä laskareihin käytettyä aikaa
- Viikolle on tehty changelog-merkintä _changelog.md_-tiedostoon
- Repositorion README.md kunnossa
  - tiedosto on kurssin tämän vaiheen osalta relevantin sisällön suhteen samankaltainen kuin [referenssisovelluksen](https://github.com/mluukkai/OtmTodoApp) README.md
  - kaikki ylimääräinen, mm. linkit laskareihin on poistettu
- Repositorio siisti
  - ei ylimääräistä tavaraa (mm. hakemistoa target/ tai tietokantatiedoistoja)
  - laskarit jätetään hakemiston _laskarit_ alle
  - järkevä .gitignore-tiedosto olemassa

{% include harjoitustyon_toimivuus.md %}

{% include ala_plagioi.md %}
