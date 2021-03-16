## Ohjelmistotuotanto

Kun tehdään pientä ohjelmaa omaan käyttöön, ei työskentelymenetelmillä ole suurta merkitystä. Kun ohjelmiston koko on suurempi ja erityisesti, jos sitä tehdään useamman ihmisen toimesta ulkoiselle käyttäjälle tai tilaajalle, ei pelkkä häkkeröinti enää tuota optimaalista tulosta. Tarvitaankin jonkinlainen systemaattinen menetelmä ohjaamaan ohjelmistokehittäjien toimintaa ja varmistamaan, että ohjelmistosta tulee käyttäjien käyttötarkoitukseen sopiva.

Ohjelmiston systemaattinen tekeminen, eli ohjelmistotuotanto (engl. Software engineering) sisältää useita erilaisia aktiviteettejä, joiden aikana tekemisen fokus on hieman erilaisissa asioissa. Näitä aktiviteetteja tai _vaiheita_ niinkuin niitä joskus nimitetään ovat seuraavat

- _vaatimusmäärittely_ jonka tehtävä on selvittää, kuinka ohjelmiston halutaan toimivan
- _suunnittelu_ jonka aikana mietitään, miten halutunkaltainen ohjelmisto tulisi rakentaa
- _toteutusvaiheessa_ määritelty ja suunniteltu ohjelmisto koodataan
- _testauksen_ tehtävä taas on varmistaa ohjelmiston laatu, että se ei ole liian buginen ja että se toimii kuten vaatimusmäärittely sanoo
- _ylläpitovaiheessa_ ohjelmisto on jo käytössä ja siihen tehdään bugikorjauksia ja mahdollisia laajennuksia.

Katsotaan vielä kutakin vaihetta hieman tarkemmin.

Käytetään seuraavassa esimerkkinä kurssia varten tehtyä yksinkertaista [todo]({{include.reference_app_url}})-sovellusta.

### Vaatimusmäärittely

Vaatimusmäärittelyn aikana kartoitetaan ohjelman tulevien käyttäjien tai tilaajan kanssa se, mitä toiminnallisuutta ohjelmaan halutaan. Ohjelman toiminnalle siis asetetaan asiakkaan haluamat vaatimukset. Tämän lisäksi kartoitetaan ohjelman toimintaympäristön ja toteutusteknologian järjestelmälle asettamia rajoitteita.

Vaatimusmäärittelyn tuloksena on useimmiten jonkinlainen dokumentti, johon vaatimukset kirjataan. Dokumentin muoto vaihtelee suuresti, se voi olla paksu mapillinen papereita tai vaikkapa joukko postit-lappuja.

#### Todo-sovelluksen vaatimusmäärittely

Esimerkkisovelluksemme on siis klassinen _TodoApp_, eli sovellus, jonka avulla käyttäjien on mahdollista pitää kirjaa omista tekemättömistä töistä, eli _todoista_.

Vaatimusmäärittely kannattaa yleensä aloittaa tunnistamalla järjestelmän erityyppiset _käyttäjäroolit_. Sovelluksellamme ei ole toistaiseksi muuta kuin normaaleja käyttäjiä. Jatkossa sovellukseen saatetaan lisätä myös ylläpitäjän oikeuksilla varustettu käyttäjärooli.

Kun sovelluksen käyttäjäroolit ovat selvillä, mietitään mitä toiminnallisuuksia kunkin käyttäjäroolin halutaan pystyvän tekemään sovelluksen avulla.

Todo-sovelluksen normaalien käyttäjien toiminnallisuuksia ovat esim. seuraavat

- käyttäjä voi luoda järjestelmään käyttäjätunnuksen
- käyttäjä voi kirjautua järjestelmään
- kirjautumisen jälkeen käyttäjä näkee omat tekemättömät työt eli todot
- käyttäjä voi luoda uuden todon
- käyttäjä voi merkitä todon tehdyksi, jolloin todo häviää listalta

Ylläpitäjän toiminnallisuuksia voisivat olla esim. seuraavat

