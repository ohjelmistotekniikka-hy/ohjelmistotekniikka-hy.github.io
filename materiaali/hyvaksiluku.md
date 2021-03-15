---
layout: page
permalink: /hyvaksiluku
title: Kurssin hyväksiluku
---

Kurssi on mahdollista _hyväksilukea_, eli ansaita opintopisteet arvosanalla _hyväksytty_. Hyväksiluvun vaatimuksena on ohjelmointiprojektin toteutus ja dokumentointi. Projektin toteutuksessa käytetty ohjelmointikieli on vapaasti valittavissa, kunhan ohjelman suorittamiseen vaadittavat toimenpiteet on dokumentoitu.

Jos haluat hyväksilukea kurssin, ota sähköpostilla yhteyttä kurssin vastuuopettajaan Matti Luukkaiseen (matti.luukkainen@helsinki.fi).

## Projektin vaatimukset

### Laajuus

- Projektin toteuttamiseen, testaamiseen ja dokumentointiin käytetyn työajan tulee olla vähintään **80 tuntia**
- Sovelluksella täytyy olla jokin käyttöliittymä, esim. komentoriviltä käytettävä tai graafinen käyttöliittymä
- Projektin sovelluslogiikkaa tulee testata, niin että testien rivi- ja haarautumakattavuus on vähintään 60%. Käyttöliittymään liittyvää koodia ei tarvitse testata, joten sen voi jättää kattavuuden ulkopuolelle. Tälle on kuitenkin se vaatimus, että sovelluslogiikan ja käyttöliittymän koodi ovat erillään toisistaan

### Koodin laatu

- Sovelluksen koodin tulee noudattaa kurssilla määriteltyjä [laatuvaatimuksia](./koodin-laatuvaatimukset.md). Laatuvaatimuksia saattaa joutua soveltamaan ohjelmointikielestä riippuen
- Sovelluksen koodin tulee olla suurimmilta osin kommenttien avulla dokumentoituta ohjelmointikielen standardien mukaisesti (esim. Pythonin [Docstring](./docstring.md)). Tämä tarkoittaa mm. luokkien, metodien ja funktioiden dokumentointia

### Versionhallinta ja repositorio

- Projektin lähdekoodin tulee olla GitHub-repositoriossa. Repositorio voi olla julkinen ja yksityinen. Jos repositorio on yksityinen, lisää sen kollaboraattoreiksi käyttäjät [Kaltsoon](https://github.com/Kaltsoon) ja [mluukkai](https://github.com/mluukkai)
- Luo sovelluksesta [GitHub release](./release.md). Kerro repositorion `README.md`-tiedossa, mikä release pitää ladata ja miten se suoritetaan
- Lisää repositorioon `README.md`-tiedosto, joka on suurin piirtein kurssin [referenssisovelluksen](https://github.com/ohjelmistotekniikka-hy/python-todo-app) mukainen. Mukana tulee olla vähintään seuraavat asiat:
  - Lyhyt kuvaus projektista
  - Linkit dokumentaatioon
  - Ohjeet ohjelman suorittamiselle
  - Ohjeet testien suorittamiselle

### Dokumentaatio

Jokaiseen dokumenttiin tulee olla linkki projektin repositorion `README.md`-tiedostossa. Dokumentaatiossa tulee olla vähintään seuraavat dokumentit: 

- **Arkkitehtuurikuvaus**, joka on suurin piirtein [referenssisovelluksen](https://github.com/ohjelmistotekniikka-hy/python-todo-app/blob/master/dokumentaatio/arkkitehtuuri.md) arkkitehtuurikuvauksen mukainen. Mukana tulee olla vähintään [sovelluslogiikan](https://github.com/ohjelmistotekniikka-hy/python-todo-app/blob/master/dokumentaatio/arkkitehtuuri.md#sovelluslogiikka) sanallinen kuvaus ja kaavio. Jos sovellus on erittäin laaja, keskity johonkin olennaiseen kokonaisuuteen
- **Käyttöohje**, joka on suurin piirtein [referenssisovelluksen](https://github.com/ohjelmistotekniikka-hy/python-todo-app/blob/master/dokumentaatio/kayttoohje.md) käyttöohjeen mukainen
- **Testausdokumentti**, joka on suurin piirtein [referenssisovelluksen](https://github.com/ohjelmistotekniikka-hy/python-todo-app/blob/master/dokumentaatio/testaus.md) testausdokumentin mukainen.
- **Tuntikirjanpito**, josta käy ilmi projektin toteuttamiseen käytetyt työtunnit. [Referenssisovelluksen](https://github.com/ohjelmistotekniikka-hy/python-todo-app/blob/master/dokumentaatio/tuntikirjanpito.md) mukainen tuntikirjanpito on ihanteellinen, mutta myös karkeampi taso käy. Tärkeintä on, että tutkikirjanpidosta ilmenee, mihin osa-alueeseen työaikaa on käytetty ja kuinka paljon. Muista, että hyväksiluvun vaatimuksena on vähintään **80 työtuntia**
- Tuntikirjanpidon voi myös korvata vakuuttavalla selvityksellä siitä, että työhön on käytetty ainakin 80 tuntia aikaa.
