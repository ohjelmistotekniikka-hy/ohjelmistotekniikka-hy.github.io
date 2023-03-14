---
layout: page
permalink: /python/viikko2
title: Viikko 2
---

{% include java_materiaali_info.md %}

{% include deadline_info.md deadline=site.wk2dl %}

Tämän viikon tehtävien palautuksesta on tarjolla 2 pistettä ja harjoitustyön palautuksesta 1 piste.

Tee palautettavia tehtäviä varten repositorion sisällä olevaan hakemistoon _laskarit_ uusi alihakemisto _viikko2_.

## Poetry ja riippuvuuksien hallinta

Laajoissa ja monimutkaisissa ohjelmistoprojekteissa kaiken koodin tuottaminen itse ei ole enää käytännöllistä. Ei ole esimerkiksi järkevää, että jokaisessa ohjelmistoprojektissa toteutetaan oma ohjelmointirajapinta tietokantaoperaatioille, tai sovelluskehys koodin testaamiseen. Jotta pyörää ei tarvitsisi aina keksiä uudelleen, ovat ohjelmistokehittäjät kehittäneet valtavan määrän avoimen lähdekoodin _kirjastoja_, joita jokainen voi hyödyntää projekteissaan.

Kirjastojen lähdekoodi on usein luettavissa versionhallinta-alustoilla, kuten GitHubissa. Usein kirjastoja päivitetään jatkuvasti ja nämä päivitykset synnyttävät kirjastoista uusia _versioita_. Kirjastojen versioita julkaistaan erilaisiin rekistereihin, joista ne ovat helposti asennettavissa. [The Python Package Index](https://pypi.org/) (PyPI) on eräs tämän kaltainen, Python-kirjastoille tarkoitettu rekisteri.

Projektissa käytettävät kirjastojen versiot ovat projektin _riippuvuuksia_. Riippuvuuksia asennetaan Python-projekteissa tyypillisesti projektikohtaisiin _virtuaaliympäristöihin_, jottei samalla tietokoneella olevien projektien riippuvuuksissa syntyisi ristiriitoja. Jotta riippuvuuksien hallinta virtuaaliympäristöissä sujuisi helposti, käytämme kurssilla [Poetry](https://python-poetry.org/)-komentorivityökalua.

### Huomioita komennoista

Monilla tietokoneilla Python-version kolme komennot suoritetaan `python3`-komennolla komennon `python` sijaan. Tarkista käytössä oleva versio komennolla:

```bash
python3 --version
```

Jos komentoa `python3` ei jostain syystä löydy, tarkista `python`-komennon käyttämä versio komennolla:

```bash
python --version
```

Jos molemmissa tapauksissa versio on alle 3.8, asenna tietokoneellesi [uusin Python-versio](https://www.python.org/downloads/). Muista varmistaa asennuksen jälkeen, että oikea versio on käytössä. Muussa tapauksessa käytä komentoa, jonka käyttämä versio on vähintään 3.8.

### Asennus

Ennen kuin pääsemme tutustumaan Poetryn käyttöön tarkemmin, tulee se ensin asentaa. Seuraa alla olevista ohjeista tietokoneesi käyttöjärjestelmälle sopivaa asennusohjetta.

**HUOM:** kaikki asennustavat saattavat vaatia terminaali-ikkunan sulkemisen ja uudelleen avaamisen, jotta Poetryn komennot alkavat toimia. Joissain tapauksissa on vaadittu jopa tietokoneen uudelleenkäynnistys.

#### Linux- ja macOS-asennus

Asenna Poetry suorittamalla terminaalissa seuraava komento:

```bash
curl -sSL https://install.python-poetry.org | POETRY_HOME=$HOME/.local python3 -
```

**HUOM:** jos `python3`-komentoa ei löydy, käytä sen sijaan komennon lopussa `python`-komentoa. Varmista kuitenkin, että Python-versio on oikea edellisen ohjeen mukaisesti.

**HUOM:** jos törmäät macOS-tietokoneella virheeseen `SSL: CERTIFICATE_VERIFY_FAILED`, avaa Python-asennuksen hakemisto komenolla `open /Applications/Python\ 3.9` (korvaa "3.9" käytössä olevalla Python-versiolla) ja klikkaa hakemistossa olevaa tiedostoa _Install Certificates.command_. Odota, että operaatio valmistuu ja suorita tämän jälkeen edellä mainittu asennus-komento uudestaan.

Asennuksen jälkeen Poetry-binäärin polku tulee asettaa `PATH`-muuttujaan. Tämä onnistuu lisäämällä kotihakemiston _.bashrc_-tiedoston loppuun seuraava rivi:

```bash
export PATH="$HOME/.local/bin:$PATH"
```

Lisääminen onnistuu esimerkiksi muokkaamalla tiedostoa nano-editorin avulla, tai suorittamalla seuraava komento:

```bash
echo "export PATH=\"\$HOME/.local/bin:\$PATH\"" >> $HOME/.bashrc
```

**HUOM:** jos käytössäsi on zsh-komentorivi, on oikea konfiguraatiotiedosto _.bashrc_-tiedoston sijaan _.zshrc_-tiedosto. Voit tarkistaa käytössä olevan komentirivin komennolla `echo $SHELL`. Käytä tässä tapauksessa edellisessä komennossa käytetyn `$HOME/.bashrc`-polun sijaan polkua `$HOME/.zshrc`.

**HUOM:** jos käytössäsi on macOS-käyttöjärjestelmä ja bash-komentorivi, käytä edellisessä komennossa käytetyn `$HOME/.bashrc`-polun sijaan polkua `$HOME/.bash_profile`.

**HUOM:** käytä melkki-palvelimella edellisessä komennossa käytetyn `$HOME/.bashrc`-polun sijaan polkua `$HOME/.profile`.

Käynnistä terminaali uudestaan ja varmista, että asennus onnistui suorittamalla komento `poetry --version`. Komennon pitäisi tulostaa asennettu versio.

#### Windows-asennus

Asenna Poetry suorittamalla terminaalissa seuraava komento:

```bash
(Invoke-WebRequest -Uri https://raw.githubusercontent.com/python-poetry/poetry/master/install-poetry.py -UseBasicParsing).Content | python -
```

Asennuksen jälkeen Poetry-binäärin polku tulee asettaa `PATH`-muuttujaan. Lisää [tämän](https://www.architectryan.com/2018/03/17/add-to-the-path-on-windows-10/) ohjeen mukaisesti `PATH`-muuttujaan polku `%APPDATA%\Python\Scripts`.

Käynnistä terminaali uudestaan ja varmista, että asennus onnistui suorittamalla komento `poetry --version`. Komennon pitäisi tulostaa asennettu versio.

### Projektin alustaminen

Harjoitellaan Poetryn käyttöä tekemällä pieni esimerkkiprojekti. Luo hakemisto _poetry-testi_ haluamaasi hakemistoon. Hakemiston ei tarvitse löytyä Labtooliin rekisteröimästäsi repositoriosta. Avaa hakemisto terminaalissa ja suorita siellä komento:

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

[build-system]
requires = ["poetry-core>=1.0.0"]
build-backend = "poetry.core.masonry.api"
```

Tiedoston `[tool.poetry]`-osio sisältää projektiin liittyviä yleistietoja, kuten sen nimen, kuvauksen ja ylläpitäjät. Osion alapuolella on osioita, jotka listaavat projektin riippuvuuksia. Osiossa `[tool.poetry.dependencies]` näemme `poetry init`-komennon suorituksen yhteydessä asettamamme Python-version vaatimuksen, joka on muotoa `python = "^3.8"`. `^3.8`-merkintä tarkoittaa, että projektin käyttö vaatii vähintään Python-version 3.8.

Kun _pyproject.toml_-tiedosto on tullut tutuksi, viimeistellään projektin alustaminen suorittamalla komento:

```bash
poetry install
```

Komennon suorittaminen tekee projektille vaadittavat alustustoimenpiteet, kuten virtuaaliympäristön alustamisen. Jos projektille olisi määritelty riippuvuuksia, komennon suorittaminen asentaisi myös ne. Tämän vuoksi komento tulee suorittaa aina ennen kuin uutta projektia aletaan käyttämään.

Komennon suorittamisen jälkeen hakemistoon pitäisi ilmestyä tiedosto _poetry.lock_. Tiedosto sisältää kaikkien asennettujen riippuvuuksien versiotiedot. Sen tietojen avulla Poetry pystyy aina asentamaan `poetry install`-komennolla riippuvuuksista täsmälleen oikeat versiot. Tästä syystä tiedosto tulee lisätä versionhallintaan.

### Riippuvuuksien asentaminen

Asennetaan seuraavaksi projektiimme ensimmäisen riippuvuus. Riippuvuuksien löytäminen onnistuu helpoiten Googlettamalla ja etsimällä hakutuloksista sopivia GitHub-repositorioita, tai PyPI-sivuja. Asennetaan esimerkkinä projektiimme [cowsay](https://pypi.org/project/cowsay/)-kirjasto. Tämä onnistu projektin juurihakemistossa (samassa hakemistossa, missä _pyproject.toml_-tiedosto sijaitsee) komennolla:

```bash
poetry add cowsay
```

Asennuksen komento on siis muotoa `poetry add <kirjasto>`. Komennon suorittamisen jälkeen huomaamme, että _pyproject.toml_-tiedoston `[tool.poetry.dependencies]`-osion alla on uutta sisältöä:

```
[tool.poetry.dependencies]
python = "^3.8"
cowsay = "^2.0.3"
```

`poetry add`-komento asentaa oletusarvoisesti kirjaston uusimman version, joka oli komennon suoritushetkellä `2.0.3`. Usein tämä on juuri se, mitä haluamme tehdä. Voimme kuitenkin asentaa halutessamme esimerkiksi cowsay-kirjaston version `1.0` komennolla:

```bash
poetry add cowsay==1.0
```

Jos haluaisimme poistaa kirjaston projektimme riippuvuuksien joukosta, se onnistuisi komennolla:

```bash
poetry remove cowsay
```

Pidetään kuitenkin cowsay-kirjasto toistaiseksi asennettuna.

### Komentojen suorittaminen virtuaaliympäristössä

Lisätään seuraavaksi _poetry-testi_-hakemistoon hakemisto _src_ ja sinne tiedosto _index.py_. Lisätään tiedostoon seuraavat koodirivit:

```python
import cowsay

cowsay.tux("Poetry is awesome!")
```

Koodissa käyttämme `import`-lausetta saadaksemme cowsay-kirjaston käyttöömme. Jos suoritamme tiedoston terminaalissa komennolla:

```bash
python3 src/index.py
```

On lopputuloksena seuravaa virheilmoitus:

```
ModuleNotFoundError: No module named 'cowsay'
```

Tämä johtuu siitä, että emme ole projektin virtuaaliympäristön sisällä, jonka vuoksi Python ei löydä projektimme riippuvuuksia. Asia korjaantuu käyttämällä [run](https://python-poetry.org/docs/cli/#run) komentoa:

```bash
poetry run python3 src/index.py
```

`poetry run`-komento siis suorittaa annetun komennon virtuaaliympäristössä, jonka sisällä Python löytää riippuvuutemme.

Kun projektia kehitetään aktiivisesti ja komentoja suoritetaan terminaalissa jatkuvasti, on kätevintä olla koko ajan virtuaaliympäristön sisällä. Voimme siirtyä virtuaaliympäristön sisään kommennolla [shell](https://python-poetry.org/docs/cli/#shell):

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

Poetryn avulla riippuvuuksia on mahdollista ryhmitellä niiden käyttötarkoituksen mukaan. Melko yleinen tapa ryhmitellä riippuuvuuksia on ryhmitellä ne _kehityksen_ ja _suorituksen_ aikaisiksi riippuvuuksiksi. Kehityksen aikaisia riippuvuuksia tarvitaan ohjelmiston kehityksen aikana, mutta ne eivät ole välttämättömiä ohjelman suorituksessa.

Komennon `poetry add` suorittaminen asentaa oletusarvoisesti riippuvuudet `[tool.poetry.dependencies]`-osion alle. Näiden riippuvuuksien lisäksi voimme asentaa projektiimme riippuvuuksia, joita tarvitsemme vain kehityksen aikana. Näitä riippuvuuksia ovat kaikki ne, joita itse sovelluksen käynnistäminen (esimerkiksi `python3 src/index.py`-komennon suorittaminen) ei tarvitse.

Kehityksen aikaisten riippuvuuksien asentaminen onnistuu antamalla `poetry add`-komennolle `--group dev`-flagi. Esimerkiksi pian tutuksi tulevan [pytest](https://pytest.org/)-kirjaston voi asentaa kehityksen aikaiseksi riippuvuudeksi seuraavalla komennolla:

```bash
poetry add pytest --group dev
```

Komennon suorittaminen lisää pytest-kirjaston riippuvuudeksi `[tool.poetry.group.dev.dependencies]`-osion alle:

```
[tool.poetry.group.dev.dependencies]
pytest = "^6.1.2"
```

Kehityksen aikaisten riippuvuuksien määritteleminen on kätevää, koska se vähentää asennettavien riippuvuuksien määrää tapauksessa, jossa haluamme vain suorittaa sovelluksen. Tässä tilanteessa riippuvuuksien asentamisen voi tehdä komennolla `poetry install --without dev`.

### Ratkaisuja yleisiin ongelmiin

Usein Poetry-ongelmat ratkeavat seuraavilla toimenpiteillä:

1. Varmista, että Poetrysta on asennettu uusin versio suorittamalla komento `poetry self update`
2. Varmista, että _pyproject.toml_-tiedostossa on oikea Python version vaatimus:

   ```
   [tool.poetry.dependencies]
   python = "^3.8"
   ```

   **Jos versio on väärä**, muuta se oikeaksi ja suorita komento `poetry update`

3. Tyhjennä välimuisti suorittamalla komennot `poetry cache clear pypi --all` ja `poetry cache clear PyPi --all`

4. Listaa projektissa käytössä olevat virtuaaliympäristöt komennolla `poetry env list` ja poista ne kaikki yksitellen komennolla `poetry env remove <nimi>`. Esimerkiksi seuraavasti:

   ```bash
   $ poetry env list
   unicafe-jLeQYxxf-py3.9 (Activated)
   $ poetry env remove unicafe-jLeQYxxf-py3.9
   Deleted virtualenv: /Users/kalleilv/Library/Caches/pypoetry/virtualenvs/unicafe-jLeQYxxf-py3.9
   ```
   Kun virtuaaliympäristöt on poistettu, suorita komento `poetry install`

Kun kaikki toimenpiteet on suoritettu, yritä suorittaa epäonnistunut Poetry-komento uudestaan.

### Keyring-ongelma

Jos `poetry install`-komennon suorittaminen pyytää keyring-salasanaa, ongelma pitäisi ratketa suorittamalla terminaalissa `export PYTHON_KEYRING_BACKEND=keyring.backends.fail.Keyring` ja sen jälkeen suorittamalla komento `poetry install` uudestaan. Kyseisen rivin voi laittaa _.bashrc_ (tai vastaavaan) tiedostoon, jotta sitä ei tarvitse suorittaa jokaisen terminaali-istunnon aluksi.

## Unittest ja testaaminen

Tutustutaan yksikkötestien tekemiseen [unittest](https://docs.python.org/3/library/unittest.html)-sovelluskehyksen avulla. Yksikkötesteissä testauksen kohteena ovat ohjelman pienimmät rakenneosaset eli yksittäiset funktiot sekä luokkien oliot ja niiden metodit.

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

**HUOM:** Kaikki raha-arvot, kuten maksukortin saldo ja aterioiden hinnat ovat senteissä.

### Tehtävä 1: Alkutoimet

Luo Labtooliin rekisteröimäsi repositorion hakemistoon _laskarit/viikko2_ hakemisto _maksukortti_. Suorita terminaalissa hakemiston sisällä tuttu, projektin alustamiseen vaadittava komento:

```bash
poetry init --python "^3.8"
```

Poetryn kysymillä projektin tiedoilla ei ole väliä, joten voit hyvin käyttää Poetryn ehdottamia tietoja.

Asennetaan projektiin kehityksen aikaiseksi riippuvuudeksi [pytest](https://docs.pytest.org/en/stable/)-sovelluskehys, joka helpottaa testien suorittamista. Riippuvuuden asentaminen onnistuu samassa hakemistossa komennolla:

```bash
poetry add pytest --group dev
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

### Tehtävä 2: Aloitetaan testien kirjoittaminen

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

Tehdään seuraavaksi testi, joka varmistaa, että kortin saldo pienee kutsuttaessa metodia `syo_edullisesti`:

```python
def test_syo_edullisesti_vahentaa_saldoa_oikein(self):
    kortti = Maksukortti(1000)
    kortti.syo_edullisesti()

    self.assertEqual(str(kortti), "Kortilla on rahaa 7.50 euroa")
```

Jälleen testi alkaa kortin luomisella. Seuraavaksi kutsutaan kortin testattavaa metodia ja viimeisenä on rivi joka varmistaa, että tulos on haluttu, eli että kortin saldo on pienentynyt edullisen lounaan hinnan verran.

### Muutama huomio

Molemmat testit ovat yksinkertaisia ja testaavat vain yhtä asiaa, tämä on suositeltava käytäntö vaikka on mahdollista laittaa yhteen testiin useitakin `assertEqual`-metodin kutsuja. Testit on nimetty siten, että nimi kertoo selvästi sen mitä testi testaa. Lisäksi tulee aina muistaa käyttää metodin nimessä <i>test\_</i>-etuliitettä. Kaikki testit ovat toisistaan riippumattomia, esim. kortilla maksaminen ei vaikuta kortin saldoon kuin siinä testissä missä korttimaksu tapahtuu. Testien järjestyksellä testikoodissa ei ole merkitystä. Testit kannattaa ajaa mahdollisimman usein, eli aina kun teet testin (tai muutat normaalia koodia) aja testit!

Tehdään kaksi testiä lisää:

```python
def test_syo_maukkaasti_vahentaa_saldoa_oikein(self):
    kortti = Maksukortti(1000)
    kortti.syo_maukkaasti()

    self.assertEqual(str(kortti), "Kortilla on rahaa 6.00 euroa")

def test_syo_edullisesti_ei_vie_saldoa_negatiiviseksi(self):
    kortti = Maksukortti(200)
    kortti.syo_edullisesti()

    self.assertEqual(str(kortti), "Kortilla on rahaa 2.00 euroa")
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

        self.assertEqual(str(self.kortti), "Kortilla on rahaa 7.50 euroa")

    def test_syo_maukkaasti_vahentaa_saldoa_oikein(self):
        self.kortti.syo_maukkaasti()

        self.assertEqual(str(self.kortti), "Kortilla on rahaa 6.00 euroa")

    def test_syo_edullisesti_ei_vie_saldoa_negatiiviseksi(self):
        kortti = Maksukortti(200)
        kortti.syo_edullisesti()

        self.assertEqual(str(kortti), "Kortilla on rahaa 2.00 euroa")
```

`setUp`-metodi suoritetaan **ennen jokaista testitapausta** (eli testimetodia). Jokainen testitapaus saa siis käyttöönsä `Maksukortti`-olion, jonka saldo on 10 euroa. Huomaa, että testien kohteena oleva maksukortti talletetaan testiluokan oliomuuttujaan `self.kortti = Maksukortti(1000)`-rivillä. Näin testimetodit pystyvät näkemään metodin `setUp` luoman maksukortin.

Testimetodit voivat myös alustaa eri käyttötarkoitukseen sopivia olioita, kuten on tehty testimetodissa `test_syo_edullisesti_ei_vie_saldoa_negatiiviseksi`. Huomaa, että tässä tapauksessa `self.kortti` viittaa `setUp`-metodissa alustettuun oliomuuttujaan, kun taas `kortti` metodin sisäiseen muuttujaaan.

### Lisää testejä

Tehdään vielä testi metodille `lataa_rahaa`. Ensimmäinen testi varmistaa, että lataus onnistuu ja toinen testaa, ettei kortin saldo kasva suuremmaksi kuin 150 euroa.

```python
def test_kortille_voi_ladata_rahaa(self):
    self.kortti.lataa_rahaa(2500)

    self.assertEqual(str(self.kortti), "Kortilla on rahaa 35.00 euroa")

def test_kortin_saldo_ei_ylita_maksimiarvoa(self):
    self.kortti.lataa_rahaa(20000)

    self.assertEqual(str(self.kortti), "Kortilla on rahaa 150.00 euroa")
```

### Tehtävä 3: Lisää testejä

Lisää lopuksi maksukortille seuraavat testit:

- Maukkaan lounaan syöminen ei vie saldoa negatiiviseksi, ota tähän mallia testistä `test_syo_edullisesti_ei_vie_saldoa_negatiiviseksi`
- Negatiivisen summan lataaminen ei muuta kortin saldoa
- Kortilla pystyy ostamaan edullisen lounaan, kun kortilla rahaa vain edullisen lounaan verran (eli 2.5 euroa)
- Kortilla pystyy ostamaan maukkaan lounaan, kun kortilla rahaa vain maukkaan lounaan verran (eli 4 euroa)

**HUOM:** On suositeltavaa, että yksi testi testaa vain "yhtä asiaa" kerrallaan. Tee siis jokaisesta ylläolevasta oma testinsä.

**HUOM:** Kirjoita `assertEqual`-komennot aina siten, että ensimmäisenä parametrina saatu tulos
ja toisena parametrina on odotettu tulos. Esimerkiksi:

```python
self.assertEqual(str(kortti), "Kortilla on rahaa 2.00 euroa")
```

### Testit ovat toisistaan riippumattomia

Yllä jo mainittiin että testit ovat toisistaan riippumattomia eli molemmat testit toimivat siis kuin itsenäiset pienet funktiot. Mitä tämä oikein tarkoittaa?

Maksukorttia testataan usealla pienellä testimetodilla joista jokaisen nimi alkaa <i>test\_</i>-etuliitteellä. Jokainen erillinen testi testaa yhtä pientä asiaa, esim. että kortin saldo vähenee lounaan hinnan verran. On tarkoituksena, että jokainen testi aloittaa "puhtaalta pöydältä", eli ennen jokaista testiä luodaan alustuksen tekevässä `setUp`-metodissa uusi kortti.

Jokainen testi siis alkaa tilanteesta jossa kortti on juuri luotu. Tämän jälkeen testi joko kutsuu suoraan testattavaa metodia tai ensin saa aikaan sopivan alkutilanteen ja tämän jälkeen kutsuu testattavaa metodia. Näin tehtiin testimetodissa `test_syo_edullisesti_ei_vie_saldoa_negatiiviseksi`, jossa alustettiin erillinen maksukortti, jonka saldo ei riitä edullisen lounaan ostamiseen. Tämän avulla testattiin, ettei edullisen lounaan syöminen vie saldoa negatiiviseksi.

### Onko jo testattu tarpeeksi?

Olemme tyytyväisiä, uskomme että testitapauksia on nyt tarpeeksi. Onko tosiaan näin? Onneksi on olemassa työkaluja, joilla voidaan tarkastaa testien _haarautumakattavuus_, eli se mitä suoritushaaroja testien suorittaminen on tutkinut. Tutustumme testien haarautumakattavuuden mittaamiseen [testikattavuutta](#coverage-ja-testikattavuus) käsittelevässä osiossa.

Testikattavuuden mittaus paljastaa että koodi on melko kattavasti testattu. Ainoa testien tutkimatta jättämä asia on tilanne, jossa kortille yritetään ladata negatiivinen saldo.

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

        self.assertEqual(str(self.kortti), "Kortilla on rahaa 7.50 euroa",)

    def test_syo_maukkaasti_vahentaa_saldoa_oikein(self):
        self.kortti.syo_maukkaasti()

        self.assertEqual(str(self.kortti), "Kortilla on rahaa 6.00 euroa")

    def test_syo_edullisesti_ei_vie_saldoa_negatiiviseksi(self):
        kortti = Maksukortti(200)
        kortti.syo_edullisesti()

        self.assertEqual(str(kortti), "Kortilla on rahaa 2.00 euroa")

    def test_kortille_voi_ladata_rahaa(self):
        self.kortti.lataa_rahaa(2500)

        self.assertEqual(str(self.kortti), "Kortilla on rahaa 35.00 euroa")

    def test_kortin_saldo_ei_ylita_maksimiarvoa(self):
        self.kortti.lataa_rahaa(20000)

        self.assertEqual(str(self.kortti), "Kortilla on rahaa 150.00 euroa")
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

    def lataa_rahaa(self, maara):
        self.saldo += maara

    def ota_rahaa(self, maara):
        if self.saldo < maara:
            return False

        self.saldo = self.saldo - maara
        return True

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
```

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

Siirry terminaalissa _unicafe_-hakemistoon ja asenna vaadittavat riippuvuudet komennolla:

```
poetry install
```

Testien suorittaminen terminaalissa onnistuu siirtymällä virtuaaliympäristöön komennolla `poetry shell` ja sen jälkeen suorittamalla komento `pytest src`. Jos kaikki on kunnossa, saat raportin läpimenneistä testeistä:

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

Mene **repositoriosi juureen**, luo tiedosto _.gitignore_, avaa se editorilla ja lisää tiedostoon seuraava rivi:

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
- Rahan ottaminen toimii:
  - Saldo vähenee oikein, jos rahaa on tarpeeksi
  - Saldo ei muutu, jos rahaa ei ole tarpeeksi
  - Metodi palauttaa _True_, jos rahat riittivät ja muuten _False_

Suorita testit terminaalissa virtuaaliympäristössä `pytest src`-komennolla.

## Komentojen suorittaminen Visual Studio Codessa

Visual Studio Codesta löytyy sisään rakennettu terminaali. Terminaalin saa avattua valitsemalla päävalikosta _Terminal_ ja aukeavasta alavalikosta _New Terminal_. editorin alalaitaan pitäisi ilmestyä terminaali, jossa voit suorittaa komentorivikomentoja.

Terminaalin avaaminen saattaa automaattisesti avata komentorivin virtuaaliympäristössä. Jos olet virtuaaliympäristössä, on komentorivin syöterivin alussa projektin nimi ja jokin satunnainen merkkijono suluissa, esimerkiksi `(unicafe-sF0cl2di-py3.9)`. Jos et ole virtuaaliympäristössä pääset siihen tutulla `poetry shell`-komennolla. Tämän jälkeen voit suorittaa komentoja suoraan Visual Studio Codessa:

![Visual Studio Code terminaali]({{ "/assets/images/python/vscode-terminaali.png" | absolute_url }})

## Coverage ja testikattavuus

Olemme tyytyväisiä, uskomme että testitapauksia on nyt tarpeeksi. Onko tosiaan näin? Onneksi on olemassa työkaluja, joilla voidaan tarkastaa testien rivi- ja haarautumakattavuus. _Rivikattavuus_ mittaa mitä koodirivejä testien suorittaminen on tutkinut. Täydellinen rivikattavuuskaan ei tietenkään takaa että ohjelma toimii oikein, mutta on parempi kuin ei mitään. _Haarautumakattavuus_ taas mittaa mitä eri suoritushaaroja koodista on käyty läpi. Suoritushaaroilla tarkoitetaan esimerkiksi if-komentojen valintatilanteita.

Koska haarautumakattavuus antaa tyypillisesti realistisemman kuvan testien kattavuudesta, käytämme kurssilla sitä testikattavuuden mittarina.

### Testikattavuusraportti

Testikattavuuden kerääminen testien suorituksesta onnistuu [coverage](https://coverage.readthedocs.io/en/latest/)-työkalun avulla. Sen asentamisen projektin kehityksen aikaiseksi riippuvuudeksi onnistuu tuttuun tapaan komennolla:

```bash
poetry add coverage --group dev
```

Testikattavuuden kerääminen `pytest src`-komennolla suoritetuista testeistä onnistuu virtuaaliympäristössä komennolla:

```bash
coverage run --branch -m pytest src
```

Komennon `--branch` flagillä pystymme keräämään testien [haarautumakattavuuden](https://coverage.readthedocs.io/en/latest/branch.html). Huomaa, että `pytest src`-komento rajaa testien etsinnän projektin juurihakemistossa sijaitsevaan _src_-hakemistoon. Komennon suorittamisen jälkeen voimme tulostaa komentoriville raportin kerätystä testikattavuudesta komennolla:

```bash
coverage report -m
```

Tulostuksesta huomaamme, että raportissa on suuri määrä projektin kannalta turhia tiedostoja. Voimme konfiguroida, mistä tiedostoista testikattavuutta kerätään projektin juurihakemiston _.coveragerc_-tiedostossa. Jos haluamme sisällyttää testikattavuuteen vain projektin _src_-hakemiston, on konfiguraatio seuraava:

```
[run]
source = src
```

**HUOM:** _src_-hakemiston **alahakemistoissa** (ei siis itse _src_-hakemistossa) tulee olla tyhjät <i>\_\_init\_\_.py</i>-tiedostot, jotta testikattavuuteen sisällytetään kaikki halutut tiedostot. [Referenssisovelluksessa]({{site.python_reference_app_url}}) tapauksessa <i>\_\_init\_\_.py</i>-tiedostot on lisätty seuraavasti:

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

### Tehtävä 7: Testikattavuus

Unicafe-projektiin on valmiiksi konfiguroitu käytettäväksi [coverage](https://coverage.readthedocs.io/en/latest/)-työkalu, joka mittaa testien haarautumakattavuuden. Testikattavuuden konfiguraatiossa käytettävä, _.coveragerc_-tiedoston sisältö on projektissa seuraava:

```
[run]
source = src
omit = src/tests/**,src/index.py
```

Testikattavuuden kerääminen testeistä onnistuu virtuaaliympäristössä komennolla `coverage run --branch -m pytest src`. Komennon suorittamisen jälkeen kattavuusraportin voi muodostaa komennolla `coverage html`. Komennon suorittaminen luo projektin juurihakemistoon hakemiston _htmlcov_. Avaamalla hakemiston tiedoston _index.html_ selaimessa aukeaa seuraavan näköinen raportti:

![Testikattavuusraportti]({{ "/assets/images/python/unicafe-coverage.png" | absolute_url }})

Huomaa, että oma raporttisi tuskin näyttää täysin tältä (etenkin kattavuusprosenttien osalta) edellisten tehtävien testien toteutuksen jälkeen. Yksittäistä moduulia klikkaamalla näet punaisella korostuksella haarat, joita testit eivät kata vielä lainkaan ja keltaisella korostuksella haarat, joita testit kattavat vain osittain.

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

Varmista testikattavuuskomentojen avulla, että kassapäätteen testeillä on 100% haarautumakattavuus. Suorita siis virtuaaliympäristössä komennot `coverage run --branch -m pytest src` ja `coverage html`, jonka jälkeen avaa selaimessa _htmlcov/index.html_-tiedosto.

Jos testikattavuus ei ole vielä 100%, tee lisää testejä kunnes tilanne korjautuu. Tallenna edellisessä esimerkissä olevan testikattavuusraportin kuvan tyylinen [screenshot](https://www.take-a-screenshot.org/) projektisi kattavuusraportista palautusrepositoriosi hakemistoon _laskarit/viikko2_.

## Harjoitustyö

Kurssin pääpainon muodostaa viikolla 2 aloitettava harjoitustyö. Harjoitustyössä toteutetaan itsenäisesti ohjelmisto omavalintaisesta aiheesta. Tavoitteena on soveltaa ja syventää ohjelmoinnin perus- ja jatkokursseilla opittuja taitoja ja harjoitella tiedon omatoimista etsimistä. Harjoitustyötä tehdään itsenäisesti, mutta tarjolla on runsaasti [pajaohjausta](/#ajankohtaista).

Harjoitustyön on edettävä [viikottaisten tavoitteiden mukaan](/#aikataulu). Työ on saatava valmiiksi kurssin aikana ja sitä on toteutettava tasaisesti, muuten kurssi katsotaan keskeytetyksi. Samaa ohjelmaa ei voi jatkaa seuraavalla kurssilla (eli syksyllä 2023), vaan työ on aloitettava uudella aiheella alusta. Muista varata riittävästi aikaa (10-15h viikossa) koko periodin ajaksi.

Koko kurssin arvostelu perustuu pääasiassa harjoitustyöstä saataviin pisteisiin. Osa pisteistä kertyy [aikatauluun](/#aikataulu) määriteltyjen viikoittaisten välitavoitteiden kautta, osa taas perustuu työn lopulliseen palautukseen.

### Harjoitustyön kieli ja ohjelmointikieli

Harjoitustyön ohjelmointikieli on Java tai Python.

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

Harjoitustyön tekeminen aloitetaan päättämällä aihe ja kuvaamalla se _alustavassa määrittelydokumentissa_, eli työlle tehdään [vaatimusmäärittely](/python/viikko1#vaatimusmäärittely).

Mikään ei tietenkään estä sitä, että aloitat jo ohjelmoinnin tai vaikkapa koodaat koko työn valmiiksi. Tämän viikon deadlinen pisteytyksessä ollaan kiinnostuneita ainoastaan määrittelydokumentista.

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
