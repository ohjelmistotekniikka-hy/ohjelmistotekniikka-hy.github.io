---
layout: page
permalink: /python/docstring
title: Docstring ja koodin dokumentointi
---

> “Code is more often read than written.”
> — [Guido van Rossum](https://fi.wikipedia.org/wiki/Guido_van_Rossum)

Uutta projekti kuumeisesti koodatessa saattaa sortua ajatukseen, että toteutun koodipätkän pariin ei enää koskaan palata. Tosiasiassa jonkin koodipätkän elinikä saattaa hyvinkin olla vuosia, jonka aikana sitä saatetaan lukea lukuisia kertoja. Selkeä koodi on itsessään jo kohtalainen dokumentaatio, mutta sen dokumentointiin löytyy myös muita tapoja.

## Dokumentointi kommenteilla

Kommentien käyttö koodin dokumentoinnissa on erittäin hyödyllinen dokumentaation muoto. Siitä huolimatta väärin käytettynä kommentteja pidetään niin kutsuttuina "koodihajuina", eli merkkinä huonolaatuisesta koodista. Esimerkiksi seuraavanlainen kommentointi ei paranna koodin luettavuutta:

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

Kommentoinnin ei siis pitäisi selittää mitä yksittäinen koodirivi tekee, vaan tämä pitäisi tulla ilmi koodista itsestään. Sen sijaan kommenttien pitäisi kertoa, mitä yksittäinen moduuli, luokka, metodi tai funktio tekee. Tämän tyyppisiä kommentteja kutsutaan Python-terminologiassa [docstringeiksi](https://www.python.org/dev/peps/pep-0257/). Docstring-formaatteja on standardoitu, mutta eri standardien välillä on eroja. Tutustumme tällä kurssilla melko suosittuun, [Googlen formaattiin](https://google.github.io/styleguide/pyguide.html#38-comments-and-docstrings).

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
