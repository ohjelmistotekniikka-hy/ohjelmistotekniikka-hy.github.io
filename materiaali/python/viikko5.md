---
layout: page
title: Harjoitustyö viikko 5
permalink: /python/vk5
---

{% include deadline_info.md deadline=site.wk5dl %}

## GitHub release

Eräs tapa julkaista ohjelmasta vakaa versio on tehdä GitHubiin release, eli julkaistu versio:

- Klikkaa repositorion GitHub-sivulta kohtaa "0 releases"
- Valitse _Draft a new release_
- Määrittele julkaisun tiedot
  - Käytä tagina palautuksen viikkoa. Esimerkiksi viikon 5 palautuksessa tagina on "viikko5"
- Jos sovelluksen suorituksessa edellytetään tiedostoja, tai jonkin erityisen komennon suorittamista, voit mainita niistä tekstissä. Kaikki asennukseen vaadittavat toimenpiteet tulee kuitenkin mainita myös _README.md_-tiedostossa
- GitHub liittää automaattisesti projektin lähdekoodin zip-pakattuna releaseen.

![Release](/assets/images/python/release.png)

Nyt koodi on kenen tahansa ladattavissa menemällä GitHub-repositorioosi, ja klikkaamalla repositoriosivusi kohtaa "1 release". Ohjelman käynnistäminen tulee olla mahdollista lataamalla releasessa oleva projektin lähdekoodi ja noudattamalla _README.md_-tiedoston ohjeita.

Projektin käyttöönottoa kannattaa testata releasen kautta: lataa releasessa mukana oleva lähdekoodi, noudata oman _README.md_-tiedostosi ohjeita ja varmista, että sovellus toimii, kuten pitäisi. _Älä oleta mitään_, esimerkiksi, että käyttäjä tietää, että tiettyyn hakemistoon tulee lisätä tietty tiedosto, että sovellus toimii.

## Issueiden salliminen GitHubissa

Varmista, että palautusrepositorioosi on mahdollista tehdä issueita, eli repositorion _Settings_ näyttää seuraavalta

![](/assets/images/issuet.png)

## Harjoitustyö

Tämän viikon aikana harjoitustyöhön toteutetaan edellisen viikon tapaan uutta toiminallisuutta ja parannetaan sen dokumentaatiota.

**Tämän viikon palautuksesta on tarjolla 3 pistettä.** Viikkopisteiden lisäksi kannattaa pitää mielessä harjoitustyön lopullisen palautuksen [arvosteluperusteet](/python/arvosteluperusteet).

### 🧪 Harjoitustyö 1: GitHub release

