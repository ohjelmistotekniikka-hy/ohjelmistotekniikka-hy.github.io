---
layout: page
permalink: /python/viikko1
title: Viikko 1
---

{% include java_materiaali_info.md %}

{% include deadline_info.md deadline=site.wk1dl %}

Tämän viikon tehtävien palautuksesta on tarjolla 1 piste.

## Kurssista

Kurssin nimi on muuttunut syksyllä 2023: vanha nimi oli Ohjelmistotekniikka. Kurssin oppimistavoitteet ovat edelleen suunnilleen samat kuin aiemmin. Kurssin suoritettuaan opiskelija

- Tuntee ohjelmistotuotantoprosessin vaiheet
- On tietoinen vesiputousmallin ja ketterän ohjelmistotuotannon luonteesta
- Osaa soveltaa versionhallintaa osana ohjelmistokehitystä
- Osaa soveltaa UML-mallinnustekniikkaa vaatimusmäärittelyssä ja ohjelmiston suunnittelussa tarkoituksenmukaisella tavalla
- Tuntee ohjelmiston testauksen eri vaiheet
- Osaa soveltaa automatisoitua testausta yksinkertaisissa ohjelmistoprojekteissa
- Tuntee tärkeimpiä ohjelmiston suunnitteluperiaatteita ja osaa soveltaa niitä yksinkertaisissa projekteissa

Kurssin esitietoina ovat kurssit Tietokone työvälineenä, Ohjelmoinnin jatkokurssi, Tietokantojen perusteet sekä Tietokannat ja web-ohjelmointi. Oletuksena on, että näistä kaikista on käyty suhteellisen tuore versio ja että opittu on vielä hyvin mielessä.

Kurssin ensimmäisen kolmen viikon aikana harjoitellaan yksikkötestausta ja UML-kaavioiden tekemistä. Myös komentorivistä ja versionhallinnasta on tehtäviä, mutta nämä ovat syksystä 2023 alkaen vapaaehtoisia muuttuneiden esitietovaatimusten takia. Toisesta viikosta alkaen aloitetaan oman harjoitustyön tekeminen. Harjoitustyön tekemisen ohessa osoitetaan riittävä osaaminen kurssin oppimistavoitteiden suhteen, koetta kurssilla ei ole. Tarkemmat arvosteluperusteet [täällä](./arvosteluperusteet).

{% include materiaali_ohjelmistotuotanto.md reference_app_url=site.python_reference_app_url %}

---
## Ensimmäisen viikon harjoitukset

