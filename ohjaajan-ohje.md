---
layout: page
permalink: /ohjaajan-ohje
title: Ohjaajan ohje
---

## Ohjaajan tehtävät

Ohjaajan tehtävät kurssilla ovat:

- Palautteen antaminen opiskelijoiden välipalautuksista [Labtoolin]({{site.labtool_link}}) kautta
- Lopullisten palautusten arviointi
- Opiskelijoiden paja- ja muu ohjaus

## Palautteen antaminen

Opiskelijoille annetaan pääsääntöisesti palautetta viikkopalautuksien yhteydessä [Labtoolin]({{site.labtool_link}}) kautta. Kurssin opiskelijat jaetaan Labtoolissa ohjaajien kesken ensimmäisen viikon deadlinen jälkeen. **Ohjaajan tulee antaa viikkopalaute jokaiselle opiskelijalleen deadlinea vastaavan viikon sunnuntaihin klo 23:59 mennessä**.

Viikkopalautuksien tarkistuksessa kannattaa hyödyntää Labtoolin viikoittaista "tarkistuslistaa" ja alta löytyviä arvosteluperusteita. Palautuksia ei tarvitse syynätä turhan tarkasti, oleellisten tiedostojen silmäily ja vaadittavien toiminnallisuuksien pikainen testaaminen riittää. Palautteen itsessään tulee olla _ytimekästä_ ja _rakentavaa_.

### Puller.sh

Tässä muutaman kurssin aiemman ohjaajan kirjoittama skripti, jolla voi ladata kaikki projektit kerralla: [puller.sh](puller.sh).

Käyttöohjeet:

- Lataa kaikki arvosteltavat repositoriosi ensin manuaalisesti samaan kansioon (jokainen toki omana alikansiona) ja tallenna samaan kansioon yllä oleva skripti nimellä puller.sh
- Anna skriptille suoritusoikeudet: `$ chmod +x puller.sh`
- Kun haluat pullata repot, mene terminaalin kautta kansioon, jossa skripti ja repot sijaitsevat ja aja se käskyllä ./puller.sh

### Viikko 1

Komentorivi- ja versionhallintatehtäviä ei ole pakko suorittaa, eikä niistä saa lisäpisteitä. Ensimmäisen viikon pisteen saa joko niistä tai kohdan "tee joka tapauksessa seuraavat asiat:" tehtävien suorittamisesta.

Jos opiskelija tekee komentorivi- ja versionhallintatehtävät:
Katsokaa että GitHubista löytyy tiedostot [gitlog.txt]({{site.repo_url}}/tree/master/materiaali/python/gitlog.txt) ja [komentorivi.txt]({{site.repo_url}}/tree/master/materiaali/python/komentorivi.txt) ja että ne näyttävät edes suurinpiirtein oikeilta.
Pienistä virheistä voi laittaa huomautuksen viestiksi. *Pisteen kuitenkin saa, jos kohdan "tee joka tapauksessa seuraavat asiat:" vaatimukset täyttyvät.*

### Viikko 2

Katsokaa että coveragen raportti on ok ja silmäilkää nopeasti, että testit ovat järkeviä eikä feikkitestejä. Jos jotain testejä puuttuu (eli testikattavuus ei ole 100%), niin sitten tarkempi syynäys ja pisteiden vähennys Labtoolin ohjeen mukaan. (Testeistä paremmat kuvaukset niissä Labtoolin opiskelijalle menevissä alaosan teksteissä...)

### Viikko 3

#### Laskaritehtävät

