---
layout: page
permalink: /python/vk2
title: Viikko 2
---

{% include deadline_info.md deadline=site.wk2dl %}

Tämän viikon tehtävien palautuksesta on tarjolla 2 pistettä ja harjoitustyön palautuksesta 1 piste.

## PDM ja riippuvuuksien hallinta

Laajoissa ja monimutkaisissa ohjelmistoprojekteissa kaiken koodin tuottaminen itse ei ole enää käytännöllistä. Ei ole esimerkiksi järkevää, että jokaisessa ohjelmistoprojektissa toteutetaan oma ohjelmointirajapinta tietokantaoperaatioille, tai sovelluskehys koodin testaamiseen. Jotta pyörää ei tarvitsisi aina keksiä uudelleen, ovat ohjelmistokehittäjät kehittäneet valtavan määrän avoimen lähdekoodin _kirjastoja_, joita jokainen voi hyödyntää projekteissaan.

Kirjastojen lähdekoodi on usein luettavissa versionhallinta-alustoilla, kuten GitHubissa. Usein kirjastoja päivitetään jatkuvasti ja nämä päivitykset synnyttävät kirjastoista uusia _versioita_. Kirjastojen versioita julkaistaan erilaisiin rekistereihin, joista ne ovat helposti asennettavissa. [The Python Package Index](https://pypi.org/) (PyPI) on eräs tämän kaltainen, Python-kirjastoille tarkoitettu rekisteri.

Jotta kirjastoja olisi helppo asentaa projektiin, on kehitetty erilaisia kirjastojen asennukseen tarkoitettuja komentorivityökaluja. Pythonin kohdalla suosituin komentorivityökalu tähän tarkoitukseen on [pip](https://pypi.org/project/pip/). Pip tulee valmiiksi asennettuna uusimpien Python-asennusten mukana. Voit varmistaa sen löytymisen terminaalissa komennolla:

```bash
pip3 --version
```

Terminaaliin tulisi tulostua pipin versio. Jos `pip3`-komentoa ei löydy, kokeile komentoa `python3 -m pip --version`.

Pipin käyttö projektin riippuvuuksien hallinnassa voi kuitenkin osoittautua ongelmalliseksi ja johtaa helposti tilanteisiin, jossa ohjelma riippuvuuksineen on vaikea saada toimimaan eri ympäristöissä ilman suurta vaivannäköä. Tämän ongelman ratkaisemiseksi tutustumme kurssilla riippuvuuksinen hallinnastaa vastaavaan [PDM](https://pdm.fming.dev/)-työkaluun.

### Huomioita komennoista

Monilla tietokoneilla Python-version kolme komennot suoritetaan `python3`- ja `pip3`-komennoilla komentojen `python` ja `pip` sijaan. Jos komentoja `python3` ja `pip3` ei jostain syystä löydy, tarkista `python`-komennon käyttämä versio komennolla:

```bash
python --version
```

Jos versio on alle 3.8, asenna tietokoneellesi [uusin Python-versio](https://www.python.org/downloads/). Muissa tapauksissa, voit käyttää `python`-komentoa `python3`-komennon sijaan.

### Asennus

PDM tarjoaa dokumentaatiossaan useita [asennusvaihtoehtoja](https://pdm.fming.dev/#installation). Seuraa alla olevista asennusohjeita tietokoneesi käyttöjärjestelmän mukaista asennusohjetta PDM:n asentamiseksi.

#### Linux- ja macOS-asennus

Asenna PDM suorittamalla terminaalissa seuraava komento:

```bash
curl -sSL https://raw.githubusercontent.com/pdm-project/pdm/main/install-pdm.py | python -
```

Asennuksen jälkeen PDM-binäärin polku tulee asettaa `PATH`-muuttujaan. Tämä onnistuu terminaalissa seuraavalla komennolla:

```bash
echo "export PATH=\$HOME/.local/bin:\$PATH" >> $HOME/.bashrc
```

Käynnistä tämän jälkeen terminaali uudestaan ja varmista, että asennus on onnistunut suorittamalla komento `pdm --version`. Komennon tulisi tulostaa asennettu versio.

Lopuksi PDM tulee aktivoida, jotta asennettuja riippuvuuksia voi hyödyntää koodissa. Tämä onnistuu terminaalissa seuraavalla komennolla:

```bash
pdm --pep582 >> $HOME/.bashrc
```

Käynnistä vielä terminaali uudestaaan, jotta muutokset tulevat voimaan.

#### Windows-asennus

Asenna PDM suorittamalla terminaalissa seuraava komento:

```bash
(Invoke-WebRequest -Uri https://raw.githubusercontent.com/pdm-project/pdm/main/install-pdm.py -UseBasicParsing).Content | python -
```

Asennuksen jälkeen PDM-binäärin polku tulee asettaa `PATH`-muuttujaan. Seuraa [tätä](https://www.architectryan.com/2018/03/17/add-to-the-path-on-windows-10/) ohjetta ja lisää `PATH`-muuttujaan polku `%APPDATA%\Python\Scripts`. Käynnistä tämän jälkeen terminaali uudestaan ja varmista, että asennus on onnistunut suorittamalla komento `pdm --version`. Komennon tulisi tulostaa asennettu versio.

Lopuksi PDM tulee aktivoida, jotta asennettuja riippuvuuksia voi hyödyntää koodissa. Tämä onnistuu terminaalissa seuraavalla komennolla:

```bash
pdm --pep582
```

Käynnistä vielä terminaali uudestaaan, jotta muutokset tulevat voimaan.

### Projektin alustaminen

Harjoitellaan PDM:n käyttöä tekemällä pieni esimerkkiprojekti. Luo hakemisto _pdm-testi_ haluamaasi hakemistoon. Hakemiston ei tarvitse löytyä Labtooliin rekisteröimästäsi repositoriosta. Avaa hakemisto terminaalissa ja suorita hakemiston sisällä seuraava komento:

```bash
pdm init
```

Komennon suorittaminen alkaa kysymään kysymyksiä. Kun PDM kysyy _"Please enter the Python interpreter to use"_, valitse vaihtoehdoista jokin, jossa Python-versio (näkyy suluissa polun vieressä) on vähintään 3.8. Kysymykseen _"Python requires"_ tulee vastata `>=3.8`, eli vähintään Python-versio 3.8. Voit vastata muihin kysymyksiin haluamallasi tavalla ja kaikkien kohtien vastauksia voi myös muokata myöhemmin. Tämän vuoksi muiden kysymysten ohittaminen Enter-painiketta painamalla on täysin hyvä vaihtoehto.

Kun viimeiseen kysymykseen on vastattu, katso hakemiston sisältöä. Hakemistoon pitäisi ilmestyä _pyproject.toml_-tiedosto, jonka sisältö on kutakuinkin seuraava:

```
[project]
name = ""
version = ""
description = ""
authors = [
    {name = "Kalle Ilves", email = "kalle.ilves@helsinki.fi"},
]
dependencies = []
requires-python = ">=3.8"
license = {text = "MIT"}

[project.urls]
homepage = ""

[tool]
[tool.pdm]

[build-system]
requires = ["pdm-pep517"]
build-backend = "pdm.pep517.api"
```

Tiedoston `[project]`-osio sisältää projektiin liittyviä yleistietoja, kuten sen nimen, kuvauksen ja ylläpitäjät. Osion `dependencies`-kohdassa on lista projektin riippuvuuksista, joka on vielä toistaiseksi tyhjä. Kohdassa `requires-python` on määrittelemämme vaatimus käytettävälle Python-versiolle.

### Riippuvuuksien asentaminen

Asennetaan seuraavaksi esimerkkiprojektimme ensimmäisen riippuvuus. Sopivien riippuvuuksien löytäminen onnistuu esimerkiksi Googlettamalla ja etsimällä hakutuloksista sopivia GitHub-repositorioita, tai PyPI-sivuja. Asennetaan esimerkkinä projektiimme [cowsay](https://pypi.org/project/cowsay/)-kirjasto. Tämä onnistuu seuraavalla komennolla:

```bash
pdm add cowsay
```

Riippuvuuden asentaminen onnistuu siis komennolla, joka on muotoa `pdm add <kirjasto>`. Komennon suorittamisen jälkeen huomaamme, että _pyproject.toml_-tiedoston `[project]`-osion `dependencies`-listaan on ilmestynyt uutta sisältöä:

```
[project]
name = ""
version = ""
description = ""
authors = [
    {name = "Kalle Ilves", email = "kalle.ilves@helsinki.fi"},
]
dependencies = [
    "cowsay~=4.0",
]
requires-python = ">=3.8"
license = {text = "MIT"}
```

Lisäksi hakemistoon on ilmestynyt tiedosto _pdm.lock_. PDM kirjoittaa kyseiseen tiedostoon asennettujen riipuvuuksien tarkat versiot, jotta jokaisella asennuskerralla saadaan asennettu riippuvuuksista täsmälleen samat versiot. Tämän vuoksi tiedosto tulee lisätä versionhallintaan.

Mutta mihin riippuvuudet oikeastaa asennettiin? PDM asentaa riippuvuudet projektin juurihakemiston (hakemistoon, missä _pyproject.toml_-tiedosto sijaitsee) <i>\_\_pypackages\_\_</i>-hakemistoon. Asennetut riippuvuudet ovat siis projektikohtaisia, eli jokaisella projektilla on omat riippuvuutensa.

Komento `pdm add` asentaa projektiin aina kirjaston uusimman version, joka oli cowsay-kirjaston tapauksessa komennon suoritushetkellä `4.0`. Usein tämä on juuri se, mitä haluamme tehdä. Voimme kuitenkin asentaa halutessamme esimerkiksi cowsay-kirjaston version `1.0` komennolla:


```bash
pdm add cowsay==1.0
```

Jos haluaisimme poistaa kirjaston projektimme riippuvuuksien joukosta, se onnistuisi komennolla:

```bash
pdm remove cowsay
```

Pidetään kuitenkin cowsay-kirjasto toistaiseksi asennettuna.

### Riippuvuuksien hyödyntäminen koodissa

Luodaan seuraavaksi _pdm-testi_-hakemistoon hakemisto _src_ ja lisätään sinne tiedosto _index.py_. Lisätään tiedostoon seuraavat koodirivit:

```python
import cowsay

cowsay.tux("PDM is awesome!")
```

Otamme siis kirjaston käyttöön koodissa `import`-lauseen avulla cowsay-kirjaston [dokumentaatiossa](https://pypi.org/project/cowsay/) olevien esimerkkien mukaisesti. Voimme suorittaa _index.py_-tiedoston terminaalissa seuraavalla komennolla:

```
python3 src/index.py
```

Huomaa, että komento suoritetaan projektin juurihakemistosta.

## Unittest ja testaaminen

Tutustutaan yksikkötestien tekemiseen [unittest](https://docs.python.org/3/library/unittest.html)-sovelluskehyksen avulla. Yksikkötesteissä testauksen kohteena ovat ohjelman pienimmät rakenneosaset eli yksittäiset funktiot sekä luokkien oliot ja niiden metodit.

Käytetään esimerkkinä luokkaa `Maksukortti`, joka sisältää metodeja arvon lataamiseen ja eri arvoisten aterioiden ostamiseen:

```python
EDULLINEN = 2.5
MAUKAS = 4


class Maksukortti:
    def __init__(self, arvo_alussa):
        self.arvo = arvo_alussa

    def syo_edullisesti(self):
        if self.arvo >= EDULLINEN:
            self.arvo -= EDULLINEN

    def syo_maukkaasti(self):
        if self.arvo >= MAUKAS:
            self.arvo -= MAUKAS

    def lataa_rahaa(self, rahamaara):
        if rahamaara < 0:
            return

        self.arvo += rahamaara

        if self.arvo > 150:
            self.arvo = 150

    def __str__(self):
        return f"Kortilla on rahaa {self.arvo} euroa"
```

### Tehtävä 1: Alkutoimet

Luo Labtooliin rekisteröimäsi repositorion hakemistoon _laskarit/viikko2_ hakemisto _maksukortti_. Suorita terminaalissa hakemiston sisällä tuttu, projektin alustamiseen vaadittava komento:

```bash
pdm init
```

Käytä projektin Python-version vaatimuksena versiota `>=3.8`. 

Asennetaan projektiin riippuvuudeksi [pytest](https://docs.pytest.org/en/stable/)-sovelluskehys, joka helpottaa testien suorittamista. Riippuvuuden asentaminen onnistuu samassa hakemistossa komennolla:

```bash
pdm add pytest
```

Seuraavaksi muodosta _maksukortti_-hakemistoon seuraava rakenne:

```
maksukortti/
  src/
    maksukortti.py
    tests/
      __init__.py
      maksukortti_test.py
  pyproject.toml
  pdm.lock
  ...
```

Lisää tiedostoon _src/maksukortti.py_ edellä esitelty `Maksukortti`-luokan koodi.

### Tehtävä 2: Aloitetaan testien kirjoittaminen

Yritetään seuraavaksi suorittaa testejä. Tämä onnistuu suorittamalla projektin juurihakemistossa komento `pdm run pytest src`. Komennon suorittaminen antaa ymmärtää, ettei yhtään testiä ole suoritettu. Syy on yksinkertaisesti siinä, ettemme ole vielä toteuttaneet yhtään testiä.

Toteutetaan <i>src/tests/maksukortti_test.py</i>-tiedostoon projektimme ensimmäinen testi. Tiedoston sisältö tulee olla seuraava:

```python
import unittest
from maksukortti import Maksukortti

class TestMaksukortti(unittest.TestCase):
    def setUp(self):
        print("Set up goes here")

    def test_hello_world(self):
        self.assertEqual("Hello world", "Hello world")
```

Suoritetaan komento `pdm run pytest src` uudestaan ja huomaamme, että yksi testi on suoritettu onnistuneesti. Huomaa, että `pytest`-komennon jälkeinen _src_ rajaa suoritettavien testien etsinnän projektin juurihakemistossa sijaitsevaan _src_-hakemistoon. Jos arvoa ei annettaisi, pytest lähtisi etsimään suoritettavia testejä suoraan projektin juurihakemistosta.

Komento `pdm run pytest src` etsii suoritettavia testejä projektin juurihakemiston _src_-hakemistosta, sekä rekursiivisesti kaikista sen alahakemistoista. Jotta pytest tietää, mitä testejä tulisi suorittaa, **tulee nimeämisessä noudattaa oikeita käytänteitä.** Nämä käytänteet ovat:

- Testien tiedostojen nimen tulee päättyä <i>\_test</i>-päätteeseen, esim. <i>maksukortti_test.py</i>
- Testattavan luokan nimen tulee alkaa _Test_-etuliitteellä, esim. `TestMaksukortti`
- Testattavan luokan metodin nimen tulee alkaa <i>test\_</i>-etuliitteellä, esim. `test_hello_world`

Huomaa, että testien hakemistossa tulee olla tyhjä <i>\_\_init\_\_.py</i>-tiedosto, jotta Python löytää moduulit oikein. Ilman kyseistä tiedostoa testi kaatuisi virheeseen:

```
ModuleNotFoundError: No module named 'maksukortti'
```

Jos testien hakemistossa on alihakemistoja, myös näissä tulee olla tyhjä <i>\_\_init\_\_.py</i>-tiedosto.

Tehdään seuraavaksi ensimmäinen järkevä testi, joka testaa, että `Maksukortti`-luokan konstruktori asettaa saldon oikein:

```python
import unittest
from maksukortti import Maksukortti

class TestMaksukortti(unittest.TestCase):
    def setUp(self):
        print("Set up goes here")

    def test_konstruktori_asettaa_saldon_oikein(self):
        kortti = Maksukortti(10)

        vastaus = str(kortti)

        self.assertEqual(vastaus, "Kortilla on rahaa 10 euroa")
```

Ensimmäinen rivi luo kortin, jonka saldoksi tulee 10 euroa. Testin on tarkoitus varmistaa, että konstruktorin parametrina oleva luku menee kortin alkusaldoksi. Tämä varmistetaan selvittämällä kortin saldo. Kortin saldo selviää kortin `__str__`-metodin muodostamasta merkkijonoesitysestä. Testin toinen rivi muodostaa `kortti`-muuttujan merkkijonoesityksen ja ottaa sen talteen muuttujaan `vastaus`. Viimeinen rivi tarkastaa onko vastaus sama kuin odotettu tulos, eli "Kortilla on rahaa 10 euroa".

Tarkastus tapahtuu unittestissä paljon käytettyä `assert`- eli väittämäkomentoa käyttäen. Komento testaa onko sille ensimmäisenä parametrina annettu odotettu tulos sama kuin toisena parametrina oleva testissä saatu tulos. Erilaisia [assert](https://docs.python.org/3/library/unittest.html#assert-methods)-metodeja on monia.

Suoritetaan seuraavaksi testi komennolla `pdm run pytest src` ja toivotaan, että testi menevät läpi. Vaihtoehtoinen tapa määritellä sama testi olisi seuraava:

```python
def test_konstruktori_asettaa_saldon_oikein(self):
    kortti = Maksukortti(10)
    self.assertEqual(str(kortti), "Kortilla on rahaa 10 euroa")
```

Eli metodikutsun palauttamaa arvoa ei oteta erikseen talteen muuttujaan vaan sitä kutsutaan suoraan assertEqual-vertailun sisällä. Käy niin, että ennen kuin varsinainen vertailu suoritetaan, tehdään funktiokutsu ja vertailtavaksi tulee sen palauttama arvo.

Kannattaa varmistaa, että testi todellakin löytää virheet, eli muutetaan edellistä testiä siten että se ei mene läpi (assertEqualissa väitetään että saldo olisi 9):

```python
def test_konstruktori_asettaa_saldon_oikein(self):
    kortti = Maksukortti(10)
    self.assertEqual(str(kortti), "Kortilla on rahaa 9 euroa")
```

Testien suorittaminen antaa ymmärtää, ettei testiä suoritettu onnistuneesti. Jokaisesta virheellisestä testistä löytyy yksityiskohtainen selitys ongelman syystä. Lisäksi lopussa listataan kompaktimmassa muodossa virheelliset tiedostot ja metodit:

```
FAILED src/tests/maksukortti_test.py::TestMaksukortti::test_konstruktori_asettaa_saldon_oikein - AssertionError: 'Kortilla on rahaa 9 euroa' != 'Kortilla on rahaa 10 euroa'
```

Tehdään seuraavaksi testi, joka varmistaa, että kortin saldo pienee kutsuttaessa metodia `syo_edullisesti`:

```python
def test_syo_edullisesti_vahentaa_saldoa_oikein(self):
    kortti = Maksukortti(10)

    kortti.syo_edullisesti()

    self.assertEqual(str(kortti), "Kortilla on rahaa 7.5 euroa")
```

Jälleen testi alkaa kortin luomisella. Seuraavaksi kutsutaan kortin testattavaa metodia ja viimeisenä on rivi joka varmistaa, että tulos on haluttu, eli että kortin saldo on pienentynyt edullisen lounaan hinnan verran.

### Muutama huomio

- Molemmat testit ovat yksinkertaisia ja testaavat vain yhtä asiaa, tämä on suositeltava käytäntö vaikka on mahdollista laittaa yhteen testiin useitakin assert:eja
- Testit on nimetty siten, että nimi kertoo selvästi sen mitä testi testaa. Lisäksi tulee aina muistaa käyttää metodin nimessä <i>test\_</i>-etuliitettä
- Kaikki testit ovat toisistaan riippumattomia, esim. kortilla maksaminen ei vaikuta kortin saldoon kuin siinä testissä missä korttimaksu tapahtuu. Testien järjestyksellä testikoodissa ei ole merkitystä
- Testit kannattaa ajaa mahdollisimman usein, eli aina kun teet testin (tai muutat normaalia koodia) aja testit!

Tehdään muutama testi lisää:

```python
def test_syo_maukkaasti_vahentaa_saldoa_oikein(self):
    kortti = Maksukortti(10)

    kortti.syo_maukkaasti()

    self.assertEqual(str(kortti), "Kortilla on rahaa 6 euroa")

def test_syo_edullisesti_ei_vie_saldoa_negatiiviseksi(self):
    kortti = Maksukortti(10)

    kortti.syo_maukkaasti()
    kortti.syo_maukkaasti()
    # nyt kortin saldo on 2
    kortti.syo_edullisesti()

    self.assertEqual(str(kortti), "Kortilla on rahaa 2 euroa")
```

Ensimmäinen testeistä tarkastaa, että maukkaasti syöminen vähentää saldoa oikein. Toinen testi varmistaa, että edullista lounasta ei voi ostaa jos kortin saldo on liian pieni.

### Testin alustustoimet

Huomaamme, että testikoodissamme on toistoa: neljä ensimmäistä testiä luovat kaikki samanlaisen 10 euron saldon omaavan kortin.

Siirrämmekin metodin luonnin testiluokassa määriteltyyn alustusmetodiin, `setUp`:

```python
class TestMaksukortti(unittest.TestCase):
    def setUp(self):
        self.kortti = Maksukortti(10)

    def test_konstruktori_asettaa_saldon_oikein(self):
        self.assertEqual(str(self.kortti), "Kortilla on rahaa 10 euroa")

    def test_syo_edullisesti_vahentaa_saldoa_oikein(self):
        self.kortti.syo_edullisesti()
        self.assertEqual(str(self.kortti), "Kortilla on rahaa 7.5 euroa")

    def test_syo_maukkaasti_vahentaa_saldoa_oikein(self):
        self.kortti.syo_maukkaasti()
        self.assertEqual(str(self.kortti), "Kortilla on rahaa 6 euroa")


    def test_syo_edullisesti_ei_vie_saldoa_negatiiviseksi(self):
        self.kortti.syo_maukkaasti()
        self.kortti.syo_maukkaasti()
        self.kortti.syo_edullisesti()
        self.assertEqual("Kortilla on rahaa 2 euroa", str(self.kortti))
```

`setUp`-metodi suoritetaan **ennen jokaista testitapausta** (eli testimetodia). Jokainen testitapaus siis aloittaa tilanteesta, jossa on luotu kortti jonka saldo on 10.

Huomaa, että testien kohteena oleva maksukortti talletetaan testiluokan oliomuuttujaan `self.kortti = Maksukortti(10)`-rivillä. Näin on tehtävä, jotta testimetodit pystyvät näkemään metodin `setUp` luoman maksukortin.

### Lisää testejä

Tehdään vielä testi metodille `lataa_rahaa`. Ensimmäinen testi varmistaa, että lataus onnistuu ja toinen testaa, ettei kortin saldo kasva suuremmaksi kuin 150 euroa.

```python
def test_kortille_voi_ladata_rahaa(self):
    self.kortti.lataa_rahaa(25)
    self.assertEqual(str(self.kortti), "Kortilla on rahaa 35 euroa")

def test_kortin_saldo_ei_ylita_maksimiarvoa(self):
    self.kortti.lataa_rahaa(200)
    self.assertEqual(str(self.kortti), "Kortilla on rahaa 150 euroa")
```

### Tehtävä 3: Lisää testejä

Lisää lopuksi maksukortille seuraavat testit:

- Maukkaan lounaan syöminen ei vie saldoa negatiiviseksi, ota tähän mallia testistä `test_syo_edullisesti_ei_vie_saldoa_negatiiviseksi`
- Negatiivisen summan lataaminen ei muuta kortin saldoa
- Kortilla pystyy ostamaan edullisen lounaan, kun kortilla rahaa vain edullisen lounaan verran (eli 2.5e)
- Kortilla pystyy ostamaan maukkaan lounaan, kun kortilla rahaa vain maukkaan lounaan verran (eli 4e)

**HUOM:** On suositeltavaa, että yksi testi testaa vain "yhtä asiaa" kerrallaan. Tee siis jokaisesta ylläolevasta oma testinsä.

**HUOM:** Kirjoita `assertEqual`-komennot aina siten, että ensimmäisenä parametrina saatu tulos
ja toisena parametrina on odotettu tulos. Esimerkiksi:

```python
self.assertEqual(str(kortti), "Kortilla on rahaa 2 euroa")
```

### Testit ovat toisistaan riippumattomia

Yllä jo mainittiin että testit ovat toisistaan riippumattomia eli molemmat testit toimivat siis kuin itsenäiset pienet funktiot. Mitä tämä oikein tarkoittaa?

Maksukorttia testataan usealla pienellä testimetodilla joista jokaisen nimi alkaa <i>test\_</i>-etuliitteellä. Jokainen erillinen testi testaa yhtä pientä asiaa, esim. että kortin saldo vähenee lounaan hinnan verran. On tarkoituksena, että jokainen testi aloittaa "puhtaalta pöydältä", eli ennen jokaista testiä luodaan alustuksen tekevässä `setUp`-metodissa uusi kortti.

Jokainen testi siis alkaa tilanteesta jossa kortti on juuri luotu. Tämän jälkeen testi joko kutsuu suoraan testattavaa metodia tai ensin saa aikaan sopivan alkutilanteen ja tämän jälkeen kutsuu testattavaa metodia (näin tapahtui testimetodissa `test_syo_edullisesti_ei_vie_saldoa_negatiiviseksi`, maukkaasti syömisellä saldo väheni 2 euroon jonka jälkeen testattiin ettei edullisesti syöminen vie saldoa negatiiviseksi).

### Onko jo testattu tarpeeksi?

Olemme tyytyväisiä, uskomme että testitapauksia on nyt tarpeeksi. Onko tosiaan näin? Onneksi on olemassa työkaluja, joilla voidaan tarkastaa testien _haarautumakattavuus_, eli se mitä suoritushaaroja testien suorittaminen on tutkinut. Tutustumme testien haarautumakattavuuden mittaamiseen [testikattavuutta](/python/coverage) käsittelevässä osiossa.

Testikattavuuden mittaus paljastaa että koodi on melko kattavasti testattu. Ainoa testien tutkimatta jättämä asia on tilanne, jossa kortille yritetään ladata negatiivinen saldo.

### Testiluokka vielä kokonaisuudessaan

```python
import unittest
from maksukortti import Maksukortti


class TestMaksukortti(unittest.TestCase):
    def setUp(self):
        self.kortti = Maksukortti(10)

    def test_konstruktori_asettaa_saldon_oikein(self):
        self.assertEqual(str(self.kortti), "Kortilla on rahaa 10 euroa")

    def test_syo_edullisesti_vahentaa_saldoa_oikein(self):
        self.kortti.syo_edullisesti()
        self.assertEqual(str(self.kortti), "Kortilla on rahaa 7.5 euroa",)

    def test_syo_maukkaasti_vahentaa_saldoa_oikein(self):
        self.kortti.syo_maukkaasti()
        self.assertEqual(str(self.kortti), "Kortilla on rahaa 6 euroa")

    def test_syo_edullisesti_ei_vie_saldoa_negatiiviseksi(self):
        self.kortti.syo_maukkaasti()
        self.kortti.syo_maukkaasti()
        self.kortti.syo_edullisesti()
        self.assertEqual(str(self.kortti), "Kortilla on rahaa 2 euroa")

    def test_kortille_voi_ladata_rahaa(self):
        self.kortti.lataa_rahaa(25)
        self.assertEqual(str(self.kortti), "Kortilla on rahaa 35 euroa")

    def test_kortin_saldo_ei_ylita_maksimiarvoa(self):
        self.kortti.lataa_rahaa(200)
        self.assertEqual(str(self.kortti), "Kortilla on rahaa 150 euroa")
```

### Tehtävä 4: Maksukortti ja kassapääte

**HUOM:** tämä tehtävä tehdään **eri projektiin** kuin edellinen, ja vaikka molemmissa tehtävissä on samanniminen luokka, eli `Maksukortti`-luokat ovat erilaiset, eli **älä** copypastaa edellisen tehtävän koodia tai tehtäviä tähän tehtävään.

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
wget https://raw.githubusercontent.com/ohjelmistotekniikka-hy/ohjelmistotekniikka-hy.github.io/master/tehtavat/python/unicafe.zip
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

Siirry terminaalissa _unicafe_-hakemistoon ja asenna projektin riippuvuudet komennolla:

```
pdm install
```

Riippuvuuksien asentamisen jälkeen testien suorittaminen onnistuu komennolla `pdm run pytest src`. Jos kaikki on kunnossa, saat raportin läpimenneistä testeistä:

```
collected 1 item

src/tests/maksukortti_test.py .                          [100%]

====================== 1 passed in 0.03s ======================
```

### Tehtävä 5: .gitignore

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

git-repositorion juureen on mahdollista lisätä tiedosto [.gitignore](https://www.atlassian.com/git/tutorials/gitignore), jossa voidaan määritellä, mitä tiedostoja ja hakemistoja git jättää huomioimatta eli _ignoroi_. Jokainen määritelmä lisätään tiedostoon omalle rivilleen.

Mene **repositoriosi juurihakemistoon**, luo tiedosto _.gitignore_, avaa se editorilla ja lisää tiedostoon seuraava rivi:

```
.pytest_cache
```

Kun nyt teet komennon `git status` pitäisi tuloksen olla seuraava:

```bash
On branch master

Initial commit

Untracked files:
  (use "git add <file>..." to include in what will be committed)

	.gitignore
```

Eli vaikka hakemistossa _/laskarit/viikko2/unicafe_ on alihakemisto <i>.pytest_cache</i>, ei git niitä huomioi

**HUOM:** Jos `git status`-komento näyttää muutoksia myös <i>\_\_pycache\_\_</i>-hakemistossa, lisää myös se omalle rivilleen _.gitignore_-tiedostoon:

```
__pycache__
```

### Tehtävä 6: Takaisin testeihin

Avaa nyt projekti valitsemallasi editorilla, kuten Visual Studio Codella.

Tee valmiiseen, tiedostossa _src/tests/maksukortti_test.py_ sijaitsevaan, `TestMaksukortti`-testiluokkaan testit, jotka testaavat ainakin seuraavia asioita:

- Kortin saldo alussa oikein
- Rahan lataaminen kasvattaa saldoa oikein
- Rahan ottaminen toimii
  - Saldo vähenee oikein, jos rahaa on tarpeeksi
  - Saldo ei muutu, jos rahaa ei ole tarpeeksi
  - Metodi palauttaa _True_, jos rahat riittivät ja muuten _False_

Suorita testit `pdm run pytest src`-komennolla.

## Komentojen suorittaminen Visual Studio Codessa

Visual Studio Codesta löytyy sisäänrakennettu terminaali. Terminaalin saa avattua valitsemalla päävalikosta _Terminal_ ja aukeavasta alavalikosta _New Terminal_. editorin alalaitaan pitäisi ilmestyä terminaali, jossa voimme suorittaa komentorivikomentoja:

<!-- TODO -->
![Visual Studio Code terminaali]({{ "/assets/images/python/vscode-terminaali.png" | absolute_url }})

## Coverage ja testikattavuus

Olemme tyytyväisiä, uskomme että testitapauksia on nyt tarpeeksi. Onko tosiaan näin? Onneksi on olemassa työkaluja, joilla voidaan tarkastaa testien rivi- ja haarautumakattavuus. _Rivikattavuus_ mittaa mitä koodirivejä testien suorittaminen on tutkinut. Täydellinen rivikattavuuskaan ei tietenkään takaa että ohjelma toimii oikein, mutta on parempi kuin ei mitään. _Haarautumakattavuus_ taas mittaa mitä eri suoritushaaroja koodista on käyty läpi. Suoritushaaroilla tarkoitetaan esimerkiksi if-komentojen valintatilanteita.

Koska haarautumakattavuus antaa tyypillisesti realistisemman kuvan testien kattavuudesta, käytämme kurssilla sitä testikattavuuden mittarina.

### Testikattavuusraportti

Testikattavuuden kerääminen testien suorituksesta onnistuu [coverage](https://coverage.readthedocs.io/en/coverage-4.3.2/index.html)-työkalun avulla. Sen asentamisen projektin riippuvuudeksi onnistuu tuttuun tapaan komennolla:

```bash
pdm add coverage
```

Testikattavuuden kerääminen `pdm run pytest src`-komennolla suoritetuista testeistä onnistuu komennolla:

```bash
pdm run coverage run --branch -m pytest src
```

Komennon `--branch`-flagillä pystymme keräämään testien [haarautumakattavuuden](https://coverage.readthedocs.io/en/coverage-4.3.2/branch.html). Huomaa, että `pdm run pytest src`-komento rajaa testien etsinnän projektin juurihakemistossa sijaitsevaan _src_-hakemistoon. Komennon suorittamisen jälkeen voimme tulostaa komentoriville raportin kerätystä testikattavuudesta komennolla:

```bash
pdm run coverage report -m
```

Tulostuksesta huomaamme, että raportissa on suuri määrä projektin kannalta turhia tiedostoja. Voimme konfiguroida, mistä tiedostoista testikattavuutta kerätään projektin juurihakemiston _.coveragerc_-tiedostossa. Jos haluamme sisällyttää testikattavuuteen vain projektin _src_-hakemiston, on konfiguraatio seuraava:

```
[run]
source = src
```

**HUOM:** _src_-hakemiston **alahakemistoissa** (ei siis itse _src_-hakemistossa) tulee olla tyhjät <i>\_\_init\_\_.py</i>-tiedostot, jotta testikattavuudeen sisällytetään kaikki halutut tiedostot. [Referenssisovelluksessa]({{site.python_reference_app_url}}) tapauksessa <i>\_\_init\_\_.py</i>-tiedostot on lisätty seuraavasti:

```
src/
  entities/
    __init__.py
    todo.py
    ...
  repositories/
    __init__.py
    todo_repository.py
    ...
  services/
    __init__.py
    todo_service.py
  ...
```

### Tiedostojen jättäminen raportin ulkopuolelle

Voimme jättää testikattavuuden ulkopuolelle tiedostoja ja hakemistoja. Järkevää voisi olla esimerkiksi jättää testihakemisto, käyttöliittymän koodin hakemisto ja _src/index.py_-tiedosto testikattavuuden ulkopuolle. Tämä onnistuu seuraavalla muutoksella _.coveragerc_-tiedostoon:

```
[run]
source = src
omit = src/**/__init__.py,src/tests/**,src/ui/**,src/index.py
```

Nyt komentojen `pdm run coverage run --branch -m pytest src` ja `pdm run coverage report -m` suorittaminen sisällyttää vain haluamamme _src_-hakemiston tiedostot.

### Visuaalisempi testikattavuusraportti

Komentoriviltä luettavaa raporttia selkeämmän esitysmuodon voi generoida komennolla:

```bash
pdm run coverage html
```

Komennon suorittaminen luo projektin juurihakemistoon hakemiston _htmlcov_. Raporttia voi katsoa selaimessa avaamalla hakemiston tiedoston _index.html_ selaimen kautta. Selaimessa aukeava raportti näyttää kutakuinkin seuraavalta:

![](/assets/images/python/coverage-raportti.png)

Raportista näemme, että koko koodin haaraumakattavuus on 95%. Yksittäisen tiedoston haaraumakattavuuden näemme taulukon "coverage"-sarakkeesta. Jos klikkaamme taulukosta yksittäisen tiedoston nimeä aukeaa tiedoston koodi ja testien siinä kattamat haarat. Katetut haarat näkyvät vihreinä palkkeina rivinumeron vieressä. Haarat, joita ei ole katettu ollenkaan, on korostettu punaisella värillä. Sen sijaan, jos haara on osittain katettu, se on korostettu keltaisella värillä. Viemällä hiiri rivin päälle, nähdään tarkempi selitys, miksi haaraa ei ole täysin katettu:

![](/assets/images/python/coverage-tiedosto.png)

Kuvan tilanteessa if-ehto ei koskaan saanut arvoa `True`, joten kyseistä haaraa ei testeissä käsitelty.

### Tehtävä 7: Testikattavuus

Unicafe-projektiin on valmiiksi konfiguroitu käytettäväksi [coverage](https://coverage.readthedocs.io/en/coverage-5.3/)-työkalu, joka mittaa testien haarautumakattavuuden. Testikattavuuden konfiguraatiossa käytettävä, _.coveragerc_-tiedoston sisältö on projektissa seuraava:

```
[run]
source = src
omit = src/tests/**,src/index.py
```

Testikattavuuden kerääminen testeistä onnistuu komennolla `pdm run coverage run --branch -m pytest src`. Komennon suorittamisen jälkeen kattavuusraportin voi muodostaa komennolla `pdm run coverage html`. Komennon suorittaminen luo projektin juurihakemistoon hakemiston _htmlcov_. Avaamalla hakemiston tiedoston _index.html_ selaimessa aukeaa seuraavan näköinen raportti:

![Testikattavuusraportti]({{ "/assets/images/python/unicafe-coverage.png" | absolute_url }})

Huomaa, että oma raporttisi tuskin näyttää täysin tältä (etenkin kattavuusprosenttien osalta) edellisen tehtävien testien toteutuksen jälkeen. Yksittäistä moduulia klikkaamalla näet punaisella korostuksella haarat, joita testit eivät kata vielä lainkaan ja keltaisella korostuksella haarat, joita testit kattavat vain osittain.

**Jos maksukortin koodissa on vielä rivejä tai haarautumia (merkitty punaisella) joille ei ole testiä, kirjoita sopivat testit.**

Jotta `coverage`-komennon generoimat tiedostot eivät päättyisi versionhallintaan, lisää _.gitignore_-tiedostoon vielä seuraavat rivit:

```
.coverage
htmlcov
```

### Tehtävä 8: Kassapäätteen testit

Laajennetaan unicafe-projektin testaus kattamaan myös kassapääte.

Tee testihakemistoon testitiedosto <i>kassapaate_test.py</i> ja sinne testiluokka `TestKassapaate`. Tee testit jotka testaavat ainakin seuraavia asioita:

- Luodun kassapäätteen rahamäärä ja myytyjen lounaiden määrä on oikea (rahaa 1000 euroa, lounaita myyty 0)
  - Huomaa, että luokka tallentaa rahamäärän sentteinä
- Käteisosto toimii sekä edullisten että maukkaiden lounaiden osalta
  - Jos maksu riittävä: kassassa oleva rahamäärä kasvaa lounaan hinnalla ja vaihtorahan suuruus on oikea
  - Jos maksu on riittävä: myytyjen lounaiden määrä kasvaa
  - Jos maksu ei ole riittävä: kassassa oleva rahamäärä ei muutu, kaikki rahat palautetaan vaihtorahana ja myytyjen lounaiden määrässä ei muutosta
- _seuraavissa testeissä tarvitaan myös Maksukorttia jonka oletetaan toimivan oikein_
- Korttiosto toimii sekä edullisten että maukkaiden lounaiden osalta
  - Jos kortilla on tarpeeksi rahaa, veloitetaan summa kortilta ja palautetaan _True_
  - Jos kortilla on tarpeeksi rahaa, myytyjen lounaiden määrä kasvaa
  - Jos kortilla ei ole tarpeeksi rahaa, kortin rahamäärä ei muutu, myytyjen lounaiden määrä muuttumaton ja palautetaan _False_
  - Kassassa oleva rahamäärä ei muutu kortilla ostettaessa
- Kortille rahaa ladattaessa kortin saldo muuttuu ja kassassa oleva rahamäärä kasvaa ladatulla summalla

Huomaat että kassapääte sisältää melkoisen määrän "copypastea". Nyt kun kassapäätteellä on automaattiset testit, on sen rakennetta helppo muokata eli refaktoroida siistimmäksi koko ajan kuitenkin varmistaen, että testit menevät läpi. Refaktoroi koodisi siistimmäksi jos haluat.

### Tehtävä 9: 100% testikattavuus

Varmista testikattavuuskomentojen avulla, että kassapäätteen testeillä on 100% haarautumakattavuus. Suorita siis komennot `pdm run coverage run --branch -m pytest src` ja `pdm run coverage html`, jonka jälkeen avaa selaimessa _htmlcov/index.html_-tiedosto.

Jos testikattavuus ei ole vielä 100%, tee lisää testejä kunnes tilanne korjautuu. Tallenne edellisessä esimerkissä olevan testikattavuusraportin kuvan tyylinen [screenshot](https://www.take-a-screenshot.org/) projektisi kattavuusraportista palautusrepositoriosi hakemistoon _laskarit/viikko2_.

## Harjoitustyö

Kurssin pääpainon muodostaa viikolla 2 aloitettava harjoitustyö. Harjoitustyössä toteutetaan itsenäisesti ohjelmisto omavalintaisesta aiheesta. Tavoitteena on soveltaa ja syventää ohjelmoinnin perus- ja jatkokursseilla opittuja taitoja ja harjoitella tiedon omatoimista etsimistä. Harjoitustyötä tehdään itsenäisesti, mutta tarjolla on runsaasti [pajaohjausta](/#ajankohtaista).

Harjoitustyön on edettävä [viikottaisten tavoitteiden mukaan](/#aikataulu). Työ on saatava valmiiksi kurssin aikana ja sitä on toteutettava tasaisesti, muuten kurssi katsotaan keskeytetyksi. Samaa ohjelmaa ei voi jatkaa seuraavalla kurssilla (eli keväällä 2021), vaan työ on aloitettava uudella aiheella alusta. Muista varata riittävästi aikaa (10-15h viikossa) koko periodin ajaksi.

Koko kurssin arvostelu perustuu pääasiassa harjoitustyöstä saataviin pisteisiin. Osa pisteistä kertyy [aikatauluun](/#aikataulu) määriteltyjen viikoittaisten välitavoitteiden kautta, osa taas perustuu työn lopulliseen palautukseen.

### Harjoitustyön kieli ja ohjelmointikieli

Harjoitustyön ohjelmointikieli on Java tai Python.

Web-sovelluksia kurssilla ei sallita. Sovelluksissa sallitaan toki webissä olevat komponentit, mutta sovelluksen käyttöliittymän tulee olla niin sanottu työpöytäsovellus.

**Ohjelmakoodin muuttujat, luokat ja metodit kirjoitetaan englanniksi.** Dokumentaatio voidaan kirjoittaa joko suomeksi tai englanniksi.

### Ohjelman toteutus

Toteutus etenee "iteratiivisesti ja inkrementaalisesti". Tämä tarkoittaa, että heti alussa toteutetaan pieni osa ohjelman toiminnallisuudesta. Ohjelman ydin pidetään koko ajan toimivana, uutta toiminnallisuutta lisäten, kunnes tavoiteltu ohjelman laajuus on saavutettu. Ohjelman rakenteeseen kannattaa kysyä vinkkejä pajasta, sekä ottaa mallia ohjelmoinnin jatkokurssin harjoitustehtävistä ja materiaalista. Muutamia vihjeitä on myös kurssin [referenssiprojektissa]({{site.python_reference_app_url}}) sekä [täällä](/python/toteutus).

Iteratiiviseen tapaan tehdä ohjelma liittyy kiinteästi automatisoitu testaus. Aina uutta toiminnallisuutta lisättäessä ja vanhaa muokatessa täytyy varmistua, että kaikki vanhat ominaisuudet toimivat edelleen. Kaiken testaaminen käsin uudelleen ja uudelleen ei ole ajankäytöllisesti järkevää, ja siksi ohjelmakoodille onkin syytä laatia jatkuvasti testejä ohjelmoinnin edetessä. Testit on syytä pitää kattavina ja ajan tasalla.

Jotta ohjelmaa pystyisi testaamaan, on tärkeää että sovelluslogiikkaa [ei kirjoiteta käyttöliittymän sekaan](/python/toteutus)!

Eräs mahdollisuus on tehdä aluksi tekstikäyttöliittymän ja vasta saatuasi ohjelman perustoiminnallisuuden toteutettua voit siirtyä graafisen käyttöliittymän toteutukseen. Graafinen käyttöliittymä on mahdollista myös jättää pois, mutta tämä [vaikuttaa arvosanaan](/python/arvosteluperusteet). Graafisen käyttöliittymän toteutukseen löytyy ohjeita [täällä](/python/tkinter). Pelin toteutukseen Pygame-kirjastolla löytyy ohjeita [täältä](/python/pygame).

[Arvosanan kannalta suositeltavaa](/python/arvosteluperusteet) on, että ohjelmasi tallettaa tietoa joko tiedostoon tai tietokantaan. Vihjeitä tiedon tallettamiseen [täällä](/python/toteutus#tietojen-tallennus).

Harjoitustyön tavoitteena on tuottaa ohjelma, joka voitaisiin antaa toiselle opiskelijalle ylläpidettäväksi ja täydennettäväksi. Lopullisessa palautuksessa on oltava lähdekoodin lisäksi dokumentaatio ja automaattiset testit.

Toivottava dokumentaation taso käy ilmi [referenssiprojektissa]({{site.python_reference_app_url}}).

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

### Harjoitustyö 1: Alustava määrittelydokumentti

Harjoitustyön tekeminen aloitetaan päättämällä aihe ja kuvaamalla se _alustavassa määrittelydokumentissa_, eli työlle tehdään [vaatimusmäärittely](/python/materiaali#vaatimusmäärittely).

Mikään ei tietenkään estä sitä, että aloitat jo ohjelmoinnin tai vaikkapa koodaat koko työn valmiiksi. Tämän viikon deadlinen pisteytyksessä ollaan kiinnostuneita ainoastaan määrittelydokumentista.

**HUOM:** jos aloitat jo ohjelmoinnin, muista että ohjelmakoodi tulee kirjoittaa englanniksi! Ohjelman käyttöliittymä ja dokumentaatio voivat olla suomeksi tai englanniksi. Ohjeet ohjelmoinnin aloittamiseen löytyvät viikon 3 materiaalista.

Palautus tapahtuu lisäämällä oman aiheen _alustava määrittelydokumentti_ ensimmäisen viikon [laskareiden](/python/viikko1#labtool) päätteeksi [Labtooliin]({{site.labtool_link}}) rekisteröimääsi palautusrepositorioon.

Määrittelydokumentti tehdään samaan tapaan kuin [referenssiprojektissa]({{site.python_reference_app_url}}/blob/master/dokumentaatio/vaatimusmaarittely.md) eli [markdown](https://guides.github.com/features/mastering-markdown/)-muodossa. Sijoita _vaatimusmaarittely.md_-tiedosto repositorion _dokumentaatio_-hakemistoon ja lisää siihen linkki repositorion _README.md_-tiedostosta.

Määrittelydokumenttiin kannattaa ottaa mallia [referenssiprojektista]({{site.python_reference_app_url}}/blob/master/dokumentaatio/vaatimusmaarittely.md), eli sen tulee sisältää:

- _Sovelluksen tarkoitus_ eli pieni tekstuaalinen yleiskuvaus sovelluksesta
- _Käyttäjät_ eli tieto erilaisista _käyttäjärooleista_, joita järjestelmässä on
  - Tosin jos sovelluksessasi on vain yhdenlaisia käyttäjiä, ei kohtaa tarvita. Näin lienee tilanne monissa harjoitustöiden aiheissa kuten peleissä.
- Suunnitellut toiminnallisuudet
  - Toiminnallisuudet voi kuvata ranskalaisina viivoina samaan tapaan kuin referenssiprojektissa
  - Referenssiprojektissa on kuvattu perusversion eli jo "kurssin alkupuolella" toteutettavan ydintoiminnallisuuden toiminnallisuudet tarkemmin
  - Perusversiota laajentavat jatkokehitysideat ovat omassa listassaan

Voit myös tehdä referenssiprojektin tapaan _käyttöliittymäluonnoksen_, se ei ole kuitenkaan pakollinen.

### Harjoitustyö 2: Työaikakirjanpito

Pidä säännöllisesti kirjaa käyttämistäsi työtunneista. Käytettyjen työtuntien määrä ei vaikuta arvosanaan, _mutta_ vajavaisesti pidetty työaikakirjanpito alentaa työn arvosanaa. **Tuntikirjanpitoon ei merkitä laskareihin käytettyä aikaa.**

Lisää repositorion _README.md_-tiedostoon linkki [työaikakirjanpitoon]({{site.python_reference_app_url}}/blob/master/dokumentaatio/tuntikirjanpito.md) ja sijoita tiedosto _dokumentaatio_-hakemistoon.
