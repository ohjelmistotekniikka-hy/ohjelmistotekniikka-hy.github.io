## Harjoitustyön toimivuus

**HUOM:** Saadaksesi harjoitustyöstä viikkokohtaiset pisteet, sovelluksen tulee toimia laitoksen tietokoneella ja ohjaajien pitää pystyä se niiltä aukaisemaan! Voit testata tätä millä tahansa [Cubbli](https://helpdesk.it.helsinki.fi/ohjeet/tietokone-ja-tulostaminen/tyoasemapalvelu/cubbli-helsingin-yliopistossa)-tietokoneella, esim. osaston tietokoneluokissa. Testaus onnistuu myös [virtuaalityöasemassa](https://vdi.helsinki.fi) joko selaimen tai VMWare Horizon -asiakasohjelman avulla.

Virtuaalityöasemassa oman sovelluksen testaaminen onnistuu selaimen avulla seuraavasti:

1. Kirjaudu [virtuaalityöasemaan](https://vdi.helsinki.fi/portal/webclient/#/home) ja valitse Cubbli Linux
2. Varmista, että uv on asennettu suorittamalla komento `uv --version`. Jos asennus puuttuu, seuraa [näitä](/python/viikko2#asennus) Linux-asennuksen ohjeita
4. Kloonaa repositoriosi haluamaasi hakemistoon `git clone`-komennolla
5. Siirry repositoriosi hakemistoon ja suorita komento `uv sync`. Huomaa, että komento tulee suorittaa hakemistossa, jossa _pyproject.toml_-tiedosto sijaitsee. (Jos uv valittaa, ettei se löydä pyproject.toml-tiedostossa vaadittua Python-versiota, asenna vaadittu versio uv:n itsensä avulla komennolla `uv python install {{site.python_version}}` ja suorita tämän jälkeen `uv sync` uudelleen.)

Mikäli yhteys virtuaalityöasemaan pätkii, kannattaa kokeilla toista selainta. Käyttäjät ovat raportoineet ainakin Google Chromen toimivan varsin hyvin. Myös [VMWare Horizon Clientin](https://customerconnect.vmware.com/en/downloads/info/slug/desktop_end_user_computing/vmware_horizon_clients/horizon_8) asentaminen saattaa auttaa.

**HUOM:** Jos suoritat SQLite-tietokantaa käyttävää sovellusta virtuaalityöasemassa, saatat törmätä virheeseen `database is locked`. Ongelma ratkeaa luultavasti [tämän](/python/toteutus#sqlite-tietokanta-lukkiutuminen-virtuaalityöasemalla) ohjeen avulla.
