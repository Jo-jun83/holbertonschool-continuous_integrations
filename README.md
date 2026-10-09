## Construction de l'image Docker avec GitHub Actions

Un workflow GitHub Actions, défini dans `.github/workflows/image.yml`, construit automatiquement une image Docker à chaque `push`.

La construction est exécutée sur une machine GitHub utilisant `ubuntu-latest`, ce qui permet de vérifier que l'image peut être construite dans un environnement CI indépendant de mon ordinateur.

**Résultat :**
- Statut : Success
- Durée totale : 18 secondes
- Job `build` : réussi
- Publication de l'image : aucune

**Preuve :** [Voir l'exécution réussie sur GitHub Actions](https://github.com/Jo-jun83/holbertonschool-continuous_integrations/actions/runs/37908716282)