- ylläpitäjä näkee tilastoja sovelluksen käytöstä
- ylläpitäjä voi poistaa normaalin käyttäjätunnuksen

Ohjelmiston vaatimuksiin kuuluvat myös _toimintaympäristön rajoitteet_. Todo-sovellusta koskevat seuraavat rajoitteet

- ohjelmiston tulee toimia Linux- ja OSX-käyttöjärjestelmillä varustetuissa koneissa
- käyttäjien ja todojen tiedot talletetaan paikallisen koneen levylle

Vaatimusmäärittelyn aikana hahmotellaan yleensä myös sovelluksen käyttöliittymä.

Kurssin aiemmissa versioissa käyttäjien vaatimukset dokumentointiin [käyttötapauksina](https://en.wikipedia.org/wiki/Use_case) (engl. use case). Käytämme tällä kurssilla hieman kevyempää tapaa, ja kirjaamme järjestelmältä toivotun toiminnallisuuden vapaamuotoisena ranskalaisista viivoista koostuvana feature-listana. Katso tarkemmin Todo-sovelluksen alustavasta [vaatimusmäärittelystä](https://github.com/mluukkai/OtmTodoApp/blob/master/dokumentaatio/vaatimusmaarittely.md).

### Suunnittelu

Ohjelmiston suunnittelu jakautuu yleensä kahteen erilliseen vaiheeseen.

_Arkkitehtuurisuunnittelussa_ määritellään ohjelman rakenne karkealla tasolla

- mistä suuremmista rakennekomponenteista ohjelma koostuu
- miten komponentit yhdistetään, eli minkälaisia komponenttien väliset rajapinnat ovat
- mitä riippuvuuksia ohjelmalla on esim. tietokantoihin ja ulkoisiin rajapintoihin

Arkkitehtuurisuunnittelua tarkentaa _oliosuunnittelu_, missä mietitään ohjelmiston yksittäisten komponenttien rakennetta, eli minkälaisista luokista komponentit koostuvat ja miten luokat kutsuvat toistensa metodeja sekä mitä apukirjastoja luokat käyttävät.

Myös ohjelmiston suunnittelu, erityisesti sen arkkitehtuuri dokumentoidaan usein jollain tavalla. Joskus tosin dokumentaatio on hyvin kevyt, esim. valkotaululle piirretty kaavio tai se voi jopa puuttua kokonaan ja ajatellaankin että hyvin muotoiltu koodi voi korvata dokumentoinnin.

### Testaus

Toteutuksen yhteydessä ja sen jälkeen järjestelmää testataan. Testauksessa on monta erilaista näkökulmaa, eli pääasiallista kiinnostuksen kohdetta. Näitä eri näkökulmia nimitetään usein _testaustasoiksi_. Testauksen terminologia vaihtelee hieman mutta yleisimmin puhutaan kolmesta testaustasosta eli yksikkötestauksesta, integraatiotestauksesta ja järjestelmätestauksesta.

_Yksikkötestauksessa_ (engl. unit testing) tutkitaan yksittäisten metodien ja luokkien toimintaa. Yksikkötestauksen tekee usein testattavan luokan ohjelmoija ja hyvä tapa on tehdä luokalle yksikkötestit samalla kun luokka ohjelmoidaan.

Kun erikseen ohjelmoidut komponentit (eli luokat tai luokkien muodostamat kokoelmat) yhdistetään, suoritetaan integraatiotestaus (engl. integration testing), jossa varmistetaan erillisten komponenttien yhteentoimivuus. Myös integraatiotestit tehdään useimmiten ohjelmoijien toimesta.

_Järjestelmätestauksessa_ (engl. system testing) testataan järjestelmää kokonaisuutena ja verrataan, että se toimii vaatimusdokumentissa sovitun määritelmän mukaisesti. Järjestelmätestauksessa testien näkökulma on sama kuin loppukäyttäjän, eli testit suoritetaan ohjelmiston käyttöliittymän kautta. Järjestelmätestauksen suorittavat usein testauksen ammattilaiset.

### Vesiputousmalli

Ohjelmistoja on perinteisesti tehty vaihe vaiheelta etenevän _vesiputousmallin_ (engl. waterfall model) mukaan. Vesiputousmallissa edellä esitellyt ohjelmistotuotannon vaiheet suoritetaan peräkkäin:

![](/assets/images/l-1.png)

Vesiputousmallissa suoritetaan siis ensin vaatimusmäärittely, jonka seurauksena kirjoitetaan vaatimusdokumentti, johon pyritään kokoamaan kaikki ohjelmalle osoitettavat vaatimukset mahdollisimman tarkasti dokumentoituna. Määrittelyvaiheen päätteeksi vaatimusdokumentti jäädytetään. Jäädytettyä vaatimusmäärittelyä käytetään usein ohjelman kehittämisen vaatimien resurssien arvioinnin perustana ja myös sopimus ohjelman hinnasta saatetaan tehdä vaatimusmäärittelyn pohjalta.

Vaatimusmäärittelyä seuraa suunnitteluvaihe, joka myös dokumentoidaan tarkoin. Pääsääntöisesti suunnitteluvaiheen aikana ei enää tehdä muutoksia määrittelyyn. Joskus tämäkin on tarpeen. Suunnittelu pyritään tekemään niin täydellisenä, että ohjelmointivaiheessa ei enää ole tarvetta muuttaa suunnitelmia.

Suunnittelun jälkeen toteutetaan ohjelman yksittäiset komponentit ja tehdään niille yksikkötestaus. Tämän jälkeen erilliset komponentit liitetään yhteen eli integroidaan ja suoritetaan integrointitestaus.

Integroinnin jälkeen ohjelmalle tehdään järjestelmätestaus, eli testataan, että ohjelmisto toimii kokonaisuutena niin kuin määrittelydokumentissa on määritelty.

Vesiputousmalli on monella tapaa ongelmallinen. Mallin toimivuus perustuu siihen oletukseen, että ohjelman vaatimukset pystytään määrittelemään täydellisesti ennen kuin suunnittelu ja ohjelmointi alkaa. Näin ei useinkaan ole. On lähes mahdotonta, että asiakkaat pystyisivät tyhjentävästi ilmaisemaan kaikki ohjelmalle asettamansa vaatimukset. Vähintäänkin riski sille, että ohjelma on käytettävyydeltään huono, on erittäin suuri. Usein käy myös niin, että vaikka ohjelman vaatimukset olisivat kunnossa vaatimusten laatimishetkellä, muuttuu toimintaympäristö (tapahtuu esim. yritysfuusio) ohjelman kehitysaikana niin ratkaisevasti, että valmistuessaan ohjelma on vanhentunut. Hyvin yleistä on myös se, että vasta käyttäessään valmista ohjelmaa asiakkaat alkavat ymmärtää, mitä he olisivat ohjelmalta halunneet.

Asiakkaan muuttuvien vaatimuksien lisäksi toinen suuri ongelma on se, että vesiputousmallissa ohjelmistoa aletaan testata verrattain myöhäisessä vaiheessa. Erityisesti integraatiotestauksessa on tyypillistä että ohjelmasta löydetään pahoja ongelmia, joiden korjaaminen hidastaa ohjelmiston valmistumista paljon ja käy kalliiksi.

### Ketterä ohjelmistokehitys

Vesiputousmallin heikkoudet ovat johtaneet viime vuosina yleistyneiden _ketterien (engl. agile) ohjelmistokehitysmenetelmien_ käyttöönottoon.

Ketterissä menetelmissä lähdetään oletuksesta, että vaatimuksia ei voi tyhjentävästi määritellä ohjelmistokehitysprosessin alussa. Koska näin ei voida tehdä, ei sitä edes yritetä vaan pyritään toimimaan niin, että asiakkaan vaatimukset saadaan tarkennettua pikkuhiljaa ohjelmiston kehitysprosessin aikana ja lopputuloksesta saadaan sitä kautta mahdollisimman halutun kaltainen.

Ketterä ohjelmistokehitys etenee yleensä siten, että ensin kartoitetaan pääpiirteissään ohjelman vaatimuksia ja ehkä hahmotellaan järjestelmän alustava arkkitehtuuri. Tämän jälkeen suoritetaan useita _iteraatioita_ (joista käytetään yleisesti myös nimitystä sprintti), joiden aikana ohjelmaa rakennetaan pala palalta eteenpäin. Kussakin iteraatiossa suunnitellaan ja toteutetaan valmiiksi pieni osa ohjelman vaatimuksista. Vaatimukset voivat myös tarkentua koko prosessin ajan.

Yksittäinen iteraatio, joka on kestoltaan tyypillisesti 1-4 viikkoa, siis lisää järjestelmään pienen osan koko järjestelmän toivotusta toiminnallisuudesta. Tyypillisesti tärkeimmät ja toteutuksen kannalta haasteellisimmat ja riskialttiimmat toiminnallisuudet toteutetaan ensimmäisillä iteraatioilla. Yksi iteraatio sisältää toteutettavaksi valittujen vaatimusten tarkennuksen, suunnittelun, toteutuksen sekä testauksen.

Jokainen iteraatio tuottaa toimivan ja toteutettujen ominaisuuksien kannalta testatun järjestelmän. Asiakas pääsee kokeilemaan järjestelmää jokaisen iteraation jälkeen. Tällöin voidaan jo aikaisessa vaiheessa todeta, onko kehitystyö etenemässä oikeaan suuntaan ja vaatimuksia voidaan tarvittaessa tarkentaa ja lisätä.

Jokainen iteraatio siis sisältää määrittelyä, suunnittelua, ohjelmointia ja testausta ja jokaisen iteraation jälkeen saadaan asiakkaalta palautetta siitä, onko kehitystyö etenemässä oikeaan suuntaan:

![](/assets/images/l-2.png)

Ketterässä ohjelmistokehityksessä dokumentointi ei ole yleensä niin keskeisessä osassa kuin perinteisissä menetelmissä.

Vähäisemmän dokumentaation sijaan testauksella ja ns. jatkuvalla integroinnilla on hyvin suuri merkitys. Yleensä pyritään siihen, että järjestelmään lisättävät uudet komponentit testataan välittömästi ja pyritään heti integroimaan kokonaisuuteen; tästä työskentelytavasta käytetään nimitystä _jatkuva integrointi_ (engl. continuous integration). Näin uusia versioita järjestelmästä syntyy jopa päivittäin.

Uusien komponenttien toimiminen pyritään varmistamaan perinpohjaisella automaattisella testauksella. Joskus jopa "testataan ensin", eli jo ennen uuden komponentin toteuttamista ohjelmoidaan komponentin toimintaa testaavat testitapaukset. Testitapausten valmistuttua toteutetaan komponentti ja siinä vaiheessa kun komponentti läpäisee testitapaukset, se integroidaan muuhun kokonaisuuteen.

Erilaisia ketteriä ohjelmistokehitysmenetelmiä on olemassa lukuisia, näistä tunnetuin nykyään on Scrum.

Ketterät menetelmät ovat nykyään vallitseva tapa tehdä ohjelmistoja. Ketterien menetelmien rinnalle ovat viime vuosina nousseet ketteryyden ideaa hieman jalostavat Lean-menetelmät. Palaamme aiheeseen tarkemmin kurssilla Ohjelmistotuotanto.

Tämän kurssin harjoitustyö pyritään tekemään osittain ketterien menetelmien hengessä, eli vaatimusmäärittely ja suunnittelu pidetään kevyenä ja ohjelmaa aletaan toteuttaa jo heti alkuvaiheessa. Ohjelmasta pyritään mahdollisuuksien mukaan tekemään jokaisen iteraation eli viikon päätteeksi toimiva versio jota sitten viikko viikolta laajennetaan. Kurssin vaatimaa dokumentaatiota tehdään osin matkan varrella.
