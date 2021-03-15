---
layout: page
title: Viikko 2
permalink: /python/viikko2
---
# Viikon 2 laskarit

Tehtävät on tarkoitus tehdä joko pajassa tai omatoimisesti. Tehtävien palautuksen deadline on ti {{ site.wk2dl }}. klo 23:59

Tehtävät palautetaan GitHubin avulla Labtoolin rekisteröimääsi repositorioon.

Muista pushata tehtävät GitHubiin ennen viikkodeadlinea.

- Klo 00 jälkeen tulevia repositorion päivityksiä ei huomioida pisteytyksessä, eli ne tuovat 0 pistettä.

Tee palautuksia varten repositorion sisällä olevaan hakemistoon _laskarit_ uusi alihakemisto _viikko2_.

Viikon palautuksista on tarjolla 2 pistettä. Pisteytys arvioidaan palautuksen laadun perusteella.

Huomaa, että tällä viikolla on myös harjoitustyöhön liittyviä [tavoitteita](/python/ht-viikko2)

## Alkutoimet

Ennen tehtävien aloitusta, tutustu [Poetry-ohjeisiin](/python/poetry). Varmista, että Poetry on asennettuna ja osaat suorittaa `poetry`-komentoja komentoriviltä.

## 1

- Tutustu [unittest-ohjeeseen](/python/unittest)
- Lukiessasi tee testit myös itse
- Lisää lopuksi maksukortille seuraavat testit:
  - Maukkaan lounaan syöminen ei vie saldoa negatiiviseksi, ota tähän mallia testistä `test_syo_edullisesti_ei_vie_saldoa_negatiiviseksi`
  - Negatiivisen summan lataaminen ei muuta kortin saldoa
  - Kortilla pystyy ostamaan edullisen lounaan, kun kortilla rahaa vain edullisen lounaan verran (eli 2.5e)
  - Kortilla pystyy ostamaan maukkaan lounaan, kun kortilla rahaa vain maukkaan lounaan verran (eli 4e)

**HUOM1** On suositeltavaa, että yksi testi testaa vain "yhtä asiaa" kerrallaan. Tee siis jokaisesta ylläolevasta oma testinsä.

**HUOM2** Kirjoita `assertEqual`-komennot aina siten, että ensimmäisenä parametrina saatu tulos
ja toisena parametrina on odotettu tulos. Esimerkiksi:

```python
self.assertEqual(str(kortti), "Kortilla on rahaa 2 euroa")
```

## 2 Maksukortti ja kassapääte: testit kortille

**HUOM** tämä tehtävä tehdään **eri projektiin** kuin edellinen, ja vaikka molemmissa tehtävissä on saman niminen luokka, eli `Maksukortti`-luokat vat erilaiset, eli **älä** copypastaa edellisen tehtävän koodia tai tehtäviä tähän tehtävään.

Tämän tehtävän projekti _ladataan internetistä_ hieman alempana olevan ohjeen mukaan.

