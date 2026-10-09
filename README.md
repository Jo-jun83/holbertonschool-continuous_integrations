## Construction de l'image Docker avec GitHub Actions

Un workflow GitHub Actions, défini dans `.github/workflows/image.yml`, construit automatiquement une image Docker à chaque `push`.

La construction est exécutée sur une machine GitHub utilisant `ubuntu-latest`, ce qui permet de vérifier que l'image peut être construite dans un environnement CI indépendant de mon ordinateur.

**Résultat :**
- Statut : Success
- Durée totale : 18 secondes
- Job `build` : réussi
- Publication de l'image : aucune

**Preuve :** [Voir l'exécution réussie sur GitHub Actions](https://github.com/Jo-jun83/holbertonschool-continuous_integrations/actions/runs/37908716282)

## Publication de l'image Docker sur GHCR

Le workflow `.github/workflows/image.yml` construit et publie automatiquement une image Docker sur GitHub Container Registry (GHCR) à chaque push sur la branche `main`.

L'authentification utilise `GITHUB_TOKEN`, fourni automatiquement par GitHub Actions, sans identifiants codés en dur.

Chaque image est publiée avec deux tags :
- `latest` : dernière version publiée.
- SHA du commit : identification précise de la version du code.

**Image publiée :** [Voir le package sur GitHub Container Registry](https://github.com/users/Jo-jun83/packages/container/package/holbertonschool-continuous_integrations)

## Mise en cache des couches Docker

Le workflow GitHub Actions utilise Docker Buildx et le cache GitHub Actions pour accélérer la construction des images Docker.

La configuration utilise :

- `cache-from: type=gha` pour récupérer les couches déjà enregistrées.
- `cache-to: type=gha,mode=max` pour sauvegarder les couches et les réutiliser lors des prochaines constructions.

### Comparaison des performances

| Indicateur | Avant réutilisation du cache | Après réutilisation du cache |
|---|---|---|
| Durée totale du workflow | 36 secondes | 32 secondes |
| Durée du build Docker | 11 secondes | 10 secondes |
| Couches réutilisées | 0 % | 9 % |

### Preuves GitHub Actions

- [Première construction avec cache (0 %)](https://github.com/Jo-jun83/holbertonschool-continuous_integrations/actions/runs/37911646058/attempts/1)
- [Deuxième construction avec réutilisation du cache (9 %)](https://github.com/Jo-jun83/holbertonschool-continuous_integrations/actions/runs/37911646058)

### Résultat

La durée totale du workflow est passée de 36 à 32 secondes, soit une réduction observée d'environ 11 %.

La construction Docker est passée de 11 à 10 secondes.

La deuxième exécution montre que 9 % des étapes de construction ont bénéficié du cache. Le gain reste limité sur ce petit projet et peut varier d'une exécution à l'autre.