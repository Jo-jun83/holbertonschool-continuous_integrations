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