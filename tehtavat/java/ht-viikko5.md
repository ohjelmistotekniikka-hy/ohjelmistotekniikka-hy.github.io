---
layout: page
permalink: /java/ht-viikko5
title: Harjoitustyö viikko 5
---

**Palautuksen deadline {{site.wk5dl}}.**

**HUOM** jotta voisit osallistua viikolla 6 pidettävään koodikatselmointiin (josta tarjolla 2 kurssipistettä)

- viikon 5 deadlinen jälkeen tulee palautusrepositoriosta löytyä osan määrittelydokumentin käyttäjälle näkyvää toiminnallisuutta toteuttava toimiva versio harjoitustyöstä
- viikon 5 palautuksesta tulee saada enemmän kuin 0 pistettä
- palautusrepositorioistasi on GitHub-issuet sallittuna, ks. [ohje](/java/ht-viikko5#issueiden-salliminen)

Muista pushata harjoitustyöhön liittyvät asiat GitHubiin ennen viikkodeadlinea.

- Klo 00 jälkeen tulevia repositorion päivityksiä ei huomioida pisteytyksessä, eli ne tuovat 0 pistettä.

**HUOM! Saadaksesi harjoitustyöstä viikkokohtaiset pisteet, sovelluksen tulee toimia laitoksen koneella ja ohjaajien pitää pystyä se niiltä aukaisemaan!!** Esim. [Virtuaalisessatyöasemassa](https://vdi.helsinki.fi) voit testata tätä.

Palautuksesta on tarjolla 3 kurssipistettä.

Arvostelussa kiinnitetään huomiota seuraaviin seikkoihin

- Ohjelmasta pystyy tekemään suorituskelpoisen [jar](/java/maven.md#jarin-generointi)-tiedoston komennolla _mvn package_ (0.5p)
- Projektista on tehty _github release_ (0.25p)
  - Release sisältää ohjelman uusimman version suorituskelpoisen jar-tiedoston
  - [Ohje](/release) releasen tekemiseen
  - Releaseen on linkki projektin README:stä
- Ohjelma on kasvanut edellisestä viikosta (0.75p)
  - Ohjelman suoritettavissa oleva versio on kasvanut edellisestä viikosta _ja_ toteuttaa edellisen viikon versiota suuremman osan määrittelydokumentin toiminnallisuudesta eli jotain käyttäjälle näkyvää hyödyllistä toiminnallisuutta.
    Merkitse lisäksi tarkastusta varten määrittelydokumenttiin tällä viikolla tekemäsi toiminnallisuudet "tehty" merkinnällä.
- Testaus on edennyt (0.5p)
  - Sovellukselle tulee pystyä generoimaan testikattavuusraportti komennolla <code>mvn test jacoco:report</code>
  - Käyttöliittymän rakentava koodi [jätetään pois](/java/maven.md#koodin-huomiotta-jättäminen-kattavuusraportissa) testikattavuusraportista
  - Sovelluksen testien rivikattavuuden tulee olla vähintään 40%
  - Testien tulee olla mielekkäitä, eli niiden on testattava jotain ohjelman kannalta merkityksellistä asiaa
- Koodin laatu (0.5p)
  - Sovelluslogiikka on eriytetty käyttöliittymästä
    - Vihjeitä [täällä](/java/toteutus) ja [referenssisovelluksessa](https://github.com/mluukkai/OtmTodoApp/blob/master/dokumentaatio/arkkitehtuuri.md)
  - Ohjelman [pakkausrakenne](/java/koodin-laatuvaatimukset#5-pakkaukset) heijastaa ohjelman loogista rakennetta ja on nimennältään järkevä
  - Checkstyle on käytössä
    - Täydet pisteet Checkstylestä ainoastaan jos ohjelmassa on alle 5 Checkstyle-virhettä
    - Käyttöliittymän rakentavan koodin ei tarvitse olla Checkstyle-tarkastelun alla
  - Ohjelma ei sisällä suurta määrää toisteista koodia
- Ohjelman dokumentaatiossa on ainakin yksi sen jotain oleellista toiminnallisuutta kuvaava sekvenssikaavio (0.5p)
  - Mallia voi ottaa [referenssisovelluksesta](https://github.com/mluukkai/OtmTodoApp/blob/master/dokumentaatio/arkkitehtuuri.md#sovelluslogiikka)
  - Lisää kaavio [edellisellä viikolla](/java/ht-viikko4) tehtyyn dokumenttiin _arkkitehtuuri.md_
  - Tiedostoon _arkkitehtuuri.md_ tulee olla linkki repositorion README:stä [referenssisovelluksen](https://github.com/mluukkai/OtmTodoApp) tavoin

**Seuraavien kohtien puutteet vähentävät pisteitä**

- Koodin laatu
  - Pakkausrakenne ei ole järkevä (esim. kaikki koodi oletuspakkauksessa)
  - Sovelluslogiikkaa ei ole eriytetty riittävästi käyttöliittymästä
- Tuntikirjanpito on ajantasalla
  - **Tuntien summan tulee olla merkittynä**
  - Tuntikirjanpitoon ei merkitä laskareihin käytettyä aikaa
- Palautusrepositorioosi voi tehdä GitHub-issuieta, ks [ohje](/java/ht-viikko5#issueiden-salliminen)
- Repositorion README.md kunnossa
  - tiedosto on kurssin tämän vaiheen osalta relevantin sisällön suhteen samankaltainen kuin [referenssisovelluksen](https://github.com/mluukkai/OtmTodoApp) README.md, eli siellä on ainakin seuraavat
    - harjoitustyön aiheen lyhyt kuvaus
    - linkit vaatimusmäärittelyyn, arkkitehtuuridokumenttiin ja tuntikirjanpitoon
    - linkki releaseen
    - ohjeet komentoriviltä suoritettaviin toimenpiteisiin (testaus, testiraportin suoritus, suoritettavan jarin generointi, checkstyletarkastuksen suorittaminen)
- Repositorio siisti
  - ei ylimääräistä tavaraa (mm. hakemistoa target)
  - laskarit jätetään hakemiston _laskarit_ alle
  - järkevä .gitignore-tiedosto olemassa

## Issueiden salliminen

Varmista, että palautusrepositorioosi on mahdollista tehdä issueita, eli repositorion _Settings_ näyttää seuraavalta

![](/assets/images/issuet.png)

{% include harjoitustyon_toimivuus.md %}

{% include ala_plagioi.md %}
