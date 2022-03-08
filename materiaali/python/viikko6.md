---
layout: page
title: Viikko 6
permalink: /python/viikko6
---

{% include java_materiaali_info.md %}

{% include deadline_info.md deadline=site.wk6dl %}

Tämän viikon harjoitustyön palautuksesta on tarjolla 3 pistettä. Koodikatselmoinnista on tarjolla 2 pistettä.

**⚠️ Viikon aikana järjestetään [koodikatselmointi](#koodikatselmointi), joka alkaa {{site.code_review_start_date}}.**

## Docstring ja koodin dokumentointi

> “Code is more often read than written.”
> — [Guido van Rossum](https://fi.wikipedia.org/wiki/Guido_van_Rossum)

Uutta projekti kuumeisesti koodatessa saattaa sortua ajatukseen, että toteutun koodipätkän pariin ei enää koskaan palata. Tosiasiassa jonkin koodipätkän elinikä saattaa hyvinkin olla vuosia, jonka aikana sitä saatetaan lukea lukuisia kertoja monen eri ohjelmistokehittäjän toimesta. Etenkin jos koodi on vaikealukuista, saattaa sen ymmärtämisessä kestää hyvinkin pitkään. Selkeä koodi on itsessään jo kohtalainen dokumentaatio, mutta sen dokumentointiin löytyy myös muita tapoja.

### Dokumentointi kommenteilla

Kommentien käyttö koodin dokumentoinnissa on erittäin hyödyllinen ja yleinen dokumentaation muoto. Siitä huolimatta väärin käytettynä kommentteja pidetään niin kutsuttuina "koodihajuina", eli merkkinä huonolaatuisesta koodista. Esimerkiksi seuraavanlainen kommentointi ei paranna koodin luettavuutta:

```python
class Machine:
    def __init__():
        self._tank = FuelTank()
        # fill tank with 40 units
        self._tank.fill(40)
        self._engine = Engine(self._tank)

    def drive(self):
        self._egine.start()
        # check if engine is running
        running = self._engine.engine_is_running()

        # if engine is running, use energy
        if running:
          self._engine.use_energy()
```

Kommentoinnin ei siis pitäisi selittää mitä yksittäinen koodirivi tekee, vaan tämä pitäisi tulla ilmi koodista itsestään. Sen sijaan kommenttien pitäisi kertoa, mitä yksittäinen moduuli, luokka, metodi tai funktio tekee ja minkälaisen rajapinnan se tarjoaa (esimerkiksi metodin argumentit ja palautusarvot). Tämän tyyppisiä kommentteja kutsutaan Python-terminologiassa [docstringeiksi](https://www.python.org/dev/peps/pep-0257/). Docstring-formaatteja on standardoitu, mutta eri standardien välillä on eroja. Tutustumme tällä kurssilla melko suosittuun, [Googlen formaattiin](https://google.github.io/styleguide/pyguide.html#38-comments-and-docstrings).

Tutustutaan luokkien ja metodien dokumentointiin Googlen formaatilla jo tutuksi tulleen `Maksukortti`-luokan avulla:

```python
class Maksukortti:
    """Luokka, jonka avulla ylläpidetään maksukortin saldoa.

    Attributes:
        saldo: Maksukortin alkusaldo.
    """

    def __init__(self, saldo):
        """Luokan konstruktori, joka luo uuden maksukortin.

        Args:
            saldo: Maksukortin alkusaldo.
        """

        self.saldo = saldo

    def lataa_rahaa(self, lisays):
        """Kasvattaa Maksukortin saldoa määritetyn summan verran

        Args:
            lisays: Maksukortille ladattava summa.
        """

        self.saldo += lisays

    def ota_rahaa(self, maara):
        """Vähentää maksukortin saldoa määritetyn summan verran.

        Jos maksukortilla ei ole määritetyn summan verran rahaa, saldoa ei vähennetä.

        Args:
            maara: Maksukortilta otettava summa.

        Returns:
            True, jos summan vähentäminen onnistui, muussa tapauksessa False.
        """

        if self.saldo < maara:
            return False

        self.saldo = self.saldo - maara
        return True

    def __str__(self):
        """Muodostaa maksukortista merkkijonomuotoisen esityksen.

        Returns:
            Merkkijono, joka kertoo maksukortin saldon euroissa.
        """

        saldo_euroissa = round(self.saldo / 100, 2)

        return f"saldo: {saldo_euroissa}"
```

Dokumentaatio on luokkien, metodin ja funktioiden tapauksessa heti määritelmän jälkeisellä rivillä. Dokumentaatio alkaa `"""`-merkeillä ja päättyy samoihin merkkeihin. Ensimmäinen dokumentoitava asia on yleinen kuvaus. Luokan tapauksessa kuvausta seuraa luokan attribuutit, jotka luetellaan allekkain `Attributes`-osion alle. Attribuutit dokumentoidaan formaatissa `attribuutin_nimi: Attribuutin kuvaus`. Metodien ja funktioiden argumentit dokumentoidaan samankaltaisesti, mutta osion nimi on [Args](https://github.com/google/styleguide/blob/gh-pages/pyguide.md#doc-function-args). Metodien ja funktioiden paluuarvot kuvaillaan `Returns`-osion alle.

Visual Studio Codessa docstringien kirjoittamista nopeuttaa huomattavasti [Python Docstring Generator](https://marketplace.visualstudio.com/items?itemName=njpwerner.autodocstring)-lisäosan käyttö. Lisäosan asennuksen jälkeen riittää, että kirjoitat `"""` ja painat tab-näppäintä, niin docstringille generoituu pohja.

## Koodikatselmointi

Katselmoinnista voi saada maksimissaan kaksi pistettä.

Kurssilla tapahtuvan katselmoinnin perimmäinen tarkoitus on oppia hahmottamaan toisen henkilön kirjoittamaa koodia ja kokonaista ohjelmointiprojektia. Sujuva koodinlukutaito on välttämätön taito ohjelmoijan työssä. Toisten koodia luetaan kuitenkin laitoksen kursseilla toistaiseksi valitettavan vähän. Hyvin suoritettu katselmointi on tehokas tapa havaita koodista ongelmakohtia ja virheitä sekä parantaa koodin laatua.

_Katselmointiin käytettyä aikaa ei merkata työaikakirjanpitoon._

### Ohjeet

Katselmoinnin alkamispäivämäärä on {{site.code_review_start_date}}, jonka jälkeen _viimeistään_ näet sinulle osoitetun katselmointikohteen repositoriolinkin Labtoolista.

Tehtävänäsi on lukea läpi toisen opiskelijan harjoitustyö ja antaa siitä rakentavaa palautetta. Ohjelmaa kannattaa kokeilla myös suorittaa.

- Lataa katselmointikohteesi zip-pakattu projekti koneellesi
  - Ota talteen kellonaika ja päivä, jolloin latasit projektin
  - Pura projekti
  - Voit halutessasi kloonata repositorion koneellesi

![](/assets/images/review1.png)

- Aloita lukemalla projektin vaatimusmäärittely
- Tutustu mahdollisimman kattavasti ohjelmakoodiin sekä testeihin
  - Kokeile myös suorittaa projektin testit
- Yritä ymmärtää, mitä mikäkin luokka ja metodi tekee
  - Ole sinnikäs: kaikkea ei aina osaa, eikä tarvitsekaan ymmärtää!
  - Haastavin osuus lienee luokkien suhde toisiinsa. Käytä hyväksesi koodista tehtyjä luokkakaavioita

Kun olet tutustunut riittävän tarkasti katselmoitavaan projektiin, on aika antaa toiselle koodista palaute. Palautteessa ei tarvitse ottaa kantaa ohjelman dokumentointiin, ulkonäköön tai toimivuuteen. Tärkeintä on kiinnittää huomiota Ohjelmoinnin perusteissa ja Ohjelmoinnin jatkokurssilla opittuihin hyviin käytänteisiin sekä tällä kurssilla noudatettaviin koodin laatuvaatimuksiin ([Java](/java/koodin-laatuvaatimukset), [Python](/python/koodin-laatuvaatimukset)).

{% include koodikatselmointi.md %}

## Harjoitustyö

Kannattaa pitää mielessä, että kurssin loppu alkaa lähestyä ja täten myös loppupalautuksen deadline. Nyt kannattaa kerrata loppupalautuksen [arvosteluperusteet](/python/arvosteluperusteet). Viimeiselläkin viikolla ohjelmaa ehtii vielä kasvattaa, mutta myös dokumentoinnille kannattaa jättää aikaa.

Tämän viikon aikana harjoitustyöhön toteutetaan edellisen viikon tapaan uutta toiminallisuutta ja parannetaan sen dokumentaatiota.

**Tämän viikon harjoitustyön palautuksesta on tarjolla 3 pistettä.** Viikkopisteiden lisäksi kannattaa pitää mielessä harjoitustyön lopullisen palautuksen [arvosteluperusteet](/python/arvosteluperusteet).

### Harjoitustyö 1: Uutta toiminallisuutta

Kasvaata ohjelmaa edellisestä viikosta (0.75p):

- Ohjelman pystyy suorittamaan komentoriviltä komennolla `poetry run invoke start`
- Suoritettava versio on kasvanut edellisestä viikosta _ja_ toteuttaa edellisen viikon versiota suuremman osan määrittelydokumentin toiminnallisuuksista eli ohjelmaan on lisätty jotain käyttäjälle näkyvää hyödyllistä toiminnallisuutta
- Merkitse lisäksi tarkastusta varten määrittelydokumenttiin valmiit toiminnallisuudet "tehty" merkinnällä
- Ohjelman suoritettavissa olevasta versiosta on tehty uusi [GitHub-release](/release), joka sisältää ohjelman uusimman version lähdekoodin (GitHub lisää tämän automaattisesti releasin tehdessä)

Ohjeita toteutukseen löydät [täältä](/python/toteutus).

### Harjoitustyö 2: Testaaminen

Edistä ohjelman testaamista (0.5p):

- Sovellukselle tulee pystyä generoimaan testikattavuusraportti komennolla `poetry run invoke coverage-report`
- Projektin juurihakemistossa tulee olla _.coveragerc_-tiedosto, jossa määritellään, mistä hakemistosta testikattavuus kerätään. Käyttöliittymään ja testeihin liittyvä koodi [jätetään testikattavuusraportin ulkopuolle](/python/viikko2#tiedostojen-jättäminen-raportin-ulkopuolelle)
- Projektin _src_-hakemiston alahakemistoissa tulee olla tyhjät <i>\_\_init\_\_.py</i>-tiedostot [ohjeiden](/python/viikko2#testikattavuusraportti) mukaisesti, jotta kaikki halutut tiedostot sisällytetään testikattavuusraporttiin
- Ohjelman testien haarautumakattavuuden tulee olla vähintään 60%
- Testien tulee olla mielekkäitä, eli niiden on testattava jotain ohjelman kannalta merkityksellistä asiaa

### Harjoitustyö 3: Koodin laatu

Kiinnitä koodin laadussa huomio seuraaviin seikkoihin (0.5p):

- Ohjelma ei sisällä suurta määrää toisteista koodia eli copy-pastea
- Ohjelman rakenne on järkevä
  - Luokkien, metodien ja funktioiden tulee pyrkiä noudattamaan niin kutsuttua [single responsibility](https://en.wikipedia.org/wiki/Single-responsibility_principle) -periaatetta, eli yhden komponentin ei tulisi tehdä liian montaa asiaa
  - Liian suuret luokat, metodit ja funktiot tulee siis pilkkoa osiin
- Pidä harjoitustyön lopullista palautusta varten myös mielessä [koodin laatuvaatimukset](/python/koodin-laatuvaatimukset)

### Harjoitustyö 4: Dokumentaatio

Aloita koodin docstring-dokumentointi (0.5p):

- Ainakin osalle ohjelman luokista, metodeista ja funktioista on tehty docstring-dokumentaatio
- Edellytyksenä pisteille on, että suurin piirtein puolella luokista, metodeista ja funktioista on tehty docstring-dokumentaatio

Laadi alustava arkkitehtuurikuvaus (0.5p):

- Dokumentti sisältää sovelluksen korkean tason (esim. hakemistojen tasolla) rakenteen kuvauksen, sekä alustavan kuvauksen sovelluslogiikasta
- Dokumentissa voi hyödyntää edellisten viikkojen luokka- ja sekvenssikaavioita
- Mallia voi ottaa [referenssisovelluksesta]({{site.python_reference_app_url}}/blob/master/dokumentaatio/arkkitehtuuri.md#sovelluslogiikka)
- Dokumentin alustavan version sopiva pituus on noin 1-2 sivua tekstiä ja kaavioita

Laadi alustava käyttöohje (0.25p):

- Ohje voi olettaa, että sovellusta suoritetaan palautusrepositoriosta käsin, eli asentamiseen ja konfigurointiin ei ole vielä tarvetta ottaa kantaa
- Alustavan käyttöohjeen sopiva pituus on noin sivu
- Mallina voi jälleen toimia [referenssisovellus]({{site.python_reference_app_url}}/blob/master/dokumentaatio/kayttoohje.md)

### Harjoitustyö 6: Changelog

{% include changelog_info.md %}

### Harjoitustyö 7: Pistevähennykset

Seuraavien kohtien puutteet **vähentävät** pisteitä:

- Koodin laatu
  - Rakenne on järkevä (esim. kaikki koodi on samassa hakemistossa)
  - Sovelluslogiikkaa on eriytetty riittävästi käyttöliittymästä
  - Pylint on käytössä
    - Pylint-virheitä on alle 5
    - Käyttöliittymään tai testeihin liittyvän koodin voi jättää pylint-tarkistuksien ulkopuolelle
- Tuntikirjanpito on ajantasalla
  - **Tuntien summan tulee olla merkittynä**
  - Tuntikirjanpitoon ei merkitä laskareihin käytettyä aikaa
- Viikolle on tehty changelog-merkintä _changelog.md_-tiedostoon
- Repositorion _README.md_-tiedosto on kunnossa
  - Tiedosto on kurssin tämän vaiheen osalta relevantin sisällön suhteen samankaltainen kuin [referenssisovelluksen]({{site.python_reference_app_url}}) README.md, eli se sisältää ainakin seuraavat
    - Harjoitustyön aiheen lyhyt kuvaus
    - Linkit vaatimusmäärittelyyn, arkkitehtuuridokumenttiin, käyttöohjeeseen ja tuntikirjanpitoon
    - Linkki releaseihin
    - Ohjeet komentoriviltä suoritettaviin toimenpiteisiin (ohjelman käynnistys, testaus, testikattavuusraportin suoritus, pylint-tarkistuksien suorittaminen)
- Repositorio siisti
  - Ei ylimääräistä tavaraa (mm. `pytest`- ja `coverage`-komentojen generoimia tiedostoja)
  - Laskarit jätetään hakemiston _laskarit_ alle
  - Järkevä _.gitignore_-tiedosto olemassa

{% include harjoitustyon_toimivuus_info.md %}

{% include ala_plagioi.md %}
