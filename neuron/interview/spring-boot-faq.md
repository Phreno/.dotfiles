
## Questions Fréquentes

Qu’est-ce que Spring boot ?
: Framework spring basé sur Java 
- développement accéléré d’applications
- construction de microservices autonomes
- support d’auto-configuration 
- serveur d’application embarqué

Quelles sont les caractéristiques de Spring Boot qui le rendent différent ?
: Application Spring autonome avec une configuration minimale
- intègration tomcat et jetty
- fonctionnalités de production
  - les métriques
  - le bilan de santé(health checks) 
  - la configuration externalisée
- aucune exigence pour la configuration XML

Quels sont les avantages de l’utilisation de Spring Boot ?
: Développement accéléré, concentration sur le code
- ajout d’un serveur HTTP intégré
- configuration par annotation
- facile à comprendre

Quels sont les composants clés de Spring Boot ?
: Autoconfiguration
- CLI de Spring Boot
- POMs de démarrage de Spring Boot
- Les actionneurs de Spring Boot

Pourquoi préférer Spring Boot à Spring ?
: Différences Spring / Spring Boot 
- Gestion des versions
- Auto Configuration
- Analyse des composants
- Serveur embarqué
- Base de données en mémoire
- Starter POM
- Actionneurs

Quelles sont les dépendances Spring Boot Starter ?
: Les plus courantes 
- Data JPA starter
- Test Starter
- Security starter
- Web starter
- Mail starter
- Thymeleaf starter

Comment fonctionne Spring Boot ?
: Configuration automatique 
- `@SpringBootApplication`, point d’entrée
- `@ComponentScan` scanne automatiquement tous les composants

Que fait l’annotation `@SpringBootApplication` en interne ?
: Équivaut à utiliser les annotations suivantes
- `@Configuration`
- `@EnableAutoConfiguration`
- `@ComponentScan` 

Quel est le but de l’utilisation de `@ComponentScan` dans une classe ?
: Scanne tous les beans et les déclarations de package lors de l’initialisation de l’application

Comment démarre une application Spring Boot ?
: Comme n'importe quelle application java

> Méthode `main` qui invoque la méthode `SpringApplication#run`

``````java
@SpringBootApplication 
public class MyApp 
{    
   public static void main(String[] args) { 
    SpringApplication.run(MyApp.class); /* code... */ 
   } 
}
``````

Quelles sont les dépendances spring-boot-starter?
: Spring boot starter est un template maven 
- contient une collection de toutes les dépendances transitives pertinentes qui sont nécessaires pour démarrer une fonctionnalité particulière.

> Par exemple, nous devons importer la dépendance spring-boot-starter-web pour créer une application web.

``````xml
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
: Le port par défaut du serveur tomcat est 8080. 
> Modifiable dans `application.propertie`
```properties
server.port= 8080
```

Peut-on remplacer le serveur Tomcat embarqué dans Spring Boot ?
: Oui
- en utilisant la dépendance Starter dans le fichier pom.xml.
> Par exemple, vous pouvez utiliser spring-boot-starter-jetty comme dépendance pour utiliser un serveur jetty dans votre projet.

Peut-on désactiver le serveur web par défaut dans une application Spring boot ?
: Oui
- modifiable dans `application.properties`
```properties
spring.main.web-application-type=none
```

Comment désactiver l’autoconfiguration pour une classe spécifique ?
: Avec exclude de `@EnableAutoConfiguration`
```java
@EnableAutoConfiguration(exclude={className})
```
Quel est le moteur de template HTML par défaut dans Spring Boot ?
: Thymeleaf

Peut-on créer une application non-web dans Spring Boot ?
: Oui
- en supprimant les dépendances web du classpath 
- en modifiant la façon dont Spring Boot crée le contexte de l’application.

Expliquez l’annotation `@RestController` dans Sprint boot ?
: Il s’agit d’une combinaison de `@Controller` et `@ResponseBody`, utilisée pour créer un contrôleur restful.
- convertit la réponse en JSON ou XML.
- garantit que les données renvoyées par chaque méthode seront écrites directement dans le corps de la réponse au lieu de renvoyer un template.

Quelle est la différence entre `@RestController` et `@Controller` dans Spring Boot ?
: 
- `@Controller` fait correspondre l’objet du modèle à la vue et le rend lisible
- `@RestController` renvoie simplement l’objet et les données de l’objet sont directement écrites dans la réponse HTTP sous forme de JSON ou de XML.

Quelle est la différence entre `RequestMapping` et `GetMapping` ?
: 
- `RequestMapping` peut être utilisé avec `GET`, `POST`, `PUT`, ... 
- Alors que `getMapping` n’est qu’une extension de RequestMapping

Quelle est l’utilité de « Profiles » dans Spring Boot ?
: Gestion des environnements

> Base H2 en test, et Oracle en production. 

A quoi sert l’actionneur dans Spring ? Quels sont ses avantages ?
: Surveiller et gérer votre application
- audit
- healthcheck
- utilisation du CPU
- hits HTTP
- métriques
- ...


Comment activer un actionneur dans une application Spring boot ?
: Ajouter la dépendance de `spring-boot-starter-actuator` dans pom.xml.

