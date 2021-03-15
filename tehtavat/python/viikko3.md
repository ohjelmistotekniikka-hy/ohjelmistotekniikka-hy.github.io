---
layout: page
title: Viikko 3
permalink: /python/viikko3
---
# Viikon 3 laskarit

Tehtävät on tarkoitus tehdä joko pajassa tai omatoimisesti. **Tehtävien palautuksen deadline on {{site.wk3dl}}.**

Tehtävät palautetaan Githubin avulla Labtooliin rekisteröimääsi repositorioon.

Muista pushata tehtävät GitHubiin ennen viikkodeadlinea.

- Klo 00 jälkeen tulevia repositorion päivityksiä ei huomioida pisteytyksessä, eli ne tuovat 0 pistettä.

Tee palautuksia varten repositorion sisällä olevaan hakemistoon _laskarit_ uusi alihakemisto _viikko3_. Kukin tehtävä palautetaan lisäämällä hakemiston sisälle sopivasti nimettyjä kuvia.

Viikon palautuksista on tarjolla yksi kurssipiste. Pisteytys arvioidaan palautuksen laadun perusteella.

Huomaa, että tällä viikolla on myös harjoitustyöhön liittyviä [tavoitteita](/python/ht-viikko3)

## Luokkakaaviot

Kertaa luokkakaavioihin liittyvät asiat [kurssimateriaalista](/python/materiaali#luokkakaaviot).

Luokkakaavioiden piirtoon helpoin työkalu on <http://yuml.me/>, jos haluat ammattimaisempaa jälkeä on <https://draw.io/> hyvä (tätä tehtävää varten se ei kuitenkaan liene vaivan arvoista). Myös valokuva käsin piirretyistä kaavioista riittää.

### 1

Monopoli ks. esim. http://fi.wikipedia.org/wiki/Monopoli_(peli) on varmasti kaikkien tuntema lautapeli.

Tehdään luokkakaavio, joka kuvaa pelissä olevia asioita ja niiden suhteita.

Tässä tehtävän osassa tehdään alustava luokkakaavio, joka ei kuvaa peliä vielä kokonaisuudessaan vaan sisältää vasta seuraavat elementit:

Monopolia pelataan käyttäen kahta noppaa. Pelaajia on vähintään 2 ja enintään 8. Peliä pelataan pelilaudalla joita on yksi. Pelilauta sisältää 40 ruutua. kukin ruutu tietää, mikä on sitä seuraava ruutu pelilaudalla. Kullakin pelaajalla on yksi pelinappula. Pelinappula sijaitsee aina yhdessä ruudussa.

### 2

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

## Sekvenssikaaviot

Kertaa sekvenssikaavioihin liittyvät asiat [kurssimateriaalista](/python/materiaali#sekvenssikaaviot).

Sekvenssikaavioiden piirtoon paras työkalu lienee <https://www.websequencediagrams.com/>. Myös valokuva käsin piirretyistä kaavioista riittää.

### 3

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
        self.fuel_contents = self.fuel_contents + amount

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

### 4

Tarkastellaan HSL-matkarkottien hallintaan käytettävää koodia.

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
