# docker-compose
Beinhaltet die Zusammenstellung der Container im mip02 

# Environment Variblen
Zum starten wird eine .env benötigt die sich in dem Ordner von dem docker_compose.yml liegen.
Wichtig ist dabei das diese .env auf gitignore liegt!!!
Ansonsten verlieren wir unsere Tokens, was nicht tragisch ist aber mehr Arbeit bedeuten würde neue Token zu generieren.

#### Vorlage für ```.env```:
```properties
CK=this
CS=is

AT=super
ATS=top

ANALYSIS_MONGODB_PASS=secret

DEBUGGING=true
```
