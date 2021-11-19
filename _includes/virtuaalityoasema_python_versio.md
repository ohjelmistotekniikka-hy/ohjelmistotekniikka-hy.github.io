**HUOM:** Tarkista virtuaalityöaseman Python-versio komennolla `python3 --version`. Jos versio on alle 3.8, muuta **virtuaalityöasemalle lataamassasi projektissa** (repositoriossa olevassa projektissa tätä ei tarvitse muuttaa) _pyproject.toml_-tiedoston Python version vaatimukseski `^3.6`:

```
[tool.poetry.dependencies]
python = "^3.6"
```

Suorita tämän jälkeen komento `poetry install`.