Lue tehtävänannot kohdista **"Komentorivin harjoittelua"** ja **"Versionhallinta"**. Jos niissä käsitellyt asiat ovat tuttuja (kuten kurssin esitietovaatimuksien mukaan pitäisi olla), sinun ei tarvitse tehdä näitä harjoituksia. **Jos kuitenkin yhtään epäilet osaamistasi, tee harjoitukset tehtävänantojen mukaan!** Et saa siitä pisteitä, mutta tulet jatkossa tarvitsemaan vastaavia taitoja tällä kurssilla.
Mikäli komentorivi- ja versionhallintaharjoitusten asiat ovat tuttuja, **tee joka tapauksessa seuraavat asiat**:
1. Luo paikallinen repositorio harjoitustyölle ja viikkoharjoituksille. Voit antaa sille nimeksi ot-harjoitustyo.
2. Kirjoita tiedostoon README.md otsikko "Ohjelmistotekniikka, harjoitustyö" ja kerro yhdellä virkkeellä, mitä olet tekemässä (tämä saa vielä muuttua: harjoitustyön oikea alustava vaatimusmäärittely vasta seuraavalla viikolla). Muotoile tekstisi markdown-notaatiota käyttäen. Luo myös alihakemisto nimeltä "laskarit".
3. Luo GitHub-repositorio ja liitä se paikallisen repositoriosi etärepositorioksi
4. Pushaa paikallisen repositoriosi sisältö GitHubiin
5. Rekisteröi omat tietosi ja luomasi GitHub-repositorio [Labtooliin](https://study.cs.helsinki.fi/labtool/courses/TKT20018.2023.S.K.1)

Koska säästit aikaa komentorivi- ja versionhallintaharjoitusten sivuuttamisella, tutustu jo alustavasti seuraavan viikon kurssimateriaaliin.  Sivun loppupuolelta löydät ohjeita harjoitustyön aiheenvalintaan ja alustavan määrittelydokumentin kirjoittamiseen. Mieti, miten aiot harjoitustyössäsi edetä ja näetkö siinä joitain ongelmallisia kohtia. Mikäli niin haluat, mikään ei estä sinua jo käytännössä tekemästä 2. viikon harjoituksia.  Ne kuitenkin arvioidaan vasta 2. viikon jälkeen.
---

## Komentorivin harjoittelua (tee nämä harjoitukset jos ei tunnu tutulta)

Graafisten käyttöliittymien olemassaolosta huolimatta ohjelmistoalalla on edelleen erittäin tärkeää hallita komentorivin eli terminaalin käyttö. Opettele käyttämään "riittävästi" komentoriviä (ks. alla oleva lista). Opettelu käy ehkä helpoiten tekemällä Tietokone työvälineenä-kurssin ensimmäisen osan [_Komentorivi_](https://tkt-lapio.github.io/komentorivi/) tehtävät 1-13.

Tämän tehtävän jälkeen sinun tulisi hallita seuraavat käsitteet:

- Root directory
- Home directory
- Parent directory
- Child directory
- Working directory
- .. ja \*

Lisäksi sinun tulee osata käyttää seuraavia komentoja:

- `pwd`
- `cd`
- `ls`, `ls -a`, `ls -l`, `ls -t`
- `mkdir`
- `touch`
- `cp`
- `rm`, `rm -r`
- `mv`

Tulet tarvitsemaan komentorivin käyttötaitoja tällä kurssilla ja muutenkin opinnoissasi.

### Tehtävä 1: Komentorivin harjoittelua

Saman Tietokone työvälineenä-kurssin materiaalin [toisesta osasta](https://tkt-lapio.github.io/git/) voi olla paljonkin hyötyä tässä ja seuraavissa tehtävissä.

Ota ssh-yhteys linuxpalvelimeen _melkki.cs.helsinki.fi_, _melkinpaasi.cs.helsinki.fi_ tai _melkinkari.cs.helsinki.fi_. Linuxilla, macilla ja Windows 10:llä yhteys otetaan komentoriviltä komennolla _ssh kayttajatunnus@palvelimenosoite_. Vanhemmilla Windows versioilla ssh-yhteyden ottaminen onnistuu esimerkiksi [putty:llä](http://www.putty.org).

Kirjauduttuasi laitoksen palvelimelle, tee seuraavat toimenpiteet:

- Luo kotihakemistoosi hakemisto _kurssit_
  - **HUOM:** joidenkin kohdalla melkillä on ollut ongelmia kotihakemiston asetuksissa ja esim. hakemiston luomisen seurauksena on virhe 'permission denied'. Jos törmäät ongelmaan, lähetä viesti osoitteeseen _it-support@cs.helsinki.fi_ ja raportoi ongelmaksi "ei oikeuksia kotihakemistoon melkillä"
  - Kokeile myös jos kirjaantuminen toiselle koneelle, esim. _melkinpaasi.cs.helsinki.fi_ tuottaisi paremman tuloksen
- Luo hakemistolle _kurssit_ alihakemisto _ot2023_
- Ja luomallesi hakemistolle alihakemisto _viikko1_
- Mene kotihakemistoosi ja luo sen alle hakemisto _temp_
- Mene hakemistoon _temp_
- Hae osoitteessa _https://raw.githubusercontent.com/ohjelmistotekniikka-hy/ohjelmistotekniikka-hy.github.io/master/materiaali/python/unicafe.zip_ oleva tiedosto [wget](https://en.wikipedia.org/wiki/Wget)-ohjelmalla
  - Wget toimii siten, että sille annetaan ladattava tiedosto parametriksi
- Haettu tiedosto on _zip-paketti_, pura se _unzip_-ohjelmalla
  - Myös unzip toimii siten, että sille annetaan purettava tiedosto parametriksi
- Komennon suorittamisen jälkeen hakemistoon on ilmestynyt hakemisto _unicafe_
- Siirrä hakemisto hakemiston _kurssit/ot2023/viikko1_ alihakemistoksi
- Poista zip-paketti
- Poista hakemisto _temp_

**Mene tämän jälkeen _kotihakemistoon_ ja anna komento _tree kurssit_. Copypastea komennon tulostus talteen, tarvitset sitä myöhemmin.**

### Tab complete

Komentoriviä käyttäessä kannattaa ehdottomasti totutella _tab-completen_ käyttöön. _Tab_ on näppäin, joka näyttää suunnilleen seuraavalta

![](https://github.com/mluukkai/otm2016/raw/master/img/tab.jpg)

Tab:ia painamalla voit komentorivillä täydentää kirjoittamasi komennon nimen tai parametrin. Esim. jos olet siirtymässä hakemistoon nimeltään _ohjelmistotekniikka-syksy-2020_, riittää, että kirjoitat `cd oh` ja painat tabia. Jos hakemistossasi ei ole muita tiedostoja tai hakemistoja, jotka alkavat merkeillä _oh_, nimi täydentyy. Jos on, niin voit joutua kirjoittamaan merkin tai kaksi lisää. Jos tiedostoja on useampia etkä ole varma oikeasta nimestä, painamalla tabia useamman kerran näet mahdolliset vaihtoehdot.

Myös komentojen nimet voi täydentää tab-completella. Esim. haluat avata _chromium-browser_ web-selaimen komentoriviltä, riittää että kirjoitat _chro_ ja painat tabia. Komennon nimi täydentyy.

Ei pidä myöskään unohtaa _nuolta ylöspäin_. Sen avulla voit selata aiemmin kirjoittamiasi komentoja.

### Yhtäaikaiset terminaalit ja terminaalin tabit

Aloitteleva komentorivin käyttäjä pitää usein ainoastaan yhtä terminaali-ikkunaa kerrallaan auki. Useimmissa tilanteissa työtehosi moninkertaistuu, jos avaat useita terminaaleja näytöllä tai avaat yhteen terminaaliin useita "tabeja" eli välilehtiä. Uuden tabin saat avautumaan painamalla yhtä aikaa _ctrl_, _shift_ ja _t_ tai sovelluksen valikosta (joka laitoksen Linuxeissa sijaitsee ruudun yläreunassa).

## Versionhallinta (tee nämä harjoitukset jos ei tunnu tutulta)

Tutustumme seuraavaksi versionhallintaan.

Mitä tarkoitetaan versionhallinnalla? Lainaus sivulta [https://www.atlassian.com/git/tutorials](https://www.atlassian.com/git/tutorials)

> Version control systems are a category of software tools that help a software team manage changes to source code over time. Version control software keeps track of every modification to the code in a special kind of database. If a mistake is made, developers can turn back the clock and compare earlier versions of the code to help fix the mistake while minimizing disruption to all team members.

Vaikka ylläoleva puhuu versionhallinnasta ohjelmistotiimien yhteydessä, kannattaa versionhallintaa käyttää oikeastaan yhdenkin hengen projekteissa ja muunkinlaisen materiaalin, kuin koodin hallinnoimiseen. Esim. tämän kurssin kaikki materiaali on talletettu versionhallintaan.

Nykyään suosituin versionhallintaohjelmisto on [git](https://git-scm.com). Tutustumme tänään gitin alkeisiin.

**HUOM:** Git-tehtävät tulee tehdä tietokoneella, jolle on asennettu Git. Monilla macOS- ja Linux-käyttöjärjestelmien tietokoneilla Git on valmiiksi asennettuna. Asian voi tarkistaa suorittamalla oman tietokoneen terminaalissa komennon:

```bash
git --version
```

Jos komento ei tulosta Git-version numeroa, tutustu [Git-asennusohjeisiin](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git). Windows-tietokoneilla asennuksessa ja komentojen suorituksessa voi käyttää esimerkiksi [Windows Subsystem for Linux](https://tkt-lapio.github.io/#windows-subsystem-for-linux) -työkalua.

Jos komennon tulostama gitin versio taas on pienempi kuin 2.23.0, seuraavissa tehtävissä käytetty `git restore` -komento ei toimi. Voit kuitenkin käyttää `git reset HEAD`- ja `git checkout` -komentoja, joista saat lisätietoa [Tietokone työvälineen -kurssin materiaaleista](https://tkt-lapio.github.io/git/).

### Tehtävä 2: Git-konfiguraatioita

Avaa terminaali omalla koneellasi. **Seuraavat tehtävät tehdään siis paikallisesti, ei melkillä!**

Määrittele gitille **oma nimesi** sekä **käyttämäsi email-osoite** antamalla komennot:

```
 git config --global user.name "Your Name"
 git config --global user.email you@example.com
```

Varmista komennolla `git config -l`, että määrittelyt menivät oikein.

Määritellään vielä git käyttämään sopivia värejä komennolla `git config --global color.ui` ja **vaihdetaan gitin käyttämäksi oletuseditoriksi nano** komennolla `git config --global core.editor nano`

Jos käytät vimiä, voit jättää oletuseditorin muuttamatta.

Tee vielä seuraava konfiguraatio:

```
git config --global push.default matching
```

Tämä liittyy `git push`-komennon oletusarvoiseen toiminnallisuuteen. Komennosta lisää myöhemmin.

### Tehtävä 3: Repositorio

Tee nyt sopiva hakemisto gitin harjoittelua varten ja mene hakemistoon, eli anna esim. komennot:

- `mkdir ot_viikko1`
- `cd ot_viikko1`

**HUOM:** varmista nyt että olet luomassasi hakemistossa, eli jos suoritat komennon _ls_, ei hakemistossa pitäisi olla mitään.

Luodaan hakemistosta paikallinen _git-repositorio_ antamalla komento `git init`

Git ilmoittaa alustaneensa repositorion:

```
mluukkai@melkinpaasi:~/ot_viikko1$ git init
Initialised empty Git repository in /home/ad/fshome4/u4/m/mluukkai/Linux/ot_viikko1/.git/
```

Jos katsot hakemiston sisältöä komennolla `ls -la` huomaat, että hakemiston sisälle on ilmestynyt hakemisto `.git`. Git käyttää luotua hakemistoa pitääkseen kirjaa repositorioon talletetuista tiedostoista.

**HUOM:** koska hakemiston nimi (_.git_) alkaa pisteellä, ei komento `ls` näytä sitä oletusarvoisesti. Parametri _a_ näyttää myös pisteellä alkavat tiedostot ja hakemistot. Kokeile, miten `ls -a` ja `ls -la` eroavat toisistaan!

Pysy edelleen repositorion sisältävässä hakemistossasi _ot_viikko1_.

Luo hakemistoon tiedosto nimeltään _tiedosto.txt_, esim. komennolla `touch`. Luotuasi tiedoston, suorita komento `git status`:

```
mluukkai@melkinpaasi:~/ot_viikko1$ touch tiedosto.txt
mluukkai@melkinpaasi:~/ot_viikko1$ git status
On branch master

No commits yet

Untracked files:
  (use "git add <file>..." to include in what will be committed)

	tiedosto.txt

nothing added to commit but untracked files present (use "git add" to track)
mluukkai@melkinpaasi:~/ot_viikko1$
```

Git ilmoittaa, että on olemassa tiedosto, joka on tilassa _untracked_, eli tiedostoa ei ole lisätty versionhallinnan pariin.

Kuten komennon tuloste kertoo, tiedoston lisääminen gitin alaisuuteen (...to include in what will be committed) tapahtuu komennolla `git add tiedosto.txt`

Suorita lisäys ja sen jälkeen komento `git status`:

```
mluukkai@melkinpaasi:~/ot_viikko1$ git add tiedosto.txt
mluukkai@melkinpaasi:~/ot_viikko1$ git status
On branch master

No commits yet

Changes to be committed:
  (use "git rm --cached <file>..." to unstage)

	new file:   tiedosto.txt
```

Git kertoo nyt, että _tiedosto.txt_ on niiden muutosten joukossa, jotka voidaan _commitoida_.

### Tehtävä 4: Commitit

Commitoimisella tarkoitetaan tiedostojen ja hakemistojen sekä niihin liittyvien muutosten tallentamista _git-repositorioon_.

Suoritetaan commitointi antamalla komento `git commit -m "tiedosto.txt luotu"`

```
mluukkai@melkinpaasi:~/ot_viikko1$ git commit -m "tiedosto.txt luotu"
[master (root-commit) 0e12cfa] tiedosto.txt luotu
 1 file changed, 0 insertions(+), 0 deletions(-)
 create mode 100644 tiedosto.txt
```

Suorita jälleen komento `git status`

```
mluukkai@melkinpaasi:~/ot_viikko1$ git status
On branch master
nothing to commit, working tree clean
```

Git ilmoittaa, että _working tree clean_, eli hakemistosi on samassa tilassa kuin git-repositorio.

### Tehtävä 5: Working directory, index ja staging

**Muista käyttää tab-completea tehtäviä tehdessäsi!**

Kun teet muutoksia hakemistosi alla oleviin tiedostoihin (tai hakemistoihin), kohdistuvat muutokset _working directoryyn_ eli työhakemistoon.

- Tee jokin muutos tiedostoon tiedosto.txt
  - Käytä tiedostojen editointiin _nano_-editoria. Editori käynnistyy komentoriviltä komennolla _nano tiedosto.txt_
  - Saat tallennettua nanossa tiedoston painamalla yhtä aikaa _ctrl_ ja _o_
  - Editori sulkeutuu painamalla _ctrl_ ja _x_
- Luo hakemistoon uusi tiedosto, nimeltään _toinen.txt_

Suorita jälleen `git status`

```
mluukkai@melkinpaasi:~/ot_viikko1$ git status
On branch master
Changes not staged for commit:
  (use "git add <file>..." to update what will be committed)
  (use "git restore <file>..." to discard changes in working directory)
	modified:   tiedosto.txt

Untracked files:
  (use "git add <file>..." to include in what will be committed)

	toinen.txt

no changes added to commit (use "git add" and/or "git commit -a")
```

Git ilmoittaa nyt, että uusi tiedosto on _untracked_ ja että aiemmassa tiedostossa on muutoksia, jotka eivät ole _staged for commit_.

Toimitaan ohjeen mukaan eli lisätään muutokset ja uusi tiedosto commitoitavien joukkoon. Molempien tiedostojen yhtäaikainen "addaaminen" onnistuu komennolla `git add .`

Tarkistetaan taas tilanne komennolla `git status`

```
mluukkai@melkinpaasi:~/ot_viikko1$ git status
On branch master
Changes to be committed:
  (use "git restore --staged <file>..." to unstage)
	modified:   tiedosto.txt
	new file:   toinen.txt
```

Sekä muutos että uusi tiedosto ovat nyt valmiina committoitavaksi.

Committointi onnistuu komennolla `git commit`. Kuten edelliselläkin kerralla, annetaan komennolle parametrina _commit-viesti_, eli merkkijono, joka kuvaa mitä muutoksia uusi commit tuo edelliseen nähden:

`git commit -m "muutos ja lisäys"`

Tarkasta committoinnin jälkeen jälleen tilanne komennolla `git status`.

**HUOM** jos suoritat commitoinnin vahingossa ilman commit-viestiä, eli parametria `-m`, avaa git tekstieditorin ja olettaa että haluat kirjoittaa commit-viestin editoriin. Jos et määritellyt alun ohjeen mukaan gitille editoriksi nanoa, avautuu oletusarvoinen editori _vim_ ja joudut kenties googlaamaan, miten pääset pois editorista.

Tiedostot ja niihin tehdyt muutokset voivat siis olla gitin suhteen _kolmessa eri tilassa_.

- Aluksi tiedostot (tai niihin tehdyt muutokset) ovat vain _working directoryssä_ ja git ei noteeraa niitä ennen kuin ne lisätään komennolla `git add`
- Tämän jälkeen tiedostot ovat valmiina commitoitavaksi. Gitin terminologian mukaan valmiina committoitavaksi olevat tiedostot ovat _staging_-alueella
- Komento `git commit` siirtää stagingissa olevat muutokset repositorioon eli luo uuden _commitin_

Seuraava kuva havainnollistaa sitä, miten tiedoston _tila_ vaihtuu git-komentoja tekemällä.

![](https://github.com/mluukkai/otm2016/raw/master/img/lh3-2.png)

Kun tiedosto luodaan, menee se gitin _working directoryyn_. Komennolla _git add_ tiedosto siirtyy _staging_-alueelle, eli valmiiksi committointia varten. Stagingissa oleva tiedosto viedään (eli "commitoidaan") repositorioon komennolla _git commit_. Kun committoitua tiedostoa taas editoidaan, menevät muutokset jälleen _working directoryyn_.

### Git log

Jokainen komennon _git commit_ suorittaminen siis synnyttää repositorioon uuden commitin, eli uuden "tilan". Komennolla `git log` on mahdollista nähdä, mitä committeja repositorio sisältää:

```
mluukkai@melkinpaasi:~/ot_viikko1$ git log
commit 6aff75ab51d14d7cb9a72867ba13d9782d06c7ff (HEAD -> master)
Author: Matti Luukkainen <mluukkai@iki.fi>
Date:   Sun Oct 7 19:33:32 2018 +0300

    muutos ja lisäys

commit 9e6a83d058c9564e8a390f8766845d45b365f360
Author: Matti Luukkainen <mluukkai@iki.fi>
Date:   Sun Oct 7 19:32:12 2018 +0300

    tiedosto.txt luotu
mluukkai@melkinpaasi:~/ot_viikko1$
```

Gitin logi kertoo jokaisen commitin ajan, tekijän, viestin ja _tunnisteen_. Tunnisteita käytetään, jos on esim. tarvetta palata johonkin vanhan commitin tilaan.

Voit selata logia nuolinäppäimillä. Pääset ulos `git log`:ista painamalla _q_.

### Tehtävä 6: Harjoittelua

Muista käyttää komentoa `git status` mahdollisimman usein. Älä myöskään unohda tab-completea!

- Luo tiedosto _kolmas.txt_
- Lisää se commitoitavaksi ja commitoi
- Muuta tiedostojen _toinen.txt_ ja _kolmas.txt_ sisältöä ja commitoi muutokset
- Luo hakemisto _stuff_ ja sen sisälle jokin tiedosto
- Lisää muutokset committoitavaksi ja committoi
  - Huomaa, että hakemiston lisääminen riittää, sen sisältämät tiedostot tulevat automaattisesti lisätyksi
- Katso miltä git-logi näyttää

### Tehtävä 7: gitk

Gitin committeja voi tarkastella myös graafisella _gitk_-komennolla.

- `gitk`-komento toimii Windowsilla ainakin GitHub for Windowsin Git Shellissä.
- Saat asennettua Maciin `gitk`:n [tämän ohjeen](https://www.geekbitzone.com/posts/git/gitk-for-macos/) avulla
- Jos `gitk` ei jostain syystä toimi, voit asentaa [Sourcetree](https://www.sourcetreeapp.com)-työkalun

Suorita komento repositoriossa:

![]({{ "/assets/images/lh3-1.png" | absolute_url }})

Vasemmalla yläkulmassa näet kaikki commitit. Uusin tilanne ylimpänä. Uusimman commitin nimi on _master_. Klikkaamalla commitia, näet muissa ikkunoissa commitiin liittyviä tietoja. Oikealla alakulmassa näet ne tiedostot, jotka ovat muuttuneet commitissa (jos valinta on _patch_) tai ne tiedostot, joita repositoriossa oli olemassa commitin aikana (jos valinta on _tree_). Vasemmassa alakulmassa pystyt tarkastelemaan commitin tiedostoihin tekemiä muutoksia tai tiedostojen tilaa commitin aikana. Valinnat ovat hieman hämäävät, sillä ne toimivat eri tavoin riippuen oikean puolen moodista.

Vastaava näkymä OSX:n [Sourcetree](https://www.sourcetreeapp.com)-ohjelmalla tarkasteltaessa:

![]({{ "/assets/images/lh1-1a.png" | absolute_url }})

Seuraavaa tehtävää tehdessäsi kannattaa terminaaliin avata uusi välilehti, jotta voit pitää gitk:ta käynnissä.

- Kopioi tiedostoon _tiedosto.txt_ jostain paljon tekstiä ja commitoi tiedosto
- Poista nyt osa tiedoston tekstistä ja lisää tiedostoon hieman lisää tekstiä
- commitoi muutosten jälkeen
- Päivitä gitk:n näkymä (file/update) ja katso miten muutokset näkyvät (tarkastele kahta ylintä committia)
  - Valitse oikeasta alakulmasta _patch_ ja vasemmasta _diff_
  - Näin näet commitin aiheuttamat muutokset [diff](https://fi.wikipedia.org/wiki/Diff)-muodossa
  - Jos oikealta on valittuna _tree_, näkyy vasemmalla puolella (valinnasta riippumatta) tiedostojen commitin aikainen tilanne
- Jos käytät sourcetreetä, sen pitäisi päivittyä automaattisesti ja näyttää muutos _diff_-muodossa

### Tehtävä 8: Tiedoston poistaminen ja uudelleennimentä

- Poista tiedosto _toinen.txt_
- Suorita `git status`
- Commitoi muutos
  - Poista ensin tiedosto gitin alaisuudesta komennolla `git rm`
- varmista komennolla `git status`, että kaikki on niinkuin kuuluukin
- muuta tiedoston _tiedosto.txt_ nimeksi _eka.txt_
  - uudelleennimentä tapahtuu komennolla `mv`
- Suorita `git status`
  - Miten git käsittelee uudelleennimennän?
- Commitoi muutos

### Tehtävä 9: git add -p

- Tee jotain muutoksia tiedostoihin _eka.txt_ ja _kolmas.txt_
  - Tee sekä lisäyksiä että poistoja
- lisää ne commitoitavaksi komennolla `git add -p`
  - Git näyttää nyt jokaisen tekemäsi muutoksen _patch_-muodossa ja pyytää varmistamaan lisätäänkö muutos commitoivaksi
  - Hyväksy painamalla _y_ ja enter
- Commitoi muutokset
- Tee tiedostoihin tehtyjen muutosten commitoitavaksi lisääminen _aina_ komennolla `git add -p`, näin pääset tarkastamaan, että muutokset ovat juuri ne mitä oletat olevasi lisäämässä
- Huomaa, että kokonaan uudet tiedostot eivät siirry committoitavaksi komennolla `git add -p`

### Tehtävä 10: Muutosten peruminen

Joskus tiedostoihin tulee tehtyä muutoksia, jotka on tarpeen perua

- Tee nyt joku muutos tiedostoon _eka.txt_, **älä** lisää tiedostoa committoitavaksi
- Suorita komento `git status`

```
mluukkai@melkinpaasi:~/ot_viikko1$ git status
On branch master
Changes not staged for commit:
  (use "git add <file>..." to update what will be committed)
  (use "git restore <file>..." to discard changes in working directory)
	modified:   eka.txt

no changes added to commit (use "git add" and/or "git commit -a")
```

Kuten oletettua, git kertoo että olemme tehneet muutoksia, jotka eivät ole "staged for commit", eli lisättyjä commitoitavaksi.

- Päätetäänkin perua muutokset. Se onnistuu komennolla `git restore eka.txt`
- Kun suoritat uudelleen komennon `git status` huomaat, että working directory ei enää sisällä muutoksia:

```
mluukkai@melkinpaasi:~/ot_viikko1$ git restore eka.txt
mluukkai@melkinpaasi:~/ot_viikko1$ git status
On branch master
nothing to commit, working trean clean
```

- Varmista vielä, että tiedoston sisältö on sama kuin ennen muutoksia

Myös stagingiin viety eli valmiina committoitavaksi oleva muutos voidaan perua.

- Tee muutoksia tiedostoon _kolmas.txt_ ja lisää se committoitavaksi. **Älä** kuitenkaan committoi.
- Git statuksen pitäisi näyttää seuraavalta

```
mluukkai@melkinpaasi:~/ot_viikko1$ git status
On branch master
Changes to be committed:
  (use "git restore --staged <file>..." to unstage)

	modified:   kolmas.txt

mluukkai@melkinpaasi:~/ot_viikko1$
```

Ohje muutoksen perumiseen löytyy git statuksen tulosteesta.

- Suorita muutokset peruva komento `git restore --staged kolmas.txt`
- Katsotaan jälleen `git status`

```pre
mluukkai@melkinpaasi:~/ot_viikko1$ git status
On branch master
Changes not staged for commit:
  (use "git add <file>..." to update what will be committed)
  (use "git restore <file>..." to discard changes in working directory)

	modified:   kolmas.txt

no changes added to commit (use "git add" and/or "git commit -a")
```

Tiedosto ei siis enää ole _staged_-tilassa, muutokset ovat kuitenkin _working directoryssä_, eli jos katsot tiedoston sisällön, muutokset ovat vielä olemassa

- Pääset perumaan muutokset kokonaan antamalla komennon `git restore kolmas.txt`
- Varmista, että tiedosto on palannut muutoksia edeltävään tilaan

Seuraavassa tiedoston tilaa kuvaava kaavio täydennettynä, eli jos tiedosto on lisätty committoitavaksi, eli se on _staged_, voidaan muutos perua komennolla `git restore --staged`. Tällöin muutokset kuitenkin vielä jäävät tiedostoon, eli ovat _working directoryssä_. Tiedosto saadaan palautettua repositoriossa olevaan edellisen commitin tilaan komennolla `git restore`.

![]({{ "/assets/images/v1-RestoreGit.png" | absolute_url }})

### Tehtävä 11: Harjoittelua

- luo repositoriosi sisälle hakemisto _tiedostoja_ ja hakemiston sisälle tiedostot _file1_, _file2_ ja _file3_
- commitoi muutokset
  - muista miten pystyt lisäämään kokonaisen hakemiston sisällön commitoitavaksi yhdellä komennolla
- muuta tiedoston _file1_ sisältöä ja poista tiedosto _file2_
- peru muutokset!
- muuta tiedoston _file3_ sisältöä, lisää commitoitavaksi
- peru muutokset!
- poista tiedosto _file1_ ja uudelleennimeä tiedosto _file2_ tiedostoksi _file22_
- committoi

Suorita repositoriossa komento `git log --stat | cat` ja **ota komennon tulos talteen**, tulet tarvitsemaan sitä myöhemmin!

### Tehtävä 12: GitHub

Gitin käytöstä on toki hyötyä jo harjoittelemallammekin tavalla, eli muodostamalla paikallisen koneen hakemistosta repositorio. Pääsemme kuitenkin nauttimaan kertaluokkaa suuremmista hyödyistä liittämällä repositoriomme internetissä olevaan _etärepositorioon_. Etärepositorion kautta repositorion tiedostot on helppo jakaa useiden koneiden tai/ja useiden käyttäjien kesken.

Internetin johtava paikka etärepositorioiden tallettamiseen on [GitHub](https://github.com)

Ennen GitHubin käytöönottoa, tee uusi git-repositorio paikalliselle koneelle, seuraavassa oletetaan että hakemiston nimi on _ot-harjoitustyo_.

**HUOM: älä luo uutta repositoriota aiemmin tekemäsi harjoitusrepositorion sisälle!**

Esim. seuraavat komennot siirtyvät kotihakemistoon, luovat sen alle hakemiston _ot-harjoitustyo_, siirtyvät hakemistoon, alustavat sen git-repositorioksi sekä lisäävät ja commitoivat yhden tiedoston repositorioon:

```
cd
mkdir ot-harjoitustyo
cd ot-harjoitustyo
git init
touch README.md
git add .
git commit -m "initial commit"
```

Siirrytään sitten GitHubin käyttöön

- Luo itsellesi tunnus GitHubiin (ellei sinulla jo ole tunnusta)
- Luo uusi repositorio
  - uuden repositorion luomistoiminto löytyy oikean ylänurkan plus-symboolin alta
- **Älä laita rastia** kohtaan _Initialize this repository with a README_

![]({{ "/assets/images/lh1-2a.png" | absolute_url }})

- Luo repositorio painamalla vihreää _Create repository_ -nappia

Seuraavaksi haluamme liittää GitHubiin luodun repositorion juuri luodun paikallisen koneen repositorion _ot-harjoitustyo_ etärepositorioksi.

- Etärepositorion lisääminen onnistuu GitHubiin avautuvan näkymän ohjeiden mukaan
- Varmista, että kohdasta "Quick setup..." on valittu **SSH**

![]({{ "/assets/images/lh1-3a.png" | absolute_url }})

- Kopioi ylempi rivi kohdasta _...or push an existing repository from the command line_
- Omassa esimerkissäni rivi on

```bash
git remote add origin git@github.com:mluukkai/ot-harjoitustyo.git
```

- Pastea rivi komentoriville ja suorita komento painamalla enter
- Suorita komento `git remote -v`
- Tulostus kertoo, että githubin etärepositorio on liitetty paikalliseen repositorioosi nimellä _origin_

```bash
mluukkai@melkki:~/ot-harjoitustyo$ git remote  -v
origin	git@github.com:mluukkai/ot-harjoitustyo.git (fetch)
origin	git@github.com:mluukkai/ot-harjoitustyo.git (push)
```

- _Origin_ on etärepositorion oletusarvoinen nimi. Nimi voi olla mikä tahansa ja etärepositorioitakin voi olla useita
- Voimme siirtää paikallisen repositoriomme tilan etärepositorioon komennolla `git push`
  - Saatat joutua tekemään ensimmäisen pushin pidemmässä muodossa `--set-upstream origin master`. Käytettävän haaran nimi voi git-konfiguraatiosta riippuen olla myös <i>main</i>. Käytä siis muotoa `-set-upstream origin main`, jos edellä mainittu muoto ei toimi
- Kokeillaan

```bash
mluukkai@melkki:~/ot-harjoitustyo$ git push --set-upstream origin master
Warning: Permanently added the RSA host key for IP address '192.30.253.112' to the list of known hosts.
Permission denied (publickey).
fatal: Could not read from remote repository.

Please make sure you have the correct access rights
and the repository exists.
```

### Tehtävä 13: Julkinen avain

Jos olet jo asettanut julkisen avaimen esim. Tietokantojen perusteissa, pushauksen pitäisi toimia ja voit siirtyä [seuraavaan kohtaan](#tehtävä-14-lisää-tiedostoja).

Pushaus ei toimi. Nyt kyse on siitä, että git haluaisi suorittaa [julkisen avaimen](https://the.earth.li/~sgtatham/putty/0.55/htmldoc/Chapter8.html) autentikoinnin. Se ei kuitenkaan onnistu koska emme ole kertoneet gitille julkista salausavaintamme.

- Luo salausavain antamalla komentoriviltä komento `ssh-keygen`
  - Voit vastata kaikkiin kysymyksiin enterillä
- Syntyy kaksi salausavainta, salainen ja julkinen. Ne sijoitetaan kotihakemistosi alla olevaan hakemistoon _.ssh_
- Mene hakemistoon ja katso hakemiston sisältöä
- Tiedosto _id_rsa.pub_ sisältää julkisen avaimen, se on tarkoitus kopioida githubiin jotta avaimeen perustuva kirjautuminen onnistuisi
  - Näet tiedoston sisällön komennolla _cat id_rsa.pub_
- Anna komentoriviltä komento `ssh-add`
- Mene GitHubin asetussivulle klikkaamalla oikean yläkulman symbolista ja valitsemalla _settings_
- Valitse settingseistä _SSH and GPG keys_
- Luo uusi _SSH-avain_
  - Anna avaimelle joku _title_ (esim. laitos) ja kopioi tiedoston _id_rsa.pub_ sisältö kohtaan _key_
- Suorita uudelleen `git push`:

```
mluukkai@melkki:~/ot-harjoitustyo$ git push
Counting objects: 3, done.
Writing objects: 100% (3/3), 213 bytes | 106.00 KiB/s, done.
Total 3 (delta 0), reused 0 (delta 0)
remote:
remote: Create a pull request for 'master' on GitHub by visiting:
remote:      https://github.com/mluukkai/ot-harjoitustyo/pull/new/master
remote:
To github.com:mluukkai/ot-harjoitustyo.git
 * [new branch]      master -> master
Branch master set up to track remote branch master from origin.
```

Nyt kaikki näyttää toimivan.

### Tehtävä 14: Lisää tiedostoja

- Tee juuri luodun repositorion sisälle hakemisto _laskarit_
  - Ja sen sisälle hakemisto _viikko1_
  - Komentorivitehtävien lopussa oli kehotus: Mene tämän jälkeen kotihakemistoon ja anna komento tree kurssit. _Copypastea komennon tulostus talteen, tarvitset sitä myöhemmin_
  - Tee hakemiston _laskarit/viikko1_ sisälle tiedosto _komentorivi.txt_ ja kopioi sinne komennon _tree_ tulos
  - Edellisen tehtäväsarjan lopussa kehoitettiin tallentamaan harjoitusrepositoriossa annetun komennon `git log --stat | cat` tulos
  - Tee hakemiston _laskarit/viikko1_ sisälle tiedosto _gitlog.txt_ ja kopioi sinne githarjoittelun tulos
- Kirjoita jotain tekstiä hakemiston juuressa olevaan tiedostoon README.md
  - Muotoile tekstisi [markdown-notaatiota](https://guides.github.com/features/mastering-markdown/) käyttäen
  - Tee tiedostoon esim. jokin otsikko, tavallista tekstiä, joka sisältää lihavoituja ja kursivoituja osuuksia
  - Näemme pian tekstin ruudulla muotoiltuna
- Commitoi muutokset
  - Muista aina commitoinnin yhteydessä _lisätä_ tiedosto/muutokset commitoitavaksi
- Pushaa koodi githubiin komennolla `git push`

### Tehtävä 15: Tiedostot GitHubissa

- Mene GitHub-repositoriosi sivulle
  - Käytännössä tämä tapahtuu uudelleenlataamalla repositorion luomisen jälkeen avautunut sivu
- Huomaat että tiedostot näkyvät nyt repositorion sivulla. Sivulle renderöityy repositorion juuressa olevan README.md:n sisältö markdown-muotoiltuna
- Voit editoida repositoriossa olevia tiedostoja suoraan GitHubin editorilla menemällä tiedoston sivulle ja painamalla kynäsymbolia
- Tee README.md:hen linkit repositorion hakemistossa _laskarit/viikko1/_ oleviin tiedostoihin _komentorivi.txt_ ja _gitlog.txt_
  - Ohje linkin muodostamiseen löytyy [täältä](https://guides.github.com/features/mastering-markdown/)
  - Tiedostojen urlin saat navigoimalla GitHubissa tiedostoon ja kopioimalla osoitteen selaimen osoiteriviltä
- Repositoriosi tulee näyttää suunnilleen seuraavalta

![]({{ "/assets/images/lh1-4a.png" | absolute_url }})

Jos teit kaiken oikein, pääset README.md:ssä olevia linkkejä klikkaamalla näkemään linkitettyjen tiedostojen sisällön.

### Paikallisen repositorion ajantasaistaminen

- GitHubissa tekemämme muutokset ovat tehneet etärepositorioon uuden commitin
- Etärepositorio on nyt _edellä_ paikallista repositorioamme
- Saamme tuotua muutokset paikalliselle koneelle komennolla `git pull`
- Kokeile komentoa ja varmista, että muuttunut sisältö on nyt paikallisessa repositoriossa

### Tehtävä 16: Lisää GitHubia

- Tee paikallisella koneella jokin muutos esim. tiedostoon README.md
- Lisää ja committaa muutos
- Vie muutokset GitHubiin komennolla `git push`
- Varmista GitHubista että muutokset näkyvät
- Paikallinen repositoriosi ja GitHubin etärepositorio ovat jälleen samassa tilassa.

### Tehtävä 17: Paikallisen ja etärepositorion epäsynkrooni

- Joskus käy niin, että paikallinen ja etärepositorio menevät epäsynkroniin, siten että molempiin tehdään yhtäaikaa uusi commit
- Luodaan tälläinen tilanne
- Tee paikalliseen repositorioon muutos tiedostoon _README.md_, lisää ja committoi muutos
  - **Älä** pushaa muutosta GitHubiin
- Tee GitHubiin muutos **johonkin muualle** kuin README.md-tiedostoon
  - editoi siis esim. tiedostoa _gitlog.txt_ hieman suoraan GitHubissa
- Yritä nyt pushata paikallisen repositorion muutokset githubiin
- Seurauksena on virheilmoitus

```
mluukkai@melkki:~/ot-harjoitustyo$ git push
To git@github.com:mluukkai/ot-harjoitustyo.git
 ! [rejected]        master -> master (fetch first)
error: failed to push some refs to 'git@github.com:mluukkai/ot-harjoitustyo.git'
hint: Updates were rejected because the remote contains work that you do
hint: not have locally. This is usually caused by another repository pushing
hint: to the same ref. You may want to first integrate the remote changes
hint: (e.g., 'git pull ...') before pushing again.
hint: See the 'Note about fast-forwards' in 'git push --help' for details.
mluukkai@melkki:~/ot-harjoitustyo$
```

- Tulet törmäämään tähän varmaan useasti jatkossakin.
- Ongelma ei ole paha. Koska paikalliset ja GitHubin muutokset ovat kohdistuneet **eri tiedostoihin**, selviämme helpolla
- Ensin pullaamme muutokset paikalliseen repositorioon komennolla `git pull`
- Saat suurella todennäköisyydellä seuraavan ilmoituksen

```
hint: You have divergent branches and need to specify how to reconcile them.
hint: You can do so by running one of the following commands sometime before
hint: your next pull:
hint: 
hint:   git config pull.rebase false  # merge (the default strategy)
hint:   git config pull.rebase true   # rebase
hint:   git config pull.ff only       # fast-forward only
hint: 
hint: You can replace "git config" with "git config --global" to set a default
hint: preference for all repositories. You can also pass --rebase, --no-rebase,
hint: or --ff-only on the command line to override the configured default per
hint: invocation.
fatal: Need to specify how to reconcile divergent branches.
```

- Git kysyy millä tavalla sen pitäisi käsitellä kahden eri branchin eli "koodihaaran" yhdistämistilanne, tässä tapauksessa branchit ovat paikallisen koneen versio ja GitHubissa oleva versio (ks. halutessasi [täältä](https://www.atlassian.com/git/tutorials/merging-vs-rebasing) lisää vaihtoehtojen eroista)
- Valitaan ylin, eli annetaan komento `git config pull.rebase false`
- Tehdään nyt uudelleen `git pull`
  - Pullaaminen synnyttää ns. merge commitin, jolle joudumme määrittelemään commit-viestin avautuvaan editoriin
  - Oletusarvoinen viesti käy, eli riittää että poistut editorista tallentaen muutokset
- Ja pushaamme ne uudelleen githubiin
- Nyt paikallinen ja etärepositorio ovat taas synkroonissa
- Katso repositorion tilaa nyt komennolla `gitk`
- Näet, että repositorion uusimmalla commitilla on nyt kaksi edeltäjää, paikallinen commit ja etärepositorion commit

<img src="https://github.com/mluukkai/otm2016/raw/master/img/lh5-3.png" alt="alt text" width="800">

Jos muutokset olisivat kohdistuneet samaan tiedostoon, olisi syntynyt hieman vakavampi tilanne, eli _merge-konflikti_. Konfliktit on pakko selvittää itse editorin avulla. On toki olemassa työkaluja, mergetooleja, jotka auttavat konfliktin selvittämisessä. Emme kuitenkaan mene tällä kurssilla merge-konflikteihin.

Nyrkkisääntönä kannattaa pitää aina sitä, että kun rupeat työskentelemään paikallisessa repositoriossa, pullaa ensin kaikki muutokset etärepositoriosta. Ja kun lopetat työskentelyn, pushaa muutokset etärepositorioon. Näin konflikteja ei yhden ihmisen työskentelyssä todennäköisesti tule.

### Lisää gitiä

Gitin peruskäyttö tulee varmasti tutuksi kurssin aikana. Gitin edistyneempien piirteiden opiskelua kannattaa ilman muuta jatkaa myös omin päin. Internetistä löytyy suuri määrä enemmän tai vähemmän hyviä tutoriaaleja. Seuraavassa muutama linkki

- <https://www.atlassian.com/git/tutorials/>
- <http://learngitbranching.js.org>
- <http://ohshitgit.com>

## Labtool

Rekisteröi nyt omat tietosi ja luomasi repositorio [Labtooliin]({{site.labtool_link}}).

