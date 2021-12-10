---
layout: page
title: Viikko 3
permalink: /python/vk3
---

{% include deadline_info.md deadline=site.wk3dl %}

Tämän viikon tehtävien palautuksesta on tarjolla 1 piste ja harjoitustyön palautuksesta 2 pistettä.

## UML

Ohjelmistojen dokumentoinnissa ja sovelluksen suunnittelun yhteydessä on usein tapana visualisoida ohjelman rakennetta ja toimintaa [UML](https://en.wikipedia.org/wiki/Unified_Modeling_Language)-kaavioilla.

UML tarjoaa lukuisia erilaisia kaaviotyyppejä, hyödynnämme kurssilla kuitenkin näistä ainoastaan kolmea.

### Luokkakaaviot

Kurssilla [Tietokantojen perusteet](https://tikape-k20.mooc.fi) olet saattanut jo tutustua luokkakaavioiden käyttöön. Luokkakaavioiden käyttötarkoitus on ohjelman luokkien ja niiden välisten suhteiden kuvailu. Todo-sovelluksen oleellista tietosisältöä edustavat käyttäjää vastaava luokka `User`:

```python
class User:
    def __init__(self, username, password):
        self.username = username
        self.password = password
```

ja tehtävää vastaava luokka `Todo`:

```python
import uuid

class Todo:
    def __init__(self, content, done=False, user=None, todo_id=None):
        self.content = content
        self.done = done
        self.user = user
        self.id = todo_id or str(uuid.uuid4())

    def set_done(self):
        self.done = True
```

Jokaiseen todoon liittyy yksi käyttäjä, ja yksittäiseen käyttäjään liittyviä todoja voi olla useita. Tilannetta kuvaa seuraava luokkakaavio

![Luokkakaavio](/assets/images/python/materiaali-luokkakaavio-1.png)

Luokkakaavioon on nyt merkitty molempien luokkien oliomuuttujat sekä metodit.

Yleensä ei ole mielekästä kuvata luokkia tällä tarkkuudella, eli luokkakaavioihin riittää merkitä luokan nimi

<img src="https://raw.githubusercontent.com/mluukkai/ohjelmistotekniikka-syksy-2020/main/web/images/l-4.png" width="350">

Luokkien tarkemmat detaljit selviävät koodia katsomalla tai docstring-dokumentoinnista.

#### Riippuvuus

UML-kaavioissa olevat "viivat" kuvaavat luokkien olioiden välistä _pysyvää yhteyttä_. Joissain tilanteissa on mielekästä merkata kaavioihin myös ei-pysyvää suhdetta kuvaava katkoviiva, eli _riippuvuus_.

Eräs tällainen tilanne voisi olla Unicafe-ruokalan kassapäätteen toiminallisuudesta vastaava koodi. Koodissa on kaksi luokkaa `Maksukortti` ja `Kassapaate`, joiden välillä ei ole pysyvää yhteyttä.

Maksukortin koodi on seuraava:

```python
class Maksukortti:
  def __init__(self, saldo):
      self.saldo = saldo

  def lataa_rahaa(self, lisays):
      self.saldo += lisays

  def ota_rahaa(self, maara):
      if self.saldo < maara:
          return False

      self.saldo -= maara

      return True
```

Kuten huomataan, koodissa ei mainita kassapäätettä millään tavalla.

Kassapäätteen hieman lyhennetty koodi on seuraava:

```python
EDULLISEN_HINTA = 2.5
MAUKKAAN_HINTA = 4.3

class Kassapaate:
    def __init__():
        self.edulliset = 0
        self.maukkaat = 0

    def syo_edullisesti(self, kortti):
        if kortti.saldo() < EDULLISEN_HINTA:
            return False

        kortti.ota_rahaa(EDULLISEN_HINTA);
        self.edulliset += 1
        return True

    def syo_maukkaasti(self, kortti):
        # ...

    def lataa_rahaa_korttille(self, kortti, summa):
        if summa < 0:
            return

        kortti.lataa_rahaa(summa)
        self.rahaa += summa
```

Kassapääte käyttää maksukortteja hetkellisesti lounaiden maksamisen ja rahan lataamisen yhteydessä. Kassapääte ei kuitenkaan muista pysyvästi yksittäisiä maksukortteja. Tämän takia kassapäätteellä on riippuvuus maksukortteihin, mutta ei kuitenkaan normaalia yhteyttä, sillä UML-kaavioon merkattu yhteys viittaa pysyvään, ajallisesti pidempikestoiseen suhteeseen.

Tilannetta kuvaava luokkakaavio on seuraava:

<img src="https://raw.githubusercontent.com/mluukkai/ohjelmistotekniikka-syksy-2020/main/web/images/l-18.png" width="450">

Riippuvuus siis kuvataan _katkoviivallisena nuolena_, joka kohdistuu siihen luokkaan mistä ollaan riippuvaisia. Riippuvuuteen ei merkitä numeroa toisin kuin yhteyteen.

Tarkastellaan toisena esimerkkinä riippuvuudesta todo-sovelluksen sovelluslogiikasta vastaavaa luokkaa `TodoService`, jonka koodi hieman lyhennettynä näyttää seuraavalta:

```python
class TodoService:
    def __init__(self, todo_repository, user_repository):
        self._user = None
        self._todo_repository = todo_repository
        self._user_repository = user_repository

    def create_todo(self, content):
        todo = Todo(content=content, user=self._user)

        return self._todo_repository.create(todo)

    def get_undone_todos(self):
        if not self._user:
            return []

        todos = self._todo_repository.find_by_username(self._user.username)
        undone_todos = filter(lambda todo: not todo.done, todos)

        return list(undone_todos)

    # ...
```

Sovelluslogiikkaa hoitava olio tuntee kirjautuneen käyttäjän, mutta pääsee käsiksi kirjautuneen käyttäjän todoihin ainoastaan `todo_repository`-olion välityksellä. Tämän takia luokalla ei ole yhteyttä luokkaan `Todo`, luokkien välillä on kuitenkin _riippuvuus_, sillä sovelluslogiikka käsittelee metodeissaan todo-olioita.

Merkitään luokkakaavioon seuraavasti:

![Luokkakaavio](/assets/images/python/materiaali-luokkakaavio-2.png)

Riippuvuuksien merkitseminen luokkakaavioihin ei ole välttämättä kovin oleellinen asia, niitä kannattaa merkitä jos ne tuovat esille tilanteen kannalta jotain oleellista.

#### Perintä

Luokkien [perintähierarkian](https://docs.python.org/3/tutorial/classes.html#inheritance) ilmaisemisessa käytetään nuolia, joissa on valkoiset päät. Esim. jos Todo-sovelluksessa olisi normaalin käyttäjän eli luokan `User` perivää ylläpitäjää kuvaava luokka `SuperUser`, merkattaisiin se luokkakaavioon seuraavasti:

<img src="https://raw.githubusercontent.com/mluukkai/ohjelmistotekniikka-syksy-2020/main/web/images/l-9.png" width="350">

#### Työkaluja luokkakaavioiden piirtämiseen

Luokkakaavioiden piirtoon helpoin työkalu on <http://yuml.me/>, jos haluat ammattimaisempaa jälkeä on <https://draw.io/> hyvä (tätä tehtävää varten se ei kuitenkaan liene vaivan arvoista). Myös valokuva käsin piirretyistä kaavioista riittää.

### Tehtävä 1: Monopoli

Monopoli ks. esim. http://fi.wikipedia.org/wiki/Monopoli_(peli) on varmasti kaikkien tuntema lautapeli.

Tehdään luokkakaavio, joka kuvaa pelissä olevia asioita ja niiden suhteita.

Tässä tehtävän osassa tehdään alustava luokkakaavio, joka ei kuvaa peliä vielä kokonaisuudessaan vaan sisältää vasta seuraavat elementit:

Monopolia pelataan käyttäen kahta noppaa. Pelaajia on vähintään 2 ja enintään 8. Peliä pelataan pelilaudalla joita on yksi. Pelilauta sisältää 40 ruutua. Kukin ruutu tietää, mikä on sitä seuraava ruutu pelilaudalla. Kullakin pelaajalla on yksi pelinappula. Pelinappula sijaitsee aina yhdessä ruudussa.

**Lisää tämän viikon tehtäviä varten repositoriosi _laskarit_ hakemistoon hakemisto _viikko3_ ja lisää toteuttamasi kaavio sinne.**

### Tehtävä 2: Laajennettu Monopoli

Laajennetaan edellisen tehtävän luokkakaaviota tuomalla esiin seuraavat asiat:

Ruutuja on useampaa eri tyyppiä:

- Aloitusruutu
- Vankila
- Sattuma ja yhteismaa
- Asemat ja laitokset
- Normaalit kadut (joihin liittyy nimi)

Monopolipelin täytyy tuntea sekä aloitusruudun että vankilan sijainti.

Jokaiseen ruutuun liittyy jokin toiminto.

Sattuma- ja yhteismaaruutuihin liittyy kortteja, joihin kuhunkin liittyy joku toiminto.

Toimintoja on useanlaisia. Ei ole vielä tarvetta tarkentaa toiminnon laatua.

Normaaleille kaduille voi rakentaa korkeintaan 4 taloa tai yhden hotellin. Kadun voi omistaa joku pelaajista. Pelaajilla on rahaa.

**Lisää toteuttamasi kaavio repositoriosi _laskarit/viikko3_-hakemistoon.**

### Pakkauskaavio

Todo-sovelluksen koodi on sijoitettu hakemistoihin seuraavasti:

![](/assets/images/python/materiaali-hakemistorakenne.png)

Hakemistorakennetta voidaan kuvata UML:ssä _pakkauskaaviolla_:

![](/assets/images/python/materiaali-pakkaukset.png)

Pakkausten välille on merkitty _riippuvuudet_ katkoviivalla. Pakkaus _ui_ riippuu pakkauksesta _services_ sillä _ui_-pakkauksen luokat käyttävät _services_-pakkauksen luokkaa `TodoService`, joka vastaa sovelluksen sovelluslogiikasta.

Vastaavasti pakkaus _services_ riippuu pakkauksesta _repositories_ sillä sen luokka `TodoService` käyttää _repositorios_-pakkauksen luokkia `TodoRepository` ja `UserRepository`.

Pakkauskaavioihin on myös mahdollista merkitä pakkausten sisältönä olevia luokkia normaalin luokkakaaviosyntaksin mukaan:

![](/assets/images/python/materiaali-pakkaukset-luokat.png)

Sovelluksen koodi on organisoitu _kerrosarkkitehtuurin_ periaatteiden mukaan. Asiasta lisää hieman myöhemmin tässä dokumentissa.

### Sekvenssikaaviot

Luokka- ja pakkauskaaviot kuvaavat ohjelman rakennetta. Ohjelman toiminta ei kuitenkaan tule niistä ilmi millään tavalla.

Esimerkiksi Unicafe-ruokalan maksukortin ja kassapäätteen välistä suhdetta kuvaava luokkakaavio voisi näyttää seuraavalta:

![Luokkakaavio](/assets/images/python/materiaali-kassapaate-luokkakaavio.png)

Vaikka kaavioon on merkitty metodien nimet, ei ohjelman toimintalogiikka, esimerkiksi mitä tapahtuu kun kortilla ostetaan edullinen lounas, selviä kaaviosta millään tavalla.

_Sekvenssikaaviot_ on alunperin kehitetty kuvaamaan verkossa olevien ohjelmien keskinäisen kommunikoinnin etenemistä. Sekvenssikaaviot sopivat kohtuullisen hyvin kuvaamaan myös sitä, miten ohjelman oliot kutsuvat toistensa metodeja suorituksen aikana.

Koodia katsomalla näemme, että lounaan maksaminen tapahtuu siten, että ensin kassapääte kysyy kortin saldoa ja jos se on riittävä, vähentää kassapääte lounaan hinnan kortilta ja palauttaa _True_:

```python
EDULLISEN_HINTA = 2.5

class Kassapaate:
    # ...

    def syo_edullisesti(self, kortti):
        if kortti.saldo < EDULLISEN_HINTA:
            return False

        kortti.ota_rahaa(EDULLISEN_HINTA)
        self.edulliset += 1
        return True

    # ...
```

Sekvenssikaaviona kuvattuna tilanne näyttää seuraavalta:

<img src="https://raw.githubusercontent.com/mluukkai/ohjelmistotekniikka-syksy-2020/main/web/images/l-16.png" width="450">

Sekvenssikaaviossa oliot kuvataan laatikoina, joista lähtee alaspäin olion "elämänlanka". Kaaviossa aika etenee ylhäältä alas. Metodikutsut kuvataan nuolena, joka yhdistää kutsujan ja kutsutun olion elämänlangat. Paluuarvo merkitään katkoviivalla. Attribuuttin arvon lukeminen tai asettaminen voidaan kuvata kaaviossa metodikutsun tavoin. Tästä esimerkkinä kaavion `saldo`-attribuutin lukeminen.

Jos saldo ei riitä, etenee suoritus seuraavan sekvenssikaavion tapaan:

<img src="https://raw.githubusercontent.com/mluukkai/ohjelmistotekniikka-syksy-2020/main/web/images/l-17.png" width="450">

Tarkastellaan hieman monimutkaisempaa tapausta, yrityksen palkanhallinnasta vastaavaa ohjelmaa:

```python
class Henkilo:
    def __init__(self, nimi, palkka, tilinumero):
        self.nimi = nimi
        self.palkka = palkka
        self.tilinumero = tilinumero

class Henkilostorekisteri:
    def __init__(self):
        self._henkilot = {}
        self._pankki = PankkiRajapinta()

    def lisaa(self, henkilo):
        self._henkilot[henkilo.nimi] = henkilo

    def suorita_palkanmaksu(self):
        for nimi in self._henkilot:
            henkilo = self._henkilot[nimi]
            self._pankki.maksa_palkka(henkilo.tilinumero, henkilo.palkka)

    def aseta_palkka(self, nimi, uusi_palkka):
        henkilo = self._henkilot[nimi]
        henkilo.palkka = uusi_palkka

class PankkiRajapinta:
    # ...

    def maksa_palkka(tilinumero, summa):
        # suorittaa maksun verkkopankin internet-rajapinnan avulla
        # yksityiskohdat piilotettu
```

Sekvenssikaaviot siis kuvaavat yksittäisten suoritusskenaarioiden aikana tapahtuvia asioita. Kuvataan nyt seuraavan pääohjelman aikaansaamat tapahtumat:

```python
def main():
    rekisteri = Henkilostorekisteri()

    arto = Henkilo("Hellas", 1200, "1234-12345")
    rekisteri.lisaa(arto)

    sasu = Henkilo("Tarkoma", 6500, "4455-123123")
    rekisteri.lisaa(sasu)

    rekisteri.aseta_palkka("Hellas", 3500)

    rekisteri.suorita_palkanmaksu()
```

Sekvenssikaavio on seuraavassa:

![](/assets/images/python/materiaali-sekvenssikaavio-rekisteri.png)

Kaavio alkaa tilanteesta, jossa `Henkilostorekisteri`-luokan olio on jo luotu, mutta henkilöolioita ei vielä ole olemassa.

Toiminta alkaa siitä, kun pääohjelma eli main luo henkilön nimeltä `arto`. Seuraavaksi `main`-fuktiosta kutsutaan rekisterin metodia `lisaa`, jolle annetaan argumentiksi luotu henkilöolio. Vastaava toistuu kun `main` luo uuden henkilön ja lisää sen rekisteriin.

Seuraavana toimenpiteenä main kasvattaa arton palkkaa kutsumalla rekisterin metodia `aseta_palkka`. Tämä saa aikaan sen, että `rekisteri` asettaa `arto`-olion `palkka`-attribuutille uuden arvon. Rekisterin viivaan on merkitty paksunnus, joka korostaa, että attribuutille on asetettu arvo. Huomaa, että olion attribuutin asettamista voidaan kuvata metodikutsun tavoin.

Viimeinen ja monimutkaisin toiminnoista käynnistyy, kun `main` kutsuu rekisterin metodia `suorita_palkanmaksu`. Rekisteri kysyy ensin arton tilinumeroa ja palkkaa ja kutsuu paluuarvoina olevilla tiedoilla pankin metodia `maksa_palkka` ja sama toistuu `sasu`-olion kohdalla.

Sekvenssikaaviot eivät ole optimaalinen tapa ohjelman suorituslogiikan kuvaamiseen. Ne sopivat jossain määrin olio-ohjelmien toiminnan kuvaamiseen, mutta esim. funktionaalisella tyylillä tehtyjen ohjelmien kuvaamisessa ne ovat varsin heikkoja.

Tietynlaisten tilanteiden kuvaamiseen ohjelmoinnin perusteissakin käsitellyt [vuokaaviot](https://materiaalit.github.io/ohjelmointi-18/part2/) voivat sopia paremmin.

Voit halutessasi lukea lisää sekvenssikaavioista kurssin vanhan version [materiaalista](https://github.com/mluukkai/OTM2016/blob/master/luennot/luento5.pdf).

#### Työkaluja sekvenssikaavioiden piirtämiseen

Sekvenssikaavioiden piirtämiseen sopivat melko hyvin samat työkalut kuin luokkakaavioihinkin. Näiden lisäksi [WebSequenceDiagrams](https://www.websequencediagrams.com/) on eräs, juuri sekvenssikaavioiden piirtämiseen tarkoitettu työkalu.

### Tehtävä 3: Sekvenssikaavio

Tarkastellaan bensatankista ja moottorista koostuvan koneen Python-koodia.

Piirrä sekvenssikaaviona tilanne, jossa kutsutaan (jostain koodin ulkopuolella olevasta metodista) ensin `Machine`-luokan konstruktoria ja sen jälkeen luodun Machine-olion metodia `drive`.

Muista, että sekvenssikaaviossa tulee tulla ilmi kaikki mainin suorituksen aikaansaamat olioiden luomiset ja metodien kutsut!

```python
class Machine:
    def __init__(self):
        self._tank = FuelTank()
        self._tank.fill(40)
        self._engine = Engine(self._tank)

    def drive(self):
        self._engine.start()
        running = self._engine.is_running()

        if running:
          self._engine.use_energy()

class FuelTank:
    def __init__(self):
        self.fuel_contents = 0

    def fill(self, amount):
        self.fuel_contents = amount

    def consume(self, amount):
        self.fuel_contents = self.fuel_contents - amount

class Engine:
    def __init__(self, tank):
        self._fuel_tank = tank

    def start(self):
        self._fuel_tank.consume(5)

    def is_running(self):
        return self._fuel_tank.fuel_contents > 0

    def use_energy(self):
        self._fuel_tank.consume(10)
```

**Lisää toteuttamasi kaavio repositoriosi _laskarit/viikko3_-hakemistoon.**

### Tehtävä 4: Laajempi sekvenssikaavio

Tarkastellaan HSL-matkakorttien hallintaan käytettävää koodia.

Kuvaa _sekvenssikaaviona_ koodin `main`-funktion suorituksen aikaansaama toiminnallisuus.

Muista, että sekvenssikaaviossa tulee tulla ilmi kaikki mainin suorituksen aikaansaamat olioiden luomiset ja metodien kutsut!

```python
class Kioski:
    def osta_matkakortti(self, nimi, arvo = None):
        uusi_kortti = Matkakortti(nimi)

        if arvo:
            uusi_kortti.kasvata_arvoa(arvo)

        return uusi_kortti

class Matkakortti:
    def __init__(self, omistaja):
        self.omistaja = omistaja
        self.pvm = 0
        self.kk = 0
        self.arvo = 0

    def kasvata_arvoa(self, maara):
        self.arvo += maara

    def vahenna_arvoa(self, maara):
        self.arvo -= maara

    def uusi_aika(self, pvm, kk):
        self.pvm = pvm
        self.kk = kk

class Lataajalaite:
    def lataa_arvoa(self, kortti, maara):
        kortti.kasvata_arvoa(maara)

    def lataa_aikaa(self, kortti, pvm, kk):
        kortti.uusi_aika(pvm, kk)

RATIKKA = 1.5
HKL = 2.1
SEUTU = 3.5

class Lukijalaite:
    def osta_lippu(self, kortti, tyyppi):
        hinta = 0

        if tyyppi == 0:
            hinta = RATIKKA
        elif tyyppi == 1:
            hinta = HKL
        else:
            hinta = SEUTU

        if kortti.arvo < hinta:
            return False

        kortti.vahenna_arvoa(hinta)

        return True

class HKLLaitehallinto:
    def __init__(self):
        self._lataajat = []
        self._lukijat = []

    def lisaa_lataaja(self, lataaja):
        self._lataajat.append(lataaja)

    def lisaa_lukija(self, lukija):
        self._lukijat.append(lukija)

def main():
    laitehallinto = HKLLaitehallinto()

    rautatietori = Lataajalaite()
    ratikka6 = Lukijalaite()
    bussi244 = Lukijalaite()

    laitehallinto.lisaa_lataaja(rautatietori)
    laitehallinto.lisaa_lukija(ratikka6)
    laitehallinto.lisaa_lukija(bussi244)

    lippu_luukku = Kioski()
    kallen_kortti = lippu_luukku.osta_matkakortti("Kalle")

    rautatietori.lataa_arvoa(kallen_kortti, 3)

    ratikka6.osta_lippu(kallen_kortti, 0)
    bussi244.osta_lippu(kallen_kortti, 2)

if __name__ == "__main__":
    main()
```

**Lisää toteuttamasi kaavio repositoriosi _laskarit/viikko3_-hakemistoon.**

## PDM-skriptit

Laajemmissa ohjelmistoprojekteissa on useimmiten monia usein toistettavia komentoja, jotka saattavat olla pitkiä ja monimutkaisia. Luultavasti tärkein näistä komennoista on sovelluksen käynnistäminen, joka saattaa tapahtua esimerkiksi komennolla `python3 src/index.py`.

Jatkuvasti toistettavien, pitkien komentojen kirjoittaminen käsin käy helposti työlääksi. Tämä tulee ilmi etenkin tilanteissa, joissa komennot ovat monimutkaisempia ja vaikeasti muistettavia. Eräs ratkaisu ongelmaan on toteuttaaa usein käytettävistä komennoista [PDM-skriptejä](https://pdm.fming.dev/usage/project/#run-scripts-in-isolated-environment).

### Skriptien määritteleminen

Olemme jo käyttäneet `pdm run`-komentoa esimerkiksi testien suorittamiseen. Komennolla voi suorittaa myös _pyproject.toml_-tiedostossa määriteltyjä _skriptejä_, joiden avulla tietty komento voidaan suorittaa lyhyemmässä muodossa käyttämällä skriptin nimeä. Skriptit määritellään _pyproject.toml_-tiedoston `[tool.pdm.scripts]`-osiossa. Määrittellään esimerkiksi _start_-skripti, joka suorittaa komennon `python3 src/index.py`:

```
[tool]
[tool.pdm]
[tool.pdm.scripts]
start = "python3 src/index.py"
```

Voimme suorittaa skriptin projektin juurihakemistossa komennolla `pdm run start`. Komento on siis muotoa `pdm run <skriptin nimi>`. Lisää esimerkkejä skripteistä löytyy [referenssisovelluksen]({{site.python_reference_app_url}}) _pyproject.toml_-tiedostosta.

Projektissa käytössä olevat skriptit voi listata komennolla `pdm run --list`.

### Skriptien suorittaminen Visual Studio Codessa

Skriptejä voi suorittaa Visual Studio Codessa editorin sisäänrakennetun terminaalin kautta, tai [PDM Task Provider](https://marketplace.visualstudio.com/items?itemName=knowsuchagency.pdm-task-provider)-lisäosan avulla.

## Harjoitustyö

Tämän viikon aikana aloitetaan harjoitustyön toteutus ja testaaminen. Ohjelman tulee edistyä jokaisella viikolla tasaisesti. Jos ohjelma tulee valmiiksi jo ennen loppupalautusta valmistaudu laajentamaan sitä saadaksesi ohjelman edistymisestä pisteet. Tarkoitus on edistää projektia tasaisesti kurssiviikkojen aikana.

**Tämän viikon harjoitustyön palautuksesta on tarjolla 2 pistettä.** Viikkopisteiden lisäksi kannattaa pitää mielessä harjoitustyön lopullisen palautuksen [arvosteluperusteet](/python/arvosteluperusteet).

### Harjoitustyö 1: PDM-projektin alustaminen

Alusta repositoriosi juureen PDM-projekti edellisen viikon ohjeiden mukaisesti. Repositorion rakenne tulee olla seuraava:

```
laskarit/
  ...
dokumentaatio/
  ...
src/
  ...
pyproject.toml
pdm.lock
README.md
...
```

Projektin koodi tulee sijoittaa repositorion _src_-hakemistoon. Koodia kannattaa tarpeen mukaan jakaa hakemiston sisällä alihakemistoihin. Mallia voi ottaa [referenssisovelluksesta]({{site.python_reference_app_url}}).

Voit myös halutessasi alustaa projektin haluamaasi alihakemistoon, esimerkiksi seuraavasti:

```
laskarit/
  ...
todo-app/
  dokumentaatio/
    ...
  src/
    ...
  pyproject.toml
  pdm.lock
  ...
README.md
...
```

**HUOM:** _src_-hakemiston **alahakemistoissa** (ei siis itse _src_-hakemistossa) tulee olla tyhjät <i>\_\_init\_\_.py</i>-tiedostot, jotta mm. `import`-lauseet toimivat halutulla tavalla. Lisää aiheesta voi lukea Pythonin [dokumentaatiosta](https://docs.python.org/3/tutorial/modules.html) ja mallia voi ottaa [referenssisovelluksesta]({{site.python_reference_app_url}}).

### Harjoitustyö 2: Toiminallisuuden toteutus

Toteuta ainakin osa jostain edellisellä viikolla tekemäsi määrittelydokumentin toiminallisuudesta. Pelkät tyhjät luokat tai funktiot ilman toiminallisuutta eivät tuo pisteitä.

Toteutukseen liittyviä ohjeita löydät [täältä](/python/toteutus).

### Harjoitustyö 3: Testaamisen aloittaminen

Sovelluksella on oltava _vähintään yksi testi_. Testin tulee olla mielekäs, eli sen on testattava jotain ohjelman kannalta merkityksellistä asiaa. Testin tulee myös mennä läpi. Lisää testejä varten _src_ hakemistoon hakemisto _tests_ ja lisää testitiedostot sinne:

```
src/
  tests/
    __init__.py
    ...
  ...
```

Kertaa edellisen viikon unittest-ohjeet, jos tämä tuottaa hankaluuksia.

### Harjoitustyö 4: Testikattavuusraportti

Ohjelmalle tulee pystyä generoimaan coverage-työkalun avulla testikattavuusraportti. Projektin juurihakemistossa (samassa hakemistossa, missä _pyproject.toml_-tiedosto sijaitsee) tulee olla _.coveragerc_-tiedosto, jossa määritellään, mistä hakemistosta testikattavuus kerätään. Testeihin liittyvä koodi tulee jättää testikattavuusraportin ulkopuolelle:

```
[run]
source = src
omit = src/**/__init__.py,src/tests/**
```

Kertaa edellisen viikon coverage-ohjeet, jos tämä tuottaa hankaluuksia. Mallia coveragen konfigurointiin voi tarvittaessa ottaa [referenssisovelluksesta]({{site.python_reference_app_url}}).

### Harjoitustyö 5: PDM-skriptit

Toteuta projektille seuraavat PDM-skriptit:

- `pdm run start` käynnistää ohjelman
- `pdm run test` suorittaa testit pytestin avulla
- `pdm run coverage` kerää testikattavuuden coveragen avulla
- `pdm run coverage-report` muodostaa coveragen avulla kerätyn testikattavuuden perusteella selaimessa avattavan, HTML-muotoisen testikattavuusraportin

Mallia skriptien toteutukseen voi ottaa tarvittaessa [referenssisovelluksesta]({{site.python_reference_app_url}}). Voit halutessasi lisätä myös muita skriptejä, joita koet projektisi kannalta hyödylliseksi.

### Harjoitustyö 6: Muuta

Varmista vielä, että seuraavat asiat ovat kunnossa:

- Tuntikirjanpito on ajantasalla
  - Tuntikirjanpitoon ei merkitä laskareihin käytettyä aikaa
- Repositorion _README.md_-tiedosto kunnossa
  - Tiedosto on kurssin tämän vaiheen osalta relevantin sisällön suhteen samankaltainen kuin [referenssisovelluksen]({{site.python_reference_app_url}}) _README.md_-tiedosto
  - Kaikki ylimääräinen, mm. linkit laskareihin on poistettu
- Repositorio on siisti
  - Ei ylimääräistä tavaraa (esim. `pytest`-, tai `coverage`-komentojen generoimia hakemistoja ja tiedostoja)
  - Laskarit jätetään hakemiston _laskarit_ alle
  - Järkevä _.gitignore_-tiedosto olemassa. Mallia voi ottaa [referenssisovelluksesta]({{site.python_reference_app_url}})

{% include harjoitustyon_toimivuus_info2.md %}

{% include ala_plagioi.md %}
