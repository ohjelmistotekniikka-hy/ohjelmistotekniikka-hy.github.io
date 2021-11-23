**HUOM:** Tarkista virtuaalityöaseman Python-versio komennolla `python3 --version`. Jos versio on alle 3.8, toimi seuraavasti:

1. Avaa terminaali ja asenna [pyenv](https://github.com/pyenv/pyenv) komennolla `curl https://pyenv.run | bash`
2. Siirry kotihakemistoon komennolla `cd` ja lisää kotihakemiston _.bashrc_-tiedoston loppuun seuraavat rivit:

   ```bash
   export PATH="$HOME/.pyenv/bin:$PATH"
   eval "$(pyenv init --path)"
   ```

   Tämä onnistuu esimerkiksi nano-editorilla komennolla `nano .bashrc`

3. Suorita komennot:

   ```bash
   source .bashrc
   pyenv install 3.8.12
   pyenv global 3.8.12
   ```

4. Varmista, että Python-versio on 3.8.12 komennolla `python --version`
