---
layout: page
permalink: /ohjaajan-ohje
title: Ohjaajan ohje
---

## Ohjaajan tehtävät

Ohjaajan tehtävät kurssilla ovat:

- Palautteen antaminen opiskelijoiden välipalautuksista [Labtoolin]({{site.labtool_link}}) kautta
- Lopullisten palautusten arviointi
- Opiskelijoiden ohjaaminen (pajassa tai etänä), jos ohjaaja haluaa osallistua pajaohjaukseen

## Palautteen antaminen

Opiskelijoille annetaan pääsääntöisesti palautetta viikkopalautuksien yhteydessä [Labtoolin]({{site.labtool_link}}) kautta. Kurssin opiskelijat jaetaan Labtoolissa ohjaajien kesken ensimmäisen viikon deadlinen jälkeen. **Ohjaajan tulee antaa viikkopalaute jokaiselle opiskelijalleen deadlinea vastaavan viikon sunnuntaihin klo 23:59 mennessä**.

Viikkopalautuksien tarkistuksessa kannattaa hyödyntää Labtoolin viikoittaista "tarkistuslistaa" ja alta löytyviä arvosteluperusteita. Palautuksia ei tarvitse syynätä turhan tarkasti, oleellisten tiedostojen silmäily ja vaadittavien toiminnallisuuksien pikainen testaaminen riittää. Palautteen itsessään tulee olla _ytimekästä_ ja _rakentavaa_.

### Puller.sh

Tässä erään kurssin aiemman ohjaajan kirjoittama skripti, jolla voi ladata kaikki projektit kerralla: [puller.sh](puller.sh).

Käyttöohjeet:

- Lataa kaikki arvosteltavat reposi ensin manuaalisesti samaan kansioon (jokainen toki omana alikansiona) ja tallenna samaan kansioon yllä oleva scripti nimellä puller.sh
- Kun haluat pullata repot, mene terminaalin kautta kansioon, jossa skripti ja repot sijaitsevat ja aja se käskyllä ./puller.sh

### Viikko 1

Katsokaa että GitHubista löytyy tiedostot [gitlog.txt]({{site.repo_url}}/tree/master/materiaali/python/gitlog.txt) ja [komentorivi.txt]({{site.repo_url}}/tree/master/materiaali/python/komentorivi.txt) ja että ne näyttävät edes suurinpiirtein oikeilta.
Pienistä virheistä voi laittaa huomautuksen / korjauskehoituksen viestiksi
Ei pisteitä jos ei tehtynä tai ymmärtänyt tehtävän aivan väärin.

### Viikko 2

Katsokaa että jacocon/coveragen raportti on ok ja silmäilkää nopeasti, että testit ovat järkeviä eikä feikkitestejä. Jos jotain testejä puuttuu (eli testikattavuus ei ole 100%), niin sitten tarkempi syynäys ja pisteiden vähennys Labtoolin ohjeen mukaan. (Testeistä paremmat kuvaukset niissä Labtoolin opiskelijalle menevissä alaosan teksteissä...)

### Viikko 3

#### Laskaritehtävät

