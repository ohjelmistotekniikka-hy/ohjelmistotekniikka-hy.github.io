---
layout: page
permalink: /java/materiaali
title: Materiaali
---

{% include materiaali_johdanto.md %}

{% include materiaali_kirjoitusvirheita.md %}

{% include materiaali_ohjelmistotuotanto.md reference_app_url=site.java_reference_app_url %}

# Työkaluja

Tarvitsemme ohjelmistokehityksessä suuren joukon käytännön työkaluja.

## Komentorivi ja Versionhallinta

Olet jo ehkä käyttänyt muilla kursseilla komentoriviä ja versionhallintaa, molemmat ovat tärkeässä roolissa ohjelmistokehityksessä ja niiden harjoittelu on aiheena viikon 1 [tehtävissä](/viikko1).

## Maven

Olet todennäköisesti ohjelmoinut Javaa suurimmaksi osaksi NetBeansilla ja luottanut siihen että kaikki hoituu valitsemalla sopivia toimintoja valikoista ja painamalla "vihreää nappia".

Alamme tämän kurssin myötä hieman tutkimaan, miten Javalla tehdyn ohjelmiston hallinnointi (esim. koodin kääntäminen, koodin sekä testin suorittaminen ja koodin paketoiminen NetBeansin ulkopuolella suoritettavissa olevaksi jar-paketiksi) tapahtuu NetBeansin "ulkopuolella".

Java-projektien hallinnointiin on olemassa muutamakin vaihtoehto. Käytämme tällä kurssilla _mavenia_, joka lienee jo useimmille osittain tuttu esim. Tietokantojen perusteista.

[Ohje](/java/maven)
Mavenin käytön aloittamiseen.

## JUnit

Ohjelmistojen testaus tapahtuu nykyään ainakin yksikkö- ja integraatiotestien osalta automatisoitujen testityökalujen toimesta. Java-maailmassa testausta dominoi lähes yksinvaltiaan tavoin JUnit. Tulet kurssin ja myöhempienkin opintojesi aikana kirjoittamaan paljon JUnit-testejä.

JUnitiin tutustumme viikon 2 [tehtävissä](/java/viikko2).

## JavaDoc

Osa ohjelmiston dokumentointia on lähdekoodin API:n eli käytännössä luokkien julkisten metodien kuvaus. Javassa lähdekoodi dokumentoidaan käyttäen JavaDoc-työkalua. Dokumentointi tapahtuu kirjoittamalla koodin yhteyteen sopivasti muotoiltuja kommentteja.

Sovelluksen JavaDocia voi tarkastella selaimen avulla