``````xml
<dependency>
<groupId> org.springframework.boot</groupId>
<artifactId> spring-boot-starter-actuator </artifactId>
</dependency>
``````

Comment récupérer la liste de tous les beans de votre application Spring boot ?
: `/Beans`

Comment vérifier les propriétés de l’environnement dans votre application Spring boot ?
: `env`

Annotation utilisée pour le traitement des requêtes GET ?
: `@GetMapping`

Comment activer le log de débogage dans une application Spring Boot ?
:
- `--debug`
- `logging.level.root=debug` dans le fichier `application.property`.

Où définir les propriétés dans une application Spring Boot ?
: `application.properties`.
- S’il existe dans le classpath, Spring Boot le charge automatiquement

Qu’est-ce qu’un conteneur IOC ?
: Framework qui implémente l’injection automatique de dépendances.
- création des objets
- durée de vie
- injection de dépendances

Annotation utilisée pour Rest Controller ?
: `@RestController`

Citer 3 annotation Spring Boot ?
:
- `@Controller`
- `@Service`
- `@RestController`

Version minimale de Java requise pour Spring Boot ?
: Java 8

Lequel des éléments suivants est utilisé par Maven ?
: `pom.xml` 

Quelles sont Les dépendances nécessaires pour créer une application web Spring Boot?
: `spring-boot-starter-web`

Points de départ d’une application Spring Boot ?
: `@SpringBootApplication`

L’objet de base de données doit être annoté avec _____
: `@Entity`

Étant donné le fichier de configuration Spring, quelles sont les instructions correctes?
: L’espace de noms `p` doit être déclaré
``````xml
<bean class="com.spring.service.CompanyServiceImpl" p:CompanyName="WayToLearnX"> 
</bean>
``````
 
Compte tenu du fichier de configuration Spring suivant, quelle est la bonne réponse?
: Le deuxième bean déclaré JpaDao, il manque un identifiant doit être nommé jpaDao
``````
<bean class="com.spring.service.MyServiceImpl"> 
     <property name="repository" ref="jpaDao"/> 
</bean>
<bean class="com.spring.repository.JpaDao"/>
``````
- Ces beans sont anonymes car aucun identifiant n’est fourni explicitement.
- Ainsi, le conteneur Spring génère un identifiant unique pour ce bean.
- Il utilise le nom de classe complet et leur ajoute un numéro.
- Toutefois, si vous souhaitez faire référence à ce bean par son nom, vous devez fournir un nom via l’utilisation de l’élément ref.
- Pour être correct, le deuxiéme bean doit déclarer un attribut id jpaDao afin d’être référencé par la propriété repository du premier bean.

Quel est généralement le(s) cas où vous avez généralement besoin d’instancier manuellement un `ApplicationContext`?
: 
- Dans une application autonome démarrée avec la méthode principale main
- Dans une application Web, `ContextLoaderListener` est chargé de créer un `WebApplicationContext`.
- Dans un test d’intégration basé sur Spring, SpringJUnit4ClassRunner crée le contexte de l’application pour vous. L’annotation `@ContextConfiguration` permet de spécifier des fichiers de configuration de contexte d’application.
- Dans la méthode principale main, vous devez instancier une classe implémentant l’interface ApplicationContext (exemples: ClassPathXmlApplicationContext ou FileSystemXmlApplicationContext).

 
Comment s’appelle le bean défini dans la classe de configuration suivante. Sélectionnez une seule réponse?
: clientRepository
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

> L’annotation `@Bean` définit un bean String avec l’id clientRepository. JpaClientRepository est la classe d’implémentation du bean. Data source est injectée et n’est pas déclarée dans cette classe.

 
Quelle est la portée d’un bean stateless dans Spring?
: Singleton scope

> Prototype scope. Si la portée est définie sur prototype, le conteneur Spring IoC crée une nouvelle instance de l’objet bean à chaque fois qu’une requête pour ce bean spécifique est effectuée. En règle générale, utilisez la portée du prototype(Prototype scope) pour tous les beans state-full et la portée du singleton(Singleton scope) pour les beans stateless(sans-état).

 
Comment auto-injecter dans un attribut un bean par son nom?
: En utilisant les annotations de spring `@Autowired` et `@Qualifier`
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
- `TransactionConfiguration` définit les métadonnées au niveau de la classe pour la configuration des tests transactionnels.

 
Sélectionnez la déclaration correcte concernant le développement du test d’intégration avec Spring?
: La configuration du contexte Spring pourrait hériter de la classe super
- Le contexte Spring est mis en cache dans les tests, sauf si vous utilisez l’annotation `@DirtiesContext`.
- Avec le module de test Spring, l’injection de dépendance est disponible en cas de test. Donc, vous pouvez automatiquement injecter le bean pour le tester
- Par défaut, une classe avec l’annotation `@ContextConfiguration` hérite des emplacements de fichier de configuration de contexte définis par l’annotation d’une superclasse. InheritLocations de cet attribut permet de modifier ce comportement par défaut.
- Si aucun fichier de configuration de contexte n’est fourni à l’annotation `@ContextConfiguration`, Spring utilise un nom de convention. Il essaie de charger un fichier nommé avec le nom de la classe de test avec le suffixe « -context.xml » (c’est-à-dire MaClasseDeTest-context.xml).
