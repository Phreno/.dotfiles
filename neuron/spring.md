## Différence Spring / Spring boot

|    | Spring                                                                                                     | SpringBoot                                                                                                       |   |   |
|----|------------------------------------------------------------------------------------------------------------|------------------------------------------------------------------------------------------------------------------|---|---|
| 1. | Spring est un framework léger open source largement utilisé pour développer des applications d’entreprise. | Spring Boot est construit sur le framework Spring conventionnel, largement utilisé pour développer des API REST. |   |   |
| 2. | La fonctionnalité la plus importante de Spring Framework est l’injection de dépendances.                   | La fonctionnalité la plus importante de Spring Boot est la configuration automatique.                            |   |   |
| 3. | Cela aide à créer une application faiblement couplée.                                                      | Il aide à créer une application autonome.                                                                        |   |   |
| 4. | Pour exécuter l’application Spring, nous devons définir explicitement le serveur.                          | Spring Boot fournit des serveurs intégrés tels que Tomcat et Jetty, etc.                                         |   |   |
| 5. | Pour exécuter l’application Spring, un descripteur de déploiement est requis.                              | Il n’y a aucune exigence pour un descripteur de déploiement.                                                     |   |   |
| 6. | Pour créer une application Spring, les développeurs écrivent beaucoup de code.                             | Cela réduit les lignes de code.                                                                                  |   |   |
| 7. | Il ne prend pas en charge la base de données en mémoire.                                                   | Il prend en charge la base de données en mémoire telle que H2.                                                   |   |   |

## Questions Fréquentes

Qu’est-ce que Spring boot ?
: Sprint boot est un framework spring basé sur Java utilisé pour le développement accéléré d’applications (pour construire des microservices autonomes).
- Il dispose d’un support supplémentaire d’auto-configuration et d’un serveur d’application embarqué comme tomcat, jetty, etc.


Quelles sont les caractéristiques de Spring Boot qui le rendent différent ?
: Crée une application Spring autonome avec une configuration minimale.
- Il intègre tomcat et jetty, ce qui permet de coder et d’exécuter l’application.
- Fournit des fonctionnalités prêtes pour la production telles que les métriques, le bilan de santé(health checks) et la configuration externalisée.
- Absolument aucune exigence pour la configuration XML.

Quels sont les avantages de l’utilisation de Spring Boot ?
: Facile à comprendre et à développer des applications Spring.
- Spring Boot n’est rien d’autre qu’un framework existant avec l’ajout d’un serveur HTTP intégré et d’une configuration d’annotation, ce qui le rend plus facile à comprendre et accélère le processus de développement.
- Augmente la productivité et réduit le temps de développement.
- Configuration minimale.
- Nous n’avons pas besoin d’écrire de configuration XML, seules quelques annotations sont nécessaires pour effectuer la configuration.

Quels sont les composants clés de Spring Boot ?
: Autoconfiguration de Spring Boot.
- CLI de Spring Boot.
- POMs de démarrage de Spring Boot.
- Les actionneurs de Spring Boot.

Pourquoi préférer Spring Boot à Spring ?
: Quelques points essentiels que Spring Boot offre, mais pas Spring:
- Gestion des versions.
- Auto Configuration.
- Analyse des composants.
- Serveur embarqué.
- Base de données en mémoire.
- Starter POM.
- Actionneurs.

Quelles sont les dépendances Spring Boot Starter ?
: Spring boot fournit un certain nombre de dépendances Starter, dont voici les plus couramment utilisées.
- Data JPA starter.
- Test Starter.
- Security starter.
- Web starter.
- Mail starter.
- Thymeleaf starter.

Comment fonctionne Spring Boot ?
: Spring Boot configure automatiquement votre application en fonction des dépendances que vous avez ajoutées au projet en utilisant des annotations.
- Le point d’entrée de l’application Spring Boot est la classe qui contient l’annotation `@SpringBootApplication` et la méthode main.
- Spring Boot scanne automatiquement tous les composants inclus dans le projet en utilisant l’annotation `@ComponentScan`.

Que fait l’annotation `@SpringBootApplication` en interne ?
: L’annotation `@SpringBootApplication` équivaut à utiliser `@Configuration`, `@EnableAutoConfiguration` et `@ComponentScan` avec leurs attributs par défaut. 
- Spring Boot permet au développeur d’utiliser une seule annotation au lieu d’en utiliser plusieurs.
- Mais, comme nous le savons, Spring a fourni des fonctionnalités faiblement couplées que nous pouvons utiliser pour chaque annotation en fonction des besoins de notre projet.

