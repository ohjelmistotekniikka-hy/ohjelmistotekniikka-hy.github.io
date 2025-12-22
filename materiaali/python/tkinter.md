---
layout: page
permalink: /python/tkinter
title: Tkinter ja graafisen käyttöliittymän toteutus
---

Python-sovellusten graafisten käyttöliittymien toteutuksessa käytetään usein [Tkinter](https://wiki.python.org/moin/TkInter)-kirjastoa. Tkinter on Pythonin omia moduuleja ja siihen liittyvät käyttöjärjestelmäkohtaiset kirjastot tulevat useimmiten Python-asennuksien mukana.

Ennen ohjelmoinnin aloittamista on hyvä tarkistaa, että asennus on kunnossa. Käynnistä Python-komentorivi komennolla `python3` (komentoa ei tarvitse suorittaa virtuaaliympäristön sisällä, koska emme käytä ulkoisia riippuvuuksia). Syötä komentoriville `import tkinter` ja paina Enter-painiketta. Jos lopputuloksena ei ole virhettä, asennus on kunnossa. Jos näin ei ole, asenna tietokoneellesi uusin Python-versio [täältä](https://www.python.org/downloads/) ja yritä uudelleen. Voit sulkea komentorivin syöttämällä `exit()` ja painamalla Enter-painiketta.

## Ikkunan avaaminen

Graafista käyttöliittymää käytetään usein tietokoneen näytölle aukeavan ikkunan kautta. Ikkunan alustaminen onnistuu `Tk`-luokan avulla:

```python
from tkinter import Tk

window = Tk()
window.title("TkInter example")
window.mainloop()
```

Kun koodi suoritetaan, pitäisi aueta ikkuna, jonka otsakkeena on `title`-metodin kautta asetettu, "TkInter example". `mainloop`-metodin kutsu käynnistää loputtoman silmukan, jonka aikana Tkinter odottaa käyttöliittymään kohdistuvia tapahtumia, kuten painikkeiden painalluksia. Huomaa, että `mainloop`-metodin kutsun jälkeistä koodia ei enää suoriteta:

```python
# ...
window.mainloop()
print("Hello world!")
```

Tervehdys ei tulostu, koska koodin suoritus on ikuisessa silmukassa.


**HUOM:** Tkinter-ikkunan avaaminen Windows-tietokoneella WSL:n kautta, tai SSH-yhteyden kautta melkillä aiheuttaa luultavasti seuraavan virheen:

```
no display name and no $DISPLAY environment variable
```

Käynnistä Windowsin tapauksessa sovellus joko suoraan Windows-komentoriviltä, tai seuraa [tässä](https://stackoverflow.com/questions/48254530/tkinter-in-ubuntu-inside-windows-10-error-no-display-name-and-no-display-env) keskustelussa esitettyjä ohjeita. Melkin tapauksessa käytä sovellusta SSH-yhteyden sijaan [virtuaalityöaseman](https://vdi.helsinki.fi/) kautta.


## Graafiset komponentit

Tkinter tarjoaa käyttöömme monia graafisia komponentteja, kuten tekstiä, painikkeita ja tekstikenttiä. Tekstin lisääminen onnistuu `Label`-komponentin avulla:

```python
from tkinter import Tk, ttk

class UI:
    def __init__(self, root):
        self._root = root

    def start(self):
        label = ttk.Label(master=self._root, text="Hello world!")

        label.pack()

window = Tk()
window.title("TkInter example")

ui = UI(window)
ui.start()

window.mainloop()
```

Koodi sai hieman paremman rakenteen. `UI`-luokka saa konstruktorin kautta juurikomponentin, johon se liittää lisäämänsä komponentit. Metodi `start` alustaa `Label`-olion ja kertoo sille parametrin `master` kautta, että se liitetään juurikomponenttiin, `root`. `text`-parametri sen sijaan määrittelee itse näytettävän tekstin.

Huomaa, ettei komponenttia näytetä ennen `pack`-metodin kutsua. Tutustumme metodin merkitykseen pian, mutta lisätään sitä ennen vielä lisää komponentteja käyttöliittymäämme.

```python
def start(self):
    label = ttk.Label(master=self._root, text="Hello world!")
    button = ttk.Button(master=self._root, text="Button")
    entry = ttk.Entry(master=self._root)
    checkbutton = ttk.Checkbutton(master=self._root, text="Check button")
    radiobutton = ttk.Radiobutton(master=self._root, text="Radio button")

    label.pack()
    button.pack()
    entry.pack()
    checkbutton.pack()
    radiobutton.pack()
```

Nyt käyttöliittymämme näyttää seuraavalta:

![TkInter](/assets/images/python/tkinter-1.png)

Tkinter tarjoaa komponenteista sekä ttk-moduulista löytyviä versioita että niiden alkuperäisiä Tkinter-toteutuksia. Käytimme tässä edellisiä (ttk), koska ne tarjoavat modernimman ulkoasun ja tukevat käyttöjärjestelmän teemoja. Keskitymme jatkossakin ttk-moduulin välineisiin.

## Komponenttien asettelu

Edellisestä esimerkissä huomasimme, että `pack`-metodin kutsu asettaa komponentit allekkain. Kutsujen järjestyksellä on väliä, koska metodi etsii suorituksen hetkellä ensimmäisen "tyhjän" paikan komponentille. Voimme vaikuttaa mihin suuntaan komponentit asetellaan käyttämällä `side`-parametria:

```python
from tkinter import Tk, ttk, constants


class UI:
    def __init__(self, root):
        self._root = root

    def start(self):
        label = ttk.Label(master=self._root, text="Hello world!")
        button = ttk.Button(master=self._root, text="Button")
        entry = ttk.Entry(master=self._root)
        checkbutton = ttk.Checkbutton(master=self._root, text="Check button")
        radiobutton = ttk.Radiobutton(master=self._root, text="Radio button")

        label.pack(side=constants.LEFT)
        button.pack(side=constants.LEFT)
        entry.pack()
        checkbutton.pack()
        radiobutton.pack()

# ...
```

Komponenttien asettelussa `pack`-metodin käyttöä käytännöllisempää on käyttää `grid`-metodia. Gridissä on rivejä ja sarakkeita, joihin voimme sijottaa komponentteja kutsumalla `pack`-metodin sijaan `grid`-metodia:

```python
def start(self):
    heading_label = ttk.Label(master=self._root, text="Login")

    username_label = ttk.Label(master=self._root, text="Username")
    username_entry = ttk.Entry(master=self._root)

    password_label = ttk.Label(master=self._root, text="Password")
    password_entry = ttk.Entry(master=self._root)

    button = ttk.Button(master=self._root, text="Button")

    heading_label.grid(row=0, column=0, columnspan=2)

    username_label.grid(row=1, column=0)
    username_entry.grid(row=1, column=1)

    password_label.grid(row=2, column=0)
    password_entry.grid(row=2, column=1)

    button.grid(row=3, column=0, columnspan=2)
```

Käyttöliittymällämme on käytössä neljän rivin ja kahden sarakkeen gridi. Lopputulos näyttää seuraavalta:

![TkInter](/assets/images/python/tkinter-2.png)

`heading_label` on ensimmäisellä rivillä ja ensimmäisellä sarakkeella. Tämä tulee ilmi `grid`-metodin `row`- ja `column`-parametreista. Lisäksi `heading_label` levittäytyy kahdelle sarakkeelle, eli vie leveyssuunnassa kaiken tilan. Tämä käy ilmi `columspan`-parametrista.

`username_label` on toisella rivillä ja ensimmäisellä sarakkeella. Tämän viereen tulee `username_entry`, joka on samalla rivillä, mutta toisella sarakkeella. `password_label` ja `password_entry` asettuvat samankaltaisesti, mutta vain eri riville.

Lopuksi `button` asettuu gridin viimeiselle, kolmannelle riville. Samoin kuten `heading_label`, myös `button` levittäytyy kahdelle sarakkeelle.

Olemme käyttöliittymään melko tyytyväisiä, mutta pari pientä yksityiskohtaa pitäisi vielä korjata. Kun kasvatamme ikkunan kokoa, huomaamme, ettei komponenttien koko muutu tämän seurauksena. Haluaisimme, että tekstikentät ja kirjautumispainike ottaisivat kaiken jäljellä jäävän tilan leveyssuunnassa. Tämä onnistuu konfiguroimalla juurikomponentin gridin sarakkeita:

```python
def start(self):
    heading_label = ttk.Label(master=self._root, text="Login")

    username_label = ttk.Label(master=self._root, text="Username")
    username_entry = ttk.Entry(master=self._root)

    password_label = ttk.Label(master=self._root, text="Password")
    password_entry = ttk.Entry(master=self._root)

    button = ttk.Button(master=self._root, text="Button")

    heading_label.grid(row=0, column=0, columnspan=2)

    username_label.grid(row=1, column=0)
    username_entry.grid(row=1, column=1)

    password_label.grid(row=2, column=0)
    password_entry.grid(row=2, column=1)

    button.grid(row=3, column=0, columnspan=2)

    # konfiguroidaan toisen sarakkeen painoksi 1
    self._root.grid_columnconfigure(1, weight=1)
```

`grid_columnconfigure`-metodia tulee kutsua `master`-parametrin kautta annetulle juurikomponentille. Konfiguroimme toisen sarakkeen (huomaa, että indeksi alkaa nollasta) painoksi 1. Tämä tarkoittaa, että sarake ottaa kaiken vapaana olevan tilan leveyssuunnassa.

Käyttöliittymä ei tämänkään muutokseen jälkeen näytä siltä, miltä pitäisi. Tämä johtuu siitä, että meidän täytyy vielä kertoa `username_entry`-, `password_entry`- ja `button`-komponenteille, mihin suuntiin ne sijoittuvat. Tämä onnistuu `sticky`-parametrin avulla:

```python
def start(self):
    heading_label = ttk.Label(master=self._root, text="Login")

    username_label = ttk.Label(master=self._root, text="Username")
    username_entry = ttk.Entry(master=self._root)

    password_label = ttk.Label(master=self._root, text="Password")
    password_entry = ttk.Entry(master=self._root)

    button = ttk.Button(master=self._root, text="Button")

    # vasempaan laitaan
    heading_label.grid(row=0, column=0, columnspan=2, sticky=constants.W)

    username_label.grid(row=1, column=0)
    # vasempaan ja oikeaan laitaan
    username_entry.grid(row=1, column=1, sticky=(constants.E, constants.W))

    password_label.grid(row=2, column=0)
    # vasempaan ja oikeaan laitaan
    password_entry.grid(row=2, column=1, sticky=(constants.E, constants.W))

    # vasempaan ja oikeaan laitaan
    button.grid(row=3, column=0, columnspan=2, sticky=(constants.E, constants.W))

    self._root.grid_columnconfigure(1, weight=1)
```

Nyt käyttöliittymä näyttää seuraavalta:

![TkInter](/assets/images/python/tkinter-3.png)

Kaikki kolme komponenttia sijoittuvat siis, sekä itä- (E), että länsisuunnassa (W). `sticky`-parametrin `constants.E, constants.W` arvo saa komponentin sijoittumaan sekä vasemmalle että oikealle. `header_label`-komponentin `sticky`-parametrin arvo `constants.W` saa sen sijoittumaan vasemmalle.

`sticky`-parametrille mahdollisia arvoja ovat `constants.W` (vasen), `constants.E` (oikea), `constants.N` (ylä), `constants.S` (ala) ja näiden kombinaatiot [tuplena](https://docs.python.org/3.3/library/stdtypes.html?highlight=tuple#tuple). Arvoista voi käyttää myös suoraan merkkijonoesitystä, kuten `"w"` vakion `constants.W` sijaan. Vakioiden käyttö on kuitenkin suotavaa.

Huomaa, että `grid`-kutsuissa rivin ja sarakkeen määrittäminen ei ole aina tarpeen. Rivi on oletusarvoisesti seuraava vapaa rivi ja sarake on ensimmäinen sarake (eli 0). Äskeisen esimerkin `grid`-kutsut voisi siis kirjoittaa seuraavasti:

```python
heading_label.grid(columnspan=2, sticky=constants.W)
username_label.grid()
username_entry.grid(row=1, column=1, sticky=(constants.E, constants.W))
password_label.grid()
password_entry.grid(row=2, column=1, sticky=(constants.E, constants.W))
button.grid(columnspan=2, sticky=(constants.E, constants.W))
```

## Gridin hienosäätöä

Edellisen esimerkin komponentit on aseteltu tällä hetkellä melko tiiviisti ja käyttöliittymä kaipaisi hieman väljyyttä. Voimme lisätä gridin soluille tilaa leveys- ja pituussuunnassa käyttämällä `grid`-metodin paametreja `padx` ja `pady`. Kuten nimistäkin jo voi päätellä, `padx` lisää väliä leveys- `pady` pituussuunnassa:

```python
heading_label.grid(columnspan=2, sticky=constants.W, padx=5, pady=5)
username_label.grid(padx=5, pady=5)
username_entry.grid(row=1, column=1, sticky=(constants.E, constants.W), padx=5, pady=5)
password_label.grid(padx=5, pady=5)
password_entry.grid(row=2, column=1, sticky=(constants.E, constants.W), padx=5, pady=5)
button.grid(columnspan=2, sticky=(constants.E, constants.W), padx=5, pady=5)
```

Lopputulos näyttää seuraavalta:

![TkInter](/assets/images/python/tkinter-4.png)

Tällä hetkellä käyttöliittymän tekstikentät ovat hieman kapeita. Voimme leventää niitä konfiguroimalla niiden sarakkeen `minsize`-parametria. Tekstikentät ovat toisessa sarakkeessa, joten konfiguraatio onnistuu seuraavasti:

```python
self._root.grid_columnconfigure(1, weight=1, minsize=300)
```

Nyt tekstikenttät ovat automaattisesti leveämpiä, mutta myös levenevät, kun ikkunan leveyttä muutetaan:

![TkInter](/assets/images/python/tkinter-5.png)

## Tapahtumankäsittelijät

Tkinter mahdollistaa erilaisten tapahtumien, kuten painikkeen painamisen, käsittelyn. Käsittelyllä tässä yhteydessä tarkoitetaan, että voimme määrittää funktion, jota kutsutaan, kun esimerkiksi painiketta painetaan. Käytetään esimerkkinä seuraavaa koodia, jossa määritellään yksi tekstikenttä ja yksi painike:

```python
from tkinter import Tk, ttk

class UI:
    def __init__(self, root):
        self._root = root
        self._entry = None

    def start(self):
        self._entry = ttk.Entry(master=self._root)
        button = ttk.Button(master=self._root, text="Button")

        self._entry.grid(row=0, column=0)
        button.grid(row=1, column=0)

window = Tk()
window.title("TkInter example")

ui = UI(window)
ui.start()

window.mainloop()
```

Lisätään koodiin toiminallisuus, joka tulostaa tekstikentän arvon, kun painiketta painetaan:

```python
class UI:
    def __init__(self, root):
        self._root = root
        self._entry = None

    def start(self):
        self._entry = ttk.Entry(master=self._root)

        button = ttk.Button(
          master=self._root,
          text="Button",
          command=self._handle_button_click
        )

        self._entry.grid(row=0, column=0)
        button.grid(row=1, column=0)
    
    def _handle_button_click(self):
        entry_value = self._entry.get()
        print(f"Value of entry is: {entry_value}")
# ...
```

`UI`-luokan metodi `_handle_button_click` lukee tekstikentän arvon `get`-metodilla ja tulostaa sen. Metodin kutsuminen napin painalluksen yhteydessä tapahtuu `start`-metodissa, jossa `button`-komponentille on määritelty parametri `command`. Parametrin arvo tulee olla kutsuttavissa, joten se voi olla esimerkiksi metodi, funktio, tai [lambda](https://docs.python.org/3/tutorial/controlflow.html#lambda-expressions). Lambdan käyttö olisi erityisen hyödyllistä esimerkiksi, jos haluaisimme antaa `handle_button_click`-metodille argumentin:

```python
button_a = ttk.Button(
    master=self._root,
    text="Button A",
    command=lambda: self._handle_button_click('button a')
)

button_b = ttk.Button(
    master=self._root,
    text="Button B",
    command=lambda: self._handle_button_click('button b')
)
```

Esimerkissä painikkeen painallus kutsuu lambdaa, joka puolestaa kutsuu metodia tietyllä argumentilla.

## Monta näkymää

Sovelluksissa on usein tarve useammalle näkymälle. Näkymät voidaan toteuttaa esimerkiksi luokkina, jotka saavat konstruktorin kautta juurikomponenttinsa:

```python
from tkinter import ttk, constants

class HelloView:
    def __init__(self, root, handle_good_bye):
        self._root = root
        self._handle_good_bye = handle_good_bye
        self._frame = None

        self._initialize()

    def pack(self):
        self._frame.pack(fill=constants.X)

    def destroy(self):
        self._frame.destroy()
    
    def _initialize(self):
        self._frame = ttk.Frame(master=self._root)
        label = ttk.Label(master=self._frame, text="Hello!")
        
        button = ttk.Button(
            master=self._frame,
            text="Say good bye",
            command=self._handle_good_bye
        )

        label.grid(row=0, column=0)
        button.grid(row=1, column=0)
```

Luokan `initialize`-metodissa määritellään meille ennestään tuntematon `Frame`-komponentti. `Frame`-komponentilla ei ole visuaalisesti mitään erityispiirteitä, mutta se on erittäin kätevä esimerkiksi komponenttien ryhmittelyssä. Haluamme eristää näkymän komponentit muiden näkymien komponenteista, joten liitämme ne `master`-parametrin kautta `frame`-komponenttiin. Tämä mahdollistaa sen, että voimme näyttää kaikki näkymän komponentit kerralla luokan `pack`-metodin avulla. Lisäksi voimme tuhota kaikki näkymän komponentit luokan `destroy`-metodilla. Kun komponentti tuhotaan, myös sen lapsikomponentit, eli `master`-parametrin avulla liitetyt komponentit tuhotaan.

Muokataan `UI`-luokkaa niin, että `HelloView`-näkymä näytetään, kun käyttöliittymä käynnistyy:

```python
from tkinter import Tk
from hello_view import HelloView

class UI:
    def __init__(self, root):
        self._root = root
        self._current_view = None

    def start(self):
        self._show_hello_view()
    
    def _handle_good_bye(self):
        print("User wants to say good bye")

    def _show_hello_view(self):
        self._current_view = HelloView(
            self._root,
            self._handle_good_bye
        )

        self._current_view.pack()

window = Tk()
window.title("TkInter example")

ui = UI(window)
ui.start()

window.mainloop()
```

Käyttöliittymän "Say good bye"-painikkeen painaminen pitäisi tulostaa `_handle_good_bye`-metodissa määrittelemämme viesti. Toteutetaan vielä toinenkin `HelloView`-näkymää vastaava näkymä, `GoodByeView`:

```python
from tkinter import ttk, constants

class GoodByeView:
    def __init__(self, root, handle_hello):
        self._root = root
        self._handle_hello = handle_hello
        self._frame = None

        self._initialize()

    def pack(self):
        self._frame.pack(fill=constants.X)

    def destroy(self):
        self._frame.destroy()
    
    def _initialize(self):
        self._frame = ttk.Frame(master=self._root)
        label = ttk.Label(master=self._frame, text="Good bye!")

        button = ttk.Button(
            master=self._frame,
            text="Say hello",
            command=self._handle_hello
        )

        label.grid(row=0, column=0)
        button.grid(row=1, column=0)
```

Muokataan `UI`-luokkaa niin, että käyttäjä voi siirtyä näiden kahden näkymän välillä painamalla näkymien painikkeita:

```python
from tkinter import Tk
from hello_view import HelloView
from good_bye_view import GoodByeView

class UI:
    def __init__(self, root):
        self._root = root
        self._current_view = None

    def start(self):
        self._show_hello_view()

    def _hide_current_view(self):
        if self._current_view:
            self._current_view.destroy()

        self._current_view = None

    def _handle_good_bye(self):
        self._show_good_bye_view()

    def _handle_hello(self):
        self._show_hello_view()

    def _show_hello_view(self):
        self._hide_current_view()

        self._current_view = HelloView(
            self._root,
            self._handle_good_bye
        )

        self._current_view.pack()

    def _show_good_bye_view(self):
        self._hide_current_view()

        self._current_view = GoodByeView(
            self._root,
            self._handle_hello
        )

        self._current_view.pack()

# ...
```

Nyt luokasta löytyy metodi `_hide_current_view`, joka piilottaa nykyisen näkymän kutsumalla sen `destroy`-metodia. Metodit `_show_hello_view` ja `_show_good_bye_view` ensin piilottavat nykyisen näkymän ja sen jälkeen näyttävät uuden näkymän. Metodit `_handle_hello` ja `_handle_good_bye` yksinkertaisesti kutsuvat ao. näkymän näyttävää metodia.

Käyttäjän pitäisi nyt pystyä siirtymään näkymien välillä painamalla "Say hello"- ja "Say good bye"-painikkeita.

## Muuttujat

Joskus haluamme liittää komponentissa jonkin ominaisuuden muuttuvaan arvoon. Esimerkiksi haluamme vaihtaa `Label`-komponentin tekstiä, kun nappia painetaan. Tkinter tarjoaa erilaisia [muuttujaluokkia](https://docs.python.org/3/library/tkinter.html#coupling-widget-variables), joilla on `get`- ja `set`-metodit niiden arvon lukemista ja asettamista varten. Muuttujaluokkia löytyy eri tyyppisten arvojen tallentamiseen: `StringVar`, `BooleanVar`, `DoubleVar` ja `IntVar`.

`StringVar`-luokkaa voimme hyödyntää esimerkiksi toiminnallisuudessa, jossa painikkeen painaminen vaihtaa tekstin sisältöä:

```python
from tkinter import Tk, ttk, StringVar

class UI:
    def __init__(self, root):
        self._root = root
        self._label_var = None

    def start(self):
        self._label_var = StringVar()
        self._label_var.set("0")

        label = ttk.Label(master=self._root, textvariable=self._label_var)

        increase_button = ttk.Button(
            master=self._root,
            text="Increase",
            command=self._increase
        )

        decrease_button = ttk.Button(
            master=self._root,
            text="Decrease",
            command=self._decrease
        )

        increase_button.grid(row=0, column=0)
        label.grid(row=0, column=1)
        decrease_button.grid(row=0, column=2)
    
    def _increase(self):
        value = self._label_var.get()
        increased_value = str(int(value) + 1)

        self._label_var.set(increased_value)

    def _decrease(self):
        value = self._label_var.get()
        decreased_value = str(int(value) - 1)

        self._label_var.set(decreased_value)

window = Tk()
window.title("TkInter example")

ui = UI(window)
ui.start()

window.mainloop()
```

`UI`-luokan `start`-metodissa tallennamme `StringVar`-luokan olion `label_var`-attribuuttiin ja asetamme sille alkuarvoksi `"0"` kutsumalla `set`-metodia. Luokan metodit `increase` ja `decrease` lukevat muuttujan arvon `get`-metodin avulla ja asettavat sille uuden arvon `set`-metodilla. Muuttuja liitetään `label`-komponentin tekstiksi `textvariable`-parametrin kautta.

Toinen yleinen käyttökohde muuttujaluokille on [CheckButton](https://www.tutorialspoint.com/python/tk_checkbutton.htm)- ja [RadioButton](https://www.tutorialspoint.com/python/tk_radiobutton.htm)-komponentit. Näiden arvoina voi käyttää `IntVar`-luokan olioita `variable`-parametrin kautta.

## Lisäluettavaa

[Python GUI Programming With Tkinter](https://realpython.com/python-gui-tkinter/)-ohje sisältää mm. yleisiä Tkinter-ohjeita ja esimerkkejä yksittäisten komponenttien käytöstä.
