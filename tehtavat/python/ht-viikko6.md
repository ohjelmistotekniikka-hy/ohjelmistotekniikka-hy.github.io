---
layout: page
title: Harjoitustyö viikko 6
permalink: /python/ht-viikko6
---

**Palautuksen deadline {{site.wk6dl}}.**

**Muutama huomio**

- **Viikon 6 aikana tapahtuu koodikatselmointi**, tarkemmat ohjeet katselmointiin [täällä](/koodikatselmointi)
- Kannattaa pitää mielessä, että kurssin loppu alkaa lähestyä ja myös loppupalautuksen deadline.
  - Nyt kannattaa kerrata loppupalautuksen [arvosteluperusteet](/python/arvosteluperusteet)
  - Viimeiselläkin viikolla ohjelmaa ehtii vielä kasvattaa, mutta myös dokumentoinnille kannattaa jättää aikaa

**HUOM! Saadaksesi harjoitustyöstä viikkokohtaiset pisteet, sovelluksen tulee toimia laitoksen koneella ja ohjaajien pitää pystyä se niiltä aukaisemaan!!** Esim. [Virtuaalisessatyöasemassa](https://vdi.helsinki.fi) voit testata tätä.

Arvostelussa kiinnitetään huomiota seuraaviin seikkoihin:

- Ohjelma on kasvanut edellisestä viikosta (0.75p)
  - Ohjelman pystyy suorittamaan komentoriviltä komennolla `poetry run invoke start`
  - Ohjelman suoritettavissa oleva versio on kasvanut edellisestä viikosta _ja_ toteuttaa edellisen viikon versiota suuremman osan määrittelydokumentin toiminnallisuudesta eli jotain käyttäjälle näkyvää hyödyllistä toiminnallisuutta.
  - Merkitse lisäksi tarkastusta varten määrittelydokumenttiin tällä viikolla tekemäsi toiminnallisuudet "tehty" merkinnällä.
  - Ohjelman suoritettavissa olevasta versiosta on tehty uusi [GitHub-release](/release), joka sisältää ohjelman uusimman version lähdekoodin (GitHub lisää tämän automaattisesti releasin tehdessä)
- Koodin laatu (0.5p)
  - Ohjelma ei sisällä suurta määrää toisteista koodia eli copy-pastea
  - Ohjelman rakenne on järkevä
    - Luokkien, metodien ja funktioiden tulee pyrkiä noudattamaan niin kutsuttua [single responsibility](https://en.wikipedia.org/wiki/Single-responsibility_principle) -periaatetta, eli yhden komponentin ei tulisi tehdä liian montaa asiaa
    - Liian suuret luokat, metodit ja funktiot tulee siis pilkkoa osiin
- Testaus on edennyt (0.5p)
  - Sovellukselle tulee pystyä generoimaan testikattavuusraportti komennolla `poetry run invoke coverage-report`
    - Käyttöliittymään ja testeihin liittyvä koodi [jätetään pois](/python/coverage#tiedostojen-jättäminen-raportin-ulkopuolelle) testikattavuusraportista
  - Sovelluksen testien haarautumakattavuuden tulee olla vähintään 60%
  - Testien tulee testata järkevällä tavalla ohjelman toiminnallisuutta
    - Jos testit on tehty pelkästään haarautumakattavuuden saavuttamiseksi, ei testeistä saa pisteitä
- Docstring-dokumentointi aloitettu (0.5p)
  - Ainakin osalle ohjelman luokista, metodeista ja funktioista on tehty docstring-dokumentaatio
    - Edellytyksenä pisteille on, että suurin piirtein puolella luokista, metodeista ja funktioista on docstring-dokumentaatio
  - [Ohje](/python/docstring) docstring-dokumentointiin
- Alustava arkkitehtuurikuvaus (0.5p)
  - Dokumentti sisältää sovelluksen korkean tason (esim. hakemistojen tasolla) rakenteen kuvauksen, sekä alustavan kuvauksen sovelluslogiikasta
  - Dokumentissa voi hyödyntää edellisten viikkojen luokka- ja sekvenssikaavioita
  - Mallia voi ottaa [referenssisovelluksesta](https://github.com/ohjelmistotekniikka-hy/python-todo-app/blob/master/dokumentaatio/arkkitehtuuri.md#sovelluslogiikka)
  - Dokumentin alustavan version sopiva pituus on noin 1-2 sivua tekstiä ja kaavioita
- Alustava käyttöohje (0.25p)
  - Ohje voi olettaa, että sovellusta suoritetaan palautusrepositoriosta käsin, eli asentamiseen ja konfigurointiin ei ole vielä tarvetta ottaa kantaa
  - Alustavan käyttöohjeen sopiva pituus on noin sivu
  - Mallina voi jälleen toimia [referenssisovellus](https://github.com/ohjelmistotekniikka-hy/python-todo-app/blob/master/dokumentaatio/kayttoohje.md)

**Seuraavien kohtien puutteet vähentävät pisteitä:**

- Koodin laatu
  - Rakenne on järkevä (esim. kaikki koodi samassa hakemistossa)
  - Sovelluslogiikkaa on eriytetty riittävästi käyttöliittymästä
  - Pylint on käytössä
    - Pylintin koodille antama arvosana vähintään 8.00/10
    - Käyttöliittymän rakentavan koodin ei tarvitse olla pylint-tarkastelun alla
- Tuntikirjanpito on ajantasalla
  - **Tuntien summan tulee olla merkittynä**
  - Tuntikirjanpitoon ei merkitä laskareihin käytettyä aikaa
- Repositorion _README.md_-tiedosto on kunnossa
  - Tiedosto on kurssin tämän vaiheen osalta relevantin sisällön suhteen samankaltainen kuin [referenssisovelluksen](https://github.com/ohjelmistotekniikka-hy/python-todo-appp) README.md, eli se sisältää ainakin seuraavat
    - Harjoitustyön aiheen lyhyt kuvaus
    - Linkit vaatimusmäärittelyyn, arkkitehtuuridokumenttiin, käyttöohjeeseen ja tuntikirjanpitoon
    - Linkki releaseihin
    - Ohjeet komentoriviltä suoritettaviin toimenpiteisiin (ohjelman käynnistys, testaus, testikattavuusraportin suoritus, pylint-tarkistuksien suorittaminen)
- Repositorio siisti
  - Ei ylimääräistä tavaraa (mm. `pytest`- ja `coverage`-komentojen generoimia tiedostoja)
  - Laskarit jätetään hakemiston _laskarit_ alle
  - Järkevä _.gitignore_-tiedosto olemassa

{% include harjoitustyon_toimivuus.md %}

{% include ala_plagioi.md %}