Quel est le but de l’utilisation de `@ComponentScan` dans une classe ?
: L’application Spring Boot scanne tous les beans et les déclarations de package lors de l’initialisation de l’application.
- Vous devez ajouter l’annotation `@ComponentScan` à votre classe pour analyser les composants ajoutés à votre projet.

Comment démarre une application Spring Boot ?
: Comme tout autre programme Java, une application Spring Boot doit avoir une méthode main.
- Cette méthode sert de point d’entrée, qui invoque la méthode SpringApplication#run
pour démarrer l’application.

``````
@SpringBootApplication 
public class MyApp 
{    
       public static void main(String[] args) 
       {        
             SpringApplication.run(MyApp.class);        
               // code...    
       } 
}
``````

Quelles sont les dépendances spring-boot-starter?
: Spring boot starter est un template maven qui contient une collection de toutes les dépendances transitives pertinentes qui sont nécessaires pour démarrer une fonctionnalité particulière.
- Par exemple, nous devons importer la dépendance spring-boot-starter-web pour créer une application web.

``````
<dependency>
<groupId> org.springframework.boot</groupId>
<artifactId> spring-boot-starter-web </artifactId>
</dependency>
``````
 
Qu’est-ce que Spring Initializer?
: Spring Initializer est une application web qui vous aide à créer une structure initiale de projet Spring Boot et fournit un fichier maven ou gradle pour construire votre code.
- Il résout le problème de la mise en place d’un framework lorsque vous démarrez un projet à partir de zéro.

Qu’est-ce que Spring Boot CLI et quels sont ses avantages ?
: Spring Boot CLI est une interface en ligne de commande qui vous permet de créer une application java basée sur Spring à l’aide de Groovy.

> Exemple : Vous n’avez pas besoin de créer de méthode getter et setter ou de modificateur d’accès, d’instruction de retour. Si vous utilisez le modèle JDBC, il se charge automatiquement pour vous.

Quelles sont les commandes CLI les plus courantes de Spring Boot ?
: Voici les commandes les plus courantes: 
- `-jar`
- `-install`
- `-uninstall`
- `-run`
- `-init`
- `-test`
- `-war`
- `-shell`
- `-grap`
- `-help`

Quel est le port par défaut de tomcat dans spring boot ?
: Le port par défaut du serveur tomcat est 8080. Il peut être modifié en ajoutant la propriété « sever.port » dans le fichier « application.property ».

Peut-on remplacer le serveur Tomcat embarqué dans Spring Boot ?
: Oui, nous pouvons remplacer le serveur Tomcat embarqué par n’importe quel serveur en utilisant la dépendance Starter dans le fichier pom.xml.
> Par exemple, vous pouvez utiliser spring-boot-starter-jetty comme dépendance pour utiliser un serveur jetty dans votre projet.

Peut-on désactiver le serveur web par défaut dans une application Spring boot ?
: Oui, on peut utiliser « application.properties » pour configurer le type d’application web, c’est-à-dire spring.main.web-application-type=none

Comment désactiver l’autoconfiguration pour une classe spécifique ?
: Vous pouvez utiliser l’attribut « exclude » de `@EnableAutoConfiguration` si vous souhaitez que l’autoconfiguration ne s’applique pas à une classe spécifique. 

> Exemple: `@EnableAutoConfiguration(exclude={className})`
 
Quel est le moteur de template HTML par défaut dans Spring Boot ?
: Thymeleaf

Peut-on créer une application non-web dans Spring Boot ?
: Oui, nous pouvons créer une application non-web en supprimant les dépendances web du classpath et en modifiant la façon dont Spring Boot crée le contexte de l’application.

Expliquez l’annotation `@RestController` dans Sprint boot ?
: Il s’agit d’une combinaison de `@Controller` et `@ResponseBody`, utilisée pour créer un contrôleur restful.
- Il convertit la réponse en JSON ou XML.
- Il garantit que les données renvoyées par chaque méthode seront écrites directement dans le corps de la réponse au lieu de renvoyer un template.

Quelle est la différence entre `@RestController` et `@Controller` dans Spring Boot ?
: `@Controller` fait correspondre l’objet du modèle à la vue et le rend lisible, mais `@RestController` renvoie simplement l’objet et les données de l’objet sont directement écrites dans la réponse HTTP sous forme de JSON ou de XML.

Quelle est la différence entre RequestMapping et GetMapping ?
: RequestMapping peut être utilisé avec `GET`, `POST`, `PUT`, et beaucoup d’autres méthodes de requête en utilisant l’attribut « method » de l’annotation. Alors que getMapping n’est qu’une extension de RequestMapping qui vous aide à améliorer la lisibilité de la requête.

