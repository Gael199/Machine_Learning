# Machine_Learning
Classification Methods

## Régression Logistique

Ce projet implémente un modèle de régression logistique, une méthode statistique de classification binaire largement utilisée en apprentissage automatique, afin de classer des tumeurs comme bénignes ou malignes à partir de caractéristiques biologiques issues du dataset Breast Cancer. L’algorithme permet de modéliser la probabilité qu’un échantillon appartienne à une certaine classe.

## 📘 À propos du projet

L’objectif de ce projet est de construire un modèle de machine learning supervisé capable de prédire si une tumeur est maligne (1) ou bénigne (0), à partir de caractéristiques biologiques mesurées lors de biopsies mammaires.

Pour cela, nous utilisons un modèle de régression logistique, un algorithme simple, rapide et efficace, couramment utilisé pour les tâches de classification binaire.

La régression logistique repose sur la fonction sigmoïde, qui transforme une combinaison linéaire des variables d’entrée en une probabilité comprise entre 0 et 1. Elle permet ainsi de modéliser la probabilité qu’un échantillon appartienne à une certaine classe.

Ce type de modèle est largement utilisé dans des cas d’usage tels que :

Prédire si un e-mail est un spam ou non

Diagnostiquer la présence ou non d’une maladie

Déterminer si un client effectuera un achat


## Etapes du projet

Le projet suit plusieurs étapes clés typiques d’un flux de travail en machine learning. Nous commençons par l’importation des bibliothèques nécessaires, telles que Pandas et Scikit-learn. Ensuite, nous procédons au chargement et au nettoyage des données, afin de nous assurer qu’elles soient exploitables. Les variables explicatives (X) sont séparées de la variable cible (y), qui indique si la tumeur est bénigne ou maligne. Le jeu de données est ensuite divisé en un ensemble d’entraînement et un ensemble de test, selon une répartition 80/20. Une fois les données prêtes, le modèle de régression logistique est entraîné sur l’ensemble d’apprentissage. Enfin, nous procédons à l’évaluation des performances du modèle à l’aide de différentes métriques, notamment le taux de précision (accuracy), la matrice de confusion pour analyser les performances globales du classifieur.

## Technologies utilisées
- pandas
- sckit-learn



**N.B**. : Ce dépôt a vocation à être enrichi. D'autres méthodes de classification supervisée (K-plus proches voisins, arbres de décision, SVM, etc.) seront ajoutées progressivement afin d’élargir l’étude comparative des performances.



#### 🧑‍💻 **Auteur** : *Eudes KODIA* 
