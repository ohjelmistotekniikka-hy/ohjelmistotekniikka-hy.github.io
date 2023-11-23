## Harjoitustyön toimivuus

**HUOM:** Saadaksesi harjoitustyöstä viikkokohtaiset pisteet, sovelluksen tulee toimia laitoksen tietokoneella ja ohjaajien pitää pystyä se niiltä aukaisemaan! Voit testata tätä millä tahansa [Cubbli](https://helpdesk.it.helsinki.fi/ohjeet/tietokone-ja-tulostaminen/tyoasemapalvelu/cubbli-helsingin-yliopistossa)-tietokoneella, kuten fuksiläppärillä, tai laitoksen tietokoneluokkien tietokoneilla. Testaus onnistuu myös [virtuaalityöasemassa](https://vdi.helsinki.fi) joko selaimen tai VMWare Horizon -asiakasohjelman avulla.

Virtuaalityöasemassa oman sovelluksen testaaminen onnistuu selaimen avulla seuraavasti:

1. Kirjaudu [virtuaalityöasemaan](https://vdi.helsinki.fi/portal/webclient/#/home) ja valitse Cubbli Linux
2. Käynnistä terminaali ja tarkista käytössäoleva Python-versio komennolla `python3 --version`. Jos versio on alle 3.8, päivitä versio [tämän](/fi/tasks/implementation#python-versioiden-hallinta) ohjeen avulla
3. Varmista, että Poetry on asennettu suorittamalla komento `poetry --version`. Jos asennus puuttuu, seuraa [näitä](/fi/tasks/week2#asennus) Linux-asennuksen ohjeita
4. Kloonaa repositoriosi haluamaasi hakemistoon `git clone`-komennolla
5. Siirry repositoriosi hakemistoon ja asenna riippuvuudet komennolla `poetry install`. Huomaa, että komento tulee suorittaa hakemistossa, jossa _pyproject.toml_-tiedosto sijaitsee

Mikäli yhteys virtuaalityöasemaan pätkii, kannattaa kokeilla toista selainta. Käyttäjät ovat raportoineet ainakin Google Chromen toimivan varsin hyvin. Myös [VMWare Horizon Clientin](https://customerconnect.vmware.com/en/downloads/info/slug/desktop_end_user_computing/vmware_horizon_clients/horizon_8) asentaminen saattaa auttaa.

**HUOM:** Jos suoritat SQLite-tietokantaa käyttävää sovellusta virtuaalityöasemassa, saatat törmätä virheeseen `database is locked`. Ongelma ratkeaa luultavasti [tämän](/fi/tasks/implementation#sqlite-tietokanta-lukkiutuminen-virtuaalityöasemalla) ohjeen avulla.