Quelle est l’utilité de « Profiles » dans Spring Boot ?
: Lors du développement de l’application, nous avons affaire à plusieurs environnements tels que dev, test, Prod, et chaque environnement nécessite une configuration différente.

> Par exemple, nous pouvons utiliser une base de données H2 intégrée pour le développement, mais pour la production, nous pouvons avoir un Oracle ou un DB2 propriétaire. Même si le SGBD est le même dans tous les environnements, les URLs seront différentes.

> Pour rendre cela facile et propre, Spring a prévu des profils pour garder la configuration séparée des environnements.
 
A quoi sert l’actionneur dans Spring ? Quels sont ses avantages ?
: Un actionneur est une fonctionnalité supplémentaire de Spring qui vous aide à surveiller et à gérer votre application lorsque vous la mettez en production.
- Ces actionneurs comprennent l’audit,
- la healthcheck,
- l’utilisation du CPU, 
- les hits HTTP, 
- la collecte de métriques, 
- et bien d’autres choses encore qui sont automatiquement appliquées à votre application.

Comment activer un actionneur dans une application Spring boot ?
: Pour activer la fonctionnalité de l’actionneur spring, nous devons ajouter la dépendance de `spring-boot-starter-actuator` dans pom.xml.

``````
<dependency>
<groupId> org.springframework.boot</groupId>
<artifactId> spring-boot-starter-actuator </artifactId>
</dependency>
``````

Comment récupérer la liste de tous les beans de votre application Spring boot ?
: L’actionneur Spring Boot « /Beans » est utilisé pour obtenir la liste de tous les « spring beans » de votre application.

Comment vérifier les propriétés de l’environnement dans votre application Spring boot ?
: L’actionneur Spring Boot « /env » renvoie la liste de toutes les propriétés de l’environnement d’exécution de l’application Spring Boot.

 
 
 

Annotation utilisée pour le traitement des requêtes GET ?
: `@GetMapping`

Comment activer le log de débogage dans une application Spring Boot ?
: Les journaux de débogage peuvent être activés de trois manières différentes:

- Nous pouvons démarrer l’application avec le paramètre `--debug`
- Nous pouvons définir la propriété `logging.level.root=debug` dans le fichier `application.property`.
- Nous pouvons définir le niveau de journalisation sur debug dans le fichier de configuration de log fourni.

Où définir les propriétés dans une application Spring Boot ?
: Vous pouvez définir les propriétés liées à l’application et à Spring boot dans un fichier appelé `application.properties`.

- Vous pouvez créer ce fichier manuellement ou utiliser Spring Initializer pour créer ce fichier. 
- Vous n’avez pas besoin d’effectuer une configuration spéciale pour demander à Spring Boot de charger ce fichier.
- S’il existe dans le classpath, Spring Boot le charge automatiquement et se configure lui-même ainsi que le code de l’application en conséquence.

Qu’est-ce qu’un conteneur IOC ?
: IoC Container est un framework pour implémenter l’injection automatique de dépendances.

- Il gère la création des objets et leur durée de vie et injecte également les dépendances dans la classe.

Annotation utilisée pour Rest Controller ?
: `@RestController`

Citer 3 annotation Spring Boot ?
: Voici 3 annotations: 
- `@Controller`
- `@Service`
- `@RestController`

Version minimale de Java requise pour Spring Boot ?
: Java 8

Lequel des éléments suivants est utilisé par Maven ?
: Pom.xml

Quelles sont Les dépendances nécessaires pour créer une application web Spring Boot?
: `spring-boot-starter-web`

Points de départ d’une application Spring Boot ?
: `@SpringBootApplication`

L’objet de base de données doit être annoté avec _____
: `@Entity`

Qu’est‐ce qui n’est pas vrai concernant les annotations `@PostConstruct`, `@Resource` et `@PreDestroy`?
: Le framework Spring intégre ces annotations
 
Étant donné le fichier de configuration Spring, quelles sont les instructions correctes?
``````
<bean class="com.spring.service.CompanyServiceImpl" p:CompanyName="WayToLearnX"> 
</bean>
``````
: L’espace de noms p doit être déclaré
 
Compte tenu du fichier de configuration Spring suivant, quelle est la bonne réponse?
``````
<bean class="com.spring.service.MyServiceImpl"> 
     <property name="repository" ref="jpaDao"/> 
