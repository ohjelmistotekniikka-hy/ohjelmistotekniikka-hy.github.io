---
layout: page
permalink: /python/pygame
title: Pelien toteutus Pygame-kirjastolla
---

Kuten materiaalissa on jo todettu, sovelluslogiikan ja käyttöliittymän erottaminen toisistaan muodostuu erittäin tärkeäksi ohjelmiston testattavuuden ja laajennettavuuden kannalta. Etenkin pelien kohdalla, on toteutuksessa helppo sortua ajatukseen, että kehitystä kannattaa tehdä käyttöliittymä edellä. Tämä johtaa helposti "spagettikoodiin", jossa käyttöliittymän ja sovelluslogiikan koodi nivoutuvat tiiviisti yhteen siten, että koodin luettavuus ja testattavuus kärsivät.

Tässä osiossa tutustutaan, miten pelejä voi toteuttaa [Pygame](https://www.pygame.org)-kirjaston avulla. Kirjasto saattaa olla jo ennestään tuttu Ohjelmoinnin jatkokurssilta, jossa sen avulla toteutettiin yksinkertaisia pelejä. Esimerkkinä osiossa käytetään yksinkertaista [Sokoban](https://fi.wikipedia.org/wiki/Sokoban)-peliä. Samaa peliä on käytetty esimerkkinä myös Ohjelmoinnin jatkokurssilla, mutta kyseisessä esimerkissä ei keskitytty esimerkiksi pelin testaamiseen. Projektin lähdekoodi löytyy kokonaisuudessaan [tästä](https://github.com/ohjelmistotekniikka-hy/pygame-sokoban) repositoriosta. Projektista voi ottaa vinkkejä oman pelin toteutukseeen, mutta koodin suora kopioiminen on kiellettyä.

**HUOM:** Pygame-ikkunan käynnitys SSH-yhteyden, tai WSL:n kautta aiheuttaa luultavasti seuraavan virheen:

```
pygame.error: No available video device
```

Käytä SSH-yhteyden sijaan [virtuaalityöasemaa](https://vdi.helsinki.fi) ja WSL:n sijaan Windowsin komentoriviä.

## Pygame-kirjaston asennus Poetryn avulla

Pygamen asennus Poetry-projektissa onnistuu seuraavasti:

```shell
poetry add pygame
```

## Sovelluslogiikan suunnitteleminen

Järkevästi suunniteltu sovelluslogiikka on pelin koko toteutuksen kulmakivi. Suunnittelussa kannattaa lähteä liikkeelle miettimällä, miten pelin logiikka toimii ja minkälaisia objekteja siiheen liitty. Kaksiulotteisissa peleissä pelin objekteja mallinnetaan usein suorakulmioilla, joilla on x- ja y-koordinaatti, sekä leveys- ja korkeus-arvo. Moni pelien sovellusloogiikan toiminallisuus liittyy siihen, mitkä pelin objektit leikkaavat toisiaan, eli selkokielellä "törmäävät" toisiinsa. Tästä hyvänä esimerkkinä on se, ettei pelihahmo yleensä pysty liikkumaan seinien läpi.

Sokoban-pelissä erilaisia objekteja ovat:

- _Robotti_, joka toimii pelihahmona. Pelihahmo voi liikkua lattialla ja siirtää laatikoita, jos ne eivät törmää seinään tai toiseen laatikkoon
- _Seinä_, joka rajaa pelikentän. Mikään muu objekti ei voi liikkua seinän läpi
- _Lattia_, jonka päällä robotti voi kävellä
- _Laatikko_, jota robotti voi siirtää, jos se ei törmää seinään tai muihin laatikoihin
- _Kohde_, johon laatikko pitäisi siirtää

Pygamessa pelin objekteja mallinnetaan usein luokilla, jotka perivät [Sprite](https://www.pygame.org/docs/ref/sprite.html#pygame.sprite.Sprite)-luokan. Peliohjelmoinnin yhteydessä [sprite](<https://en.wikipedia.org/wiki/Sprite_(computer_graphics)>)-termillä tarkoitetaan usein kaksiulotteista kuvaa, jota käytetään antamaan pelin objektille sen visuaalinen ilme. `Sprite`-luokka tarjoaa visuaalisen ilmeen lisäksi myös muita hyödyllisiä toiminallisuuksia, kuten mahdollisuuden tarkistaa törmääkö tietty `Sprite`-olio joidenkin muiden `Sprite`-olioiden kanssa.

Sokoban-pelissä pelihahmon `Robot`-luokka näyttää seuraavalta:

```python
import pygame
import os

# polku tämän tiedoston hakemistoon
dirname = os.path.dirname(__file__)

# Peritään Sprite-luokka
class Robot(pygame.sprite.Sprite):
    def __init__(self, x=0, y=0):
        # kutsutaan yläluokan konstruktoria
        super().__init__()

        # muodostetaan polku tiedoston hakemistosta hakemistoon, jossa kuva sijaitsee
        self.image = pygame.image.load(
            os.path.join(dirname, "..", "assets", "robot.png")
        )

        # määritellään objektin ulottuvuudet. Tässä tapauksessa muodostetaan suorakulmia kuvan koon perusteella (50x50)
        self.rect = self.image.get_rect()

        # asetetaan alustavat x- ja y-koordinaatin arvot konstruktorin argumenttien perusteella
        self.rect.x = x
        self.rect.y = y
```

Luokan `image`-attribuutin arvoksi tulee asettaa kuva, joka piirretään näytölle. Huomaa, että kuvan polku muodustuu projektin hakemistorakenteen perusteeella, joka on tässä tapauksessa seuraava:

```
src/
  assets/
    robot.png
    ...
  sprites/
    __init__.py
    robot.py
  ...
poetry.lock
pyproject.toml
...
```

Attribuutti `rect` määrittää objektin ulottuvuudet suorakulmiona. Attribuutin arvo on helpointa asettaa kuvan ulottuvuuksien perusteella kutsumalla kuvan `get_rect`-metodia. Suorakulmion x- ja y-koordinaatin arvot kannattaa asettaa luokan konstruktorin argumenttien perusteella. Jos spritellä ei ole kuvaa, onnistuu `rect`-attribuutin alustus myös [Rect](https://www.pygame.org/docs/ref/rect.html)-luokan avulla:

```python
self.rect = pygame.Rect(x, y, width, height)
```

Huomaa, että `Robot`-luokan konstruktorilla voisi hyvin olla koordinaattien lisäksi myös muita argumentteja, kuten `name`, tai `color`.

## Pelin tilan hallinta

Pelin objektien tilan hallinta, kuten tieto, missä koordinaateissa objektit sijaitsevat, on yksi sovelluslogiikan tärkeimmistä vastuualueista. Kun sovelluslogiikka on toteutettu järkevästi, on pelinäkymän piirtäminen kohtalaisen triviaali vaihe, kuten tulemme pian huomaamaan. Sokoban-pelissä yksittäisen tason tilan hallinnasta vastaa `Level`-luokka:

```python
import pygame
from sprites.robot import Robot
from sprites.box import Box
from sprites.floor import Floor
from sprites.target import Target
from sprites.wall import Wall


class Level:
    def __init__(self, level_map, cell_size):
        self.cell_size = cell_size
        self.robot = None
        self.walls = pygame.sprite.Group()
        self.targets = pygame.sprite.Group()
        self.floors = pygame.sprite.Group()
        self.boxes = pygame.sprite.Group()
        self.all_sprites = pygame.sprite.Group()

        self._initialize_sprites(level_map)

    def _initialize_sprites(self, level_map):
        height = len(level_map)
        width = len(level_map[0])

        for y in range(height):
            for x in range(width):
                cell = level_map[y][x]
                normalized_x = x * self.cell_size
                normalized_y = y * self.cell_size

                if cell == 0:
                    self.floors.add(Floor(normalized_x, normalized_y))
                elif cell == 1:
                    self.walls.add(Wall(normalized_x, normalized_y))
                elif cell == 2:
                    self.targets.add(Target(normalized_x, normalized_y))
                elif cell == 3:
                    self.boxes.add(Box(normalized_x, normalized_y))
                    self.floors.add(Floor(normalized_x, normalized_y))
                elif cell == 4:
                    self.robot = Robot(normalized_x, normalized_y)
                    self.floors.add(Floor(normalized_x, normalized_y))

        self.all_sprites.add(
            self.floors,
            self.walls,
            self.targets,
            self.boxes,
            self.robot
        )
```

`Level`-luokan tarkoitus on tässä vaiheessa muodostaa kaksiulotteisesta taulukosta taulukon arvojen mukaisia `Sprite`-olioita. Taulukon numeroarvo vastaa tietyn tyyppistä `Sprite`-olioita ja arvon indeksi sen koordinaatteja. Luokan olion voi muodostaa esimerkiksi seuraavasti:

```python
from level import Level

LEVEL_MAP = [[1, 1, 1, 1, 1],
             [1, 0, 0, 0, 1],
             [1, 2, 3, 4, 1],
             [1, 1, 1, 1, 1]]

CELL_SIZE = 50


def main():
    level = Level(LEVEL_MAP, CELL_SIZE)


if __name__ == "__main__":
    main()
```

Luokan konstruktorin `cell_size`-argumentti kuvastaa pelin ruudukon solun kokoa. Kun solun koko on 50 pikseliä, tulee esimerkiksi taulukon indeksissä `[1][2]` oleva ruutu piirtää `(x, y)`-pisteeseen `(100, 50)`.

Pelin spritet kannattaa jaotella tyyppiensä perusteella ryhmiin, jotka ovat [Group](https://www.pygame.org/docs/ref/sprite.html#pygame.sprite.Group)-luokan olioita. Esimerkiksi seinät on lisätty `initialize_sprites`-metodissa `walls`-attribuuttiin tallennettuun `Group`-olioon kutsumalla olion [add](https://www.pygame.org/docs/ref/sprite.html#pygame.sprite.Group.add)-metodia seuraavasti:

```python
self.walls.add(Wall(normalized_x, normalized_y))
```

Spritejen ryhmittelyssä on suuria etuja. Esimerkiksi kaikki ryhmän spritet pystyy helposti piirtämään yhdellä [draw](https://www.pygame.org/docs/ref/sprite.html#pygame.sprite.Group.draw)-metodin kutsulla. Lisäksi ryhmän spritejen törmäyksen tarkastaminen jonkin toisen spriten kanssa onnistuu yhdellä [spritecollide](https://www.pygame.org/docs/ref/sprite.html#pygame.sprite.spritecollide)-funktion kutsulla. 

Kaikista pelin spriteistä kannattaa koostaa yksi ryhmä, mikä helpottaa niiden piirtämistä. Edellisessä esimerkissä kaikki spritet tallennettiin `all_sprites`-attribuuttiin seuraavasti:

```python
self.all_sprites.add(
    self.floors,
    self.walls,
    self.targets,
    self.boxes,
    self.robot
)
```

Kuten näkyy, `Group`-olioon voi lisätä `add`-metodin avulla helposti yksittäisen spriten, tai kaikki spritet tietystä ryhmästä. Huomaa, että _lisäysjärjestyksellä on väliä_, sillä ensimmäisenä ryhmään lisätty sprite piirretään ensimmäisenä. Jos esimerkiksi `floors` lisättäisiin ryhmään viimeisenä, piirtyisi samoissa koordinaateissa oleva laatikko tai robotti lattian alle.

Voimme nyt piirtää `Level`-olion kaikki spritet seuraavasti:

```python
import pygame
from level import Level

LEVEL_MAP = [[1, 1, 1, 1, 1],
             [1, 0, 0, 0, 1],
             [1, 2, 3, 4, 1],
             [1, 1, 1, 1, 1]]

CELL_SIZE = 50


def main():
    height = len(LEVEL_MAP)
    width = len(LEVEL_MAP[0])
    display_height = height * CELL_SIZE
    display_width = width * CELL_SIZE

    # alustetaan ikkuna
    display = pygame.display.set_mode((display_width, display_height))

    pygame.display.set_caption("Sokoban")

    level = Level(LEVEL_MAP, CELL_SIZE)

    # alustetaan Pygamen moduulit
    pygame.init()

    # piirretään all_sprites ryhmän spritet ikkunaan
    level.all_sprites.draw(display)
    
    running = True
    
    # käynnistään pelisilmukka
    while running:
        for event in pygame.event.get():
            if event.type == pygame.QUIT:
                running = False
        
        pygame.display.update()

    pygame.quit()

if __name__ == "__main__":
    main()
```

Funktio [set_mode](https://www.pygame.org/docs/ref/display.html#pygame.display.set_mode) alustaa ikkunan, jonka koko määritellään argumenttina annettuna tuplena. Funktio palauttaa [Surface](https://www.pygame.org/docs/ref/surface.html#pygame.Surface)-olion, johon spritejä voi piirtää. Rivillä `level.all_sprites.draw()` kutsutaan `all_sprites`-attribuuttiin tallennetun `Group`-olion metodia [draw](https://www.pygame.org/docs/ref/sprite.html#pygame.sprite.Group.draw), joka piirtää ryhmän spritet argumenttina annetulle `Surface`-oliolle.

Kun koodi suoritetaan, avautuu seuraavanlainen ikkuna:

![Sokoban](/assets/images/python/pygame-1.png)

## Spriten liikuttaminen

Spritejen liikuttaminen, esimerkiksi käyttäjän syötteiden perusteeella, on monissa peleissä yksi tärkeimmistä toiminallisuuksista. Spriten liikuttaminen onnistuu kutsumalla `Sprite`-olion `rect`-attribuuttiin tallennetun `Rect`-olion [move_ip](https://www.pygame.org/docs/ref/rect.html#pygame.Rect.move_ip)-metodia. Esimerkiksi robotin siirtämistä varten voi toteuttaa `Level`-luokkaan seuraavanlaisen metodin:

```python
def move_robot(self, dx=0, dy=0):
    self.robot.rect.move_ip(dx, dy)
```

Robotin liikuttelu onnistuu nyt seuraavasti:

```python
# liikutaan ylös
level.move_robot(dy=-50)
# liikutaan alas
level.move_robot(dy=50)
# liikutaan vasemmalle
level.move_robot(dx=-50)
# liikutaan oikealle
level.move_robot(dx=50)
```

## Sovelluslogiikan testaaminen

Koodia on syntynyt jo sen verran, että alkaa olla aika toteuttaa sovelluslogiikalle ensimmäinen testi. Pelien yksikkötestauksessa ei ole erityisiä eroja minkä tahansa muun tyyppisen ohjelmiston yksikkötestaamiseen nähden. Materiaalin [unittest-ohjeen](/python/viikko2#unittest-ja-testaaminen) pitäisi siis tarjota tarvittavat esitiedot pelin testaamisen aloittamiseen.

Toteutetaan testi, joka varmistaa, että robotti voi liikkua lattialla:

```python
import unittest
from level import Level

LEVEL_MAP_1 = [[1, 1, 1, 1, 1],
               [1, 0, 0, 0, 1],
               [1, 2, 3, 4, 1],
               [1, 1, 1, 1, 1]]

CELL_SIZE = 50


class TestLevel(unittest.TestCase):
    def setUp(self):
        self.level_1 = Level(LEVEL_MAP_1)

    def assert_coordinates_equal(self, sprite, x, y):
        self.assertEqual(sprite.rect.x, x)
        self.assertEqual(sprite.rect.y, y)

    def test_can_move_in_floor(self):
        robot = self.level_1.robot

        self.assert_coordinates_equal(robot, 3 * CELL_SIZE, 2 * CELL_SIZE)

        self.level_1.move_robot(dy=-CELL_SIZE)
        self.assert_coordinates_equal(robot, 3 * CELL_SIZE, CELL_SIZE)

        self.level_1.move_robot(dx=-CELL_SIZE)
        self.assert_coordinates_equal(robot, 2 * CELL_SIZE, CELL_SIZE)
```

Seuraavaksi voisi olla mielekästä toteuttaa `Level`-luokan `move_robot`-metodiin tarkistus, ettei robotti pysty liikkumaan seinien läpi. Tälle toiminallisuudelle voisi jälleen toteuttaa oman testinsä. Toteutusta ja testaamista kannattaa siis tehdä lyhyissä sykleissä.

## Törmäyksien tarkastaminen

Tällä hetkellä robotti voi liikkua seinien läpi, joka on pelin logiikan vastaista. Kuten edellä mainittiin, eräs hyvä puoli spritejen ryhmittelyssä on törmäyksien tarkastamisen helppous. Toteutetaan `Level`-luokkaan luokan sisäinen metodi `robot_can_move`, joka tarkistaa, voiko robotti liikkua argumentteina annettujen arvojen verran:

```python
def _robot_can_move(self, dx=0, dy=0):
    # siirretään robotti uuteen sijaintiin
    self.robot.rect.move_ip(dx, dy)

    # tarkisteaan osuuko robotti johonkin seinään
    colliding_walls = pygame.sprite.spritecollide(self.robot, self.walls, False)

    can_move = not colliding_walls

    # siirretään robotti takaisin alkuperäiseen sijaintiin
    self.robot.rect.move_ip(-dx, -dy)

    return can_move
```

Metodi ensin siirtää robottia, jonka jälkeen se tarkistaa [spritecollide](https://www.pygame.org/docs/ref/sprite.html#pygame.sprite.spritecollide)-funktion avulla osuuko jokin seinistä robottiin. Funktio palauttaa listan ryhmän spriteja, joihin argumenttina annettu sprite törmää. Jos lista on tyhjä, törmäystä ei tapahdu. Funktion viimeinen argumentti, `dokill`, on boolean-arvo, joka kertoo poistetaanko kaikkii törmänneet spritet ryhmästä. Koska emme halua näin tapahtuvan, asetamme sen arvoksi `False`. Yksittäisten spritejen törmäämisen tarkastelu onnistuu [collide_rect](https://www.pygame.org/docs/ref/sprite.html#pygame.sprite.collide_rect)-funktion avulla:

```python
pygame.sprite.collide_rect(sprite, other_sprite)
```

Funktio palauttaa boolean-arvon, joka kertoo törmäävätkö argumentteina annetut spritet keskenään. Lisää funktioita spritejen törmäyksen tarkastamiseen löytyy sprite-moduulin [dokumentaatiosta](https://www.pygame.org/docs/ref/sprite.html).

Voimme hyödyntää `robot_can_move`-metodia edellä toteutetussa `move_robot`-metodissa seuraavasti:

```python
def move_robot(self, dx=0, dy=0):
    if not self._robot_can_move(dx, dy):
        return

    self.robot.rect.move_ip(dx, dy)
```

## Pelaajan syötteiden lukeminen

Peli pyörii usein ikuisen silmukan sisällä, josta käytetään nimitystä _pelisilmukka_ (game loop). Tämän silmukan sisällä luetaan pelaajan syötteet, päivitetään pelin tila syötteiden perusteella ja piirretään uusi näkymä. Silmukan voi toteuttaa esimerkiksi seuraavanlaisen `GameLoop`-luokan avulla:

```python
import pygame


class GameLoop:
    def __init__(self, level, cell_size, display):
        self._level = level
        self._clock = pygame.time.Clock()
        self._cell_size = cell_size
        self._display = display

    def start(self):
        while True:
            if self._handle_events() == False:
                break

            self._render()

            # jokaista sekunttia kohden piirretään maksimissaan 60 näkymää
            self._clock.tick(60)

    def _handle_events(self):
        for event in pygame.event.get():
            if event.type == pygame.KEYDOWN:
                if event.key == pygame.K_LEFT:
                    self._level.move_robot(dx=-self._cell_size)
                if event.key == pygame.K_RIGHT:
                    self._level.move_robot(dx=self._cell_size)
                if event.key == pygame.K_UP:
                    self._level.move_robot(dy=-self._cell_size)
                if event.key == pygame.K_DOWN:
                    self._level.move_robot(dy=self._cell_size)
            elif event.type == pygame.QUIT:
                return False

    def _render(self):
        self._level.all_sprites.draw(self._display)

        pygame.display.update()
```

Luokan metodi `start` käynnistää ikuisen silmukan. Silmukan sisällä kutsutaan ensimmäiseksi luokan `handle_events`-metodia. Metodi lukee for-silmukassa tapahtumia Pygamen tapahtumajonosta event-moduulin [get](https://www.pygame.org/docs/ref/event.html#pygame.event.get)-funktion avulla. Tapahtumien perusteella kutsutaan sovelluslogiikan metodeja. Kun tapahtumat on käsitelty, luokan `render`-metodi piirtää pelin tilan perusteella seuraavan näkymän. Silmukan viimeinen rivi, `self._clock.tick(60)`, kutsuu [Clock](http://www.pygame.org/docs/ref/time.html#pygame.time.Clock)-luokan `tick`-metodia. Metodin kutsu palauttaa ajan millisekunneissa edellisestä kutsusta. Kun metodille annetaan `framerate`-argumentti, se rajoittaa kutsujen määrän maksimissaan haluttuun lukumäärään sekunnissa. Esimerkin rivi rajoittaa siis pelin nopeuden maksimissaan 60 kierrokseen sekunnissa. Rivi on erityisen tärkeä etenkin, jos pelissä on aikaan sidottuja tapahtumia, kuten vihollisten liikkumista.

Tässä muodossa `GameLoop`-luokan testaaminen on vähintään hankalaa. Testaamista hankaloittavat riippuvuudet Pygamen tapahtumajonoon, näytön piirtämiseen ja aikaan. Onneksi olemme jo oppineet, kuinka nämä ongelmat voidaan ratkaista _riippuvuuksien injektoinnilla_. Toteutetaan aluksi riippuvuuksille yksinkertaiset abstraktiot.

Pygamen tapahtumajonon voi toteuttaa `EventQueue`-luokka:

```python
import pygame

class EventQueue:
    def get(self):
        return pygame.event.get()
```

Näkymän piirtämisestä voi vastata `Renderer`-luokka:

```python
import pygame


class Renderer:
    def __init__(self, display, level):
        self._display = display
        self._level = level

    def render(self):
        self._level.all_sprites.draw(self._display)

        pygame.display.update()
```

Ja vastuun ajastuksista voi ottaa `Clock`-luokka:

```python
import pygame

class Clock:
    def __init__(self):
        self._clock = pygame.time.Clock()

    def tick(self, fps):
        self._clock.tick(fps)

    def get_ticks(self):
        return pygame.time.get_ticks()
```

Nyt voimme injektoida riippuvuudet `GameLoop`-luokkaan sen konstruktorin kautta ja hyödyntää niitä luokan metodeissa:

```python
import pygame


class GameLoop:
    def __init__(self, level, renderer, event_queue, clock, cell_size):
        self._level = level
        self._renderer = renderer
        self._event_queue = event_queue
        self._clock = clock
        self._cell_size = cell_size

    def start(self):
        while True:
            if self._handle_events() == False:
                break

            self._render()

            self._clock.tick(60)

    def _handle_events(self):
        for event in self._event_queue.get():
            if event.type == pygame.KEYDOWN:
                if event.key == pygame.K_LEFT:
                    self._level.move_robot(dx=-self._cell_size)
                if event.key == pygame.K_RIGHT:
                    self._level.move_robot(dx=self._cell_size)
                if event.key == pygame.K_UP:
                    self._level.move_robot(dy=-self._cell_size)
                if event.key == pygame.K_DOWN:
                    self._level.move_robot(dy=self._cell_size)
            elif event.type == pygame.QUIT:
                return False

    def _render(self):
        self._renderer.render()
```

Luokan käyttö onnistuu seuraavasti:

```python
import pygame
from level import Level
from game_loop import GameLoop
from event_queue import EventQueue
from renderer import Renderer
from clock import Clock

LEVEL_MAP = [[1, 1, 1, 1, 1],
             [1, 0, 0, 0, 1],
             [1, 2, 3, 4, 1],
             [1, 1, 1, 1, 1]]

CELL_SIZE = 50

def main():
    height = len(LEVEL_MAP)
    width = len(LEVEL_MAP[0])
    display_height = height * CELL_SIZE
    display_width = width * CELL_SIZE
    display = pygame.display.set_mode((display_width, display_height))

    pygame.display.set_caption("Sokoban")

    level = Level(LEVEL_MAP, CELL_SIZE)
    event_queue = EventQueue()
    renderer = Renderer(display, level)
    clock = Clock()
    game_loop = GameLoop(level, renderer, event_queue, clock, CELL_SIZE)

    pygame.init()
    game_loop.start()


if __name__ == "__main__":
    main()
```

Kun riippuvuudet injektoidaan konstruktorin kautta, `GameLoop`-luokan testaaminen onnistuu hyödyntämällä valeluokkia:

```python
import unittest
import pygame

from level import Level
from game_loop import GameLoop


class StubClock:
    def tick(self, fps):
        pass

    def get_ticks(self):
        0


class StubEvent:
    def __init__(self, event_type, key):
        self.type = event_type
        self.key = key


class StubEventQueue:
    def __init__(self, events):
        self._events = events

    def get(self):
        return self._events


class StubRenderer:
    def render(self):
        pass


LEVEL_MAP_1 = [[1, 1, 1, 1, 1],
               [1, 0, 0, 0, 1],
               [1, 2, 3, 4, 1],
               [1, 1, 1, 1, 1]]

CELL_SIZE = 50


class TestGameLoop(unittest.TestCase):
    def setUp(self):
        self.level_1 = Level(LEVEL_MAP_1, CELL_SIZE)

    def test_can_complete_level(self):
        events = [
            StubEvent(pygame.KEYDOWN, pygame.K_LEFT),
        ]

        game_loop = GameLoop(
            self.level_1,
            StubRenderer(),
            StubEventQueue(events),
            StubClock(),
            CELL_SIZE
        )

        game_loop.start()

        self.assertTrue(self.level_1.is_completed())
```

Luokat `StubRenderer` ja `StubClock` eivät tee mitään, koska niiden toiminallisuudella ei ole testin kannalta merkitystä. `StubEventQueue`-luokkalle annetaan ennalta määrätty lista tapahtumia, jotka `GameLoop`-luokka käy läpi ja toteuttaa niiden mukaiset toimenpiteet. Voimme siis testissä tarkistaa, onko tiettyjen tapahtumien seurauksena peli tietyssä tilassa. Kyseisen testin tapauksessa testataan, että annetut tapahtumat johtavat tason läpäisyyn.

## Aikaan sidotut tapahtumat

Monissa peleissä on aikaan sidottuja tapahtumia, esimerkiksi viholliset liikkuvat satunnaisiin suuntiin tietyin väliajoin. Tällöin pelin objekteihin voi tallentaa esimerkiksi tiedon, milloin joku tietty tapahtuma tapahtui viimeksi. Esimerkiksi `Enemy`-luokan oliolla voisi olla attribuutti `previous_move_time`, joka kertoo milloin vihollinen liikkui viimeksi ja metodi `should_move`, joka kertoo pitäisi vihollisen liikkua tietyllä ajanhetkellä:

```python
import pygame
import os

dirname = os.path.dirname(__file__)


class Enemy(pygame.sprite.Sprite):
    def __init__(self, x=0, y=0):
        super().__init__()

        self.previous_move_time = 0

        self.image = pygame.image.load(
            os.path.join(dirname, "assets", "enemy.png")
        )

        self.rect = self.image.get_rect()
        self.rect.x = x
        self.rect.y = y

    def should_move(current_time):
        return current_time - self.previous_move_time >= 5000
```

Metodi `should_move` tarkistaa onko viimeisestä liikkumisesta kulunut aikaa yli 5000 millisekunttia (5 sekunttia). Sovelluslogiikasta vastaavassa luokassa voimme liikutella vihollisia seuraavaan tapaan:

```python
import pygame
from sprites.enemy import Enemy


class Level:
    def __init__(self):
        self.enemies = pygame.sprite.Group()

    update(self, current_time):
        for enemy in self.enemies:
            if enemy.should_move(current_time):
                self._move_enemy(enemy)
                enemy.previous_move_time = current_time

    _move_enemy(self, enemy):
        # liikuta vihollista esimerkiksi satunnaiseen suuntaan

    # ...
```

Luokan `update`-metodin kutsu tapahtuu pelisilmukassa:

```python
import pygame

class GameLoop:
    def __init__(self, level, renderer, event_loop, clock, cell_size):
        self._level = level
        self._renderer = renderer
        self._event_loop = event_loop
        self._clock = clock
        self._cell_size = cell_size

    def start(self):
        while True:
            if self._handle_events() == False:
                break

            # aika, joka on kulunut pelin käynnistymisestä
            current_time = self._clock.get_ticks()

            self._level.update(current_time)
            self._render()

            self._clock.tick(60)

    def _handle_events(self):
        # ...

    def _render(self):
        # ...
```

Aikaisemmin toteutetun `Clock`-luokan metodi `get_ticks` kutsuu Pygamen [get_ticks](https://www.pygame.org/docs/ref/time.html#pygame.time.get_ticks)-funktiota, joka palauttaa kuluneet millisekennut [init](https://www.pygame.org/docs/ref/pygame.html)-funktion kutsusta.

Spriteille voi myös delegoida vastuun itsensä päivittämisestä määrittelemällä luokalle [update](https://www.pygame.org/docs/ref/sprite.html#pygame.sprite.Sprite.update)-metodin. Oletusarvoisesti `Sprite`-luokalta peritty `update`-metodi ei tee mitään. Metodi voisi esimerkiksi vaihtaa spriten kuvaa jonkin tietyn attribuutin arvon perusteella:

```python
import pygame
import os

dirname = os.path.dirname(__file__)


class Enemy(pygame.sprite.Sprite):
    def __init__(self, x=0, y=0, is_angry=False):
        super().__init__()

        self.previous_move_time = 0
        self.is_angry = is_angry

        self.image = pygame.image.load(
            os.path.join(dirname, "assets", "enemy.png")
        )

        self.rect = self.image.get_rect()
        self.rect.x = x
        self.rect.y = y

    def should_move(current_time):
        return current_time - self.previous_move_time >= 5000

    def update():
        if self.is_angry:
            self._set_angry_image()
        else:
            self._set_default_image()

    def _set_angry_image():
        self.image = pygame.image.load(
            os.path.join(dirname, "assets", "enemy_is_angry.png")
        )

    def _set_default_image():
        self.image = pygame.image.load(
            os.path.join(dirname, "assets", "enemy.png")
        )
```

Spriten omaa `update`-metodia voi kutsua sovelluslogiikan `update`-luokassa:

```python
update(self, current_time):
    for enemy in self.enemies:
        if enemy.should_move(current_time):
            self._move_enemy(enemy)
            enemy.previous_move_time = current_time

    # metodi kutsuu jokaisen spriten update-metodia
    self.enemies.update()
```

Huomaa, että `Group`-olion `update`-metodi kutsuu jokaisen yksittäisen spriten `update`-metodia. Metodille voi myös antaa vapaamuotoisia argumentteja, jotka välitetään sellaisenaan spriten `update`-metodille.

## Lisäluettavaa

Internet on pullollaan erilaisia Pygame-ohjeita. Pygamen omasta [dokumentaatiosa](https://www.pygame.org/docs/index.html) löytyy ohjeita yksittäisiin käyttötarkoituksiin. Tämän lisäksi [PyGame: A Primer on Game Programming in Python](https://realpython.com/pygame-a-primer/) on melko kattava ohje tärkeimmistä aihealueista.