Tehtävä pohjautuu sovellukseen, jonka tarkoituksena on toteuttaa [Unicafe](https://unicafe.fi/)-ruokalan kassapääte. Kassapäätteen avulla voidaan ostaa eri hintaisia aterioita joko maksukortilla tai käteisellä.

Maksukortilla on mahdollisuus ladata sille rahaa ja ottaa siltä rahaa maksuja varten. Ohjelmointiuransa aloittelevan tuttavasi vastaus seuraavassa:

```python
class Maksukortti:
    def __init__(self, saldo):
        # saldo on senteissä
        self.saldo = saldo

    def lataa_rahaa(self, lisays):
        self.saldo += lisays

    def ota_rahaa(self, maara):
        if self.saldo < maara:
            return False

        self.saldo = self.saldo - maara
        return True

    def __str__(self):
        saldo_euroissa = round(self.saldo / 100, 2)

        return f"saldo: {saldo_euroissa}"
```

Kassapäätteelle on metodeja eri hintaisten aterioiden ostamiselle ja rahan lataamiselle kortille:

```python
class Kassapaate:
    def __init__(self):
        self.kassassa_rahaa = 100000
        self.edulliset = 0
        self.maukkaat = 0

    def syo_edullisesti_kateisella(self, maksu):
        if maksu >= 240:
            self.kassassa_rahaa = self.kassassa_rahaa + 240
            self.edulliset += 1
            return maksu - 240
        else:
            return maksu

    def syo_maukkaasti_kateisella(self, maksu):
        if maksu >= 400:
            self.kassassa_rahaa = self.kassassa_rahaa + 400
            self.maukkaat += 1
            return maksu - 400
        else:
            return maksu

    def syo_edullisesti_kortilla(self, kortti):
        if kortti.saldo >= 240:
            kortti.ota_rahaa(240)
            self.edulliset += 1
            return True
        else:
            return False

    def syo_maukkaasti_kortilla(self, kortti):
        if kortti.saldo >= 400:
            kortti.ota_rahaa(400)
            self.maukkaat += 1
            return True
        else:
            return False

    def lataa_rahaa_kortille(self, kortti, summa):
        if summa >= 0:
            kortti.lataa_rahaa(summa)
            self.kassassa_rahaa += summa
        else:
            return
```

**Hae nyt projektin koodi koneellesi**.

Avaa terminaali, mene palautusrepositoriosi hakemistoon _laskarit/viikko2_ ja suorita seuraavat komennot:

```bash
wget https://raw.githubusercontent.com/ohjelmistotekniikka-hy/python-materiaali/master/misc/unicafe.zip
unzip unicafe.zip
rm unicafe.zip
```

**HUOM:** jos käytät Windowsia ja koneellasi ei ole käytössä komentoa _wget_ lataa tehtävän koodi klikkaamalla yo. linkkiä. Muista siirtää projekti repositorion alle oikeaan hakemistoon!

Lisää ja commitoi hakemisto repositorioon.

Varmista komennolla `git status`, että working directory on puhdas ja kaikki on commitoitu:

```bash
On branch master
Your branch is ahead of 'origin/master' by 3 commits.
  (use "git push" to publish your local commits)
nothing to commit, working tree clean
```

Siirry komentorivillä _unicafe_-hakemistoon ja asenna vaadittavat riippuvuudet komennolla:

```
poetry install
```

Testien suorittaminen komentoriviltä onnistuu siirtymällä virtuaaliympäristöön komennolla `poetry shell` ja sen jälkeen suorittamalla komennon `pytest`. Jos kaikki on kunnossa, saat raportin läpimenneistä testeistä:

```
collected 1 item

src/tests/maksukortti_test.py .                          [100%]

====================== 1 passed in 0.03s ======================
```

### .gitignore

Kun testien jälkeen suoritat komennon `git status`, huomaat että projektin juureen on ilmestynyt uusi hakemisto <i>.pytest_cache</i>, joka ei ole gitin alaisuudessa

```bash
On branch master
Your branch is ahead of 'origin/master' by 4 commits.
  (use "git push" to publish your local commits)
Untracked files:
  (use "git add <file>..." to include in what will be committed)

	.pytest_cache/

nothing added to commit but untracked files present (use "git add" to track)
```

Hakemisto <i>.pytest_cache</i>, joka sisältää `pytest`-komentojen aikaansaannoksia on tyypillisesti sellainen, jota emme halua versionhallinnan pariin.

git-repositorion juureen on mahdollista lisätä tiedosto [.gitignore](https://www.atlassian.com/git/tutorials/gitignore) jossa voidaan määritellä, mitä tiedostoja ja hakemistoja git jättää huomioimatta eli _ignoroi_.

Mene **repositoriosi juureen**, luo tiedosto _.gitignore_, avaa se editorilla ja lisää tiedostoon seuraava rivi:

```
/laskarit/viikko2/unicafe/.pytest_cache
```

Kun nyt teet komennon _git status_ pitäisi tuloksen olla seuraava:

```bash
On branch master

Initial commit

Untracked files:
  (use "git add <file>..." to include in what will be committed)

	.gitignore
```

Eli vaikka hakemistossa _/laskarit/viikko2/unicafe_ on alihakemisto  <i>.pytest_cache</i>, ei git niitä huomioi

### Takaisin testeihin

Avaa nyt projekti valitsemallasi editorilla, kuten Visual Studio Codella.

Tee valmiiseen testiluokkaan `TestMaksukortti` testit, jotka testaavat ainakin seuraavia asioita:

- Kortin saldo alussa oikein
- Rahan lataaminen kasvattaa saldoa oikein
- Rahan ottaminen toimii
  - Saldo vähenee oikein, jos rahaa on tarpeeksi
  - Saldo ei muutu, jos rahaa ei ole tarpeeksi
  - Metodi palauttaa _True_, jos rahat riittivät ja muuten _False_

Suorita testit komentoriviltä virtuaaliympäristössä `pytest`-komennolla.

## 3 Testikattavuus

Tutustu testikattavuuden mittaamiseen lukemalla materiaalin [testikattavuutta](/python/coverage) käsittelevä osio.

Projektiin on valmiiksi konfiguroitu käytettäväksi [coverage](https://coverage.readthedocs.io/en/coverage-5.3/)-työkalu, joka mittaa testien haarautumakattavuuden. Testikattavuuden konfiguraatiossa käytettävä, _.coveragerc_-tiedoston sisältö on projektissa seuraava:

```
[run]
source = src
omit = src/tests/**,src/index.py
```

Testikattavuuden kerääminen testeistä onnistuu virtuaaliympäristössä komennolla `coverage run --branch -m pytest`. Komennon suorittamisen jälkeen kattavuusraportin voi muodostaa komennolla `coverage html`. Komennon suorittaminen luo projektin juurihakemistoon hakemiston _htmlcov_. Avamaalla hakemiston tiedoston _index.html_ selaimessa aukeaa seuraavan näköinen raportti:

![Testikattavuusraportti](../materiaali/kuvat/unicafe-coverage.png)

Huomaa, että oma raporttisi tuskin näyttää täysin tältä (etenkin kattavuusprosenttien osalta) edellisen tehtävien testien toteutuksen jälkeen. Yksittäistä moduulia klikkaamalla näet punaisella korostuksella haarat, joita testit eivät kata vielä lainkaan ja keltaisella korostuksella haarat, joita testit kattavat vain osittain.

**Jos maksukortin koodissa on vielä rivejä tai haarautumia (merkitty punaisella) joille ei ole testiä, kirjoita sopivat testit.**

Jotta `coverage`-komennon generoimat tiedostot eivät päättyisi versionhallintaan, lisää _.gitignore_-tiedostoon vielä seuraavat rivit:

```
/laskarit/viikko2/unicafe/.coverage
/laskarit/viikko2/unicafe/htmlcov
```

## Komentojen suorittaminen Visual Studio Codessa

Visual Studio Codesta löytyy sisään rakennettu terminaali. Terminaalin saa avattua valitsemalla päävalikosta _Terminal_ ja aukeavasta alavalikosta _New Terminal_. editorin alalaitaan pitäisi ilmesty terminaali, jossa voit suorittaa komentorivikomentoja.

Terminaalin avaaminen saattaa automaattisesti avata komentorivin virtuaaliympäristössä. Jos olet virtuaaliympäristössä, on komentorivin syöterivin alussa projektin nimi ja jokin satunnain merkkijono suluissa, esimerkiksi `(unicafe-sF0cl2di-py3.9)`. Jos et ole virtuaaliympäristössä pääset siihen tutulla `poetry shell` komennolla. Tämän jälkeen voit suorittaa komentoja suoraan Visual Studio Codessa:

![Visual Studio Code terminaali](../materiaali/kuvat/vscode-terminaali.png)

## 4 Kassapäätteen testit

Laajennetaan unicafe-projektin testaus kattamaan myös kassapääte.

Tee testihakemistoon testitiedosto <i>kassapaate_test.py</i> ja sinne testiluokka `TestKassapaate`. Tee testit jotka testaavat ainakin seuraavia asioita:

- Luodun kassapäätteen rahamäärä ja myytyjen lounaiden määrä on oikea (rahaa 1000, lounaita myyty 0)
- Käteisosto toimii sekä edullisten että maukkaiden lounaiden osalta
  - Jos maksu riittävä: kassassa oleva rahamäärä kasvaa lounaan hinnalla ja vaihtorahan suuruus on oikea
  - Jos maksu on riittävä: myytyjen lounaiden määrä kasvaa
  - Jos maksu ei ole riittävä: kassassa oleva rahamäärä ei muutu, kaikki rahat palautetaan vaihtorahana ja myytyjen lounaiden määrässä ei muutosta
- _seuraavissa testeissä tarvitaan myös Maksukorttia jonka oletetaan toimivan oikein_
- Korttiosto toimii sekä edullisten että maukkaiden lounaiden osalta
  - Jos kortilla on tarpeeksi rahaa, veloitetaan summa kortilta ja palautetaan true
  - Jos kortilla on tarpeeksi rahaa, myytyjen lounaiden määrä kasvaa
  - Jos kortilla ei ole tarpeeksi rahaa, kortin rahamäärä ei muutu, myytyjen lounaiden määrä muuttumaton ja palautetaan false
  - Kassassa oleva rahamäärä ei muutu kortilla ostettaessa
- Kortille rahaa ladattaessa kortin saldo muuttuu ja kassassa oleva rahamäärä kasvaa ladatulla summalla

Huomaat että kassapääte sisältää melkoisen määrän "copypastea". Nyt kun kassapäätteellä on automaattiset testit, on sen rakennetta helppo muokata eli refaktoroida siistimmäksi koko ajan kuitenkin varmistaen, että testit menevät läpi. Tulemme tekemään refaktoroinnin myöhemmin kurssilla.

## 5

Varmista testikattavuuskomentojen avulla, että kassapäätteen testeillä on 100% haarautumakattavuus. Suorita siis virtuaaliympäristössä komennot `coverage run --branch -m pytest` ja `coverage html`, jonka jälkeen avaa selaimessa _htmlcov/index.html_-tiedosto.

## 6

Talleta kohdassa [testikattavuus](#3-testikattavuus) olevan kuvan tyylinen [screenshot](https://www.take-a-screenshot.org/) projektisi kattavuusraportista palautusrepositoriosi hakemistoon _laskarit/viikko2_.

**Muista tallentaa tekemäsi muutokset gitiin ja työntää ne GitHubiin (`git push`).**