</bean>
<bean class="com.spring.repository.JpaDao"/>
``````
: Le deuxième bean déclaré JpaDao, il manque un identifiant doit être nommé jpaDao

- Ces beans sont anonymes car aucun identifiant n’est fourni explicitement.
- Ainsi, le conteneur Spring génère un identifiant unique pour ce bean.
- Il utilise le nom de classe complet et leur ajoute un numéro.
- Toutefois, si vous souhaitez faire référence à ce bean par son nom, vous devez fournir un nom via l’utilisation de l’élément ref.
- Pour être correct, le deuxiéme bean doit déclarer un attribut id jpaDao afin d’être référencé par la propriété repository du premier bean.

Quel est généralement le(s) cas où vous avez généralement besoin d’instancier manuellement un ApplicationContext?
: Dans une application autonome démarrée avec la méthode principale main

- Dans une application Web, ContextLoaderListener est chargé de créer un WebApplicationContext.
- Dans un test d’intégration basé sur Spring, SpringJUnit4ClassRunner crée le contexte de l’application pour vous. L’annotation `@ContextConfiguration` permet de spécifier des fichiers de configuration de contexte d’application.
- Dans la méthode principale main, vous devez instancier une classe implémentant l’interface ApplicationContext (exemples: ClassPathXmlApplicationContext ou FileSystemXmlApplicationContext).

 
Comment s’appelle le bean défini dans la classe de configuration suivante. Sélectionnez une seule réponse?
``````
@Configuration 
public class AppConfig { 
  @Autowired 
  private DataSource ds; 
  
  @Bean 
  ClientRepository clientRepository() { 
  
    ClientRepository cmpRepository = new JpaClientRepository(); 
    cmpRepository.setDataSource(ds); 
    
    return cmpRepository; 
  } 
  
}
``````
: clientRepository

> L’annotation `@Bean` définit un bean String avec l’id clientRepository. JpaClientRepository est la classe d’implémentation du bean. Data source est injectée et n’est pas déclarée dans cette classe.

 
Quelle est la portée d’un bean stateless dans Spring?
: Singleton scope

> Prototype scope. Si la portée est définie sur prototype, le conteneur Spring IoC crée une nouvelle instance de l’objet bean à chaque fois qu’une requête pour ce bean spécifique est effectuée. En règle générale, utilisez la portée du prototype(Prototype scope) pour tous les beans state-full et la portée du singleton(Singleton scope) pour les beans stateless(sans-état).

 
Comment auto-injecter dans un attribut un bean par son nom?
: En utilisant les annotations de spring `@Autowired` et `@Qualifier`

Exemple:
``````
public class ClientBean{
  
  @Qualifier("bean1")
  @Autowired
  private MonBean monBean;
  
  ...
  
}
``````

Quels sont les principaux avantages de l’utilisation de Spring lors de la rédaction de tests unitaires?
: Fournir des mocks pour les classes de servlets

Quels sont les principaux avantages de l’utilisation de Spring lors de la rédaction de tests unitaires?
: Vous n’avez pas besoin du conteneur Spring pour écrire le test unitaire.

> Le package org.springframework.mock fournit des classes fictives telles que MockHttpSession ou MockHttpContext. Ils pourraient être utiles pour les tests unitaires dans la couche de présentation et lorsque vous n’utilisez pas de framework fictif tel que Mockity ou EasyMock.

 
Sélectionnez la déclaration correcte concernant la gestion transactionnel du module de test du Spring?
: Le gestionnaire de transactions peut être défini avec l’annotation `@TransactionConfiguration`

TransactionConfiguration définit les métadonnées au niveau de la classe pour la configuration des tests transactionnels.

 
Sélectionnez la déclaration correcte concernant le développement du test d’intégration avec Spring?
: La configuration du contexte Spring pourrait hériter de la classe super

- Le contexte Spring est mis en cache dans les tests, sauf si vous utilisez l’annotation `@DirtiesContext`.
- Avec le module de test Spring, l’injection de dépendance est disponible en cas de test. Donc, vous pouvez automatiquement injecter le bean pour le tester
- Par défaut, une classe avec l’annotation `@ContextConfiguration` hérite des emplacements de fichier de configuration de contexte définis par l’annotation d’une superclasse. InheritLocations de cet attribut permet de modifier ce comportement par défaut.
- Si aucun fichier de configuration de contexte n’est fourni à l’annotation `@ContextConfiguration`, Spring utilise un nom de convention. Il essaie de charger un fichier nommé avec le nom de la classe de test avec le suffixe « -context.xml » (c’est-à-dire MaClasseDeTest-context.xml).