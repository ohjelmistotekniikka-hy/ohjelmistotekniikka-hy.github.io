## Harjoitustyön toimivuus

**HUOM:** Saadaksesi harjoitustyöstä viikkokohtaiset pisteet, sovelluksen tulee toimia laitoksen tietokoneella ja ohjaajien pitää pystyä se niiltä aukaisemaa! Voit testata tätä millä tahansa [Cubbli](https://helpdesk.it.helsinki.fi/ohjeet/tietokone-ja-tulostaminen/tyoasemapalvelu/cubbli-helsingin-yliopistossa)-tietokoneella, kuten fuksiläppärillä, tai laitoksen tietokoneluokkien tietokoneilla. Testaus onnistuu myös [virtuaalityöasemassa](https://vdi.helsinki.fi).

Virtuaalityöasemassa oman sovelluksen testaaminen onnistuu esimerkiksi seuraavasti:

1. Kirjaudu [virtuaalityöasemaan](https://vdi.helsinki.fi/portal/webclient/#/home) ja valitse Cubbli 20 Linux
2. Käynnistä terminaali ja tarkista käytössäoleva Python-versio komennolla `python3 --version`. Jos versio on alle 3.8, päivitä versio [tämän](/python/toteutus#python-versioiden-hallinta) ohjeen avulla
3. Varmista, että Poetry on asennettu suorittamalla komento `poetry --version`. Jos asennus puuttuu, seuraa [näitä](/python/viikko2#asennus) Linux-asennuksen ohjeita
4. Kloonaa repositoriosi haluamaasi hakemistoon `git clone`-komennolla
5. Siirry repositoriosi hakemistoon ja asenna riippuvuudet komennolla `poetry install`. Huomaa, että komento tulee suorittaa hakemistossa, jossa _pyproject.toml_-tiedosto sijaitsee

**HUOM:** Jos suoritat SQLite-tietokantaa käyttävää sovellusta virtuaalityöasemassa, saatat törmätä virheeseen `database is locked`. Ongelma ratkeaa luultavasti [tämän](/python/toteutus#sqlite-tietokanta-lukkiutuminen-virtuaalityöasemalla) ohjeen avulla.
