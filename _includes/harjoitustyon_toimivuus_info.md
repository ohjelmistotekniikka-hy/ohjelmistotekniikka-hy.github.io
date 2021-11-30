**HUOM:** Saadaksesi harjoitustyöstä viikkokohtaiset pisteet, sovelluksen tulee toimia laitoksen koneella ja ohjaajien pitää pystyä se niiltä aukaisemaa! Voit testata tätä esimerkiksi [virtuaalityöasemassa](https://vdi.helsinki.fi).

Virtuaalityöasemassa oman sovelluksen testaaminen onnistuu esimerkiksi seuraavasti:

1. Kirjaudu [virtuaalityöasemaan](https://vdi.helsinki.fi/portal/webclient/#/home) ja valitse Cubbli Linux
2. Käynnistä terminaali ja kloonaa repositoriosi haluamaasi hakemistoon `git clone`-komennolla
3. Siirry repositoriosi hakemistoon ja asenna riippuvuudet komennolla `poetry install`. Huomaa, että komento tulee suorittaa hakemistossa, jossa _pyproject.toml_-tiedosto sijaitsee

**HUOM:** Jos suoritat SQLite-tietokantaa käyttävää sovellusta virtuaalityöasemassa, saatat törmätä virheeseen `database is locked`. Ongelma ratkeaa luultavasti [tämän](/python/toteutus#sqlite-tietokanta-lukkiutuminen-virtuaalityöasemalla) ohjeen avulla.