![](https://raw.githubusercontent.com/mluukkai/ohjelmistotekniikka-syksy-2020/main/web/images/l-7.png)

Myös NetBeans osaa näyttää ohjelmoidessa koodiin määritellyn javadocin:

![](https://raw.githubusercontent.com/mluukkai/ohjelmistotekniikka-syksy-2020/main/web/images/l-14.png)

## Checkstyle

Automaattisten testien lisäksi koodille voidaan määritellä erilaisia automaattisesti tarkastettavia tyylillisiä sääntöjä, joiden avulla on mahdollista ylläpitää koodin luettavuutta ja varmistaa että joka puolella koodia noudatetaan samoja tyylillisiä konventioita.

Käytämme kurssilla tarkoitukseen [Checkstyle](http://checkstyle.sourceforge.net)-nimistä työkalua:

> Checkstyle is a development tool to help programmers write Java code that adheres to a coding standard. It automates the process of checking Java code to spare humans of this boring (but important) task. This makes it ideal for projects that want to enforce a coding standard.

[Ohje](/java/checkstyle) checkstylen konfiguroimiseen.

## UML

Ohjelmistojen dokumentoinnissa ja sovelluksen suunnittelun yhteydessä on usein tapana visualisoida ohjelman rakennetta ja toimintaa [UML](https://en.wikipedia.org/wiki/Unified_Modeling_Language)-kaavioilla.

UML tarjoaa lukuisia erilaisia kaaviotyyppejä, hyödynnämme kurssilla kuitenkin näistä ainoastaan kolmea.

### Luokkakaaviot

Kurssilla [Tietokantojen perusteet](https://tietokantojen-perusteet-19.mooc.fi/) olet jo tutustunut luokkakaavioiden käyttöön.

Luokkakaavioiden käyttötarkoitus on ohjelman luokkien ja niiden välisten suhteiden kuvailu. Todo-sovelluksen oleellista tietosisältöä edustavat käyttäjää vastaava luokka _User_:

```java
public class User {
    private String name;
    private String username;

    public User(String username, String name) {
        this.name = name;
        this.username = username;
    }

    public String getName() {
        return name;
    }

    public String getUsername() {
        return username;
    }
}
```

ja tehtävää vastaava luokka _Todo_:

```java
package todoapp.domain;

public class Todo {

    private int id;
    private String content;
    private boolean done;
    private User user;

    public Todo(int id, String content, boolean done, User user) {
        this.id = id;
        this.content = content;
        this.done = done;
        this.user = user;
    }

    public String getContent() {
        return content;
    }

    public User getUser() {
        return user;
    }

    public int getId() {
        return id;
    }

    public boolean isDone() {
        return done;
    }

    public void setDone() {
        done = true;
    }
}
```

Jokaiseen todoon liittyy yksi käyttäjä, ja yksittäiseen käyttäjään liittyviä todoja voi olla useita. Tilannetta kuvaa seuraava luokkakaavio

<img src="https://raw.githubusercontent.com/mluukkai/ohjelmistotekniikka-syksy-2020/main/web/images/l-3a.png" width="500">

Luokkakaavioon on nyt merkitty molempien luokkien oliomuuttujat sekä metodit.

Yleensä ei ole mielekästä kuvata luokkia tällä tarkkuudella, eli luokkakaavioihin riittää merkitä luokan nimi

<img src="https://raw.githubusercontent.com/mluukkai/ohjelmistotekniikka-syksy-2020/main/web/images/l-4.png" width="350">

Luokkien tarkemmat detaljit selviävät koodia katsomalla tai JavaDoc:ista.

#### Riippuvuus

UML-kaavioissa olevat "viivat" kuvaavat luokkien olioiden välistä _pysyvää yhteyttä_. Joissain tilanteissa on mielekästä merkata kaavioihin myös ei-pysyvää suhdetta kuvaava katkoviiva, eli _riippuvuus_.

Eräs tällainen tilanne on Ohjelmoinnin perusteiden Unicafe-tehtävän luokkien _Maksukortti_ ja _Kassapääte_ suhde. Maksukortin koodi on seuraava:

```java
public class Maksukortti {
    private double saldo;

    public Maksukortti(double saldo) {
        this.saldo = saldo;
    }

    public double saldo() {
        return this.saldo;
    }

    public void lataaRahaa(double lisays) {
        this.saldo += lisays;
    }

    public boolean otaRahaa(double maara) {
        if (this.saldo < maara) {
            return false;
        }

        this.saldo -= maara;

        return true;
    }
}
```

Kuten huomataan, koodissa ei mainita kassapäätettä millään tavalla.

Kassapäätteen hieman lyhennetty koodi on seuraava:

```java

public class Kassapaate {
    private int edulliset;
    private int maukkaat;
    private static final double EDULLISEN_HINTA = 2.5;
    private static final double MAUKKAAN_HINTA = 4.3;

    // käteismyyntiin liittyvät metodit poistettu

    public boolean syoEdullisesti(Maksukortti kortti) {
        if (kortti.saldo() < EDULLISEN_HINTA) {
            return false;
        }

        kortti.otaRahaa(EDULLISEN_HINTA);
        this.edulliset++;
        return true;
    }

    public boolean syoMaukkaasti(Maksukortti kortti) {
        // ...
    }

    public void lataaRahaaKortille(Maksukortti kortti, double summa) {
        if (summa < 0) {
            return;
        }

        kortti.lataaRahaa(summa);
        this.rahaa += summa;
    }

}
```

Kassapääte käyttää maksukortteja hetkellisesti lounaiden maksamisen ja rahan lataamisen yhteydessä. Kassapääte ei kuitenkaan muista pysyvästi yksittäisiä maksukortteja. Tämän takia kassapäätteellä on riippuvuus maksukortteihin, mutta ei kuitenkaan normaalia yhteyttä, sillä UML-kaavioon merkattu yhteys viittaa pysyvään, ajallisesti pidempikestoiseen suhteeseen.

Tilannetta kuvaava luokkakaavio on seuraava:

<img src="https://raw.githubusercontent.com/mluukkai/ohjelmistotekniikka-syksy-2020/main/web/images/l-18.png" width="450">

Riippuvuus siis kuvataan _katkoviivallisena nuolena_, joka kohdistuu siihen luokkaan mistä ollaan riippuvaisia. Riippuvuuteen ei merkitä numeroa toisin kuin yhteyteen.

Tarkastellaan toisena esimerkkinä riippuvuudesta todo-sovelluksen sovelluslogiikasta vastaavaa luokkaa _TodoService_, jonka koodi hieman lyhennettynä näyttää seuraavalta:

```java
public class TodoService {
    private TodoDao todoDao;
    private User loggedIn;

    public void createTodo(String content, User user) {
        Todo todo = new Todo(content, user);
        todoDao.create(todo);
    }

    public List<Todo> getUndone() {
        if (loggedIn==null) {
            return new ArrayList<>();
        }

        return todoDao.getAll()
            .stream()
            .filter(t->{
                return t.getUser().equals(loggedIn);
            })
            .filter(t->!t.isDone())
            .collect(Collectors.toList());
    }

    // ...
}
```

Sovelluslogiikkaa hoitava olio tuntee kirjautuneen käyttäjän, mutta pääsee käsiksi kirjautuneen käyttäjän todoihin ainoastaan _todoDao_-olion välityksellä. Tämän takia luokalla ei ole yhteyttä luokkaan _Todo_, luokkien välillä on kuitenkin _riippuvuus_, sillä sovelluslogiikka käsittelee metodeissaan todo-olioita.

Merkitään luokkakaavioon seuraavasti:

<img src="https://raw.githubusercontent.com/mluukkai/ohjelmistotekniikka-syksy-2020/main/web/images/l-5.png" width="600">

Riippuvuuksien merkitseminen luokkakaavioihin ei ole välttämättä kovin oleellinen asia, niitä kannattaa merkitä jos ne tuovat esille tilanteen kannalta jotain oleellista.

#### Rajapinta ja perintä

TodoService siis tuntee _TodoDao_-olion (jos unohdit mikä on DAO, kertaa Tietokantojen perusteiden [DAO-suunnittelumalli](https://tietokantojen-perusteet-19.mooc.fi/osa-6/2-data-access-object)), jonka avulla se pääsee _todo_-olioihin. _TodoDao_ ei ole itseasiassa luokka vaan _rajapinta_:

```java
public interface TodoDao {
    void create(Todo todo);
    List<Todo> getAll();
    void setDone(int id);
}
```

TodoDaosta voi olla olemassa useita eri toteutuksia. Tällä hetkellä ohjelmassa on _todo_-oliot tiedostoon tallettava _FileTodoDao_

```java
public class FileTodoDao implements TodoDao {
    public List<Todo> todos;
    private String file;

    // ...
}
```

sekä testien käyttämä _FakeTodoDao_. Jos ohjelmaa halutaan laajentaa siten, että tiedot talletetaan tiedostojen sijaan tietokantaan, voidaan tarkoitusta varten tehdä uusi toteutus rajapinnasta _SqlTodoDao_.

Rajapinta ja sen toteuttavat luokat kuvataan luokkakaaviossa seuraavasti:

<img src="https://raw.githubusercontent.com/mluukkai/ohjelmistotekniikka-syksy-2020/main/web/images/l-6.png" width="650">

Samaa merkintätapaa eli valkoisen nuolenpään sisältävää viivaa käytetään perinnän merkitsemiseen. Esim. jos Todo-sovelluksessa olisi normaalin käyttäjän eli luokan _User_ perivää ylläpitäjää kuvaava luokka _SuperUser_, merkattaisiin se luokkakaavioon seuraavasti:

<img src="https://raw.githubusercontent.com/mluukkai/ohjelmistotekniikka-syksy-2020/main/web/images/l-9.png" width="350">

### Pakkauskaavio

Todo-sovelluksen koodi on sijoitettu _pakkauksiin_ seuraavasti:

![](https://raw.githubusercontent.com/mluukkai/ohjelmistotekniikka-syksy-2020/main/web/images/l-10.png)

Pakkausrakenne voidaan kuvata UML:ssä pakkauskaaviolla:

<img src="https://raw.githubusercontent.com/mluukkai/ohjelmistotekniikka-syksy-2020/main/web/images/l-11.png" width="160">

Pakkausten välille on merkitty _riippuvuudet_ katkoviivalla. Pakkaus _todoapp.ui_ riippuu pakkauksesta _todoapp.domain_ sillä _ui_:n luokka _Main_ käyttää _domain_-pakkauksen luokkia _Todo_ ja _TodoService_.

Vastaavasti pakkaus _todoapp.domain_ riippuu pakkauksesta _todoapp.dao_ sillä domainin luokka _TodoService_ käyttää _dao_-pakkauksen rajapintoja _TodoDao_ ja UserDao.

Pakkauskaavioihin on myös mahdollista merkitä pakkausten sisältönä olevia luokkia normaalin luokkakaaviosyntaksin mukaan:

<img src="https://raw.githubusercontent.com/mluukkai/OtmTodoApp/master/dokumentaatio/kuvat/a-3c.png" width="500">

Sovelluksen koodi on organisoitu _kerrosarkkitehtuurin_ periaatteiden mukaan. Asiasta lisää hieman myöhemmin tässä dokumentissa.

### Sekvenssikaaviot

Luokka- ja pakkauskaaviot kuvaavat ohjelman rakennetta. Ohjelman toiminta ei kuitenkaan tule niistä ilmi millään tavalla.

Esim. ohjelmoinnin perusteiden Unicafe-tehtävää kuvaava luokkakaavio näyttää seuraavalta:

<img src="https://raw.githubusercontent.com/mluukkai/ohjelmistotekniikka-syksy-2020/main/web/images/l-15.png" width="550">

Vaikka kaavioon on merkitty metodien nimet, ei ohjelman toimintalogiikka, esim. mitä tapahtuu kun kortilla ostetaan edullinen lounas, selviä kaaviosta millään tavalla.

Tietokantojen perusteiden [viikolla 4](https://materiaalit.github.io/tikape-k18/part4/) on lyhyt maininta sekvenssikaavioista.

Sekvenssikaaviot on alunperin kehitetty kuvaamaan verkossa olevien ohjelmien keskinäisen kommunikoinnin etenemistä. Sekvenssikaaviot sopivat kohtuullisen hyvin kuvaamaan myös sitä, miten ohjelman oliot kutsuvat toistensa metodeja suorituksen aikana.

Koodia katsomalla näemme, että lounaan maksaminen tapahtuu siten, että ensin kassapääte kysyy kortin saldoa ja jos se on riittävä, vähentää kassapääte lounaan hinnan kortilta ja palauttaa _true_:

```java
public class Kassapaate {
    private static final double EDULLISEN_HINTA = 2.5;
    // ...

    public boolean syoEdullisesti(Maksukortti kortti) {
        if (kortti.saldo() < EDULLISEN_HINTA) {
            return false;
        }

        kortti.otaRahaa(EDULLISEN_HINTA);
        this.edulliset++;
        return true;
    }

    //...
}
```

Sekvenssikaaviona kuvattuna tilanne näyttää seuraavalta:

<img src="https://raw.githubusercontent.com/mluukkai/ohjelmistotekniikka-syksy-2020/main/web/images/l-16.png" width="450">

Sekvenssikaaviossa oliot kuvataan laatikoina, joista lähtee alaspäin olion "elämänlanka". Kaaviossa aika etenee ylhäältä alas. Metodikutsut kuvataan nuolena, joka yhdistää kutsujan ja kutsutun olion elämänlangat. Paluuarvo merkitään katkoviivalla.

Jos saldo ei riitä, etenee suoritus seuraavan sekvenssikaavion tapaan:

<img src="https://raw.githubusercontent.com/mluukkai/ohjelmistotekniikka-syksy-2020/main/web/images/l-17.png" width="450">

Tarkastellaan hieman monimutkaisempaa tapausta, yrityksen palkanhallinnasta vastaavaa ohjelmaa:

```java
public class Henkilo {
    private String nimi;
    private int palkka;
    private String tilinumero;

    public Henkilo(String nimi, int palkka, String tilinumero) {
        this.nimi = nimi;
        this.palkka = palkka;
        this.tilinumero = tilinumero;
    }

    public void setPalkka(int palkka) {
        this.palkka = palkka;
    }

    public int getPalkka() {
        return palkka;
    }

    public String getTilinumero() {
        return tilinumero;
    }
}

public class Henkilostorekisteri {
    private Map<String, Henkilo> henkilot;
    private PankkiRajapinta pankki;

    public Henkilostorekisteri() {
        henkilot = new HashMap<String, Henkilo>();
        pankki = new PankkiRajapinta();
    }

    public void lisaa(Henkilo henkilo){
        henkilot.set(henkilo, henkilo);
    }

    public void suoritaPalkanmaksu(){
        for (Henkilo henkilo : henkilot.values()) {
            String tiliNro = henkilo.getTilinumero();
            int palkka = henkilo.getPalkka();
            pankki.maksaPalkka(tiliNro, palkka);
        }
    }

    public void asetaPalkka(String nimi, int uusiPalkka){
        Henkilo h = hekilot.get(nimi);
        h.setPalkka(uusiPalkka);
    }
}


public class PankkiRajapinta {

    public void maksaPalkka(String tilinumero, int summa) {
        // suorittaa maksun verkkopankin internet-rajapinnan avulla
        // yksityiskohdat piilotettu
    }
}
```

Sekvenssikaaviot siis kuvaavat yksittäisten suoritusskenaarioiden aikana tapahtuvia asioita. Kuvataan nyt seuraavan pääohjelman aikaansaamat tapahtumat:

```java
public static void main(String[] args) {
    Henkilostorekisteri rekisteri = new Henkilostorekisteri();

    Henkilo arto = new Henkilo("Hellas", 1500, "1234-12345");
    rekisteri.lisaa(arto);
    Henkilo sasu = new Henkilo("Tarkoma", 6500, "4455-123123");
    rekisteri.lisaa(sasu);

    rekisteri.asetaPalkka("Hellas", 3500);

    rekisteri.suoritaPalkanmaksu();
}
```

Sekvenssikaavio on seuraavassa:

![](https://raw.githubusercontent.com/mluukkai/ohjelmistotekniikka-syksy-2020/main/web/images/l-13.png)

Kaavio alkaa tilanteesta, jossa _Henkilostorekisteri_ on jo luotu, mutta henkilöolioita ei vielä ole olemassa.

Toiminta alkaa siitä, kun pääohjelma eli main luo henkilön nimeltä _arto_. Seuraavaksi _main_ kutsuu rekisterin metodia _lisaa_ ja antaa parametriksi luodun henkilöolion.

Vastaava toistuu kun main luo uuden henkilön ja lisää sen rekisteriin.

Seuraavana toimenpiteenä main kasvattaa arton palkkaa kutsumalla rekisterin metodia _asetaPalkka_. Tämä saa aikaan sen, että _rekisteri_ kutsuu _arto_-olion metodia _setPalkka_. Rekisterin viivaan on merkitty paksunnus, joka korostaa, että sen metodia on kutsuttu.

Viimeinen ja monimutkaisin toiminnoista käynnistyy, kun main kutsuu rekisterin metodia _suoritaPalkanmaksu_. Rekisteri kysyy ensin arton tilinumeroa ja palkkaa ja kutsuu paluuarvoina olevilla tiedoilla pankin metodia _maksaPalkka_ ja sama toistuu _sasun_ kohdalla.

Sekvenssikaaviot eivät ole optimaalinen tapa ohjelman suorituslogiikan kuvaamiseen. Ne sopivat jossain määrin olio-ohjelmien toiminnan kuvaamiseen, mutta esim. funktionaalisella tyylillä tehtyjen ohjelmien kuvaamisessa ne ovat varsin heikkoja.

Tietynlaisten tilanteiden kuvaamiseen ohjelmoinnin perusteissakin käsitellyt [vuokaaviot](https://materiaalit.github.io/ohjelmointi-18/part2/) voivat sopia paremmin.

Voit halutessasi lukea lisää sekvenssikaavioista kurssin vanhan version [materiaalista](https://github.com/mluukkai/OTM2016/blob/master/luennot/luento5.pdf).

# Lisää ohjelmiston suunnittelusta

Katsotaan seuraavassa muutamia sovelluksen suunnittelussa noudatettuja periaatteita.

## Kerrosarkkitehtuuri

Kuten jo mainittiin, todo-sovellus noudattaa kerrosarkkitehtuuria. Koodin tasolla kerrosrakenne näkyy siinä, miten sovelluksen koodi jakautuu pakkauksiin

![](https://raw.githubusercontent.com/mluukkai/ohjelmistotekniikka-syksy-2020/main/web/images/l-10.png)

ja minkälaisia riippuvuuksia pakkausten välisillä luokilla on.

Riippuvuudet kuvaava pakkauskaavio havainnollistaa koodin rakenteen kerroksellisuuden

<img src="https://raw.githubusercontent.com/mluukkai/ohjelmistotekniikka-syksy-2020/main/web/images/l-12.png" width="400">

Kerrosarkkitehtuurissa ylimpänä on _käyttöliittymästä_ vastaava kerros. Käyttöliittymäkerroksen vastuulla on muodostaa sovelluksen käyttöliittymä ja reagoida käyttäjän syötteisiin.

Sovelluslogiikka, eli esim. käyttäjän kirjautumisesta huolehtiminen, todojen luominen ja niiden tehdyksi merkkaaminen on käyttöliittymän alapuolella olevan _sovelluslogiikkakerroksen_ vastuulla. Sovelluslogiikkakerroksen koodi on pakkauksessa nimeltään _todoapp.doman_.

Sovelluslogiikan alapuolella on _datan tallennuksesta vastaava kerros_, jonka käytännössä muodostavat DAO-suunnittelumallin (ks. Tietokantojen perusteiden [Dao-suunnittelumalli](https://tietokantojen-perusteet-19.mooc.fi/osa-6/2-data-access-object)) inspiroimana muodostetut rajapintojen _TodoDao_ ja _UserDao_ toteuttamat luokat.

[Kerrosarkkitehtuuri](https://en.wikipedia.org/wiki/Multitier_architecture) (engl. layered architecture tai multitier architecture) on ehkä eniten käytetty ohjelmistojen [arkkitehtuurimalli](https://en.wikipedia.org/wiki/Software_Architecture_styles_and_patterns), eli yleisesti käytetty tapa ohjelmiston rakenteen strukturointiin. Käytännössä lähes jokainen ohjelmisto noudattaa ainakin jossain määrin kerroksellisuuden periaatetta. On olemassa lukuisia arkkitehtuurimalleja, joihin tutustutaan tarkemmin kursseilla Ohjelmistotuotanto ja Ohjelmistoarkkitehtuurit.

## Oliosuunnittelun periaatteita

Ohjelmistojen suunnitteluun on aikojen saatossa muodostunut joukko periaatteita, joiden noudattamisen on todettu parantavan koodin laatua.

### DRY eli Don't repeat yourself

Jo Ohjelmoinnin perusteissa aloittelevaa ohjelmoijaa varoitellaan copy pasten vaaroista. [DRY](https://en.wikipedia.org/wiki/Don%27t_repeat_yourself)-periaate ilmaisee asian seuraavasti

> Every piece of knowledge must have a single, unambiguous, authoritative representation within a system

Periaate yleistää toisteettomuuden koskemaan koodin lisäksi muitakin ohjelmistoon liittyviä asioita, esim. dokumentaatiota. Luokkien dokumentoiminen JavaDoc:in avulla ilmentää osin tätä periaatetta.

### Single responsibility principle

Toinen jo [ohjelmoinnin perusteista](https://materiaalit.github.io/ohjelmointi-18/part6/) tuttu periaate _Single responsibility_ tarkoittaa karkeasti ottaen, että _oliolla tulee olla vain yksi vastuu_ eli yksi asiakokonaisuus, mihin liittyvästä toiminnasta luokan oliot itse huolehtivat. Tämän jo vuosikymmeniä vanhan säännön nimen lanseerannut Robert "Uncle Bob" Martin ilmaisee asian seuraavasti _A class should have only one reason to change_.

Kerrosarkkitehtuurin voi ajatella ilmentävän tätä periaatetta laajentaen sen yksittäisten luokkien ja olioiden tasolta sovellusten suurempiin kokonaisuuksiin.

Todo-sovelluksen suunnittelussa periaatetta on noudatettu suhteellisen hyvin

- käyttöliittymästä on eristetty sovelluslogiikka kokonaan
- käyttäjä ja tehtävät on talletettu omiin luokkiinsa User ja Todo
- sovelluslogiikan suorittamisesta, eli User- ja Todo-olioiden manipuloinnista vastaa oma luokka _TodoService_
- tietojen talletuksesta levylle vastaavat DAO-oliot, jotka on vielä jaettu kahteen vastuualueeseen eli käyttäjistä vastaavaan UserDaoon ja todoista vastaavaan TodoDaoon.

### Program to an interface, not to an Implementation

_Program to an interface, not to an Implementation_, eli _ohjelmoi käyttämällä rajapintoja äläkä konkreettisia implementaatioita_

- Laajennettavuuden kannalta ei ole hyvä idea olla riippuvainen konkreettisista luokista, sillä ne saattavat muuttua
- Parempi on tuntea vain rajapintoja (tai abstrakteja luokkia) ja olla tietämätön siitä mitä rajapinnan takana on
- Tämä mahdollistaa myös rajapinnan takana olevan luokan korvaamisen kokonaan uudella luokalla

Todo-sovelluksessa sovelluslogiikka ei käytä suoraan konkreettisia DAO-olioita, se tuntee ainoastaan rajapinnat, ja tämä taas mahdollistaa konkreettisen toteutuksen vaihtamisen esim. testeissä tai tulevaisuudessa ohjelman laajennuksen yhteydessä:

<img src="https://raw.githubusercontent.com/mluukkai/ohjelmistotekniikka-syksy-2020/main/web/images/l-6.png" width="650">

### Riippuvuuksien minimointi

Minimoi riippuvuudet, eli älä tee _spagettikoodia_, jossa kaikki oliot tuntevat toisensa. Pyri eliminoimaan riippuvuudet siten, että luokat tuntevat mahdollisimman vähän muita luokkia, ja mielellään nekin vain rajapintojen kautta.

Kerrosarkkitehtuuri tähtää osaltaan riippuvuuksien eliminointiin, esim. käyttöliittymä on nyt riippuvainen ainoastaan sovelluslogiikkakerroksen luokista _TodoService_ ja _Todo_, mutta ei millään tavalla tietojen talletuksesta vastaavista DAO-luokista.

## Riippuvuuksien injektointi

Turhien riippuvuuksien eliminointiin liittyy läheisesti tapa, jolla oliot pääsevät käsiksi riippuvuuksiinsa eli tarvitsemiinsa olioihin.

Sovelluslogiikasta huolehtiva _TodoService_-olio tarvitsee toimiakseen _TodoDao_- ja _UserDao_-oliot. Se saa oliot konstruktorin parametrina:

```java
public class TodoService {
    private TodoDao todoDao;
    private UserDao userDao;
    private User loggedIn;

    public TodoService(TodoDao todoDao, UserDao userDao) {
        this.userDao = userDao;
        this.todoDao = todoDao;
    }

    // ...
}
```

eli kun sovelluksen alustava metodi _init_ luo ensin sopivat DAO-oliot ja antaa ne konstruktorin parametrina luotavalle _TodoService_-oliolle:

```java
public class Main extends Application {
    private TodoService todoService;

    // ...

    @Override
    public void init(){
        FileUserDao userDao = new FileUserDao("users.txt");
        FileTodoDao todoDao = new FileTodoDao("todos.txt", userDao);
        todoService = new TodoService(todoDao, userDao);
    }

    // ...

}
```

Tekniikasta, missä oliolle annetaan sen riippuvuudet ulkopuolelta joko konstruktorin parametrina, erillisten metodien avulla tai jollain muulla tekniikalla, käytetään nimitystä _riippuvuuksien injektointi_ (engl. [dependency injection](http://www.jamesshore.com/Blog/Dependency-Injection-Demystified.html)).

## Riippuvuuksien injektointi ja testaus

Riippuvuuksien injektointi helpottaa erityisesti testaamista, sillä se mahdollistaa, että luokille annetaan niiden normaalien riippuvuuksien sijaan testausta varten luotuja _valekomponentteja_.

Todo-sovelluksessa on luokkaa _TodoService_ testattu juuri näin. Esim. UserDao:n valekomponentti sisältää alussa yhden käyttäjän:

```java
public class FakeUserDao implements UserDao {
    List<User> users = new ArrayList<>();

    public FakeUserDao() {
        users.add(new User("testertester", "Teppo Testaaja"));
    }

    // ...
}
```

DAO:jen valekomponentit injektoidaan testattavalle luokalle:

```java
public class TodoServiceUserTest {

    FakeTodoDao todoDao;
    FakeUserDao userDao;
    TodoService service;

    @Before
    public void setUp() {
        todoDao = new FakeTodoDao();
        userDao = new FakeUserDao();
        service = new TodoService(todoDao, userDao);
    }

    @Test
    public void nonExistingUserCanLogIn() {
        boolean result = service.login("nonexisting");
        assertFalse(result);

        assertEquals(null, service.getLoggedUser());
    }

    @Test
    public void existingUserCanLogIn() {
        boolean result = service.login("testertester");
        assertTrue(result);

        User loggedIn = service.getLoggedUser();
        assertEquals("Teppo Testaaja", loggedIn.getName() );
    }

    // ...
}
```

Toisin kuin todelliset DAO:t, testeissä käytettävät valekomponentit eivät tallenna dataa levylle. Tämä tekee testaamisesta helpompaa.

Katso lisää Todo-sovelluksen [arkkitehtuurikuvauksesta](https://github.com/mluukkai/OtmTodoApp/blob/master/dokumentaatio/arkkitehtuuri.md) ja [testausdokumentista](https://github.com/mluukkai/OtmTodoApp/blob/master/dokumentaatio/testaus.md).

# Ohjelmiston toteutus

Muutamia käyttöliittymän ja tietojen tallettamisen toteuttamiseen sekä sovelluksen konfigurointiin liittyviä vihjeitä on koottu [tänne](/java/toteutus)
