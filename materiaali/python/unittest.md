---
layout: page
permalink: /python/unittest
title: Unittest ja testaaminen
---

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

## Alkutoimet

Luo Labtooliin rekisteröimäsi repositorion hakemistoon _laskarit/viikko2_ hakemisto _maksukortti_. Suorita komentoriviltä hakemiston sisällä tuttu, projektin alustamiseen vaadittava komento:

```bash
poetry init --python ^3.8
```

Poetryn kysymillä projektin tiedoilla ei ole väliä, joten voit hyvin käyttää Poetryn ehdottamia tietoja.

Asennetaan projektiin kehityksen aikaiseksi riippuvuudeksi [pytest](https://docs.pytest.org/en/stable/)-sovelluskehys, joka helpottaa testien suorittamista komentoriviltä. Riippuvuuden asentaminen onnistuu samassa hakemistossa komennolla:

```bash
poetry add pytest --dev
```

Seuraavaksi muodosta _maksukortti_-hakemistoon seuraava rakenne:

```
maksukortti/
  src/
    maksukortti.py
    tests/
      __init__.py
      maksukortti_test.py
  ...
```

Lisää tiedostoon _src/maksukortti.py_ edellä esitelty `Maksukortti`-luokan koodi.

## Aloitetaan testien kirjoittaminen

Yritetään seuraavaksi suorittaa testejä. Siirrytään virtuaaliympäristöön komennolla `poetry shell`, jonka jälkeen suoritetaan komento `pytest src`. Komennon suorittaminen antaa ymmärtää, ettei yhtään testiä ole suoritettu. Syy on yksinkertaisesti siinä, ettemme ole vielä toteuttaneet yhtään testiä.

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

Suoritetaan virtuaaliympäristössä komento `pytest src` uudestaan ja huomaamme, että yksi testi on suoritettu onnistuneesti. Huomaa, että `pytest`-komennon jälkeinen _src_ rajaa suoritettavien testien etsinnän projektin juurihakemistossa sijaitsevaan _src_-hakemistoon. Jos arvoa ei annettaisi, pytest lähtisi etsimään suoritettavia testejä suoraan projektin juurihakemistosta.

Komento `pytest src` etsii suoritettavia testejä projektin juurihakemiston _src_-hakemistosta, sekä rekursiivisesti kaikista sen alahakemistoista. Jotta pytest tietää, mitä testejä tulisi suorittaa, **tulee nimeämisessä noudattaa oikeita käytänteitä**. Nämä käytänteet ovat:

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

Tarkastus tapahtuu unittestissä paljon käytettyä assert- eli väittämäkomentoa käyttäen. Komento testaa onko sille ensimmäisenä parametrina annettu odotettu tulos sama kuin toisena parametrina oleva testissä saatu tulos. Erilaisia [assert](https://docs.python.org/3/library/unittest.html#assert-methods)-metodeja on monia.

Suoritetaan seuraavaksi testi komennolla `pytest src` ja toivotaan, että testi menee läpi.

Vaihtoehtoinen tapa määritellä sama testi olisi seuraava:

```python
def test_konstruktori_asettaa_saldon_oikein(self):
    kortti = Maksukortti(10)
    self.assertEqual(str(kortti), "Kortilla on rahaa 10 euroa")
```

eli metodikutsun palauttamaa arvoa ei oteta erikseen talteen muuttujaan vaan sitä kutsutaan suoraan assertEqual-vertailun sisällä. Käy niin, että ennen kuin varsinainen vertailu suoritetaan, tehdään funktiokutsu ja vertailtavaksi tulee sen palauttama arvo.

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

## Muutama huomio

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

## Testin alustustoimet

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

## Lisää testejä

Tehdään vielä testi metodille `lataa_rahaa`. Ensimmäinen testi varmistaa, että lataus onnistuu ja toinen testaa, ettei kortin saldo kasva suuremmaksi kuin 150 euroa.

```python
def test_kortille_voi_ladata_rahaa(self):
    self.kortti.lataa_rahaa(25)
    self.assertEqual(str(self.kortti), "Kortilla on rahaa 35 euroa")

def test_kortin_saldo_ei_ylita_maksimiarvoa(self):
    self.kortti.lataa_rahaa(200)
    self.assertEqual(str(self.kortti), "Kortilla on rahaa 150 euroa")
```

## Testien suorittamiselle oma tehtävä

[Invoke-ohjeessa](/python/invoke) ohjeistetaan, miten projektille voi määritellä uudelleenkäytettäviä tehtäviä ja miten niitä voi suorittaa komentoriviltä. Määritellään testien suorittamista varten oma tehtävä, `test`. Tämä onnistuu määrittelemällä tehtävä projektin juurihakemiston _tasks.py_-tiedostossa:

```python
from invoke import task

@task
def test(ctx):
    ctx.run("pytest src")

# ...
```

Nyt testien suorittaminen pitäisi onnistua komennolla:

```bash
poetry run invoke test
```

## Testit ovat toisistaan riippumattomia

Yllä jo mainittiin että testit ovat toisistaan riippumattomia eli molemmat testit toimivat siis kuin itsenäiset pienet funktiot. Mitä tämä oikein tarkoittaa?

Maksukorttia testataan usealla pienellä testimetodilla joista jokaisen nimi alkaa <i>test\_</i>-etuliitteellä. Jokainen erillinen testi testaa yhtä pientä asiaa, esim. että kortin saldo vähenee lounaan hinnan verran. On tarkoituksena, että jokainen testi aloittaa "puhtaalta pöydältä", eli ennen jokaista testiä luodaan alustuksen tekevässä `setUp`-metodissa uusi kortti.

Jokainen testi siis alkaa tilanteesta jossa kortti on juuri luotu. Tämän jälkeen testi joko kutsuu suoraan testattavaa metodia tai ensin saa aikaan sopivan alkutilanteen ja tämän jälkeen kutsuu testattavaa metodia (näin tapahtui testimetodissa `test_syo_edullisesti_ei_vie_saldoa_negatiiviseksi`, maukkaasti syömisellä saldo väheni 2 euroon jonka jälkeen testattiin ettei edullisesti syöminen vie saldoa negatiiviseksi).

## Onko jo testattu tarpeeksi?

Olemme tyytyväisiä, uskomme että testitapauksia on nyt tarpeeksi. Onko tosiaan näin? Onneksi on olemassa työkaluja, joilla voidaan tarkastaa testien _haarautumakattavuus_, eli se mitä suoritushaaroja testien suorittaminen on tutkinut. Tutustumme testien haarautumakattavuuden mittaamiseen [testikattavuutta](/python/coverage) käsittelevässä osiossa.

Testikattavuuden mittaus paljastaa että koodi on melko kattavasti testattu. Ainoa testien tutkimatta jättämä asia on tilanne, jossa kortille yritetään ladata negatiivinen saldo.

## Testiluokka vielä kokonaisuudessaan

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