1. Monopolin laajennuksen malli: [malli3-12.png](https://github.com/ohjelmistotekniikka-hy/mallivastaukset/blob/main/malli3-12.png)
2. HSL-sekvenssikaavion malli: [malli3-4.png](https://github.com/ohjelmistotekniikka-hy/mallivastaukset/blob/main/malli3-4.png)

Miinustakaa pisteet kaavioista, jos niitä ei ole tehty kunnolla tai on ymmärretty täysin väärin. Mutta jos oikeasti yritetty kunnolla ja sekvenssikaavio on esim. muuten oikein, mutta joku metodi tai palautusviiva uupuu niin antakaa pisteet. (Voitte toki halutessa kommentoida, virheistä)

#### Projekti

- Projektin koodin pystyy suorittamaan komentoriviltä komennolla `poetry run invoke start`
- Sovellukselle tulee pystyä generoimaan testikattavuusraportti komennolla `poetry run invoke coverage-report` (html-muotoinen raportti löytyy kansiosta htmlcov) (Jos ei toimi vielä tsekatkaa löytyykö materiaalin ohjeen mukainen määrittely tiedostosta pyproject.toml)
- Tarkistakaa että src-hakemiston alahakemistoihin on lisätty [ohjeen](/python/viikko3#harjoitusty%C3%B6-1-poetry-projektin-alustaminen) mukaisesti tyhjät \_\_init\_\_.py -tiedostot, jos niitä ei ole coverage ei laske testikattavuutta oikein. Jos tiedostoja ei ole lisätty, ei tarvitse vähentää pisteitä tästä syystä, mutta kirjoittakaa viikkopalautteeseen muistutus lisätä nämä.
- Sovelluksella on oltava vähintään yksi testi jonka voi suorittaa komennolla `poetry run invoke test`. Testin tulee olla mielekäs, eli sen on testattava jotain ohjelman kannalta merkityksellistä asiaa. Testin tulee mennä läpi.
- Edellytys pisteille suoritettavissa oleva versio, joka toteuttaa ainakin osan jostain viikolla 2 tekemäsi määrittelydokumentin toiminnallisuudesta.
- Opiskelijan tehtävänannossa ei oltu määritelty pitääkö toiminnallisuuden on olla käyttäjälle näkyvää tai olla käyttöliittymä olemassa, joten riittää jos toiminnallisuus on toteutettu nyt kooditasolla ja toimivuus testattu (eli jos on tehnyt “test driven”) niin se riittää tässä vaiheessa
- Repositorion juuresta löytyy `src`-kansio projektin koodille

#### Tuntikirjanpito

- Tuntikirjanpito on ajan tasalla
- Tuntikirjanpitoon ei merkitä laskareihin käytettyä aikaa

#### Repositorio

- Repositorion README.md kunnossa
- Tiedosto on kurssin tämän vaiheen osalta relevantin sisällön suhteen samankaltainen kuin referenssisovelluksen README.md
- Kaikki ylimääräinen, mm linkit laskareihin on poistettu
- Repositorio siisti, ei ylimääräistä tavaraa (mm. tietokantatiedostoja)
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

#### Projekti

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
  - Siisti, ei ylimääräistä tavaraa (mm. hakemistoa \_\_pycache\_\_ tai tietokantatiedostoja)
  - README:ssa tällä hetkellä relevantit linkit ja komennot
  - Esim. tältä viikolta linkki arkkitehtuuriin ja checkstyle/pylint komennot lisätty

Arvostelussa voi myös käyttää hyödyksi opiskelijoiden viikko-ohjeistusta [viikko 4](https://ohjelmistotekniikka-hy.github.io/python/viikko4)

### Viikko 5

#### Sekvenssikaavio

- Sekvenssikaavio olemassa (0.25p)
  - Arkkitehtuuridokumentissa on sekvenssikaavio jostain ohjelman toiminnallisuudesta
- Sekvenssikaavio aika hyvä (0.25p)
  - Sekvenssikaavio kuvaa toiminnallisuutta hyvin

#### Release

- Projektista on tehty GitHub release (0.25p)
  - Release sisältää ohjelman uusimman version lähdekoodin

#### Muuta

- Ohjelma toimii komennolla `poetry run invoke start` (0.5p)
- Pylint virheitä alle 5 (0.25p)

#### Ylimääräinen koodikatselmointi
- Tämä on tosiaan ylimääräistä ja todennäköisesti aika harva osallistuu
- Katso, onko README.md -tiedoston lopussa mainintaa ylimääräisestä koodikatselmoinnista ja linkkiä katselmoituun repositorioon
- Jos on, tarkista, että viitatusta repositoriosta löytyy asianmukaiset issuet. Anna silloin piste, tai jos on selvästi puutteellista, niin puolikas.

Huomatkaa että checklistissä ohjelma kasvanut osiosta (max. 0.75 pistettä) ruksitaan vain yksi vaihtoehto.
Muuten aikalailla samat ohjeet kuin edellisellä viikolla.

### Viikko 6

Testikattavuutta arvioitaessa muistakaa katsoa että jokaisessa projektin _src_-hakemiston alahakemistossa on tyhjä \_\_init\_\_.py-tiedosto. Jos sitä ei ole, coverage ei arvioi testikattavuutta oikein näiden hakemistojen osalta. Tällöin projektin testikattavuus on todellista korkeampi. Ottakaa tämä huomioon. Arvioikaa todellinen testikattavuus. Lisätkää käsin tälläisiin hakemistoihin \_\_init\_\_.py ennen testien ajamista ja testikattavuusraportin ottamista.

*Testaus*-osiosta valitaan molemmat "Testikattavuus vähintään..." -checkboxit jos kattavuus vähintään 60%. *Ohjelma kasvanut* -osiossa valitaan vain toinen "ohjelma kasvanut..." -checkboxi.

Labtoolissa muutama uusi kohta, muuten tämä viikko aika samanlailla kuin edellinen viikko.

### Viikon 6 koodikatselmointien arviointi

0-2 pistettä

- Vähintään 6 laadukasta ja rakentavaa palautekommenttia riittää 1.5 pisteeseen
- Täysiin pisteisiin edellytetään myös vähintään yksi käyttökelpoinen parannusehdotus
- Eli 0.25p per laadukas ja rakentava kommentti ja 0.5p parannusehdotuksesta

### Loppupalautus

Loppupalautuksen jälkeen pisteet kirjataan kurssin Moodle-alueella. Siellä otsikon *Ohjaajille* alta löytyy arviointiohjeita ja apuna voi myös käyttää opiskelijoille annettuja arviointiperusteita. Arviointiohjeet suuntaa antavia, projektit niin erilaisia että tässä saa käyttää omaa harkintaa molempiin suuntiin, Slackissa voi kysyä muiden mielipidettä.

Siirry välilehdelle *Arvioinnit*, valitse alasvetovalikosta *Arvioijan raportti* ja oikealta ylhäältä *Muokkaustila*. Pisteet on syytä kirjata opiskelijakohtaisessa näkymässä, johon pääset opiskelijan nimen perässä olevan kolmen pisteen valikon toiminnolla *Single view for this user*. Muista aina painaa *Tallenna*, kun olet kirjannut yhden opiskelijan pisteet.

Arvioinnit ovat aluksi piilotettuja opiskelijoilta, mutta avataan siinä vaiheessa kun arviointi vertaisarviointeineen on suoritettu loppuun.

Tarkastettaessa:

- Merkitse sarakkeeseen *Labtoolista* opiskelijan Labtoolissa saamien pisteiden summa
- "Drop"-sarakkeeseen:
  - 1, jos projekti on aloitettu, mutta selkeästi ei viety loppuun asti (löytyy laskareiden lisäksi ainakin pohja projektille)
  - 2, jos projektia ei edes aloitettu (esim vain laskarit tehty)
- "Tunteja käytetty"-sarakkeeseen oppilaan ilmoittama määrä tuntikirjanpidossa
- Moodle on lisännyt arviointikohteisiin automaattisesti kentän "Palaute". Näistä palautekentistä ei yleensä tarvitse välittää - paitsi jos haluat jossain kohtaa kertoa opiskelijalle arvioinnista tavallista tarkemmin. Koska pistekenttiin ei voi syöttää tekstimuotoista tietoa, käytämme kuitenkin em. palautekenttiä kohdissa Tarkastaja, Huomioita, Kontrolloija ja Kontrolloijan huomioita.
- Kopioi kohdan "Huomioita" palautekenttään linkki tiedostoon, jossa olet avannut omaa pisteytystäsi.  Tämä on sen vuoksi, että kontrollitarkastukset helpottuvat huomattavasti.
- Kohdan "Tarkastaja" palautekenttään tulee oma nimesi

Kyselkää jos tulee epäselvyyksiä, esim jos projektit, checkstyle tms. ei aukea. Heittäkää linkki ohjaajien keskustelualueelle, niin tsekataan toimiiko jollain muulla.

### Arvioiden vertaisarviointi

Kukin tekee yhtä monta vertaisarviota kuin on itse loppuunsaatettuja töitä arvioinut (siis sellaisia joiden kohdalle drop-sarakkeeseen et ole merkinnyt ykköstä tai kakkosta).

Valitkaa taulukosta oppilas satunnaisesti. Voitte näpäyttää nuolia sarakkeissa *Drop* ja *Kontrolloija* jotta pääsette helpommin valitsemaan loppuunsaatetun työn, jolla ei ole vielä vertaisarvioijaa (eli molemmissa sarakkeissa tulee olla tyhjää tai nolla). Avatkaa ohjaajan kirjoittama pisteytyslista; katsokaa kaikki kohdat läpi että ne ovat järkeviä, mutta ei tarvitse kuitenkaan suurennuslasin kanssa etsiä "virheitä". Jos olette eri mieltä jostain kirjoittakaa "Kontrolloijan huomioita"-kohdan palautekenttään mitä muuttaisitte ja mihin suuntaan. Jos muutettu pisteytys vaikuttaisi arvosanaan siitä kannattaa myös mainita. **Huom:** muuttakaa kohdan "Kontrolloija" arvo nollasta ykköseksi kun alatte tarkastamaan ja lisätkää nimenne mainitun kohdan palautekenttään (ja muistakaa taas tallentaa). Näin siksi, ettei kaksi ohjaajaa tarkastaisi vahingossa samaa työtä.

Esimerkkejä kontrollikommenteista:

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

Pyrkikää arvioimaan jokaiselta muulta ohjaajalta vähintään yksi arviointi.

### Vertaisarviointien deadlinen jälkeen

- Lukekaa harjoitustöiden arviointeihin saamanne kommentit ja korjatkaa arviointinne sen mukaisesti, jos olette kommentoijan kanssa samaa mieltä. Kun tälle varattu aika on päättynyt, arvioinnit julkaistaan.


