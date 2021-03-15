# GitHub-release

Eräs tapa julkaista ohjelmasta stabiili versio on tehdä GitHubiin release, eli julkaistu versio:

- Klikkaa repositorion GitHub-sivulta kohtaa "0 releases"
- Valitse _Draft a new release_
- Määrittele julkaisun tiedot
  - Käytä tagina palautuksen viikkoa. Esimerkiksi viikon 5 palautuksessa tagina on "viikko5"
- Jos sovelluksen suorituksessa edellytetään tiedostoja, tai jonkin erityisen komennon suorittamista, voit mainita niistä tekstissä. Kaikki asennukseen vaadittavat toimenpiteet tulee kuitenkin mainita myös _README.md_-tiedostossa
- GitHub liittää automaattisesti projektin lähdekoodin zip-pakattuna releaseen

![Release](./kuvat/release.png)

Nyt koodi on kenen tahansa ladattavissa menemällä GitHub-repositorioosi, ja klikkaamalla repositoriosivusi kohtaa "1 release". Ohjelman käynnistäminen tulee olla mahdollista lataamalla releasessa oleva projektin lähdekoodi ja noudattamalla _README.md_-tiedoston ohjeita. 

Projektin käyttöönottoa kannattaa testata releasen kautta: lataa releasessa mukana oleva lähdekoodi, noudata oman _README.md_-tiedostosi ohjeita ja varmista, että sovellus toimii, kuten pitäisi. _Älä oleta mitään_, esimerkiksi, että käyttäjä tietää, että tiettyyn hakemistoon tulee lisätä tietty tiedosto, että sovellus toimii.