1. Monopoli
2. Monopolin laajennus malli: [malli3-12.png](https://github.com/ohjelmistotekniikka-hy/mallivastaukset/blob/main/malli3-12.png)
3. Bensatankki sekvenssikaavio malli: [malli3-3.png](https://github.com/ohjelmistotekniikka-hy/mallivastaukset/blob/main/malli3-3.png)
4. HSL sekvenssikaavio malli: [malli3-4.png](https://github.com/ohjelmistotekniikka-hy/mallivastaukset/blob/main/malli3-4.png)

Miinustakaa pisteet kaavioista, jos niitä ei ole tehty kunnolla tai on ymmärretty täysin väärin. Mutta jos oikeasti yritetty kunnolla ja sekvenssikaavio on esim. muuten oikein, mutta joku metodi tai palautusviiva uupuu niin antakaa pisteet. (Voitte toki halutessa kommentoida, virheistä)

#### Projekti/Java

- Projektin koodin pystyy suorittamaan NetBeansin vihreällä napilla tai/ja komennolla `mvn compile exec:java -Dexec.mainClass=pakkaus.Paaohjelma` komennon parametrina on metodin main sisältävän luokan täydellinen, eli myös pakkauksen sisältävä, nimi referenssisovelluksen tapauksessa parametri olisi `-Dexec.mainClass=todoapp.ui.TodoUi`
- Sovellukselle tulee pystyä generoimaan testikattavuusraportti komennolla `mvn test jacoco:report` (käsky luo raportin target kansioon) (Jos ei toimi vielä tsekata löytyykö materiaalin ohjeen mukainen määrittely tiedoston pom.xml osiossa plugins)
- Sovelluksella on oltava vähintään yksi testi jonka voi suorittaa komennolla `mvn test`. Testin tulee olla mielekäs, eli sen on testattava jotain ohjelman kannalta merkityksellistä asiaa. Testin tulee mennä läpi
- Edellytys pisteille suoritettavissa oleva versio, joka toteuttaa ainakin osan jostain viikolla 2 tekemäsi määrittelydokumentin toiminnallisuudesta, pelkät gettereitä ja settereitä sisältävät, täysin ilman toiminnallisuutta olevat luokat eivät tuo pisteitä
- Opiskelijan tehtävänannossa ei oltu määritelty pitääkö toiminnallisuuden on olla käyttäjälle näkyvää tai olla käyttöliittymä olemassa, joten riittää jos toiminnallisuus on toteutettu nyt kooditasolla ja toimivuus testattu (eli jos on tehnyt “test driven”) niin se riittää tässä vaiheessa
- Repositorion juuresta löytyy Maven-projekti

#### Projekti/Python

- Projektin koodin pystyy suorittamaan komentoriviltä komennolla `poetry run invoke start`
- Sovellukselle tulee pystyä generoimaan testikattavuusraportti komennolla `poetry run invoke coverage-report` (html-muotoinen raportti löytyy kansiosta htmlcov) (Jos ei toimi vielä tsekatkaa löytyykö materiaalin ohjeen mukainen määrittely tiedostosta pyproject.toml)
- Tarkistakaa että src-hakemiston alahakemistoihin on lisätty [ohjeen](/python/viikko3#harjoitusty%C3%B6-1-poetry-projektin-alustaminen) mukaisesti tyhjät \_\_init\_\_.py -tiedostot, jos niitä ei ole coverage ei laske testikattavuutta oikein. Jos tiedostoja ei ole lisätty, ei tarvitse vähentää pisteitä tästä syystä, mutta kirjoittakaa viikkopalautteeseen muistutus lisätä nämä.
- Sovelluksella on oltava vähintään yksi testi jonka voi suorittaa komennolla `poetry run invoke test`. Testin tulee olla mielekäs, eli sen on testattava jotain ohjelman kannalta merkityksellistä asiaa. Testin tulee mennä läpi.
- Edellytys pisteille suoritettavissa oleva versio, joka toteuttaa ainakin osan jostain viikolla 2 tekemäsi määrittelydokumentin toiminnallisuudesta, pelkät gettereitä ja settereitä sisältävät, täysin ilman toiminnallisuutta olevat luokat eivät tuo pisteitä
- Opiskelijan tehtävänannossa ei oltu määritelty pitääkö toiminnallisuuden on olla käyttäjälle näkyvää tai olla käyttöliittymä olemassa, joten riittää jos toiminnallisuus on toteutettu nyt kooditasolla ja toimivuus testattu (eli jos on tehnyt “test driven”) niin se riittää tässä vaiheessa
- Repositorion juuresta löytyy `src`-kansio projektin koodille

#### Tuntikirjanpito

- Tuntikirjanpito on ajan tasalla
- Tuntikirjanpitoon ei merkitä laskareihin käytettyä aikaa

#### Repositorio

- Repositorion README.md kunnossa
- Tiedosto on kurssin tämän vaiheen osalta relevantin sisällön suhteen samankaltainen kuin referenssisovelluksen README.md
- Kaikki ylimääräinen, mm linkit laskareihin on poistettu
- Repositorio siisti, ei ylimääräistä tavaraa (mm. hakemistoa target/ tai tietokantatiedostoja)
- Laskarit jätetään hakemiston laskarit alle
- Järkevä .gitignore-tiedosto olemassa
- Viikon changelog-merkintä on tehty

Seuraaville viikoille toiminnallisuuksien täytyy olla käyttäjälle näkyviä ja määrittelydokumenttiin täytyy merkata tehtyjen vaatimusmäärittelyjen kohdalle "tehty" merkintä, niin meidän on helpompi tarkistaa projektin eteneminen.

### Viikko 4

#### Projekti

- Käyttöliittymän ja sovelluslogiikan koodi on eroteltu toisistaan (0.25p)
- Pakkausrakenne kunnossa (0.25p)
  - Heijastaa ohjelman loogista rakennetta ja on nimennältään järkevä
- Ohjelman kasvaminen (0.75p)
  **!! ALLA OLEVISTA MERKATAAN NOLLA TAI USEAMPI !!**
  - Ohjelma kasvanut selvästi (0.25p)
    - Kaksi tai useampi määrittelydokumentin käyttäjälle näkyvää toiminnallisuutta toteutettu _TAI_ yksi toiminnallisuus toteutettu ja tunneista tai koodin määrästä päätellen koodia on tehty ahkerasti
  - Ohjelma kasvanut jonkin verran (0.25p)
    - Vähintään yksi määrittelydokumentin käyttäjälle näkyvä toiminto toteutettu
  - Ohjelmassa vain hieman jotain uutta toiminnallisuutta (0.25p)
    - Koodi kasvanut vähän viimeviikkoisesta
- Testauksen edistyminen (0.5p)
  **!! ALLA OLEVISTA MERKATAAN NOLLA, YKSI TAI KAKSI. EI SIIS VAIN JOMPAA KUMPAA !!**
  - Rivikattavuus vähintään 20% (0.25p)
    - Jos käyttöliittymäkoodi on mukana rivimäärissä, niin arvioi se pois prosenteista ja huomauttakaa että opiskelija poistaa sen rivikattavuudesta
  - Rivikattavuus vähintään 10% (0.25p)
    - Jos käyttöliittymäkoodi on mukana rivimäärissä, niin arvioikaa se pois prosenteista ja huomauttakaa että opiskelija poistaa sen rivikattavuudesta

#### Projekti/Java

- Checkstyle configuroitu (0.25p)
  - toimii komennolla `mvn jxr:jxr checkstyle:checkstyle`
- Checkstyle virheitä alle 10 (0.25p)
  - käyttöliittymän rakentavan koodin ei tarvitse olla Checkstyle-tarkastelun alla

#### Projekti/Python

- Pylint configuroitu (0.25p)
  - Toimii komennolla `poetry run invoke lint`
- Pylintin virheitä alle 10 (0.25p)
  - Käyttöliittymän rakentavaa koodia ei tarvitse lintata
- Tarkistakaa että `src`-hakemiston alahakemistoihin on lisätty [ohjeen](https://ohjelmistotekniikka-hy.github.io/python/coverage) mukaisesti tyhjät \_\_init\_\_.py -tiedostot, jos niitä ei ole coverage ei laske testikattavuutta oikein. Jos tiedostoja ei ole lisätty,  ei tarvitse vähentää pisteitä tästä syystä, mutta kirjoittakaa viikkopalautteeseen muistutus lisätä nämä. Jos jo viime viikolla kehotitte viikkopalautteessa lisäämään nämä tiedostot voi rokottaa pisteistä vaikka 0.15 syystä ettei ole lisätty ohjeen mukaisesti näitä.
- Jos tyhjiä \_\_init\_\_.py tiedostoja ei ole alihakemistoista, ottakaa huomioon että coverage laskee testien rivikattavuuden väärin. Arvioikaa rivikattavuus silmämääräisesti, tai jos testikattavuus ei ole ilmiselvästi yli 20%, lisätkää itse tyhjät tiedostot ennen testiraportin luomista.

#### Dokumentaatio

- Luokkakaavio varsin hyvä (0.25p)
  - Tai pakkauskaavio
  - Vastaa vähintään projektin nykyistä rakennetta tai tulevaisuutta
- Luokkakaavio oikeassa paikassa (0.25p)
  - Upotettu arkkitehtuuri.md-tiedostoon joka löytyy dokumentaatiokansiosta
- Luokkakaavio olemassa (0.25p)
  - Tai pakkauskaavio
- Tuntikirjanpito kunnossa (0p)
  - Ajantasalla
  - Summa merkitty <- ei tarvitse rokottaa jos muuten kunnossa. mainitkaa että lisää summan seuraavan kertaan
  - Ei laskareihin käytettyä aikaa

#### Repositorio

- Repositorio kunnossa (0.25p)
  - Mahdollisesti aikaisemmin huomautetut turhat tiedostot poistettu
  - Siisti, ei ylimääräistä tavaraa (mm. hakemistoa target (Java) / \_\_pycache\_\_ (Python) tai tietokantatiedostoja)
  - README:ssa tällä hetkellä relevantit linkit ja komennot
  - Esim. tältä viikolta linkki arkkitehtuuriin ja checkstyle/pylint komennot lisätty

Arvostelussa voi myös käyttää hyödyksi opiskelijoiden viikko-ohjeistuksia [Java viikko 4](https://ohjelmistotekniikka-hy.github.io/java/viikko4) ja [Python viikko 4](https://ohjelmistotekniikka-hy.github.io/python/viikko4)

### Viikko 5

#### Sekvenssikaavio

- Sekvenssikaavio olemassa (0.25p)
  - Arkkitehtuuridokumentissa on sekvenssikaavio jostain ohjelman toiminnallisuudesta
- Sekvenssikaavio aika hyvä (0.25p)
  - Sekvenssikaavio kuvaa toiminnallisuutta hyvin

#### Release

- Projektista on tehty GitHub release (0.25p)
  - Java: release sisältää ohjelman uusimman version suorituskelpoisen jar-tiedoston
  - Python: Release sisältää ohjelman uusimman version lähdekoodin

#### Java

- Suorituskelpoisen jar:in voi generoida komennolla `mvn package` (0.5p)
- Checkstyle virheitä alle 5 (0.25p)

#### Python

- Ohjelma toimii komennolla `poetry run invoke start` (0.5p)
- Pylint virheitä alle 5 (0.25p)

Huomatkaa että checklistissä ohjelma kasvanut osiosta (max. 0.75 pistettä) ruksitaan vain yksi vaihtoehto.
Muuten aikalailla samat ohjeet kuin edellisellä viikolla.

### Viikko 6

Python-projekteissa testikattavuutta arvioitaessa muistakaa katsoa että jokaisessa projektin _src_-hakemiston alahakemistossa on tyhjä \_\_init\_\_.py-tiedosto. Jos sitä ei ole, coverage ei arvioi testikattavuutta oikein näiden hakemistojen osalta. Tällöin projektin testikattavuus on todellista korkeampi. Ottakaa tämä huomioon. Arvioikaa todellinen testikattavuus. Lisätkää käsin tälläisiin hakemistoihin \_\_init\_\_.py ennen testien ajamista ja testikattavuusraportin ottamista.

*Testaus*-osiosta valitaan molemmat "Testikattavuus vähintään..." -checkboxit jos kattavuus vähintään 60%. *Ohjelma kasvanut* -osiossa valitaan vain toinen "ohjelma kasvanut..." -checkboxi.

Jotta arvostelu menee oikein, älkää ruksiko rastia "JavaDoc ei ole generoitavissa/Docstring-dokumentointia ei ole aloitettu" vaikka JavaDoc ei olisi generoitavissa tai Docstring-dokumentointia ei olisi aloitettu. Viikon 6 opiskelijan ohjeissa ei ollut mainintaa siitä, että aloittamaton JavaDoc/Docstring vähentäisi pisteitä. <!-- tämän huomion voinee sitten ottaa pois kun labtoolin pisteytyksestä on kurssin seuraavassa iteraatiossa poistettu tämä miinuspiste -->

Labtoolissa muutama uusi kohta, muuten tämä viikko aika samanlailla kuin edellinen viikko.

### Viikon 6 koodikatselmointien arviointi

0-2 pistettä

- Vähintään 6 laadukasta ja rakentavaa palautekommenttia riittää 1.5 pisteeseen
- Täysiin pisteisiin edellytetään myös vähintään yksi käyttökelpoinen parannusehdotus
- Eli 0.25p per laadukas ja rakentava kommentti ja 0.5p parannusehdotuksesta

### Loppupalautus

Tarkastustaulukosta löytyy neljä välilehteä:

- "Pisteet" projektin arvioinnille
-"Pdf" tästä ei tarvitse välittää, tämän välilehden avulla luodaan valmiista arvostelusta pdf.
- "Kommentteja" sisältää arviointiohjeita, apuna voi myös käyttää opiskelijoille annettuja arviointiperusteita. Arviointiohjeet suuntaa antavia, projektit niin erilaisia että tässä saa käyttää omaa harkintaa molempiin suuntiin, Slackissa voi kysyä muiden mielipidettä
- "Tarkastustilanne" pitää kirjaa tehdyistä arvioinneista ja kontrollitarkistuksista

Tarkastaessa:

- tarkista pikaisesti, että nimi, opiskelijanumero ja Labtoolin pisteet täsmäävät
- "Drop"-sarakkeeseen:
  - 1, jos projekti on aloitettu, mutta selkeästi ei viety loppuun asti (löytyy laskareiden lisäksi ainakin pohja projektille)
  - 2, jos projektia ei edes aloitettu (esim vain laskarit tehty)
- "Tarkastaja"-sarakkeeseen koko oma nimi, kun arvioitu, niin päivittyy tarkastustilanteet
- "Tunteja käytetty"-oppilaan ilmoittama määrä tuntikirjanpidossa
- "Huomioita"-sarakkeeseen linkkaa tiedosto, johon olet avannut omaa pisteytystäsi.  Tämä on sen vuoksi, että kontrollitarkastukset helpottuvat huomattavasti.

Kyselkää jos tulee epäselvyyksiä, esim jos projektit, jar, checkstyle tms. ei aukea. Heittäkää linkki tänne, niin tsekataan toimiiko jollain muulla.

Pajaa pitäneet ohjaajat merkitkää siihen käytetyt tunnit Tarkastustilanne-välilehdelle.

Kontrollitarkastuksiin tulee tarkemmat ohjeet lähempänä sen alkua.

### Arvioiden vertaisarviointi

Valitkaa listalta oppilas satunnaisesti ja avatkaa ohjaajan kirjoittama pisteytyslista. Katsokaa kaikki kohdat läpi että ne ovat järkeviä, mutta ei tarvitse kuitenkaan suurennuslasin kanssa etsiä "virheitä". Jos olette erimieltä jostain kirjoittakaa "Kontrolloijan huomioita"-kohtaan mitä muuttaisitte ja mihin suuntaan. Jos muutettu pisteytys vaikuttaisi arvosanaan siitä kannattaa myös mainita. Tarkastustilanne-välilehdeltä näkee kuinka monta kontrollitarkastusta pitää tehdä. Niitä on yhtä monta, kuin mitä arvioitte. Lisätkää myös nimenne "kontrolloija" kohtaan kun alatte tarkastamaan, jotta ei kävisi niin että kaksi henkilöä tarkastaakin vahingossa samaa henkilöä.
esimerkkejä kontrollikommenteista:

```
Vaikuttaa arvosanaan 4->5: muuten samaa mieltä, mutta koodin laadusta antaisin täydet 4. Yksi metodi on 21 riviä, ja katsoisin sitä sormien läpi, etenkin kun sen metodin jakaminen osiin mielestäni monimutkaistaisi koodia ja lisäksi sen olisi voinut kikkailla pari riviä lyhyemmäksi laittamalla if-lauseen kanssa samalle riville aaltosulkeiden sisällä olevan returnin.
```

```
Ok. Samaa mieltä
```

```
Näytti hyvältä, vähentäisin kuitenkin -0.25p ConnectionTest.javassa olevista tyhjistä metodeista (turhan koodin arvostelussa)
```

```
Vaikuttaa arvosanaan: mun mielestä laajuus vain 2 pistettä, vaikka onkin nettitietokanta, niin siitä saatu pisteet jo tiedon tallennuksessa ja/tai kompleksisuudessa
```

```
Laittaisin kompleksisuuden 1 ja laajuuden 2. Tuossa kyllä tehdään laskentaa, mutta aika yksinkertaista sellaista, ja siinä on oikeastaan vaan se näyttö johon piirtyy se juttu ja sitten muutamat arvot syötetään toiseen ikkunaan. Lisäksi ohjelma koostuu vain pienestä määrästä lyhyitä luokkia.
```

Pyrkikää arvioimaan jokaiselta muulta ohjaajalta vähintään yksi arviointi

### Vertaisarviointien deadlinen jälkeen

- Lukekaa harjoitustöiden arviointeihin saamanne kommentit ja korjatkaa arviointinne sen mukaisesti, jos olette kommentoijan kanssa samaa mieltä.
- Kun olette käyneet läpi kaikki saamanne vertaisarviot laittakaa "valmis" tai vastaava merkintä taulukon Tarkastustilanne -välilehdelle samalle riville nimenne kanssa sarakkeeseen "Kaikki tarkastettu ja korjaukset valmiit" merkiksi siitä että olette valmiita

Vertaisarviointeja siis tehdään yhtä monta kuin teitte arviointeja (sarake "to control" Tarkastustilanne -välilehdelle). Kannattaa myös varmistaa että Tarkastustilanne -välilehden luvut tehdyistä arvioinneista, dropanneista ja ei aloittaneista ovat oikein, koska niiden perusteella maksetaan palkkio.

## Ohjaajan palkka

Ohjaajan tuntipalkka on 17 €. Ohjaajalle maksetaan 3 · 17 € kurssin loppuun asti jatkaneesta opiskelijasta ja 0.5 · 17 € keskeyttäneestä opiskelijasta. Tämä kannattaa ottaa huomioon siinä, paljonko aikaa käyttää palautteen antamiseen ja arviointiin.

Lisäksi pajaohjauksesta maksetaan viikossa

- 2 · 17 €, jos kurssilla on alle 30 opiskelijaa,
- 4 · 17 €, jos kurssilla on 30–50 opiskelijaa,
- 6 · 17 €, jos kurssilla on 50–100 opiskelijaa, ja
- 8 · 17 €, jos kurssilla on yli 100 opiskelijaa.

Jos kurssilla on useita ohjaajia, pajaohjauksen tunnit jakautuvat ohjaajien kesken.

Kurssin lopussa ohjaaja toimittaa Reijo Sivenille raportin tunneista ja vastuullaan olleiden opiskelijoiden määristä, minkä perusteella palkka maksetaan.
