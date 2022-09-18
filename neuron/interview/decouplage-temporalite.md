# Le découplage temporalité


![resumé](./static/decouplage/decouplage-temporalite.png)


## Objectifs

Traiter de mannière asynchrone. 
- rendre plus rapidement la main à l’appelant
- gérer plus facilement les pics de charge

## Mise en oeuvre

- file de messages, 
- envoi de fichier, 
- base de données.

## Inconvénients

- ne pas perdre de demande de traitements, 
- ne pas en traiter en double (ou s’arranger pour que ça n’entraîne pas de conséquences néfastes) ;
- Complexifie 
  - gestion des erreurs 
  - cohérence des données
  - monitoring du système
    - outils externe

:::{.rounded .border-1 .border-solid .border-red-400  .mb-4}
Un découplage de temporalité sans découplage de format rend plus complexe les montées de version.
:::

> Il faut alors gérer la compatibilité entre les versions, ou attendre que les demandes en cours soient traitées avant de migrer l’ensemble du système. Ceci-dit, lorsque l’asynchronisme est utilisé à l’intérieur d’une seule et même application, cette approche peut être la bonne car elle évite d’avoir à se préoccuper de la gestion de compatibilité.

## Bonnes pratiques

- outil tiers externe à l’application 
  - file de message
  - base de données

> Suivant son implémentation et sa configuration, cet outil peut fournir une forme « naturelle » de découplage de localisation. Si, dans ce cas, elle est facile à mettre en œuvre du point de vue infrastructure, cela ne veut pas dire qu’elle est gratuite car le surcoût en complexité engendrée par les nouveaux comportements à prendre en compte est bien là.





