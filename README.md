# Les Cagettes du Net

Bienvenue sur les Cagettes du net, le site qui vous facilitera l'achat et la livraison de fruits et légumes frais, de qualités, et locaux !

## Le projet

Ce site permettra à un utilisateur de se faire livrer des fruits et des légumes sous la forme d'un panier, livré une fois par semaine, dans un lieu de son choix prêt de chez lui.

## Elements techniques

### Versions

Ce projet a été réalisé sous Ruby 2.7.1 et Rails 5.2.6.

### Gems utilisées

Pour la réalisation du projet, nous allons faire appel à :

- faker
- table_print
- devise
- stripe
- dotenv-rails
- mailjet

### API utilisées

Ce projet nécessite l'utilisation des API suivantes:

- Mailjet
- Stripe
- Amazon Web Services

## La base de données

La base de données a été développé sous postgresql. Voici le diagramme de présentation:
![BDD Les Cagettes](https://zupimages.net/up/21/25/4rnu.png)

## Accéder au site

### Tester le site en ligne

Le site est actuellement en développement sur Heroku et est accessible via le lien suivant :
[Les Cagettes du net](https://cagettes-du-net.herokuapp.com)

### Tester le site en local

Pour tester le site en local il vous faudra, après téléchargement/clonage du repo GitHub, effectuer les commandes suivantes:

```
bundle install
rails db:create
rails db:migrate
rails db:seed
rails server
```

puis accéder au site en tapant dans la barre de recherche de votre navigateur l'adresse suivante:
http://localhost:3000/

## Contenu de la version finale

- Système d'authentification de l'utilisateur
- Interface administrateur
- Base de données
- Achat, paiement et abonnement
- Mailing automatique
- Formulaire de proposition d'un nouveau lieu
- Localisation des lieux de livraison sur une carte

## Détail des fonctionnalités

### Les lieux de livraison

- Affichage de tous les lieux de livraison disponibles et de leurs horaires
- Affichage de la localisation des lieux de livraison sur une carte
- Possibilité de proposer un nouveau lieu de livraison
- Affichage des lieux de livraison proposés par la communauté
- Possibilité de s'inscrire à un lieu proposé par la communauté

### Achat de produits

- Sélection d'un ou plusieurs produits
- Sélection possible de produits supplémentaires
- Possibilité d'abonnement par carte bancaire
- Affichage du total du panier
- Paiement par carte bancaire

### Mailer

- Envoi d'un email de bienvenue à la création d'un compte
- Envoi d'un email de confirmation de commande
- Envoi d'un email lors d'un abonnement
- Envoi d'un email pour réinitialisation du mot de passe

## L'équipe

### Les moussaillons

- Célia LOBET
- Timothy REMY
- Victor JUMAIRE
- Thomas MICHONNEAU
- Baptiste BUCHOU

### Notre mentor

- Joséphine REMY
