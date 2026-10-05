---
layout: page
permalink: /python/viikko2
title: Viikko 2
---

{% include java_materiaali_info.md %}

{% include deadline_info.md deadline=site.wk2dl %}

Tämän viikon tehtävien palautuksesta on tarjolla 2 pistettä ja harjoitustyön palautuksesta 1 piste.

Tee palautettavia tehtäviä varten repositorion sisällä olevaan hakemistoon _laskarit_ uusi alihakemisto _viikko2_.

## Uv ja riippuvuuksien hallinta

Laajoissa ja monimutkaisissa ohjelmistoprojekteissa kaiken koodin tuottaminen itse ei ole enää käytännöllistä. Ei ole esimerkiksi järkevää, että jokaisessa ohjelmistoprojektissa toteutetaan oma ohjelmointirajapinta tietokantaoperaatioille, tai sovelluskehys koodin testaamiseen. Jotta pyörää ei tarvitsisi aina keksiä uudelleen, ovat ohjelmistokehittäjät kehittäneet valtavan määrän avoimen lähdekoodin _kirjastoja_, joita jokainen voi hyödyntää projekteissaan.

Kirjastojen lähdekoodi on usein luettavissa versionhallinta-alustoilla, kuten GitHubissa. Usein kirjastoja päivitetään jatkuvasti ja nämä päivitykset synnyttävät kirjastoista uusia _versioita_. Kirjastojen versioita julkaistaan erilaisiin rekistereihin, joista ne ovat helposti asennettavissa. [The Python Package Index](https://pypi.org/) (PyPI) on eräs tämän kaltainen, Python-kirjastoille tarkoitettu rekisteri.

Projektissa käytettävät kirjastojen versiot ovat projektin _riippuvuuksia_. Riippuvuuksia asennetaan Python-projekteissa tyypillisesti projektikohtaisiin _virtuaaliympäristöihin_, jottei samalla tietokoneella olevien projektien riippuvuuksissa syntyisi ristiriitoja. Jotta riippuvuuksien ja virtuaaliympäristöjen hallinta sujuisi helposti, käytämme kurssilla [uv](https://docs.astral.sh/uv/)-komentorivityökalua. uv on nopea, Rustilla toteutettu työkalu, joka hoitaa samalla kertaa niin Python-versioiden, virtuaaliympäristöjen kuin riippuvuuksienkin hallinnan.

**Huom:** _älä käytä kurssilla pip-komentoja, vaikka olisit aiemmin sellaisilla riippuvuuksia asentanutkin!_

### Miksi uv?

Python-ekosysteemissä on tarjolla useita kilpailevia työkaluja riippuvuuksien ja virtuaaliympäristöjen hallintaan. Tunnetuimpia ovat mm. suoraan Pythonin mukana tulevat [pip](https://pypi.org/project/pip/) ja [venv](https://docs.python.org/3/library/venv.html), sekä kolmannen osapuolen työkalut [Poetry](https://python-poetry.org/), [Pipenv](https://pipenv.pypa.io/) ja [conda](https://docs.conda.io/).

- **pip + venv** ovat Pythonin standardikirjaston työkaluja, eli mitään ylimääräistä ei tarvitse asentaa. Työkalujen käyttö on kuitenkin melko käsityötä: virtuaaliympäristö pitää itse luoda ja aktivoida, riippuvuudet listataan usein pelkkään _requirements.txt_-tiedostoon ilman kunnollista versiolukkoa, eikä työkalu osaa hallita käytettävää Python-versiota.
- **Poetry** toi Python-maailmaan kunnollisen riippuvuuslukituksen (_poetry.lock_) ja siistin _pyproject.toml_-pohjaisen projektinhallinnan, mutta on huomattavasti uv:tä hitaampi, eikä osaa asentaa tai hallita Python-versioita itse.
- **conda** on suunniteltu erityisesti data-analytiikan ja tieteellisen laskennan tarpeisiin, ja osaa asentaa myös ei-Python-riippuvuuksia (esim. C-kirjastoja), mutta on raskas ja hidas yleiskäyttöiseen sovelluskehitykseen.

uv:n suurimmat edut kilpailijoihinsa nähden ovat:

- **Nopeus.** uv on toteutettu Rustilla ja on riippuvuuksien asennuksessa tyypillisesti kymmeniä kertoja nopeampi kuin pip tai Poetry.
- **Kaikki yhdessä työkalussa.** uv hoitaa sekä Python-versioiden, virtuaaliympäristöjen että riippuvuuksien hallinnan, eikä erillisiä työkaluja (esim. pyenv) tarvita.
- **Yksinkertainen, standardeja noudattava projektirakenne.** uv käyttää Pythonin virallisen [PEP 621](https://peps.python.org/pep-0621/) -standardin mukaista _pyproject.toml_-muotoa, mikä tekee projekteista yhteensopivia myös muiden työkalujen kanssa.
- **Aktiivinen kehitys.** uv on tällä hetkellä Python-yhteisössä nopeimmin yleistyvä riippuvuudenhallintatyökalu, ja sen taustalla oleva [Astral](https://astral.sh/) kehittää myös muita suosittuja Python-työkaluja, kuten [Ruff](https://docs.astral.sh/ruff/)-linteriä.

### Huomioita komennoista

Monilla tietokoneilla Python-version kolme komennot suoritetaan `python3`-komennolla komennon `python` sijaan. Tarkista käytössä oleva versio komennolla:

```bash
python3 --version
```

Jos komentoa `python3` ei jostain syystä löydy, tarkista `python`-komennon käyttämä versio komennolla:

```bash
python --version
```

Jos molemmissa tapauksissa versio on alle {{site.python_version}}, ei hätää: uv osaa itse asentaa ja hallita Python-versioita, joten erillistä Python-asennusta ei välttämättä tarvita, katso alempaa.

_Kurssilla käytetään uv:n versiota 0.12 (tai uudempaa). Jos koneellasi on vanhempi versio, se on syytä päivittää komennolla `uv self update`!_

### Asennus

Ennen kuin pääsemme tutustumaan uv:n käyttöön tarkemmin, tulee se ensin asentaa. Seuraa alla olevista ohjeista tietokoneesi käyttöjärjestelmälle sopivaa asennusohjetta, kannattaa toki vilkaista myös uv:n [virallinen](https://docs.astral.sh/uv/getting-started/installation/) asennusohje.

**HUOM:** kaikki asennustavat saattavat vaatia terminaali-ikkunan sulkemisen ja uudelleen avaamisen, jotta uv:n komennot alkavat toimia.

#### Linux- ja macOS-asennus

Asenna uv suorittamalla terminaalissa seuraava komento:

```bash
curl -LsSf https://astral.sh/uv/install.sh | sh
```

Asennusskripti lisää uv-binäärin polun automaattisesti `PATH`-muuttujaan (tyypillisesti hakemisto _$HOME/.local/bin_). Käynnistä terminaali uudestaan ja varmista, että asennus onnistui suorittamalla komento `uv --version`. Komennon pitäisi tulostaa asennettu versio.

#### Windows-asennus

Asenna uv suorittamalla PowerShellissä seuraava komento:

```powershell
powershell -ExecutionPolicy ByPass -c "irm https://astral.sh/uv/install.ps1 | iex"
```

Käynnistä terminaali uudestaan ja varmista, että asennus onnistui suorittamalla komento `uv --version`. Komennon pitäisi tulostaa asennettu versio.

### Python-version hallinta

uv osaa myös asentaa Python-versioita itse, erillistä Python-asennusta ei siis välttämättä tarvita. Voit asentaa esimerkiksi Python-version {{site.python_version}} komennolla:

```bash
uv python install {{site.python_version}}
```

Asennetut versiot näkee komennolla:

```bash
uv python list
```

Kun projekti alustetaan alla kuvatulla tavalla vaatimalla tietty Python-versio, uv asentaa version automaattisesti tarvittaessa, eikä erillistä `uv python install`-komennon suorittamista välttämättä tarvita.

### Projektin alustaminen

Harjoitellaan uv:n käyttöä tekemällä pieni esimerkkiprojekti. Luo hakemisto _uv-testi_ haluamaasi hakemistoon. Avaa hakemisto terminaalissa ja suorita siellä komento:

```bash
uv init --python {{site.python_version}} --no-package
```

Komennon yhteydessä annettu `--python {{site.python_version}}`-asetus asettaa projektin Python-version vaatimukseksi vähintään version {{site.python_version}}. uv ei kysy komennon suorittamisen yhteydessä kysymyksiä, vaan luo tarvittavat tiedostot suoraan valmiiksi täytettynä.

`--no-package`-asetus on tärkeä: ilman sitä `uv init` alustaa projektin oletusarvoisesti asennettavaksi _paketiksi_, jolloin se luo mm. _src_-hakemistoon oman alihakemiston projektin nimellä, sekä _pyproject.toml_-tiedostoon `[build-system]`-osion. Tällä kurssilla teemme projekteista yksinkertaisempia sovelluksia, emme julkaistavia paketteja, joten `--no-package` pitää projektin rakenteen siistinä.

Komennon suorittamisen jälkeen hakemistoon ilmestyy muutama tiedosto: _pyproject.toml_, _.python-version_, _README.md_ sekä _main.py_. Tiedosto _.python-version_ kertoo, mitä Python-versiota projektissa oletusarvoisesti käytetään. Tiedoston _pyproject.toml_ sisältö on kutakuinkin seuraava:

```
[project]
name = "uv-testi"
version = "0.1.0"
description = "Add your description here"
readme = "README.md"
requires-python = ">={{site.python_version}}"
dependencies = []
```

Osiossa `[project]` näemme mm. `uv init`-komennon suorituksen yhteydessä asettamamme Python-version vaatimuksen, joka on muotoa `requires-python = ">={{site.python_version}}"`. Merkintä tarkoittaa, että projektin käyttö vaatii vähintään Python-version {{site.python_version}}. Kohta `dependencies` puolestaan tulee sisältämään projektin riippuvuudet, kun niitä lisätään.

Poistetaan lopuksi vielä tiedostoon `uv init`-komennon luoma esimerkkitiedosto _main.py_ turhana, sillä kirjoitamme koodimme myöhemmin hakemistoon _src_.

### Riippuvuuksien asentaminen

**Huom:** _älä käytä kurssilla pip-komentoja, vaikka olisit aiemmin sellaisilla riippuvuuksia asentanutkin!_

Asennetaan seuraavaksi projektiimme ensimmäisen riippuvuus. Riippuvuuksien löytäminen onnistuu helpoiten Googlettamalla ja etsimällä hakutuloksista sopivia GitHub-repositorioita, tai PyPI-sivuja. Asennetaan esimerkkinä projektiimme [cowsay](https://pypi.org/project/cowsay/)-kirjasto. Tämä onnistu projektin juurihakemistossa (samassa hakemistossa, missä _pyproject.toml_-tiedosto sijaitsee) komennolla:

```bash
uv add cowsay
```

Asennuksen komento on siis muotoa `uv add <kirjasto>`. Komennon suorittamisen jälkeen huomaamme, että _pyproject.toml_-tiedoston `dependencies`-kohtaan on ilmestynyt uutta sisältöä:

```
dependencies = [
    "cowsay>=6.1",
]
```

`uv add`-komento asentaa oletusarvoisesti kirjaston uusimman version, joka oli komennon suoritushetkellä `6.1`. Usein tämä on juuri se, mitä haluamme tehdä. Voimme kuitenkin asentaa halutessamme esimerkiksi cowsay-kirjaston version `5.0` komennolla:

```bash
uv add cowsay==5.0
```

Jos haluaisimme poistaa kirjaston projektimme riippuvuuksien joukosta, se onnistuisi komennolla:

```bash
uv remove cowsay
```

Pidetään kuitenkin cowsay-kirjasto toistaiseksi asennettuna.

Riippuvuuksien lisäämisen ja poistamisen yhteydessä uv päivittää projektin virtuaaliympäristön automaattisesti (hakemistoon _.venv_, joka luodaan projektin juureen) sekä tiedoston _uv.lock_. Tiedosto sisältää kaikkien asennettujen riippuvuuksien tarkat versiotiedot, joiden avulla uv pystyy aina asentamaan täsmälleen samat versiot. Tästä syystä tiedosto tulee lisätä versionhallintaan.

Hakemistoa _.venv_ ei sen sijaan _tule tallentaa_ versionhallintaan, eli se on syytä lisätä heti tiedostoon _.gitignore_.

Jos haluat pelkästään varmistaa, että kaikki _pyproject.toml_-tiedostossa määritellyt riippuvuudet on asennettu (esim. kloonattuasi jonkun toisen tekemän projektin), onnistuu se komennolla:

```bash
uv sync
```

Komento tekee tarvittaessa myös virtuaaliympäristön alustamisen. Käytännössä komentoa ei useinkaan tarvitse suorittaa erikseen, sillä esimerkiksi seuraavassa kappaleessa esiteltävä `uv run`-komento synkronoi riippuvuudet automaattisesti ennen suoritusta.

### Komentojen suorittaminen virtuaaliympäristössä

Lisätään seuraavaksi _uv-testi_-hakemistoon hakemisto _src_ ja sinne tiedosto _index.py_. Lisätään tiedostoon seuraavat koodirivit:

```python
import cowsay

cowsay.tux("uv is awesome!")
```

Koodissa käytämme `import`-lausetta saadaksemme cowsay-kirjaston käyttöömme. Jos suoritamme tiedoston terminaalissa komennolla:

```bash
python3 src/index.py
```

On lopputuloksena seuraava virheilmoitus:

```
ModuleNotFoundError: No module named 'cowsay'
```

Tämä johtuu siitä, että emme ole projektin virtuaaliympäristön sisällä, jonka vuoksi Python ei löydä projektimme riippuvuuksia. Asia korjaantuu käyttämällä [run](https://docs.astral.sh/uv/reference/cli/#uv-run)-komentoa:

```bash
uv run python3 src/index.py
```

`uv run`-komento siis suorittaa annetun komennon virtuaaliympäristössä, jonka sisällä Python löytää riippuvuutemme. Komento myös varmistaa ennen suoritusta, että riippuvuudet ovat ajan tasalla (eli tekee tarvittaessa `uv sync`-komennon suorittaman toimenpiteen).

Kun projektia kehitetään aktiivisesti ja komentoja suoritetaan terminaalissa jatkuvasti, voi olla kätevää olla koko ajan virtuaaliympäristön sisällä, sen sijaan että jokaisen komennon eteen kirjoittaa `uv run`. Tämä onnistuu aktivoimalla virtuaaliympäristö suoraan komennolla:

```bash
source .venv/bin/activate
```

(Windowsilla vastaava komento on `.venv\Scripts\activate`.)

Kun olemme virtuaaliympäristössä, komentorivin syöterivin edessä on suluissa virtuaaliympäristön nimi:

```bash
$ (uv-testi)
```

Virtuaaliympäristön sisällä voimme suorittaa komennon "normaalisti", eli ilman `uv run`-komentoa:

```bash
python3 src/index.py
```

Voimme lähteä virtuaaliympäristöstä komennolla `deactivate`.

### Kehityksenaikaiset riippuvuudet

uv:n avulla riippuvuuksia on mahdollista ryhmitellä niiden käyttötarkoituksen mukaan. Melko yleinen tapa ryhmitellä riippuvuuksia on ryhmitellä ne _kehityksen_ ja _suorituksen_ aikaisiksi riippuvuuksiksi. Kehitysaikaisia riippuvuuksia tarvitaan ohjelmiston kehityksen aikana, mutta ne eivät ole välttämättömiä ohjelman suorituksessa.

Komennon `uv add` suorittaminen asentaa oletusarvoisesti riippuvuudet tiedoston `dependencies`-kohtaan. Näiden riippuvuuksien lisäksi voimme asentaa projektiimme riippuvuuksia, joita tarvitsemme vain kehityksen aikana. Näitä riippuvuuksia ovat kaikki ne, joita itse sovelluksen käynnistäminen (esimerkiksi `python3 src/index.py`-komennon suorittaminen) ei tarvitse.

Kehityksenaikaisten riippuvuuksien asentaminen onnistuu antamalla `uv add`-komennolle `--dev`-flagi. Esimerkiksi pian tutuksi tulevan [pytest](https://pytest.org/)-kirjaston voi asentaa kehityksaikaiseksi riippuvuudeksi seuraavalla komennolla:

```bash
uv add pytest --dev
```

Komennon suorittaminen lisää pytest-kirjaston riippuvuudeksi _pyproject.toml_-tiedoston `[dependency-groups]`-osion `dev`-ryhmään:

```
[dependency-groups]
dev = [
    "pytest>=9.1.1",
]
```

Kehityksenaikaisten riippuvuuksien määritteleminen on kätevää, koska se vähentää asennettavien riippuvuuksien määrää tapauksessa, jossa haluamme vain suorittaa sovelluksen. Tässä tilanteessa riippuvuuksien asentamisen voi tehdä komennolla `uv sync --no-dev`.

**HUOM:** `uv run` synkronoi riippuvuudet automaattisesti ennen suoritusta, ja tekee tämän oletusarvoisesti _kehitysaikaiset riippuvuudet mukaan lukien_. Jos siis olet asentanut riippuvuudet komennolla `uv sync --no-dev`, palauttaa pelkkä `uv run`-komento kehitysaikaiset riippuvuudet takaisin asennetuksi. Jos haluat suorittaa komennon ilman kehitysaikaisia riippuvuuksia, käytä komentoa `uv run --no-dev`.

### Ratkaisuja yleisiin ongelmiin

#### Virtuaaliympäristö on sekaisin

Jos kohtaat oudon virheen, jonka epäilet johtuvan rikkoutuneesta virtuaaliympäristöstä tai riippuvuuksista, poista virtuaaliympäristö ja lukkotiedosto ja asenna riippuvuudet uudelleen, eli anna komennot:

```
rm -rf .venv
rm uv.lock
uv sync
```

Yritä tämän jälkeen uudelleen!

#### uv ei löydä oikeaa Python-versiota

Jos uv valittaa, ettei se löydä _pyproject.toml_-tiedostossa vaadittua Python-versiota, asenna vaadittu versio uv:n itsensä avulla:

```bash
uv python install {{site.python_version}}
```

ja suorita tämän jälkeen `uv sync` uudelleen.

#### uv:n itsensä päivittäminen

Jos epäilet käytössäsi olevan vanhentuneen uv:n version aiheuttavan ongelmia, päivitä se komennolla:

```bash
uv self update
```

ja yritä tämän jälkeen epäonnistunutta komentoa uudelleen.

## Unittest ja testaaminen

Tutustutaan yksikkötestien tekemiseen [unittest](https://docs.python.org/3/library/unittest.html)-sovelluskehyksen avulla. Yksikkötesteissä testauksen kohteena ovat ohjelman pienimmät rakenneosaset eli yksittäiset funktiot sekä luokkien oliot ja niiden metodit.

*Muistathan, että ChatGPT:n ja muiden tekoälypohjaisten välineiden (GitHub Copilot ym.) käyttö yksikkötestien generointiin on kurssilla kiellettyä.*

Käytetään esimerkkinä luokkaa `Maksukortti`, joka sisältää metodeja arvon lataamiseen ja eri arvoisten aterioiden ostamiseen:

```python
# aterioiden hinnat ovat senteissä
EDULLINEN = 250
MAUKAS = 400


class Maksukortti:
    def __init__(self, saldo):
        # saldo on senteissä
        self.saldo = saldo

    def syo_edullisesti(self):
        if self.saldo >= EDULLINEN:
            self.saldo -= EDULLINEN

    def syo_maukkaasti(self):
        if self.saldo >= MAUKAS:
            self.saldo -= MAUKAS

    def lataa_rahaa(self, maara):
        if maara < 0:
            return

        self.saldo += maara

        if self.saldo > 15000:
            self.saldo = 15000

    def __str__(self):
        saldo_euroissa = round(self.saldo / 100, 2)

        return "Kortilla on rahaa {:0.2f} euroa".format(saldo_euroissa)
```

**HUOM:** Kaikki raha-arvot, kuten maksukortin saldo ja aterioiden hinnat ovat senteissä. Huomaathan myös, että harjoitustyössä muuttujat, luokat ja metodit kirjoitetaan englanniksi vaikka kurssimateriaalissa onkin luettavuuden vuoksi käytetty suomenkielisiä nimiä.

---
### Tehtävä 1: Alkutoimet

Luo Labtooliin rekisteröimäsi repositorion hakemistoon _laskarit/viikko2_ hakemisto _maksukortti_. Suorita terminaalissa hakemiston sisällä tuttu, projektin alustamiseen vaadittava komento:

```bash
uv init --python {{site.python_version}} --no-package
```

Asennetaan projektiin kehityksen aikaiseksi riippuvuudeksi [pytest](https://docs.pytest.org/en/stable/)-sovelluskehys, joka helpottaa testien suorittamista. Riippuvuuden asentaminen onnistuu samassa hakemistossa komennolla:

```bash
uv add pytest --dev
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

Lisää tiedostoon _src/maksukortti.py_ edellä esitelty `Maksukortti`-luokan koodi. Tiedosto <i>\_\_init\_\_.py</i> on tyhjä, samoin kuin vielä tässä vaiheessa myös tiedosto `maksukortti_test.py`.`

### Tehtävä 2: Aloitetaan testien kirjoittaminen

Yritetään seuraavaksi suorittaa testejä. Siirrytään ensin virtuaaliympäristöön komennolla `source .venv/bin/activate`, jonka jälkeen suoritetaan komento `pytest src`. Komennon suorittaminen antaa ymmärtää, ettei yhtään testiä ole suoritettu. Syy on yksinkertaisesti siinä, ettemme ole vielä toteuttaneet yhtään testiä.

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

Komento `pytest src` etsii suoritettavia testejä projektin juurihakemiston _src_-hakemistosta, sekä rekursiivisesti kaikista sen alahakemistoista. Jotta pytest tietää, mitä testejä tulisi suorittaa, **tulee nimeämisessä noudattaa oikeita käytänteitä.** Nämä käytänteet ovat:

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
        # alustetaan maksukortti, jossa on 10 euroa (1000 senttiä)
        kortti = Maksukortti(1000)
        vastaus = str(kortti)

        self.assertEqual(vastaus, "Kortilla on rahaa 10.00 euroa")
```

Ensimmäinen rivi luo kortin, jonka saldoksi tulee 10 euroa. Testin on tarkoitus varmistaa, että konstruktorin parametrina oleva luku menee kortin alkusaldoksi. Tämä varmistetaan selvittämällä kortin saldo. Kortin saldo selviää kortin `__str__`-metodin muodostamasta merkkijonoesityksestä. Testin toinen rivi muodostaa `kortti`-muuttujan merkkijonoesityksen ja ottaa sen talteen muuttujaan `vastaus`. Viimeinen rivi tarkastaa onko vastaus sama kuin odotettu tulos, eli "Kortilla on rahaa 10.00 euroa".

Tarkastus tapahtuu unittestissä paljon käytettyä `assert`- eli väittämäkomentoa käyttäen. Komento testaa onko sille ensimmäisenä parametrina annettu odotettu tulos sama kuin toisena parametrina oleva testissä saatu tulos. Erilaisia [assert](https://docs.python.org/3/library/unittest.html#assert-methods)-metodeja on monia.

Suoritetaan seuraavaksi testi komennolla `pytest src` ja toivotaan, että testi menee läpi.

Vaihtoehtoinen tapa määritellä sama testi olisi seuraava:

```python
def test_konstruktori_asettaa_saldon_oikein(self):
    kortti = Maksukortti(1000)

    self.assertEqual(str(kortti), "Kortilla on rahaa 10.00 euroa")
```

Eli metodikutsun palauttamaa arvoa ei oteta erikseen talteen muuttujaan vaan sitä kutsutaan suoraan assertEqual-vertailun sisällä. Käy niin, että ennen kuin varsinainen vertailu suoritetaan, tehdään funktiokutsu ja vertailtavaksi tulee sen palauttama arvo.

Kannattaa varmistaa, että testi todellakin löytää virheet, eli muutetaan edellistä testiä siten että se ei mene läpi (assertEqual-metodissa väitetään että saldo olisi 9 euroa):

```python
def test_konstruktori_asettaa_saldon_oikein(self):
    kortti = Maksukortti(1000)

    self.assertEqual(str(kortti), "Kortilla on rahaa 9.00 euroa")
```

Testien suorittaminen antaa ymmärtää, ettei testiä suoritettu onnistuneesti. Jokaisesta virheellisestä testistä löytyy yksityiskohtainen selitys ongelman syystä. Lisäksi lopussa listataan kompaktimmassa muodossa virheelliset tiedostot ja metodit:

```
FAILED src/tests/maksukortti_test.py::TestMaksukortti::test_konstruktori_asettaa_saldon_oikein - AssertionError: 'Kortilla on rahaa 9.00 euroa' != 'Kortilla on rahaa 10.00 euroa'
```

Tehdään seuraavaksi testi, joka varmistaa, että kortin saldo pienenee kutsuttaessa metodia `syo_edullisesti`:

```python
def test_syo_edullisesti_vahentaa_saldoa_oikein(self):
    kortti = Maksukortti(1000)
    kortti.syo_edullisesti()

    self.assertEqual(str(kortti), "Kortilla on rahaa 7.50 euroa")
```

Jälleen testi alkaa kortin luomisella. Seuraavaksi kutsutaan kortin testattavaa metodia ja viimeisenä on rivi joka varmistaa, että tulos on haluttu, eli että kortin saldo on pienentynyt edullisen lounaan hinnan verran.

### Muutama huomio

Molemmat testit ovat yksinkertaisia ja testaavat vain yhtä asiaa, tämä on suositeltava käytäntö vaikka on mahdollista laittaa yhteen testiin useitakin `assertEqual`-metodin kutsuja. Testit on nimetty siten, että nimi kertoo selvästi sen mitä testi testaa. Lisäksi tulee aina muistaa käyttää metodin nimessä <i>test\_</i>-etuliitettä. Kaikki testit ovat toisistaan riippumattomia, esim. kortilla maksaminen ei vaikuta kortin saldoon kuin siinä testissä missä korttimaksu tapahtuu. Testien järjestyksellä testikoodissa ei ole merkitystä. Testit kannattaa ajaa mahdollisimman usein, eli aina kun teet testin (tai muutat normaalia koodia) aja testit!

Testimme ovat siinä mielessä hieman ikäviä, että ne testaavat maksukortin tilan muutosta maksukortin merkkijonoesityksen kautta. Voisimme myös muotoilla testin siten, että se varmistaa suoraan maksukortin oliomuuttujasta `saldo` että sen arvo on oikea maksetun ruokailun jälkeen:

```python
def test_syo_edullisesti_vahentaa_saldoa_oikein_2(self):
    kortti = Maksukortti(1000)
    kortti.syo_edullisesti()

    # varmistetaan että saldoa jäljellä 7.5 euroa eli 750 senttiä
    self.assertEqual(kortti.saldo, 750)
```

Tämäkin on hieman ikävää sillä voidaan ajatella, että kortin tapa toteuttaa saldon säilytys sentteinä on kortin sisäinen asia, jota kortin toteuttanut koodari saattaa jopa myöhemmin muuttaa.

Tehdäänkin kortille uusi metodi `saldo_euroina`, jonka avulla on mahdollista kysyä kortin saldoa euroina:

```python
class Maksukortti:
    # ...

    def saldo_euroina(self):
        return self.saldo / 100
```

Muutetaan testi käyttämään uutta metodia:

```python
def test_syo_edullisesti_vahentaa_saldoa_oikein_2(self):
    kortti = Maksukortti(1000)
    kortti.syo_edullisesti()

    self.assertEqual(kortti.saldo_euroina(), 7.5)
```

### Lisää testejä

Tehdään kaksi testiä lisää:

```python
def test_syo_maukkaasti_vahentaa_saldoa_oikein(self):
    kortti = Maksukortti(1000)
    kortti.syo_maukkaasti()

    self.assertEqual(kortti.saldo_euroina(), 6.0)

def test_syo_edullisesti_ei_vie_saldoa_negatiiviseksi(self):
    kortti = Maksukortti(200)
    kortti.syo_edullisesti()

    self.assertEqual(kortti.saldo_euroina(), 2.0)
```

Ensimmäinen testeistä tarkastaa, että maukkaasti syöminen vähentää saldoa oikein. Toinen testi varmistaa, että edullista lounasta ei voi ostaa jos kortin saldo on liian pieni.

### Testin alustustoimet

Huomaamme, että testikoodissamme on toistoa: kolme ensimmäistä testiä luovat kaikki samanlaisen 10 euron saldon omaavan kortin.

Siirrämmekin metodin luonnin testiluokassa määriteltyyn alustusmetodiin, `setUp`:

```python
class TestMaksukortti(unittest.TestCase):
    def setUp(self):
        self.kortti = Maksukortti(1000)

    def test_konstruktori_asettaa_saldon_oikein(self):
        self.assertEqual(str(self.kortti), "Kortilla on rahaa 10.00 euroa")


    def test_syo_edullisesti_vahentaa_saldoa_oikein(self):
        self.kortti.syo_edullisesti()

        self.assertEqual(self.kortti.saldo_euroina(), 7.5)

    def test_syo_maukkaasti_vahentaa_saldoa_oikein(self):
        self.kortti.syo_maukkaasti()

        self.assertEqual(self.kortti.saldo_euroina(), 6.0)

    def test_syo_edullisesti_ei_vie_saldoa_negatiiviseksi(self):
        kortti = Maksukortti(200)
        kortti.syo_edullisesti()

        self.assertEqual(kortti.saldo_euroina(), 2.0)

```

`setUp`-metodi suoritetaan **ennen jokaista testitapausta** (eli testimetodia). Jokainen testitapaus saa siis käyttöönsä `Maksukortti`-olion, jonka saldo on 10 euroa. Huomaa, että testien kohteena oleva maksukortti talletetaan testiluokan oliomuuttujaan `self.kortti = Maksukortti(1000)`-rivillä. Näin testimetodit pystyvät näkemään metodin `setUp` luoman maksukortin.

Testimetodit voivat myös alustaa eri käyttötarkoitukseen sopivia olioita, kuten on tehty testimetodissa `test_syo_edullisesti_ei_vie_saldoa_negatiiviseksi`. Huomaa, että tässä tapauksessa `self.kortti` viittaa `setUp`-metodissa alustettuun oliomuuttujaan, kun taas `kortti` metodin sisäiseen muuttujaaan.

### Lisää testejä

Tehdään vielä testi metodille `lataa_rahaa`. Ensimmäinen testi varmistaa, että lataus onnistuu ja toinen testaa, ettei kortin saldo kasva suuremmaksi kuin 150 euroa.

```python
def test_kortille_voi_ladata_rahaa(self):
    self.kortti.lataa_rahaa(2500)

    self.assertEqual(self.kortti.saldo_euroina(), 35.0)

def test_kortin_saldo_ei_ylita_maksimiarvoa(self):
    self.kortti.lataa_rahaa(20000)

    self.assertEqual(self.kortti.saldo_euroina(), 150.0)
```

### Tehtävä 3: Lisää testejä

Lisää lopuksi maksukortille seuraavat testit:

- Maukkaan lounaan syöminen ei vie saldoa negatiiviseksi, ota tähän mallia testistä `test_syo_edullisesti_ei_vie_saldoa_negatiiviseksi`
- Negatiivisen summan lataaminen ei muuta kortin saldoa
- Kortilla pystyy ostamaan edullisen lounaan, kun kortilla rahaa vain edullisen lounaan verran (eli 2.5 euroa)
- Kortilla pystyy ostamaan maukkaan lounaan, kun kortilla rahaa vain maukkaan lounaan verran (eli 4 euroa)

**HUOM:** On suositeltavaa, että yksi testi testaa vain "yhtä asiaa" kerrallaan. Tee siis jokaisesta ylläolevasta oma testinsä.

**HUOM:** Kirjoita `assertEqual`-komennot aina siten, että ensimmäisenä parametrina saatu tulos ja toisena parametrina on odotettu tulos. Esimerkiksi:

```python
self.assertEqual(str(kortti), "Kortilla on rahaa 2.00 euroa")
```

### Testit ovat toisistaan riippumattomia

Yllä jo mainittiin että testit ovat toisistaan riippumattomia eli molemmat testit toimivat siis kuin itsenäiset pienet funktiot. Mitä tämä oikein tarkoittaa?

Maksukorttia testataan usealla pienellä testimetodilla joista jokaisen nimi alkaa <i>test\_</i>-etuliitteellä. Jokainen erillinen testi testaa yhtä pientä asiaa, esim. että kortin saldo vähenee lounaan hinnan verran. On tarkoituksena, että jokainen testi aloittaa "puhtaalta pöydältä", eli ennen jokaista testiä luodaan alustuksen tekevässä `setUp`-metodissa uusi kortti.

Jokainen testi siis alkaa tilanteesta jossa kortti on juuri luotu. Tämän jälkeen testi joko kutsuu suoraan testattavaa metodia tai ensin saa aikaan sopivan alkutilanteen ja tämän jälkeen kutsuu testattavaa metodia. Näin tehtiin testimetodissa `test_syo_edullisesti_ei_vie_saldoa_negatiiviseksi`, jossa alustettiin erillinen maksukortti, jonka saldo ei riitä edullisen lounaan ostamiseen. Tämän avulla testattiin, ettei edullisen lounaan syöminen vie saldoa negatiiviseksi.

### Onko jo testattu tarpeeksi?

Olemme tyytyväisiä ja uskomme, että testitapauksia on nyt riittävästi. Mutta onko tosiaan näin? Onneksi on olemassa työkaluja, joilla voidaan selvittää testien kattavuus. Palaamme aiheeseen [myöhemmässä](#coverage-ja-testikattavuus) osiossa. Testikattavuuden mittaus kuitenkin paljastaa, että koodi on melko kattavasti testattu. Ainoa testien tutkimatta jättämä asia on tilanne, jossa kortille yritetään ladata negatiivinen saldo. 

### Testiluokka vielä kokonaisuudessaan

```python
import unittest
from maksukortti import Maksukortti

class TestMaksukortti(unittest.TestCase):
    def setUp(self):
        self.kortti = Maksukortti(1000)

    def test_konstruktori_asettaa_saldon_oikein(self):
        self.assertEqual(str(self.kortti), "Kortilla on rahaa 10.00 euroa")


    def test_syo_edullisesti_vahentaa_saldoa_oikein(self):
        self.kortti.syo_edullisesti()

        self.assertEqual(self.kortti.saldo_euroina(), 7.5)

    def test_syo_maukkaasti_vahentaa_saldoa_oikein(self):
        self.kortti.syo_maukkaasti()

        self.assertEqual(self.kortti.saldo_euroina(), 6.0)

    def test_syo_edullisesti_ei_vie_saldoa_negatiiviseksi(self):
        kortti = Maksukortti(200)
        kortti.syo_edullisesti()

        self.assertEqual(kortti.saldo_euroina(), 2.0)

    def test_kortille_voi_ladata_rahaa(self):
        self.kortti.lataa_rahaa(2500)

        self.assertEqual(self.kortti.saldo_euroina(), 35.0)

    def test_kortin_saldo_ei_ylita_maksimiarvoa(self):
        self.kortti.lataa_rahaa(20000)

        self.assertEqual(self.kortti.saldo_euroina(), 150.0)

```

### Tehtävä 4: Maksukortti ja kassapääte

**HUOM:** tämä tehtävä tehdään **eri projektiin** kuin edellinen, ja vaikka molemmissa tehtävissä on samanniminen luokka, eli `Maksukortti`-luokat ovat erilaiset, eli **älä** copypastaa edellisen tehtävän koodia tai tehtäviä tähän tehtävään.

Tämän tehtävän projekti _ladataan internetistä_ hieman alempana olevan ohjeen mukaan.

Tehtävä pohjautuu sovellukseen, jonka tarkoituksena on toteuttaa [Unicafe](https://unicafe.fi/)-ruokalan kassapääte. Kassapäätteen avulla voidaan ostaa eri hintaisia aterioita joko maksukortilla tai käteisellä.

Maksukortilla on mahdollisuus ladata sille rahaa ja ottaa siltä rahaa maksuja varten. Ohjelmointiuraansa aloittelevan tuttavasi vastaus seuraavassa:

```python
class Maksukortti:
    def __init__(self, saldo):
        # saldo on senteissä
        self.saldo = saldo

    def lataa_rahaa(self, maara):
        self.saldo += maara

    def ota_rahaa(self, maara):
        if self.saldo < maara:
            return False

        self.saldo = self.saldo - maara
        return True

    def saldo_euroina(self):
        return self.saldo / 100

    def __str__(self):
        saldo_euroissa = round(self.saldo / 100, 2)

        return "Kortilla on rahaa {:0.2f} euroa".format(saldo_euroissa)
```

Kassapäätteelle on metodeja eri hintaisten aterioiden ostamiselle ja rahan lataamiselle kortille:

```python
class Kassapaate:
    def __init__(self):
        # kassan rahamäärä on senteissä
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

    def kassassa_rahaa_euroina(self):
        return self.kassassa_rahaa / 100
```

Kun luokkia on kaksi, pääsemme hetken päästä testaamaan niiden yhteistyötä eli suorittamaan **integraatiotestausta**.

**Hae nyt projektin koodi koneellesi**. Avaa terminaali, mene palautusrepositoriosi hakemistoon _laskarit/viikko2_ ja suorita seuraavat komennot:

```bash
wget https://github.com/ohjelmistotekniikka-hy/ohjelmistotekniikka-hy.github.io/raw/master/materiaali/python/unicafe.zip
unzip unicafe.zip
rm unicafe.zip
```

**HUOM:** jos käytät Windowsia ja koneellasi ei ole käytössä komentoa _wget_ lataa tehtävän koodi klikkaamalla yllä olevaa linkkiä. Muista siirtää projekti repositorion alle oikeaan hakemistoon!

Lisää ja commitoi hakemisto repositorioon. Varmista komennolla `git status`, että working directory on puhdas ja kaikki on commitoitu:

```bash
On branch master
Your branch is ahead of 'origin/master' by 3 commits.
  (use "git push" to publish your local commits)
nothing to commit, working tree clean
```

Siirry terminaalissa _unicafe_-hakemistoon ja suorita seuraavat tutut komennot:

```
uv init --python {{site.python_version}} --no-package
uv add pytest --dev
source .venv/bin/activate
pytest src
```

Jos kaikki on kunnossa, saat raportin läpimenneistä testeistä:

```
collected 1 item

src/tests/maksukortti_test.py .                          [100%]

====================== 1 passed in 0.03s ======================
```

### Tehtävä 5: .gitignore

Kun testien jälkeen suoritat komennon `git status`, huomaat että projektin juureen on ehkä ilmestynyt uusi hakemisto <i>.pytest_cache</i>, joka ei ole gitin alaisuudessa:

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
.pytest_cache
```

Tee näin siinäkin tapauksessa jos hakemistoa <i>.pytest_cache</i> ei sinulla näkynyt. Kun nyt teet komennon `git status` pitäisi tuloksen olla seuraava:

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
- Rahan ottaminen toimii:
  - Saldo vähenee oikein, jos rahaa on tarpeeksi
  - Saldo ei muutu, jos rahaa ei ole tarpeeksi
  - Metodi palauttaa _True_, jos rahat riittivät ja muuten _False_

Suorita testit terminaalissa virtuaaliympäristössä `pytest src`-komennolla.

## Komentojen suorittaminen Visual Studio Codessa

Visual Studio Coden voi avata Linux-ympäristössä esim. siirtymällä hakemistoon _unicafe_ ja antamalla komennon `code .`. Visual Studio Codesta löytyy sisäänrakennettu terminaali. Terminaalin saa avattua valitsemalla päävalikosta _Terminal_ ja aukeavasta alavalikosta _New Terminal_. Editorin alalaitaan pitäisi ilmestyä terminaali, jossa voit suorittaa komentorivikomentoja.

Terminaalin avaaminen saattaa automaattisesti avata komentorivin virtuaaliympäristössä, ainakin jos olit virtuaaliympäristössä silloin kun avasit itse Visual Studio Coden. Jos olet virtuaaliympäristössä, on komentorivin syöterivin alussa tästä tieto sulkeiden sisällä. Jos et ole virtuaaliympäristössä pääset siihen tuttuun tapaan komennolla `source .venv/bin/activate`. Tämän jälkeen voit suorittaa komentoja suoraan Visual Studio Codessa:

![Visual Studio Code terminaali]({{ "/assets/images/python/vscode-terminaali.png" | absolute_url }})

Voit vaihtoehtoisesti kokeilla seuraavaa: lisää hakemisto _unicafe_ Visual Studio Coden "workspaceen" _File_-valikon kautta, tallenna tämä workspace samaan _unicafe_-hakemistoon ja avaa Visual Studio Coden terminaali uudelleen. Valitse oikea virtuaaliympäristö Visual Studio Coden ikkunan oikeasta alareunasta (kun _maksukortti.py_ tai _kassapaate.py_ on avattuna).

## Coverage ja testikattavuus

On olemassa työkaluja, joilla voidaan tarkastaa testien rivi- ja haarautumakattavuus. _Rivikattavuus_ mittaa mitä koodirivejä testien suorittaminen on tutkinut. Täydellinen rivikattavuuskaan ei tietenkään takaa että ohjelma toimii oikein, mutta on parempi kuin ei mitään. _Haarautumakattavuus_ taas mittaa mitä eri suoritushaaroja koodista on käyty läpi. Suoritushaaroilla tarkoitetaan esimerkiksi if-komentojen valintatilanteita. Haarautumakattavuus antaa yleensä realistisemman kuvan kuin rivikattavuus, mutta sekään ei yksin riitä kuvaamaan testien laatua.

### Testikattavuusraportti

Testikattavuuden kerääminen testien suorituksesta onnistuu [coverage](https://coverage.readthedocs.io/en/latest/)-työkalun avulla. Sen asentamisen projektin kehityksen aikaiseksi riippuvuudeksi onnistuu tuttuun tapaan komennolla:

```bash
uv add coverage --dev
```

Testikattavuuden kerääminen `pytest src`-komennolla suoritetuista testeistä onnistuu virtuaaliympäristössä komennolla:

```bash
coverage run --branch -m pytest src
```

Komennon `--branch` flagillä pystymme keräämään testien [haarautumakattavuuden](https://coverage.readthedocs.io/en/latest/branch.html). Huomaa, että `pytest src`-komento rajaa testien etsinnän projektin juurihakemistossa sijaitsevaan _src_-hakemistoon. Komennon suorittamisen jälkeen voimme tulostaa komentoriville raportin kerätystä testikattavuudesta komennolla:

```bash
coverage report -m
```

Voimme konfiguroida, mistä tiedostoista testikattavuutta kerätään projektin juurihakemiston _.coveragerc_-tiedostossa. Jos haluamme sisällyttää testikattavuuteen vain projektin _src_-hakemiston, on konfiguraatio seuraava:

```
[run]
source = src
```

**HUOM:** _src_-hakemiston **alahakemistoissa** (ei siis itse _src_-hakemistossa) tulee olla tyhjät <i>\_\_init\_\_.py</i>-tiedostot, jotta testikattavuuteen sisällytetään kaikki halutut tiedostot. [Referenssisovelluksessa]({{site.python_reference_app_url}}) <i>\_\_init\_\_.py</i>-tiedostot on lisätty seuraavasti:

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

Voimme jättää testikattavuuden ulkopuolelle tiedostoja ja hakemistoja. Järkevää voisi olla esimerkiksi jättää testihakemisto, käyttöliittymän koodin hakemisto ja _src/index.py_-tiedosto testikattavuuden ulkopuolelle. Tämä onnistuu seuraavalla muutoksella _.coveragerc_-tiedostoon:

```
[run]
source = src
omit = src/**/__init__.py,src/tests/**,src/ui/**,src/index.py
```

Nyt komentojen `coverage run --branch -m pytest src` ja `coverage report -m` suorittaminen sisällyttää vain haluamamme _src_-hakemiston tiedostot. Vastaavaa _.coveragerc_-tiedostoa voi käyttää harjoitustyössäkin.

### Visuaalisempi testikattavuusraportti

Komentoriviltä luettavaa raporttia selkeämmän esitysmuodon voi generoida komennolla:

```bash
coverage html
```

Komennon suorittaminen luo projektin juurihakemistoon hakemiston _htmlcov_. Raporttia voi katsoa selaimessa avaamalla hakemiston tiedoston _index.html_ selaimen kautta. Selaimessa aukeava raportti näyttää kutakuinkin seuraavalta:

![](/assets/images/python/coverage-raportti_v7.png)

Raportista näemme, että koko koodin testikattavuus on 94%.

Yksittäisen tiedoston haaraumakattavuuden näemme taulukon "coverage"-sarakkeesta. Jos klikkaamme taulukosta yksittäisen tiedoston nimeä aukeaa tiedoston koodi ja testien siinä kattamat haarat. Katetut haarat näkyvät vihreinä palkkeina rivinumeron vieressä. Haarat, joita ei ole katettu ollenkaan, on korostettu punaisella värillä. Sen sijaan, jos haara on osittain katettu, se on korostettu keltaisella värillä. Viemällä hiiri rivin päälle, nähdään tarkempi selitys, miksi haaraa ei ole täysin katettu:

![](/assets/images/python/coverage-tiedosto.png)

Kuvan tilanteessa if-ehto ei koskaan saanut arvoa `True`, joten kyseistä haaraa ei testeissä käsitelty.

---
### Tehtävä 7: Testikattavuus

Asenna coverage Unicafe-projektiin kehityksenaikaiseksi riippuvuudeksi komennolla 

```bash
uv add coverage --dev
```

Lisää projektin juurihakemistoon (unicafe) _.coveragerc_-tiedosto, jonka sisältö on seuraava:

```
[run]
source = src
omit = src/tests/**,src/index.py
```

Testikattavuuden kerääminen testeistä onnistuu virtuaaliympäristössä komennolla `coverage run --branch -m pytest src`. Komennon suorittamisen jälkeen kattavuusraportin voi muodostaa komennolla `coverage html`. Komennon suorittaminen luo projektin juurihakemistoon hakemiston _htmlcov_. Avaamalla hakemiston tiedoston _index.html_ selaimessa aukeaa suurinpiirtein seuraavan näköinen raportti:

![Testikattavuusraportti]({{ "/assets/images/python/unicafe-coverage_v7.png" | absolute_url }})

Oma raporttisi ei välttämättä näytä täysin tältä (etenkään kattavuusprosenttien osalta) edellisten tehtävien testien toteutuksen jälkeen. Yksittäistä moduulia klikkaamalla näet punaisella korostuksella haarat, joita testit eivät kata vielä lainkaan ja keltaisella korostuksella haarat, joita testit kattavat vain osittain.

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

Varmista, että kassapäätteen testeillä on 100% testikattavuus. Suorita siis virtuaaliympäristössä komennot `coverage run --branch -m pytest src` ja `coverage html`, jonka jälkeen avaa selaimessa _htmlcov/index.html_-tiedosto.

Jos testikattavuus ei ole vielä 100%, tee lisää testejä kunnes tilanne korjautuu. Tallenna edellisessä esimerkissä olevan testikattavuusraportin kuvan tyylinen [screenshot](https://www.take-a-screenshot.org/) projektisi kattavuusraportista palautusrepositoriosi hakemistoon _laskarit/viikko2_.

---
## Harjoitustyö

Kurssin pääpainon muodostaa viikolla 2 aloitettava harjoitustyö. Harjoitustyössä toteutetaan itsenäisesti ohjelmisto omavalintaisesta aiheesta. Tavoitteena on soveltaa ja syventää ohjelmoinnin perus- ja jatkokursseilla opittuja taitoja ja harjoitella tiedon omatoimista etsimistä. Harjoitustyötä tehdään itsenäisesti, mutta tarjolla on runsaasti [pajaohjausta](/#ajankohtaista).

Harjoitustyön on edettävä [viikottaisten tavoitteiden mukaan](/#aikataulu). Työ on saatava valmiiksi kurssin aikana ja sitä on toteutettava tasaisesti, muuten kurssi katsotaan keskeytetyksi. Samaa ohjelmaa ei voi jatkaa seuraavalla kurssilla (eli {{ site.next_course }}), vaan työ on aloitettava uudella aiheella alusta. Muista varata riittävästi aikaa (10-15h viikossa) koko periodin ajaksi.

Koko kurssin arvostelu perustuu pääasiassa harjoitustyöstä saataviin pisteisiin. Osa pisteistä kertyy [aikatauluun](/#aikataulu) määriteltyjen viikoittaisten välitavoitteiden kautta, osa taas perustuu työn lopulliseen palautukseen.

### Harjoitustyön kieli ja ohjelmointikieli

Harjoitustyön ohjelmointikieli on Python.

Web-sovelluksia kurssilla ei sallita. Sovelluksissa sallitaan toki webissä olevat komponentit, mutta sovelluksen käyttöliittymän tulee olla niin sanottu työpöytäsovellus.

**Ohjelmakoodin muuttujat, luokat ja metodit kirjoitetaan englanniksi**. Dokumentaatio voidaan kirjoittaa joko suomeksi tai englanniksi.

### Ohjelman toteutus

Toteutus etenee "iteratiivisesti ja inkrementaalisesti". Tämä tarkoittaa, että heti alussa toteutetaan pieni osa ohjelman toiminnallisuudesta. Ohjelman ydin pidetään koko ajan toimivana, uutta toiminnallisuutta lisäten, kunnes tavoiteltu ohjelman laajuus on saavutettu. Ohjelman rakenteeseen kannattaa kysyä vinkkejä pajasta, sekä ottaa mallia ohjelmoinnin jatkokurssin harjoitustehtävistä ja materiaalista. Muutamia vihjeitä on myös kurssin [referenssiprojektissa]({{site.python_reference_app_url}}) sekä [täällä](/python/toteutus).

Iteratiiviseen tapaan tehdä ohjelma liittyy kiinteästi automatisoitu testaus. Aina uutta toiminnallisuutta lisättäessä ja vanhaa muokatessa täytyy varmistua, että kaikki vanhat ominaisuudet toimivat edelleen. Kaiken testaaminen käsin uudelleen ja uudelleen ei ole ajankäytöllisesti järkevää, ja siksi ohjelmakoodille onkin syytä laatia jatkuvasti testejä ohjelmoinnin edetessä. Testit on syytä pitää kattavina ja ajan tasalla.

Jotta ohjelmaa pystyisi testaamaan, on tärkeää että sovelluslogiikkaa [ei kirjoiteta käyttöliittymän sekaan](/python/toteutus)!

Eräs mahdollisuus on tehdä aluksi tekstikäyttöliittymä ja vasta saatuasi ohjelman perustoiminnallisuuden toteutettua voit siirtyä graafisen käyttöliittymän toteutukseen. Graafinen käyttöliittymä on mahdollista myös jättää pois, mutta tämä [vaikuttaa arvosanaan](/python/arvosteluperusteet). Graafisen käyttöliittymän toteutukseen löytyy ohjeita [täällä](/python/tkinter). Pelin toteutukseen Pygame-kirjastolla löytyy ohjeita [täältä](/python/pygame).

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
- Kurssilla pääpaino on Ohjelmoinnin perusteissa ja jatkokurssilla opituissa asioissa
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
- **HUOMIO!** Kannattaa yrittää välttää aiheita, joissa pääpaino on tiedon säilömisessä tai käyttöliittymässä. Paljon tietoa säilövät, esim. yli 3 tietokantataulua tarvitsevat sovellukset ovat vaikeita testata tämän kurssin esitietovaatimusten puitteissa, ja ne sopivat yleensä paremmin kurssille Tietokannat ja web-ohjelmointi. Käyttöliittymäkeskeisissä aiheissa (esim. tekstieditori) voi olla vaikea keksiä sovelluslogiikkaa, joka on enemmän tämän kurssin painopiste (myös siksi koska käyttöliittymää ei tällä kurssilla yksikkötestata ja testaus on kurssin keskeinen aihe - jos ei ole sovelluslogiikkaa, on vaikea myös kirjoittaa sille testejä).

### Esimerkkejä aiheista

Oman aiheen ei ole pakko olla allaolevasta listasta. Listassa on kuitenkin erilaisia esimerkkejä, joista voi toteuttaa oman versionsa.

- Hyötyohjelmat
  - Jonkin kiinnostavan asian kirjanpito, kortistointi, tilastointi
  - Aritmetiikan harjoittelua
  - Tehtävägeneraattori, joka antaa käyttäjälle tehtävän sekä mallivastauksen (esim. matematiikkaa, fysiikkaa, kemiaa, ...)
  - Opintojen seurantajärjestelmä
  - Code Snippet Manageri
  - Laskin, funktiolaskin, graafinen laskin
  - Budjetointisovellus
  - HTML WYSIWYG-editor (What you see is what you get)
- Reaaliaikaiset pelit, esim. seuraavien inspiroimina:
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

Harjoitustyön tekeminen aloitetaan päättämällä aihe ja kuvaamalla se _alustavassa määrittelydokumentissa_, eli työlle tehdään [vaatimusmäärittely](/python/viikko1#vaatimusmäärittely).

Mikään ei tietenkään estä sitä, että aloitat jo ohjelmoinnin. Tämän viikon deadlinen pisteytyksessä ollaan kiinnostuneita ainoastaan määrittelydokumentista.

**HUOM:** jos aloitat jo ohjelmoinnin, muista että ohjelmakoodi tulee kirjoittaa englanniksi! Ohjelman käyttöliittymä ja dokumentaatio voivat olla suomeksi tai englanniksi. Ohjeet ohjelmoinnin aloittamiseen löytyvät [viikon 3](/python/viikko3#harjoitustyö) materiaalista.

Palautus tapahtuu lisäämällä oman aiheen _alustava määrittelydokumentti_ ensimmäisen viikon [laskareiden](/python/viikko1#labtool) päätteeksi [Labtooliin]({{site.labtool_link}}) rekisteröimääsi palautusrepositorioon.

Määrittelydokumentti tehdään samaan tapaan kuin [referenssiprojektissa]({{site.python_reference_app_url}}/blob/master/dokumentaatio/vaatimusmaarittely.md) eli [markdown](https://guides.github.com/features/mastering-markdown/)-muodossa. Sijoita _vaatimusmaarittely.md_-tiedosto repositorioon _dokumentaatio_-hakemistoon ja lisää repositorion _README.md_-tiedostoon _vaatimusmaarittely.md_ -tiedostoon vievä linkki.

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