Tekee projektistasi _GitHub release_ edellä esitetyn [ohjeen](#github-release) mukaisesti (0.25p):

- Release sisältää ohjelman uusimman version lähdekoodin (GitHub-lisää tämän automaattisesti releasin tehdessä)
- Releaseen on linkki projektin README:stä

### 🧪 Harjoitustyö 2: Koodikaatselmointiin valmistautuminen

Jotta voit osallistua viikolla 6 pidettävään koodikatselmointiin (josta on tarjolla 2 kurssipistettä), tulee seuraavien asioiden olla kunnossa:

- Viikon 5 deadlinen jälkeen tulee palautusrepositoriosta löytyä toimiva versio harjoitustyöstä, joka toteuttaa osan määrittelydokumentin käyttäjälle näkyvästä toiminnallisuudesta
- Viikon 5 palautuksesta tulee saada enemmän kuin 0 pistettä
- Palautusrepositorioistasi on [GitHub-issuet sallittuna](#issueiden-salliminen-githubissa)

### 🧪 Harjoitustyö 3: Uutta toiminallisuutta

Kasvaata ohjelmaa edellisestä viikosta (0.75p):

- Ohjelman pystyy suorittamaan komentoriviltä komennolla `poetry run invoke start`
- Suoritettava versio on kasvanut edellisestä viikosta _ja_ toteuttaa edellisen viikon versiota suuremman osan määrittelydokumentin toiminnallisuuksista eli ohjelmaan on lisätty jotain käyttäjälle näkyvää hyödyllistä toiminnallisuutta
- Merkitse lisäksi tarkastusta varten määrittelydokumenttiin valmiit toiminnallisuudet "tehty" merkinnällä

Ohjeita toteutukseen löydät [täältä](/python/toteutus).

### 🧪 Harjoitustyö 4: Testaaminen

Edistä ohjelman testaamista (0.5p):

- Sovellukselle tulee pystyä generoimaan testikattavuusraportti komennolla `poetry run invoke coverage-report`
- Käyttöliittymään ja testeihin liittyvä koodi [jätetään pois](/python/coverage#tiedostojen-jättäminen-raportin-ulkopuolelle) testikattavuusraportista
- Projektin _src_-hakemiston alahakemistoissa tulee olla tyhjät <i>\_\_init\_\_.py</i>-tiedostot [ohjeiden](/python/coverage#testikattavuusraportti) mukaisesti, jotta kaikki halutut tiedostot sisällytetään testikattavuusraporttiin
- Ohjelman testien haarautumakattavuuden tulee olla vähintään 40%
- Testien tulee olla mielekkäitä, eli niiden on testattava jotain ohjelman kannalta merkityksellistä asiaa

### 🧪 Harjoitustyö 5: Koodin laatu

Kiinnitä koodin laadussa huomio seuraaviin seikkoihin (1p):

- Sovelluslogiikka on riittävissä määrin eriytetty käyttöliittymästä
  - Vihjeitä [täällä](/python/toteutus) ja [referenssisovelluksessa]({{site.python_reference_app_url}}/blob/master/dokumentaatio/arkkitehtuuri.md)
- Ohjelman [rakenne](/python/koodin-laatuvaatimukset#rakenne) heijastaa ohjelman loogista rakennetta ja on nimennältään järkevä
- Pylintin antama arvosana koodille on vähintään 8.00/10

### 🧪 Harjoitustyö 6: Dokumentaatio

Lisää dokumentaatioon ainakin yksi jotain oleellista toiminnallisuutta kuvaava sekvenssikaavio (0.5p):

- Mallia voi ottaa [referenssisovelluksesta]({{site.python_reference_app_url}}/blob/master/dokumentaatio/arkkitehtuuri.md#sovelluslogiikka)
- Lisää kaavio [edellisellä viikolla](/python/ht-viikko4) tehtyyn dokumenttiin _arkkitehtuuri.md_
- Tiedostoon _arkkitehtuuri.md_ tulee olla linkki repositorion README:stä [referenssisovelluksen]({{site.python_reference_app_url}}) tavoin

### 🧪 Harjoitustyö 7: Pistevähennykset

Seuraavien kohtien puutteet **vähentävät** pisteitä:

- Koodin laatu
  - Rakenne on järkevä (esim. kaikki koodi on samassa hakemistossa)
  - Sovelluslogiikkaa on eriytetty riittävästi käyttöliittymästä
- Tuntikirjanpito on ajantasalla
  - **Tuntien summan tulee olla merkittynä**
  - Tuntikirjanpitoon ei merkitä laskareihin käytettyä aikaa
- Palautusrepositorioosi voi tehdä GitHub-issueita, katso [ohje](#issueiden-salliminen-githubissa)
- Repositorion _README.md_-tiedosto on kunnossa
  - Tiedosto on kurssin tämän vaiheen osalta relevantin sisällön suhteen samankaltainen kuin [referenssisovelluksen]({{site.python_reference_app_url}}) README.md, eli siellä on ainakin seuraavat
    - Harjoitustyön aiheen lyhyt kuvaus
    - Linkit vaatimusmäärittelyyn, arkkitehtuuridokumenttiin ja tuntikirjanpitoon
    - Linkki releaseen
    - Ohjeet komentoriviltä suoritettaviin toimenpiteisiin (ohjelman käynnistys, testaus, testikattavuusraportin suoritus, pylint-tarkistuksien suorittaminen)
- Repositorio siisti
  - Ei ylimääräistä tavaraa (mm. `pytest`- ja `coverage`-komentojen generoimia tiedostoja)
  - Laskarit jätetään hakemiston _laskarit_ alle
  - Järkevä _.gitignore_-tiedosto olemassa
