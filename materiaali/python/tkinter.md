---
layout: page
permalink: /python/tkinter
title_long: TkInter ja graafisen käyttöliittymän toteutus
---

Python-sovellusten graafisten käyttöliittymien toteutuksessa on jo standardiksi muodostonut [TkInter](https://wiki.python.org/moin/TkInter)-kirjaston käyttö. Tutustutaan tässä osiossa, miten sen avulla voi toteuttaa graafisia käyttöliittymiä.

TkInter on Pythonin omia moduuleja ja siihen liittyvät käyttöjärjestelmäkohtaiset kirjastot tulevat useimmiten Python-asennuksien mukana. Ennen ohjelmoimisen aloittamista on kuitenkin hyvä tarkistaa, että asennus on kunnossa. Käynnistä Python-komentorivi komennolla `python3` (komentoa ei tarvitse suorittaa virtuaaliympäristön sisällä, koska emme käytä ulkoisia riippuvuuksia). Syötä komentoriville `import tkinter` ja paina Enter-painiketta. Jos lopputuloksena ei ole virhettä, asennus on kunnossa. Jos näin ei ole, asenna tietokoneellesi uusin Python-versio [täältä](https://www.python.org/downloads/) ja yritä uudelleen. Voit sulkea komentorivin syöttämällä `exit()` ja painamalla Enter-painiketta.

## Ikkunan avaaminen

Graafista käyttöliittymää käytetään usein tietokoneen näytölle aukeavan ikkunan kautta. Ikkunan alustaminen onnistuu `Tk`-luokan avulla:

```python
from tkinter import Tk

window = Tk()
window.title("TkInter example")
window.mainloop()
```

Kun koodi suoritetaan, pitäisi aueta ikkuna, jonka otsakkeena on `title`-metodin kautta asetettu, "TkInter example". `mainloop`-metodin kutsu käynnistää loputtoman silmukan, jonka aikana TkInter odottaa käyttöliittymään kohdistuvia tapahtumia, kuten painikkeiden painalluksia. Huomaa, että `mainloop`-metodin kutsun jälkeistä koodia ei enää suoriteta:

```python
# ...
window.mainloop()
print("Hello world!")
```

Tulostusta ei tulosteta, koska koodin suoritus on siirtynyt ikuiseen silmukkaan.

## Graafiset komponentit

TkInter tarjoaa käyttöömme monia graafisia komponentteja, kuten tekstiä, painikkeita ja tekstikenttiä. Tekstin lisääminen onnistuu `Label`-komponentin avulla:

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

Koodi sai hieman paremman rakenteen. `UI`-luokka saa konstruktorin kautta juurikomponentin, johon se liittää lisäämänsä komponentit. Metodissa `start` alustaa `Label`-olion ja kerromme sille parametrin `master` kautta, että se liitetään juurikomponenttiin, `root`. `text`-parametri sen sijaan määrittelee itse näytettävän tekstin.

Huomaa, ettei komponettia näytetä ennen `pack`-metodin kutsua. Tutustumme metodin merkitykseen pian. Lisätään sitä ennen vielä lisää komponentteja käyttöliittymäämme.

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

![TkInter](./kuvat/tkinter-1.png)

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

Käyttöliittymällämme on käytössä kolmen rivin ja kahden sarakkeen gridi. Lopputulos on näyttää seuraavalta:

![TkInter](./kuvat/tkinter-2.png)

`heading_label` on ensimmäisellä rivillä ja ensimmäisellä sarakkeella. Tämä tulee ilmi `grid`-metodin `row`- ja `column`-parametreista. Lisäksi `heading_label` levittäytyy kahdelle sarakkeelle, eli vie leveyssuunnassa kaiken tilan. Tämä käy ilmi `columspan`-parametrista.

`username_label` on toisella rivillä ja ensimmäisellä sarakkeella. Tämän viereen tulee `username_entry`, joka on samalla rivillä, mutta toisella sarakkeella. `password_label` ja `password_entry` asettuvat samankaltaisesti, mutta vain eri riville.

Lopuksi `button` asettuu gridin viimeiselle, kolmannelle riville. Samoin kuten `heading_label`, myös `button` levittäytyy kahdelle sarakkeelle.

Olemme käyttöliittymään melko tyytyväisiä, mutta pari pientä yksityiskohtaa pitäisi vielä korjata. Kun kasvatamme ikkunan kokoa, huomaamme, ettei komponenttien koko muutu tämän seurauksena. Haluaisimme, että tekstikentät ja kirjautumis-painike ottaisi kaiken jäljellä jäävän tilan leveyssuunnassa. Tämä onnistuu konfiguroimalla juurikomponentin gridin sarakkeita:

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

![TkInter](./kuvat/tkinter-3.png)

Kaikki kolme komponenttia sijoittuvat siis, sekä itä- (E), että länsi-suunnassa (W). `sticky`-parametrin `constants.EW` arvo saa siis komponentien sijoittumaan sekä vasemmalle, että oikealle. `header_label`-komponentin `sticky`-parametrin arvo `constants.W` saa sen sijoittumaan vasemmalle.

`sticky`-parametrille mahdollisia arvoja ovat `constants.W` (vasen), `constants.E` (oikea), `constants.N` (ylä), `constants.S` (ala) ja näiden kombinaatit [tuplena](https://docs.python.org/3.3/library/stdtypes.html?highlight=tuple#tuple). Arvoista voi käyttää myös suoraan merkkijonoesitystä, kuten `"w"` vakion `constants.W` sijaan. Vakioiden käyttö on kuiten suotavaa.

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

Edellisen esimerkin komponentit on aseteltu tällä hetkellä melko tiiviistii ja käyttöliittymä kaipaisi hieman väljyyttä. Voimme lisätä gridin soluille väliä leveys- ja pituussuunnassa käyttämällä `grid`-metodin `padx` ja `pady` metodeja. Kuten parametrien nimistä voi päätellä, `padx` lisää väliä leveys- `pady` pituussuunnassa:

```python
heading_label.grid(columnspan=2, sticky=constants.W, padx=5, pady=5)
username_label.grid(padx=5, pady=5)
username_entry.grid(row=1, column=1, sticky=(constants.E, constants.W), padx=5, pady=5)
password_label.grid(padx=5, pady=5)
password_entry.grid(row=2, column=1, sticky=(constants.E, constants.W), padx=5, pady=5)
button.grid(columnspan=2, sticky=(constants.E, constants.W), padx=5, pady=5)
```

Lopputulos näyttää seuraavalta:

![TkInter](./kuvat/tkinter-4.png)

Tällä hetkellä käyttöliittymän tekstikentät ovat hieman kapeita. Voimme leventää niitä konfiguroimalla niiden sarakkeen `minsize`-parametria. Tekstikentät ovat toisessa sarakkeessa, joten konfiguraatio onnistuu seuraavasti:

```python
self._root.grid_columnconfigure(1, weight=1, minsize=300)
```

Nyt tekstikenttät ovat automaattisesti leveämpiä, mutta myös levenevät, kun ikkunan leveyttä muutetaan:

![TkInter](./kuvat/tkinter-5.png)

## Tapahtumankäsittelijät

TkInter mahdollistaa erilaisten tapahtumien, kuten napin painamisen, käsittelyn. Käsittelyllä tässä yhteydessä tarkoitetaan, että voimme määrittää funktion, jota kutsutaan, kun esimerkiksi painiketta painetaan. Käytetään esimerkkinä seuraavaa koodia, jossa määritellään yksi tekstikenttä ja yksi painike:

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

`UI`-luokan metodi `handle_button_click` lukee tekstikentän arvon `get`-metodilla ja tulostaa sen. Metodin kutsuminen napin painalluksen yhteydessä tapahtuu `start`-metodissa, jossa `button`-komponentille on määritelty `command`-parametri. Parametrin arvo tulee olla kutsuttavissa, joten se voi olla esimerkiksi metodi, funktio, tai [lambda](https://docs.python.org/3/tutorial/controlflow.html#lambda-expressions). Lambdan käyttö olisi erityisen hyödyllistä esimerkiksi, jos haluaisimme antaa `handle_button_click`-metodille argumentin:

```python
button_a = ttk.Button(
    master=self._root,
    text="Button A",
    command=lambda: self._handle_button_click('button a')
)

button_a = ttk.Button(
    master=self._root,
    text="Button B",
    command=lambda: self._handle_button_click('button b')
)
```

Esimerkissä napin painallus kutsuu lambdaa, joka puolestaa kutsuu metodia tietyllä argumentilla.

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

Luokan `initialize`-metodissa määritellään meille ennestään tuntematon, `Frame`-komponentti. `Frame`-komponentilla ei ole visuaalisesti mitään erityispiirteitä, mutta se on erittäin kätevä esimerkiksi komponenttien ryhmittelyssä. Haluamme eristää näkymän komponentit muiden näkymien komponenteista, joten liitämme ne `master`-parametrin kautta `frame`-komponenttiin. Tämä mahdollistaa sen, että voimme näyttää kaikki näkymän komponentit kerralla luokan `pack`-metodin avulla. Lisäksi voimme tuhota kaikki näkymän komponentit luokan `destroy`-metodilla. Kun komponentti tuhotaan, myös sen lapsikomponentit, eli `master`-parametrin avulla liitetyt komponentit tuhotaan.

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

Käyttöliittymän "Say good bye"-painikkeen painaminen pitäisi tulostaa `handle_good_bye`-metodissa määritellemämme viesti. Toteutetaan vielä toinen `HelloView`-näkymää vastaava näkymä, `GoodByeView`:

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

Nyt luokasta löytyy metodi `hide_current_view`, joka piilottaa nykyisen näkymän kutsumalla sen `destroy`-metodia. Metodit `show_hello_view` ja `show_good_bye_view` ensin piilottavat nykyisen näkymän ja sen jälkeen näyttävät uuden näkymän. `handle_hello`- ja `handle_good_bye`-metodit yksinkertaisesti kutsuvat näytettävän näkymän näyttävää metodia.

Käyttäjän pitäisi nyt pystyä siirtymään näkymien välillä painamalla "Say hello"- ja "Say good bye"-painikkeita.

## Muuttujat

Joskus haluamme liittää komponentissa jonkin ominaisuuden muuttuvaan arvoon. Esimerkiksi haluamme vaihtaa `Label`-komponentin tekstiä, kun nappia painetaan. TkInter tarjoaa erilaisia [muuttujaluokkia](https://effbot.org/tkinterbook/variable.htm), joilla on `get`- ja `set`-metodit niiden arvon lukemista ja asettamista varten. Muuttajaluokkia löytyy eri tyyppisten arvojen tallentamiseen: `StringVar`, `BooleanVar`, `DoubleVar` ja `IntVar`.

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

`UI`-luokan `start`-metodissa talletamme `StringVar`-luokan olion `label_var`-attribuuttiin ja asetamme sille alkuarvoksi `"0"` kutsumalla `set`-metodia. Luokan metodit `increase` ja `decrease` lukevat muuttujan arvon `get`-metodin avulla ja asettavat sille uuden arvon `set`-metodilla. Muuttuja liitetään `label`-komponentin tekstiksi `textvariable`-parametrin kautta.

Toinen yleinen käyttökohde muuttujaluokille on [CheckButton](http://effbot.org/tkinterbook/checkbutton.html)- ja [RadioButton](http://effbot.org/tkinterbook/radiobutton.htm)-komponentit. Näiden arvoina voi käyttää `IntVar`-luokan olioita `variable`-parametrin kautta.

## Lisäluettavaa

[Python GUI Programming With Tkinter](https://realpython.com/python-gui-tkinter/)-ohje sisältää mm. yleisiä TkInter-ohjeita ja esimerkkejä yksittäisten komponenttien käytöstä.
