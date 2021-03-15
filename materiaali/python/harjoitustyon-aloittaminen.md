---
layout: page
permalink: /python/harjoitustyon-aloittaminen
title_long: Aiheen valinta ja harjoitustyön aloittaminen
---

Kurssin pääpainon muodostaa viikolla 2 aloitettava harjoitustyö. Harjoitustyössä toteutetaan itsenäisesti ohjelmisto omavalintaisesta aiheesta. Tavoitteena on soveltaa ja syventää ohjelmoinnin perus- ja jatkokursseilla opittuja taitoja ja harjoitella tiedon omatoimista etsimistä. Harjoitustyötä tehdään itsenäisesti, mutta tarjolla on runsaasti [pajaohjausta](https://github.com/mluukkai/ohjelmistotekniikka-syksy-2020#ajankohtaista).

Harjoitustyön on edettävä [viikottaisten tavoitteiden mukaan](../README.md#aikataulu). Työ on saatava valmiiksi kurssin aikana ja sitä on toteutettava tasaisesti, muuten kurssi katsotaan keskeytetyksi. Samaa ohjelmaa ei voi jatkaa seuraavalla kurssilla (eli keväällä 2021), vaan työ on aloitettava uudella aiheella alusta. Muista varata riittävästi aikaa (10-15h viikossa) koko periodin ajaksi.

Koko kurssin arvostelu perustuu pääasiassa harjoitustyöstä saataviin pisteisiin. Osa pisteistä kertyy [aikatauluun](../README.md#aikataulu) määriteltyjen viikoittaisten välitavoitteiden kautta, osa taas perustuu työn lopulliseen palautukseen.

## Harjoitustyön toimivuus

- Koneiden konfiguraatioissa on eroja, ja tällä kurssilla ei riitä että hajoitustyössä tekemäsi sovellus toimii vain omalla koneellasi
- Harjoitustyösi pitää pystyä joka viikko suorittamaan, kääntämään ja testaamaan komentoriviltä käsin laitoksen Linux-koneilla (tai uusimmat päivitykset sisältävällä cubbli-linuxilla), muussa tapauksessa työtä ei tarkasteta ja menetät viikonpalautuksen pisteet.
- Pääset testaamaan ohjelmaasi laitoksen koneella myös kotoa käsin käyttämällä etätyöpöytää https://helpdesk.it.helsinki.fi/ohjeet/tietokone-ja-tulostaminen/tyoasemapalvelu/etakaytettavat-tyopoydat-vdi-ja-vmware tai kirjautumalla ssh:lla palvelimelle melkki.cs.helsinki.fi

## Harjoitustyön kieli ja ohjelmointikieli

Harjoitustyön ohjelmointikieli on Python.

Web-sovelluksia kurssilla ei sallita. Sovelluksissa sallitaan toki webissä olevat komponentit, mutta sovelluksen käyttöliittymän tulee olla niin sanottu työpöytäsovellus.

**Ohjelmakoodin muuttujat, luokat ja metodit kirjoitetaan englanniksi**. Dokumentaatio voidaan kirjoittaa joko suomeksi tai englanniksi.

## Ohjelman toteutus

Toteutus etenee "iteratiivisesti ja inkrementaalisesti". Tämä tarkoittaa, että heti alussa toteutetaan pieni osa ohjelman toiminnallisuudesta. Ohjelman ydin pidetään koko ajan toimivana, uutta toiminnallisuutta lisäten, kunnes tavoiteltu ohjelman laajuus on saavutettu. Ohjelman rakenteeseen kannattaa kysyä vinkkejä pajasta, sekä ottaa mallia ohjelmoinnin jatkokurssin harjoitustehtävistä ja materiaalista. Muutamia vihjeitä on myös kurssin [referenssiprojektissa](https://github.com/ohjelmistotekniikka-hy/python-todo-app) sekä [täällä](./python.md).

Iteratiiviseen tapaan tehdä ohjelma liittyy kiinteästi automatisoitu testaus. Aina uutta toiminnallisuutta lisättäessä ja vanhaa muokatessa täytyy varmistua, että kaikki vanhat ominaisuudet toimivat edelleen. Kaiken testaaminen käsin uudelleen ja uudelleen ei ole ajankäytöllisesti järkevää, ja siksi ohjelmakoodille onkin syytä laatia jatkuvasti testejä ohjelmoinnin edetessä. Testit on syytä pitää kattavina ja ajan tasalla.

Jotta ohjelmaa pystyisi testaamaan, on tärkeää että sovelluslogiikkaa [ei kirjoiteta käyttöliittymän sekaan](./python.md)!

Eräs mahdollisuus on tehdä aluksi tekstikäyttöliittymän ja vasta saatuasi ohjelman perustoiminnallisuuden toteutettua voit siirtyä graafisen käyttöliittymän toteutukseen. Graafinen käyttöliittymä on mahdollista myös jättää pois, mutta tämä [vaikuttaa arvosanaan](./arvosteluperusteet.md). Graafisen käyttöliittymän toteutukseen löytyy ohjeita [täällä](./tkinter.md). Pelin toteutukseen Pygame-kirjastolla löytyy ohjeita [täältä](./pygame.md).

[Arvosanan kannalta suositeltavaa](./arvosteluperusteet.md) on, että ohjelmasi tallettaa dataa joko tiedostoon tai tietokantaan. Vihjeitä tiedon tallettamiseen [täällä](./python.md).

Harjoitustyön tavoitteena on tuottaa ohjelma, joka voitaisiin antaa toiselle opiskelijalle ylläpidettäväksi ja täydennettäväksi. Lopullisessa palautuksessa on oltava lähdekoodin lisäksi dokumentaatio ja automaattiset testit.

Toivottava dokumentaation taso käy ilmi [referenssiprojektissa](https://github.com/ohjelmistotekniikka-hy/python-todo-app).

## Projektin hakemistorakenne

Projektin hakemistorakenteesta voi ottaa mallia [referenssiprojektista](https://github.com/ohjelmistotekniikka-hy/python-todo-app), jossa hakemistorakenne on seuraavanlainen:

```
data/
  .gitkeep
  ...
dokumentaatio/
  ...
src/
  tests/
    __init__.py
    ...
  ...
Pipfile
Pipfile.lock
README.md
...
```

Hakemistossa _data_ on projektin käyttämät data-tiedostot, kuten CSV-tiedostot ja SQLite-tietokannan tiedostot. Tyhjä _.gitkeep_-tiedosto mahdollistaa hakemiston lisäämisen versionhallintaan tyhjänä. Hakemistossa _dokumentaatio_ on projektin dokumentaatio. Itse sovelluksen koodi löytyy _src_-hakemistosta, jonka sisällä on _tests_-hakemisto sovelluksen testejä varten. Hakemiston _src_ sisällä on myös muita alihakemistoja rakenteen selkeyttämiseksi. Projektin juurihakemistossa on _README.md_-tiedosto ja erilaisia konfiguraatiotiedostoja.

## Esimerkkejä aiheista

### Hyvän aiheen ominaisuudet

- **Itseäsi kiinnostava aihe**
  - Innostava aihe auttaa huonoinakin hetkinä
- "Riittävän laaja"
  - Vältä eeppisiä aiheita, aloita riittävän pienestä. Yksi periodi on yllättävän lyhyt aika
  - Valitse kuitenkin aihe, jonka perustoiminnallisuuden saa toteutettua nopeasti, mutta jota saa myös laajennettua helposti
  - Hyvässä aiheessa on muutamia logiikkaluokkia, tiedoston tai tietokannankäsittelyä ja logiikasta eriytetty käyttöliittymä
- Kurssilla pääpaino on Ohjelmoinnin Perusteissa ja Jatkokurssilla opituissa asioissa
  - Käytettävyys
  - Toimivuus ja varautuminen virhetilanteisiin
  - Luokkien vastuut
  - Ohjelman selkeä rakenne
  - Laajennettavuus ja ylläpidettävyys
- **Tällä kurssilla ei ole tärkeää:**
  - Tekoäly
  - Grafiikka
  - Tietoturva
  - Tehokkuus
- **HUOMIO!** Kannattaa yrittää välttää aiheita, joissa pääpaino on tiedon säilömisessä tai käyttöliittymässä. Paljon tietoa säilövät, esim. yli 3 tietokantataulua tarvitsevat sovellukset ovat vaikeita testata tämän kurssin esitietovaatimusten puitteissa, ja ne sopivat yleensä paremmin Tietokantasovellus-kurssille. Käyttöliittymäkeskeisissä aiheissa (esim. tekstieditori) voi olla vaikea keksiä sovelluslogiikkaa, joka on enemmän tämän kurssin painopiste (myös siksi koska käyttöliittymää ei tällä kurssilla testata ja testaus on kurssin keskeinen aihe - jos ei ole sovelluslogiikkaa, on vaikea myös kirjoittaa sille testejä)

### Esimerkkejä aiheista

Oman aiheen ei ole pakko olla allaolevasta listasta. Listassa on kuitenkin erilaisia esimerkkejä, joista voi toteuttaa oman versionsa.

- Hyötyohjelmat
  - Aritmetiikan harjoittelua
  - Tehtävägeneraattori, joka antaa käyttäjälle tehtävän sekä mallivastauksen (esim. matematiikkaa, fysiikkaa, kemiaa, ...)
  - Opintojen seurantajärjestelmä
  - Code Snippet Manageri
  - Laskin, funktiolaskin, graafinen laskin
  - Budjetointisovellus
  - HTML WYSIWYG-editor (What you see is what you get)
- Reaaliaikaiset pelit
  - Tetris
  - Pong
  - Pacman
  - Tower Defence
  - Asteroids
  - Space Invaders
  - Yksinkertainen tasohyppypeli, esimerkiksi The Impossible Game
- Vuoropohjaiset pelit
  - Tammi
  - Yatzy
  - Miinaharava
  - Laivanupotus
  - Yksinkertainen roolipeli tai luolastoseikkailu
  - Sudoku
  - Muistipeli
  - Ristinolla (mielivaltaisen kokoisella ruudukolla?)
  - 2048
- Korttipelit
  - En Garde
  - Pasianssi
  - UNO
  - Texas Hold'em
- Omaan tieteenalaan, sivuaineeseen tai harrastukseen liittyvät hyötyohjelmat
  - Yksinkertainen fysiikkasimulaattori
  - DNA-ketjujen tutkija
  - Keräilykorttien hallintajärjestelmä
  - Pelin hahmogeneraattori, joka tallentaa tiedostoon (esim. D&D hahmolomake)
  - Fraktaaligeneraattori

## Harjoitustyön aloitus

Harjoitustyö siis aloitetaan kurssin [toisella viikolla](../tehtavat/harjoitustyo-viikko2.md).

Työ tehdään samaan repositorioon, jonka olet rekisteröinyt Labtooliin ja johon olet jo tehnyt [viikon 1 laskareiden](../tehtavat/viikko1.md) palautuksen.

### GitHubissa olevan repositorion kloonaaminen

Jos haluat tehdä harjoitustyötä eri koneella, kuin mille teit repositoriosi alunperin, saat koodin siirrettyä toiselle koneelle kloonaamalla repositorion.

Koneeseesi täytyy luonnollisesti [ensin asentaa](https://git-scm.com/downloads) git jos se ei ole jo koneellasi. Muista myös [oleellisten konfiguraatioiden](../tehtavat/viikko1.md#konfiguraatioita) tekeminen

Koneesi julkinen avain on talletettava GitHubiin. Ohje avaimen generointiin ja tallettamiseen [täällä](../tehtavat/viikko1.md#julkinen-avain).

Kloonaus tapahtuu seuraavasti:

- avaa palautusrepositoriosi
- klikkaa kohtaa _clone or download_ ja kopioi kloonausurl
  - varmista että valittuna on "clone with SSH"

<img src="https://raw.githubusercontent.com/mluukkai/ohjelmistotekniikka-syksy-2020/main/web/images/a-1.png" width="700">

- mene sopivaan hakemistoon paikallisella koneella
  - **ÄLÄ** kuitenkaan mene minkään git-repositorion sisälle
- anna kloonauskomento _git clone_ parametrina kloonausurl

```
mluukkai@melkinkari:~$ git clone git@github.com:mluukkai/otm-harjoitustyo.git
Cloning into 'otm-harjoitustyo'...
remote: Counting objects: 29, done.
remote: Compressing objects: 100% (22/22), done.
remote: Total 29 (delta 5), reused 17 (delta 2), pack-reused 0
Receiving objects: 100% (29/29), 4.83 KiB | 0 bytes/s, done.
Resolving deltas: 100% (5/5), done.
```

Hakemistoosi syntyy uusi hakemisto, esimerkissä nimeltään _otm-harjoitustyo_, eli oletusarvoisesti nimi päätellään kloonausurlista. Uuden hakemiston nimen voi myös määritellä itse antamalla komennolle lisäparametrin:

```
git clone git@github.com:mluukkai/otm-harjoitustyo.git hakemiston_nimi
```

Syntynyt hakemisto on nyt git-repositorio, jonka sisältö on sama kuin etärepositoriossa.

- tee repositorioon jokin muutos, lisää ja committoi
- pushaa muutokset githubiin ja varmista GitHubista että muutos menee perille

**HUOM** jos `git push`-komento ei toimi, eli saat seuraavan virheilmoituksen

```
ERROR: Permission to mluukkai/otm-harjoitustyo.git denied to mluukkai.
fatal: Could not read from remote repository.

Please make sure you have the correct access rights
and the repository exists.
```

niin voit siirtyä käyttämään _HTTPS_-muotoista kloonausurlia:

<img src="https://raw.githubusercontent.com/mluukkai/ohjelmistotekniikka-syksy-2020/main/web/images/a-2.png" width="500">

joudut poistamaan ensin vanhan kloonausurlin ja lisäämään uuden antamalla seuraavat komennot:

```
git remote rm origin
git remote add origin https://github.com/mluukkai/otm-harjoitustyo.git
```

Ikävä seuraus tästä on se, että GitHub kysyy jokaisen pushaamisen yhteydessä salasanaasi.

### Työskentely usealla koneella

Jos työskentelet monella koneella niin huomioi seuraavat

- GitHubissa oleva repositorion tulee olla kloonattuna kaikille koneille
- Oletusarvoisesti kaikkien koneiden julkiset avaimet kannattaa olla määritelty GitHubiin
- [Oleelliset konfiguraatiot](../tehtavat/viikko1.md#konfiguraatioita) kannattaa olla tehtynä kaikilla koneilla
- **TÄRKEÄÄ** aina kun lopetat työskentelyn koneella, pushaa muutokset GitHubiin
- Kun aloitat työskentelyn koneelta, pullaa muutokset githubista
- Jos (ja kun) törmäät seuraavaan virheeseen:

```
mluukkai@melkki:~/otm-harjoitustyo$ git push
To git@github.com:mluukkai/otm-harjoitustyo.git
 ! [rejected]        master -> master (fetch first)
error: failed to push some refs to 'git@github.com:mluukkai/otm-harjoitustyo.git'
hint: Updates were rejected because the remote contains work that you do
hint: not have locally. This is usually caused by another repository pushing
hint: to the same ref. You may want to first integrate the remote changes
hint: (e.g., 'git pull ...') before pushing again.
hint: See the 'Note about fast-forwards' in 'git push --help' for details.
mluukkai@melkki:~/otm-harjoitustyo$
```

- Tilanne korjautuu kun ensin pullaat GitHubin sisällön

### Poetry-projektin alustus

Harjoitustyössä tehtävä ohjelmistossa hyödynnetään [Poetry](https://python-poetry.org/)-työkalua. Poetryn asennukseen ja projektin alustamiseen löydät ohjeet [täältä](./poetry.md).

## Työaikakirjanpito

Pidä säännöllisesti kirjaa käyttämistäsi työtunneista. Käytettyjen työtuntien määrä ei vaikuta arvosanaan, _mutta_ vajavaisesti pidetty työaikakirjanpito alentaa työn arvosanaa.

Lisää repositorioon linkki [työaikakirjanpitoon](https://github.com/ohjelmistotekniikka-hy/python-todo-app/blob/master/dokumentaatio/tuntikirjanpito.md).
