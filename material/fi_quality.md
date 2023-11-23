---
layout: page
permalink: /fi/tasks/quality
title: Koodin laatuvaatimukset
---

Kurssin tavoitteena on, että tuotoksesi voisi ottaa kuka tahansa kaverisi tai muu opiskelija ylläpidettäväksi ja laajennettavaksi. Tavoitteena on Clean code - selkeää, ylläpidettävää ja toimivaksi testattua koodia. Tämä sivu esittelee erityisesti _lopullisen_ palautuksen laatuvaatimukset, mutta lueteltuja vaatimuksia on hyvä noudattaa mahdollisimman pian.

## Clean Code

Alla luetellaan Clean Code -periaatteita noudattavan koodin laatuvaatimukset. Ohjelmoinnin harjoitustyön tulisi noudattaa periaatteita mahdollisimman hyvin.

### Nimeä funktiot, luokat, metodit, attribuutit, parametrit ja muuttujat selkeästi ja johdonmukaisesti

- Käytä mahdollisimman kuvaavia nimiä kaikkialla
  - Luokkien nimet aina isolla alkukirjaimella ja _PascalCase_-formaatissa
- Metodit, attribuutit, parametrit ja muuttujat aina <i>snake_case</i>-formaatissa
- Jos luokan metodin tai attribuutin on tarkoitus olla vain luokan sisäisessä käytössä, [on tapana](https://google.github.io/styleguide/pyguide.html#3162-naming-conventions) käyttää nimessä `_`- tai `__`-etuliitettä
- Muuttujat, joilla on iso käyttöalue, tulee olla erittäin selkeästi nimettyjä
- Lyhyen metodin sisäisille muuttujille riittää yleensä lyhyempi nimi
- Jos metodia käytetään vähän, tulee nimen olla mahdollisimman kuvaava
- Tee nimentä englanniksi

### Ei pitkiä metodeja tai funktioita

- Sovelluslogiikan metodin ja funktioiden pituuden tulee ilman erittäin hyvää syytä olla korkeintaan 20 riviä
- Pitkät metodit ja funktiot tulee jakaa osiin
- Yksi metodi, tai funktio - yksi pieni tehtävä (Single Responsibility)
  - Helpottaa myös testaamista

### Ei copy-pastea

- Toistuvan koodin saa lähes aina hävitettyä
- Tapauksesta riippuen luo metodi tai yliluokka, joka sisältää toistuvan koodin. Perintää kannattaa välttää ja sen sijaan suosia luokkien yhteistoimintaa ([Composition over inheritance](https://en.wikipedia.org/wiki/Composition_over_inheritance))

### Single Responsibility

- Luokkien, metodien ja funktioiden tulisi hoitaa vain yhtä asiaa
- Erityisen tärkeää on erottaa käyttöliittymä ja sovelluslogiikka
  - Kaikki tulostaminen tulisi tapahtua käyttöliittymässä
  - Sovelluslogiikkaan liittyviä operaatioita ei tehdä käyttöliittymässä
- Toisaalta tiettyä asiaa ei pidä hoitaa useissa eri luokissa
- Esimerkiksi tiedoston lukemista tai -kirjoittamista ei tulisi löytyä useasta luokasta, tai funktiosta
  - Tee oma luokka tai funktioita tiedostojen käsittelylle

### Rakenne

- Kaikki koodi _ei saa olla_ samassa hakemistossa, eikä missään nimessä samassa tiedostossa
- Älä laita mitään koodia projektin juurihakemistoon, vaan esimerkiksi siellä sijaitsevaan _src_-hakemistoon
- Tiedostojen ja hakemistojen nimet pienillä kirjaimilla <i>snake_case</i>-formaatissa
- Jaa koodi järkevästi tiedostoihin, esimerkiksi seuraavalla logiikalla:
  - Yksi luokka yhdessä tiedostossa
  - Joukko toisiinsa selkeästi liittyviä funktiota samassa tiedostossa (esimerkiksi tiedosto-operaatioissa käytettäviä funktioita)
- Jaa toisiinsa selkeästi liittyvät tiedostot omiin hakemistoihinsa, esimerkiksi seuraavalla logiikalla:
  - Testien tiedostot omaan hakemistoonsa
  - Käyttöliittymän koodin tiedostot omaan hakemistoonsa
  - Mallia voi ottaa [referenssisovelluksen]({{site.python_reference_app_url}}/tree/master/src) rakenteesta
  - Myös [täällä](https://ohjelmistotekniikka-hy.github.io/fi/tasks/implementation) on avattu lisää sitä miten koodi tulisi jaoitella luokkiin/"moduuleihin"

### Testaus

- Generoidut testit ovat _kiellettyjä_
  - Tarkoitus on oppia testaamaan itse oma ohjelmakoodinsa
  - Generoidut testit harvoin testaavat mitään hyödyllistä
  - Generoitujen testien tai testipohjien käyttö: 0 pistettä
- Automatisoitu yksikkötestaus (=unittest-testit) on _pakollista_
  - Testauksen puutteessa kurssisuoritus hylätään
- Palauta mieleesi kurssin testaustehtävät:
  - Testaa mahdollisimman montaa luokkaa, metodia ja funktiota
  - Testaa rajatapauksia
  - Testaa virheellisiä syötteitä
- Käyttöliittymää ei tarvitse testata automaattisesti
- Noudata testeissä yleisiä [nimeämiskäytänteitä](/fi/tasks/week2#unittest-ja-testaaminen)
  - Esimerkiksi luokkaa `User` testaa testiluokka `TestUser`
  - Yhtä luokkaa kohti saa luoda useita testiluokkia

## Yleiset laatuvaatimukset

Lisäksi lopulliseen arvosteluun palautetun ohjelman tulee toimia oikein.

- Ohjelma ei saa missään tilanteessa kaatua
- Ohjelma ei saa printata Exceptioneita (Stack tracea) komentoriville, vaikka virhe ei kaataisi ohjelmaa
- Tarkista, ettei ohjelmasi käsittele taulukon ulkopuolelle meneviä arvoja, tai jo poistettuja arvoja
- Varaudu siihen, että käyttäjä yrittää antaa vääriä syötearvoja
  - Esimerkiksi ohjelmasi haluaa numeron, tyhmä käyttäjä syöttää tekstiä
- Pelien sääntöjen tulisi toimia oikein
  - Esimerkiksi muistipelissä ei saa kääntää jo käännettyä palaa
  - Ristinollassa ei saa asettaa merkkiä ruutuun, jossa on jo merkki
- Jos ohjelmassasi tapahtuu vakava virhe, ohjelmasi voi esimerkiksi
  - näyttää käyttäjäystävällisen virheilmoituksen
  - Ja sulkea ohjelman

Jos ohjelmaan jää jokin bugi tai outoa käyttäytymistä, yritä päästä siitä eroon. Etsi ongelman lähdettä esimerkiksi Pythonin [pdb](https://realpython.com/python-debugging-pdb/)-moduulin tarjoamien työkalujen avulla, tai lisää koodiin välitulostuksia. Kysy vaikka ohjaajilta apua bugien liiskaamisessa. Jos mikään ei auta, älä lannistu! Oikeisiinkin ohjelmiin jää yleensä aina jonkinlaisia pieniä tai suurempia bugeja. Dokumentoi tiedostamasi bugit testausdokumenttiin, jos et saa niitä korjattua.
