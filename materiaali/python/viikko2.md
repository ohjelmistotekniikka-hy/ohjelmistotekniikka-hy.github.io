---
layout: page
permalink: /python/vk2
title: Viikko 2
---

{% include deadline_info.md deadline=site.wk2dl %}

## Poetry ja riippuvuuksien hallinta

Laajoissa ja monimutkaisissa ohjelmistoprojekteissa kaiken koodin tuottaminen itse ei ole enää käytännöllistä. Ei ole esimerkiksi järkevää, että jokaisessa ohjelmistoprojektissa toteutetaan oma ohjelmointirajapinta tietokantaoperaatioille, tai sovelluskehys koodin testaamiseen. Jotta pyörää ei tarvitsisi aina keksiä uudelleen, ovat ohjelmistokehittäjät kehittäneet valtavan määrän avoimen lähdekoodin _kirjastoja_, joita jokainen voi hyödyntää projekteissaan.

Kirjastojen lähdekoodi on usein luettavissa versionhallinta-alustoilla, kuten GitHubissa. Usein kirjastoja päivitetään jatkuvasti ja nämä päivitykset synnyttävät kirjastoista uusia _versioita_. Kirjastojen versioita julkaistaan erilaisiin rekistereihin, joista ne ovat helposti asennettavissa. [The Python Package Index](https://pypi.org/) (PyPI) on eräs tämän kaltainen, Python-kirjastoille tarkoitettu rekisteri.

Jotta kirjastoja olisi helppo asentaa projektiin, on kehitetty erilaisia pakettien asennukseen tarkoitettuja komentorivityökaluja. Pythonin kohdalla suosituin komentorivityökalu tähän tarkoitukseen on [pip](https://pypi.org/project/pip/). Pip tulee valmiiksi asennettuna uusimpien Python-asennusten mukana. Voit varmistaa sen löytymisen komentorivin komennolla:

```bash
pip3 --version
```

Komentoriville tulisi tulostua pipin versio. Jos `pip3`-komentoa ei löydy, kokeile komentoa `python3 -m pip --version`.

Kirjastojen asennus onnistuu pipin komennolla `pip3 install`. Jotta samalla tietokoneella olevien projektien riippuvuuksissa ei syntyisi ristiriitoja, on käytössä usein niin kutsuttaja projektikohtaisia _virtuaaliympäristöjä_. Näitä virtuaaliympäristöjä luodaan ja käytetään [venv](https://docs.python.org/3/library/venv.html) moduulin kautta. Jotta saisimme helposti käyttöömme pipin ja virtuaaliympäristön tuomat edut, voimme käyttää [Poetry](https://python-poetry.org/) komentorivityökalua.

### Huomioita komennoista

Monilla tietokoneilla Python-version kolme komennot suoritetaan `python3`- ja `pip3`-komennoilla komentojen `python` ja `pip` sijaan. Jos komentoja `python3` ja `pip3` ei jostain syystä löydy, tarkista `python`-komennon käyttämä versio komennolla:

```bash
python --version
```

Jos versio on alle 3.8, asenna tietokoneellesi [uusin Python-versio](https://www.python.org/downloads/). Muissa tapauksissa, voit käyttää `python`-komentoa `python3`-komennon sijaan.

### Asennus

Poetry tarjoaa dokumentaatiossaan useita [asennusvaihtoehtoja](https://python-poetry.org/docs/#installation). Valitse vaihtoehdoista käyttöjärjestelmällesi sopiva asennustapa ja asenna Poetry. Kun olet suorittanut asennuksen, tarkista vielä asennuksen onnistuminen komennolla:

```
poetry --version
```

Jos mikään esitetyistä asennusvaihtoehdoista ei onnistu, on asentaminen pipin avulla myös käyttökelpoinen vaihtoehto:

```bash
pip3 install poetry
```

Huomaa, että komennon suorittaminen vaatii pääkäyttäjän oikeudet. Jos näitä ei ole saatavilla, voi asennuksen tehdä käyttäjäkohtaisesti:

```bash
pip3 install --user poetry
```

Huomaa, että tämän asennustavan kanssa `poetry`-komento ei välttämättä ole suoritettavissa. Jos näin on, voit sen sijaan käyttää komentoa `python3 -m poetry`. Tämä tarkoittaa sitä, että kaikki materiaalin `poetry`-komennot tulee suorittaa muodossa `python3 -m poetry <komento>` (esimerkiksi `python3 -m poetry init`).

**HUOM:** kaikki asennustavat saattavat vaatia terminaali-ikkunan sulkemisen ja uudelleen avaamisen, jotta Poetryn komennot alkavat toimia. Joissain tapauksissa on vaadittu jopa tietokoneen uudelleenkäynnistys.

#### Huomioita laitoksen melkki-palvelimen asennuksesta

Laitoksen melkki.cs.helsinki.fi-palvelimelle Poetryn asennus tulisi onnistua seuraamalla Poetryn [asennusohjeiden](https://python-poetry.org/docs/#installation) Linux-ohjeita. Huomaa, että asennuksen jälkeen polku Poetryn binääriin tulee asettaa `PATH`-muuttujaan. Tämä onnistuu komennolla:

```bash
source $HOME/.poetry/env
```

Komento kannattaa lisätä kotihakemiston _.profile_-tiedostoon, niin sitä ei tarvitse suorittaa käsin jokaisen kirjautumiskerran jälkeen. Tämä onnistuu esimerkiksi seuraavalla komennolla:

```bash
echo "source $HOME/.poetry/env" >> .profile
```

### Projektin alustaminen

Harjoitellaan Poetryn käyttöä tekemällä pieni esimerkkiprojekti. Luo hakemisto _poetry-testi_ haluamaasi hakemistoon. Hakemiston ei tarvitse löytyä Labtooliin rekisteröimästäsi repositoriosta. Avaa hakemisto komentoriviltä ja suorita siellä komento:

```bash
poetry init --python "^3.8"
```

Komennon yhteydessä annettu `--python "^3.8"`-asetus asettaa projektin Python-version vaatimukseksi vähintään version 3.8. Komennon suorittaminen alkaa kysymään kysymyksiä. Voit vastata kysymyksiin haluamallasi tavalla ja kaikkien kohtien vastauksia voi myös muokata myöhemmin. Tämän vuoksi kysymysten ohittaminen Enter-painiketta painamalla on täysin hyvä vaihtoehto.

Kun viimeiseen kysymykseen on vastattu, katso hakemiston sisältöä. Hakemistoon pitäisi ilmestyä _pyproject.toml_-tiedosto, jonka sisältö on kutakuinkin seuraava:

```
[tool.poetry]
name = "poetry-testi"
version = "0.1.0"
description = ""
authors = ["Kalle Ilves <kalle.ilves@helsinki.fi>"]

[tool.poetry.dependencies]
python = "^3.8"

[tool.poetry.dev-dependencies]

[build-system]
requires = ["poetry-core>=1.0.0"]
build-backend = "poetry.core.masonry.api"
```

Tiedoston `[tool.poetry]`-osio sisältää projektiin liittyviä yleistietoja, kuten sen nimen, kuvauksen ja ylläpitäjät. Osion alapuolella on osioita, jotka listaavat projektin riippuvuuksia. Osiossa `[tool.poetry.dependencies]` näemme `poetry init`-komennon suorituksen yhteydessä asettamamme Python-version vaatimuksen, joka on muotoa `python = "^3.8"`. `^3.8`-merkintä tarkoittaa, että projektin käyttö vaatii vähintään Python-version 3.8. Voit lukea lisää versiomerkinnöistä Poetryn [dokumentaatiosta](https://python-poetry.org/docs/dependency-specification/#version-constraints).

Kun _pyproject.toml_-tiedosto on tullut tutuksi, viimeistellään projektin alustaminen suorittamalla komento:

```bash
poetry install
```

Komennon suorittaminen tekee projektille vaadittavat alustustoimenpiteet, kuten virtuaaliympäristön alustamisen. Jos projektille olisi määritelty riippuvuuksia, komennon suorittaminen asentaisi myös ne. Tämän vuoksi _komento tulee suorittaa aina ennen kuin uutta projekti aletaan käyttämään_.

Komennon suorittamisen seurauksena hakemistoon pitäisi ilmestyä tiedosto _poetry.lock_. Tiedosto sisältää kaikkien asennettujen riippuvuuksien versiotiedot. Sen tietojen avulla Poetry osaa aina asentaa riippuvuuksista täsmälleen oikeat versiot. Tästä syystä _tiedosto tulee lisätä versionhallintaan_. Huomaa, että tiedoston sisältöä ei tule _missään tapauksessa_ muuttaa, vaan se on täysin Poetryn ylläpitämä.

**HUOM:** jos törmäät seuraavaan virheilmoitukseen:

```
Python 2.7 will no longer be supported in the next feature release of Poetry (1.2).
You should consider updating your Python version to a supported one.

Note that you will still be able to manage Python 2.7 projects by using the env command.
See https://python-poetry.org/docs/managing-environments/ for more information.

The currently activated Python version 2.7.16 is not supported by the project (^3.8).
Trying to find and use a compatible version.
```

Eräs tapa korjata tilanne Macilla ja ehkä myös Linuxilla on editoida tiedoston `~/.poetry.bin/poetry` ensimmäisellä rivillä mainittu Pythonin polku. Oletusarvoinen polku on todennäköisesti seuraava:

```
#!/usr/bin/python
```

Polku tulee Macilla muuttaa (todennäköisesti) muotoon:

```
#!/usr/local/bin/python3
```

Oikea polku kannattaa varmistaa komennolla `which python3`.

### Riippuvuuksien asentaminen

Asennetaan seuraavaksi esimerkkiprojektimme ensimmäisen riippuvuus. Riippuvuuksien löytäminen onnistuu helpoiten Googlettamalla ja etsimällä hakutuloksista sopivia GitHub-repositorioita, tai PyPI-sivuja. Asennetaan esimerkkinä projektiimme erittäin hyödyllinen [cowsay](https://pypi.org/project/cowsay/)-kirjasto. Tämä onnistuu komennolla:

```bash
poetry add cowsay
```

Asennuksen komento on siis muotoa `poetry add <kirjasto>`. Komennon suorittamisen jälkeen huomaamme, että _pyproject.toml_-tiedoston `[tool.poetry.dependencies]`-osion alla on uutta sisältöä:

```
[tool.poetry.dependencies]
python = "^3.8"
cowsay = "^2.0.3"
```

`add`-komento asentaa projektiin kirjaston uusimman version, joka oli komennon suoritushetkellä `2.0.3`. Usein tämä on juuri se, mitä haluamme tehdä. Voimme kuitenkin asentaa halutessamme esimerkiksi cowsay-kirjaston version `1.0` komennolla:

```bash
poetry add cowsay==1.0
```

Jos haluaisimme poistaa kirjaston projektimme riippuvuuksien joukosta, se onnistuisi komennolla:

```bash
poetry remove cowsay
```

Pidetään kuitenkin cowsay-kirjasto toistaiseksi asennettuna.

### Komentojen suorittaminen virtuaaliympäristössä

Luodaan seuraavaksi _poetry-testi_-hakemistoon hakemisto _src_ ja luodaan sinne tiedosto _index.py_. Tiedoston sisältö on seuraava:

```python
import cowsay

cowsay.tux("Poetry is awesome!")
```

Jos suoritamme tiedoston komentoriviltä komennolla:

```bash
python3 src/index.py
```

On lopputuloksena seuravaa virheilmoitus:

```
ModuleNotFoundError: No module named 'cowsay'
```

Tämä johtuu siitä, että emme ole projektin virtuaaliympäristön sisällä, eli Python ei löydä projektimme riippuvuuksia. Asia korjaantuu käyttämällä [run](https://python-poetry.org/docs/cli/#run) komentoa:

```bash
poetry run python3 src/index.py
```

`poetry run`-komento siis suorittaa annetun komennon virtuaaliympäristössä, jonka sisällä Python löytää riippuvuutumme.

Kun projektia kehitetään aktiivisesti ja komentoja suoritetaan komentoriviltä jatkuvasti, on kätevintä olla koko ajan virtuaaliympäristön sisällä. Voimme siirtyä virtuaaliympäristön sisään kommennolla [shell](https://python-poetry.org/docs/cli/#shell):

```bash
poetry shell
```

Kun olemme virtuaaliympäristössä, komentorivin syöterivin edessä on suluissa virtuaaliympäristön nimi:

```bash
$ (poetry-testi-IhtScY6W-py3.9)
```

Virtuaaliympäristön sisällä voimme suorittaa komennon "normaalisti", eli ilman `run`-komentoa:

```bash
python3 src/index.py
```

Voimme lähteä virtuaaliympäristöstä komennolla `exit`.

### Kehityksen aikaiset riippuvuudet

Jos olit tarkkana, huomasit, että _pyproject.toml_-tiedostosta löytyy `[tool.poetry.dependencies]`-osion lisäksi osio `[tool.poetry.dev-dependencies]`. Komennon `add` suorittaminen asentaa oletusarvoisesti riippuvuudet `[tool.poetry.dependencies]`-osion alle. Näiden riippuvuuksien lisäksi voimme asentaa projektiimme riippuvuuksia, joita tarvitsemme vain kehityksen aikana. Näitä riippuvuuksia ovat kaikki ne, joita itse sovelluksen käyttö (esimerkiksi `python3 src/index.py`-komennon suorittaminen) ei tarvitse.

Kehityksen aikaisten riippuvuuksien asentaminen onnistuu antamalla `add`-komennolle `--dev`-flagi. Esimerkiksi pian tutuksi tulevan [pytest](https://pytest.org/)-kirjaston voi asentaa kehityksen aikaiseksi riippuvuudeksi seuraavalla komennolla:

```bash
poetry add pytest --dev
```

Komennon suorittaminen lisää pytest-kirjaston riippuvuudeksi `[tool.poetry.dev-dependencies]`-osion alle:

```
[tool.poetry.dev-dependencies]
pytest = "^6.1.2"
```

Kehityksen aikaisten riippuvuuksien määritteleminen on kätevää, koska se vähentää asennettavien riippuvuuksien määrää tapauksessa, jossa haluamme vain käynnistää sovelluksen. Tässä tilanteessa riippuvuuksien asentamisen voi tehdä komennolla `poetry install --no-dev`.

### Ratkaisuja yleisiin ongelmiin

Aloita varmistamalla, että Poetrysta on asennettu uusin versio suorittamalla komento `poetry self update`.

#### Riippuvuuksien asennus epäonnistuu

Suorittaa komento `poetry config experimental.new-installer false` ja yritä sen jälkeen suorittaa epäonnistunut Poetry-komento uudelleen.

#### Virtuaaliympäristössä suoritetaan Python versiota 2

Varmista ensin, että _pyproject.toml_-tiedostossa on oikea Python version vaatimus:

```
[tool.poetry.dependencies]
python = "^3.8"
```

Listaa tämän jälkeen käytössä olevat virtuaaliympäristöt komennolla `poetry env list` ja poista ne kaikki yksitellen komennolla `poetry env remove <nimi>`. Esimerkiksi seuraavasti:

```bash
$ poetry env list
unicafe-jLeQYxxf-py3.9 (Activated)
$ poetry env remove unicafe-jLeQYxxf-py3.9
Deleted virtualenv: /Users/kalleilv/Library/Caches/pypoetry/virtualenvs/unicafe-jLeQYxxf-py3.9
```

Kun virtuaaliympäristöt on poistettu suorita komento `poetry install`.

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

### 📝 Tehtävä 1: Alkutoimet

Luo Labtooliin rekisteröimäsi repositorion hakemistoon _laskarit/viikko2_ hakemisto _maksukortti_. Suorita komentoriviltä hakemiston sisällä tuttu, projektin alustamiseen vaadittava komento:

```bash
poetry init --python "^3.8"
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

### 📝 Tehtävä 2: Aloitetaan testien kirjoittaminen

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

Tarkastus tapahtuu unittestissä paljon käytettyä `assert`- eli väittämäkomentoa käyttäen. Komento testaa onko sille ensimmäisenä parametrina annettu odotettu tulos sama kuin toisena parametrina oleva testissä saatu tulos. Erilaisia [assert](https://docs.python.org/3/library/unittest.html#assert-methods)-metodeja on monia.

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

### 📝 Tehtävä 3: Lisää testejä

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

### 📝 Tehtävä 4: Maksukortti ja kassapääte

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

Siirry komentorivillä _unicafe_-hakemistoon ja asenna vaadittavat riippuvuudet komennolla:

```
poetry install
```

Testien suorittaminen komentoriviltä onnistuu siirtymällä virtuaaliympäristöön komennolla `poetry shell` ja sen jälkeen suorittamalla komennon `pytest src`. Jos kaikki on kunnossa, saat raportin läpimenneistä testeistä:

```
collected 1 item

src/tests/maksukortti_test.py .                          [100%]

====================== 1 passed in 0.03s ======================
```

### 📝 Tehtävä 5: .gitignore

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

Mene **repositoriosi juureen**, luo tiedosto _.gitignore_, avaa se editorilla ja lisää tiedostoon seuraava rivi:

```
/laskarit/viikko2/unicafe/.pytest_cache
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
/laskarit/viikko2/unicafe/__pycache__
```

### 📝 Tehtävä 6: Takaisin testeihin

Avaa nyt projekti valitsemallasi editorilla, kuten Visual Studio Codella.

Tee valmiiseen, tiedostossa _src/tests/maksukortti_test.py_ sijaitsevaan, `TestMaksukortti`-testiluokkaan testit, jotka testaavat ainakin seuraavia asioita:

- Kortin saldo alussa oikein
- Rahan lataaminen kasvattaa saldoa oikein
- Rahan ottaminen toimii
  - Saldo vähenee oikein, jos rahaa on tarpeeksi
  - Saldo ei muutu, jos rahaa ei ole tarpeeksi
  - Metodi palauttaa _True_, jos rahat riittivät ja muuten _False_

Suorita testit komentoriviltä virtuaaliympäristössä `pytest src`-komennolla.

## Komentojen suorittaminen Visual Studio Codessa

Visual Studio Codesta löytyy sisään rakennettu terminaali. Terminaalin saa avattua valitsemalla päävalikosta _Terminal_ ja aukeavasta alavalikosta _New Terminal_. editorin alalaitaan pitäisi ilmestyä terminaali, jossa voit suorittaa komentorivikomentoja.

Terminaalin avaaminen saattaa automaattisesti avata komentorivin virtuaaliympäristössä. Jos olet virtuaaliympäristössä, on komentorivin syöterivin alussa projektin nimi ja jokin satunnainen merkkijono suluissa, esimerkiksi `(unicafe-sF0cl2di-py3.9)`. Jos et ole virtuaaliympäristössä pääset siihen tutulla `poetry shell` komennolla. Tämän jälkeen voit suorittaa komentoja suoraan Visual Studio Codessa:

![Visual Studio Code terminaali]({{ "/assets/images/python/vscode-terminaali.png" | absolute_url }})

## Coverage ja testikattavuus

Olemme tyytyväisiä, uskomme että testitapauksia on nyt tarpeeksi. Onko tosiaan näin? Onneksi on olemassa työkaluja, joilla voidaan tarkastaa testien rivi- ja haarautumakattavuus. _Rivikattavuus_ mittaa mitä koodirivejä testien suorittaminen on tutkinut. Täydellinen rivikattavuuskaan ei tietenkään takaa että ohjelma toimii oikein, mutta on parempi kuin ei mitään. _Haarautumakattavuus_ taas mittaa mitä eri suoritushaaroja koodista on käyty läpi. Suoritushaaroilla tarkoitetaan esimerkiksi if-komentojen valintatilanteita.

Koska haarautumakattavuus antaa tyypillisesti realistisemman kuvan testien kattavuudesta, käytämme kurssilla sitä testikattavuuden mittarina.

### Testikattavuusraportti

Testikattavuuden kerääminen testien suorituksesta onnistuu [coverage](https://coverage.readthedocs.io/en/coverage-4.3.2/index.html)-työkalun avulla. Sen asentamisen projektin kehityksen aikaiseksi riippuvuudeksi onnistuu tuttuun tapaan komennolla:

```bash
poetry add coverage --dev
```

Testikattavuuden kerääminen `pytest src`-komennolla suoritetuista testeistä onnistuu virtuaaliympäristössä komennolla:

```bash
coverage run --branch -m pytest src
```

Komennon `--branch` flagillä pystymme keräämään testien [haarautumakattavuuden](https://coverage.readthedocs.io/en/coverage-4.3.2/branch.html). Huomaa, että `pytest src`-komento rajaa testien etsinnän projektin juurihakemistossa sijaitsevaan _src_-hakemistoon. Komennon suorittamisen jälkeen voimme tulostaa komentoriville raportin kerätystä testikattavuudesta komennolla:

```bash
coverage report -m
```

Tulostuksesta huomaamme, että raportissa on suuri määrä projektin kannalta turhia tiedostoja. Voimme konfiguroida, mistä tiedostoista testikattavuutta kerätään projektin juurihakemiston _.coveragerc_-tiedostossa. Jos haluamme sisällyttää testikattavuuteen vain projektin _src_-hakemiston, on konfiguraatio seuraava:

```
[run]
source = src
```

**HUOM:** _src_-hakemiston alahakemistoissa (ei siis itse _src_-hakemistossa) tulee olla tyhjät <i>\_\_init\_\_.py</i>-tiedostot, jotta testikattavuudeen sisällytetään kaikki halutut tiedostot. [Referenssisovelluksessa]({{site.python_reference_app_url}}) tapauksessa <i>\_\_init\_\_.py</i>-tiedostot on lisätty seuraavasti:

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

Nyt komentojen `coverage run --branch -m pytest src` ja `coverage report -m` suorittaminen sisällyttää vain haluamamme _src_-hakemiston tiedostot.

### Visuaalisempi testikattavuusraportti

Komentoriviltä luettavaa raporttia selkeämmän esitysmuodon voi generoida komennolla:

```bash
coverage html
```

Komennon suorittaminen luo projektin juurihakemistoon hakemiston _htmlcov_. Raporttia voi katsoa selaimessa avaamalla hakemiston tiedoston _index.html_ selaimen kautta. Selaimessa aukeava raportti näyttää kutakuinkin seuraavalta:

![](/assets/images/python/coverage-raportti.png)

Raportista näemme, että koko koodin haaraumakattavuus on 95%. Yksittäisen tiedoston haaraumakattavuuden näemme taulukon "coverage"-sarakkeesta. Jos klikkaamme taulukosta yksittäisen tiedoston nimeä aukeaa tiedoston koodi ja testien siinä kattamat haarat. Katetut haarat näkyvät vihreinä palkkeina rivinumeron vieressä. Haarat, joita ei ole katettu ollenkaan, on korostettu punaisella värillä. Sen sijaan, jos haara on osittain katettu, se on korostettu keltaisella värillä. Viemällä hiiri rivin päälle, nähdään tarkempi selitys, miksi haaraa ei ole täysin katettu:

![](/assets/images/python/coverage-tiedosto.png)

Kuvan tilanteessa if-ehto ei koskaan saanut arvoa `True`, joten kyseistä haaraa ei testeissä käsitelty.

### 📝 Tehtävä 7: Testikattavuus

Unicafe-projektiin on valmiiksi konfiguroitu käytettäväksi [coverage](https://coverage.readthedocs.io/en/coverage-5.3/)-työkalu, joka mittaa testien haarautumakattavuuden. Testikattavuuden konfiguraatiossa käytettävä, _.coveragerc_-tiedoston sisältö on projektissa seuraava:

```
[run]
source = src
omit = src/tests/**,src/index.py
```

Testikattavuuden kerääminen testeistä onnistuu virtuaaliympäristössä komennolla `coverage run --branch -m pytest src`. Komennon suorittamisen jälkeen kattavuusraportin voi muodostaa komennolla `coverage html`. Komennon suorittaminen luo projektin juurihakemistoon hakemiston _htmlcov_. Avaamalla hakemiston tiedoston _index.html_ selaimessa aukeaa seuraavan näköinen raportti:

![Testikattavuusraportti]({{ "/assets/images/python/unicafe-coverage.png" | absolute_url }})

Huomaa, että oma raporttisi tuskin näyttää täysin tältä (etenkin kattavuusprosenttien osalta) edellisen tehtävien testien toteutuksen jälkeen. Yksittäistä moduulia klikkaamalla näet punaisella korostuksella haarat, joita testit eivät kata vielä lainkaan ja keltaisella korostuksella haarat, joita testit kattavat vain osittain.

**Jos maksukortin koodissa on vielä rivejä tai haarautumia (merkitty punaisella) joille ei ole testiä, kirjoita sopivat testit.**

Jotta `coverage`-komennon generoimat tiedostot eivät päättyisi versionhallintaan, lisää _.gitignore_-tiedostoon vielä seuraavat rivit:

```
/laskarit/viikko2/unicafe/.coverage
/laskarit/viikko2/unicafe/htmlcov
```

### 📝 Tehtävä 8: Kassapäätteen testit

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

### 📝 Tehtävä 9: 100% testikattavuus

Varmista testikattavuuskomentojen avulla, että kassapäätteen testeillä on 100% haarautumakattavuus. Suorita siis virtuaaliympäristössä komennot `coverage run --branch -m pytest src` ja `coverage html`, jonka jälkeen avaa selaimessa _htmlcov/index.html_-tiedosto.

Jos testikattavuus ei ole vielä 100%, tee lisää testejä kunnes tilanne korjautuu. Tallenne edellisessä esimerkissä olevan testikattavuusraportin kuvan tyylinen [screenshot](https://www.take-a-screenshot.org/) projektisi kattavuusraportista palautusrepositoriosi hakemistoon _laskarit/viikko2_.

## Harjoitustyö

Kurssin pääpainon muodostaa viikolla 2 aloitettava harjoitustyö. Harjoitustyössä toteutetaan itsenäisesti ohjelmisto omavalintaisesta aiheesta. Tavoitteena on soveltaa ja syventää ohjelmoinnin perus- ja jatkokursseilla opittuja taitoja ja harjoitella tiedon omatoimista etsimistä. Harjoitustyötä tehdään itsenäisesti, mutta tarjolla on runsaasti [pajaohjausta](/#ajankohtaista).

Harjoitustyön on edettävä [viikottaisten tavoitteiden mukaan](/#aikataulu). Työ on saatava valmiiksi kurssin aikana ja sitä on toteutettava tasaisesti, muuten kurssi katsotaan keskeytetyksi. Samaa ohjelmaa ei voi jatkaa seuraavalla kurssilla (eli keväällä 2021), vaan työ on aloitettava uudella aiheella alusta. Muista varata riittävästi aikaa (10-15h viikossa) koko periodin ajaksi.

Koko kurssin arvostelu perustuu pääasiassa harjoitustyöstä saataviin pisteisiin. Osa pisteistä kertyy [aikatauluun](/#aikataulu) määriteltyjen viikoittaisten välitavoitteiden kautta, osa taas perustuu työn lopulliseen palautukseen.

### Harjoitustyön kieli ja ohjelmointikieli

Harjoitustyön ohjelmointikieli on Java tai Python.

Web-sovelluksia kurssilla ei sallita. Sovelluksissa sallitaan toki webissä olevat komponentit, mutta sovelluksen käyttöliittymän tulee olla niin sanottu työpöytäsovellus.

**Ohjelmakoodin muuttujat, luokat ja metodit kirjoitetaan englanniksi**. Dokumentaatio voidaan kirjoittaa joko suomeksi tai englanniksi.

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

### 🧪 Harjoitustyö 1: Alustava määrittelydokumentti

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

### 🧪 Harjoitustyö 2: Työaikakirjanpito

Pidä säännöllisesti kirjaa käyttämistäsi työtunneista. Käytettyjen työtuntien määrä ei vaikuta arvosanaan, _mutta_ vajavaisesti pidetty työaikakirjanpito alentaa työn arvosanaa. **Tuntikirjanpitoon ei merkitä laskareihin käytettyä aikaa**.

Lisää repositorion _README.md_-tiedostoon linkki [työaikakirjanpitoon]({{site.python_reference_app_url}}/blob/master/dokumentaatio/tuntikirjanpito.md) ja sijoita tiedosto _dokumentaatio_-hakemistoon.
