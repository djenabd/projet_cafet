Rapport du projet 

Difficultés rencontrées 
La prise en main était assez compliquée et longue, il nous a fallu un temps d'adaptation pour comprendre ces nouveaux mechanismes mais une fois que c'était compris tout a été plus fluide.

Voilà les principales erreurs qui nous ont permis de progresser:
- Dès qu'on faisait un changement dans une partie du code, il y avait des répercussions ailleurs. Au début on ne se rendait pas forcement compte que les différentes parties du codes étaient liées et que si on en changeait une il fallait changer les autres. Cela nous a appris à avoir une vision plus lobale de l'architechture du code.

- Les commandes basiques et essentielles qu'on oubliait de faire tel que "python manage.py migrate" après avoir installer cas_ng_django.

- L'implementation de JavaScript pour pouvoir ameliorer le site notamment sur la partie "Mon espace". On s'est servi de https://developer.mozilla.org/ et forums tel que Rediit pour faire cette partie. 

- Une petite erreur de syntaxe (un "s" en trop ou une virgule mal placé) peut tout bloquer. Le plus compliqué a été de differencier les noms de bibliotheques comme "serializers" et les noms de variable comme "serializer". Chercher ces petites erreurs nous a pris beaucoup temps. Quand on a commencé à verifer tout ce qu'on ecrivait à chaque fois au lieu de faire plusieurs parties d'un coup.





Etape 5: Opération CRUD, GET/POST
Questions d'analyse :

Quels sont les avantages d'utiliser ModelForm par rapport à un formulaire HTML manuel ?
Utiliser ModelForm est plus rapide et pratique car django crée automatiquement les balises <form>, <input>, <label> et si on modifie notre model le forulaire se met à jour automatiquement sans avoir à changer le HTML. C'est aussi plus securisé car il inclut automatiquement le token CSRF.

Comment Django valide-t-il les données côté serveur ?
Il valide les données en plusieurs étapes lorsqu'on envoie le formulaire form.is_valid(), il verifie  le type des champs (int, date..), les contraintes (taille par exemple), les règles du modèle et les éventuelles fonctions clean().

Que se passe-t-il si le formulaire n'est pas valide (données non conforme au type défini dans le modèle) ?
Si le fomulaire n'est pas valide alors les données ne sont pas enregistrés et un formulaire d'erreur sera renvoyer à l'utilisateur.





Etape 6 : Mise en forme, Architecture des fichiers
Questions d'analyse :

Quels sont les avantages d'utiliser un template pré-conçu par rapport à coder le HTML/CSS from scratch ?
C'est un gain de temps car la structure et le design sont déjà conçu il suffit juste de l'adapter à nos besoins et gouts. Aussi la plupart des templates gèrent déjà des frameworks comme bootstrap (notamment pour l'affichage sur mobile).

Comment Django gère-t-il les fichiers statiques en développement vs production ?
En développement django cherche lui même les fichiers dans les dossiers static/ de mon application.
En production django ne gère plus les fichiers lui même, il les regroupes et utilise un serveur externe.

Pourquoi est-il important de placer les images dans le bon dossier ?
Puur que django puisse les trouver (dans media/ ou static/) et que le projet sois mieux organisé.





Etape 8 : Compréhension de la Stack TCP/IP
Remplir le tableau comparatif :
N'ayant pas accès au réseau Eduroam, nous avons effectuer la comparaison entre un réseau Wi-Fi domestique et ethernet 

Paramètre	                            WIFI Maison	              vEthernet (WSL)
Interface	                            Wi-Fi (Realtek)           vEthernet
Adresse IP	                           192.168.1.170             172.25.192.1
Masque CIDR	                          /24                       /20
Adresse réseau		                      192.168.1.0               172.25.192.0
Adresse broadcast		                   192.168.1.255             172.25.207.255
Passerelle		                          192.108.1.254             Pas de données
Nombre d'hôtes max		                  2^(32-CIDR)-2             2^(32-CIDR)-2
                                      =254                      = 4094
Plage d'IPs	                          192.168.1.1               172.25.192.1
                                      à .254                    à 172.25.207.254





Questions pour aller plus loin :

Quel est le protocole utilisé pour que votre PC reçoive automatiquement une adresse IP ?
C'est le protocole DHCP, il permet d'attribuer des adresses IP à chaque appareils qui se connectent au reseau.

Pourquoi certains réseaux utilisent-ils un masque /19 au lieu de /24 ?
Cela permet de gérer plus d'appareils car un masque /19 a 13 bits disponibles comparé à un masque /24 qui en a 8. (2^13 > 2^8)

Quelle est la différence entre IPv4 et IPv6 ? (Vous verrez des adresses comme fe80::1/64 pour IPv6)
IPv4 utilise des adresses sur 32bits alors que IPv6 sur 128 bits ce qui offre un nombre beaucoup plus grand d'adresse. Aussi IPv4 s'écrit en décimal alors que IPv6 s'écrit en héxadecimal d'où des adresses comme celle ci fe80::1/64.

Pouvez-vous communiquer directement avec une machine sur le réseau Eduroam si vous êtes sur le réseau ethernet de la salle ? Pourquoi ?
Non pas directement car ce sont deux sous-réseaux differents. Il faudrait un routeur ou un pare-feu.





Questions :

Pourquoi le port client change-t-il à chaque connexion ?
C'est un port éphemere qui change a chaque fois pour permettre plusieurs connexion simultanement.

Que se passe-t-il si vous exécutez ssh user@ip-voisin deux fois en parallèle ? Quel port aura la deuxième connexion ?
Il y a deux connexions distinctes, le serveur est le même (22) mais les deux utilisent des ports differents.

Pourquoi le serveur SSH écoute toujours sur le port 22 pendant que la connexion utilise un autre port ?
Le serveur SSH utilise un port fixe (22) pour etre facilement trouvable, c'est un port d'écoute.

Quels sont les risques de garder le port SSH (22) ouvert et accessible depuis le réseau ? Comment peut-on sécuriser un serveur SSH ? (Indice : authentification par clés, changement du port, firewall, fail2ban...)
Les risques sont les attaques par brute force ou l'exploitation des failles de securité (notamment si pas à jour). Pour le sécuriser on peut remplacer les mots de passes par des clés SSH privées, changer de port pour éviter les robots qui ne scannent que le port 22. On peut aussi utiliser un pare feu pour autoriser seulement les adresses IP de confiances à se connecter. Ou alors un logiciel qui bloque une adresse IP automatiquement après trop d'erreur de mot de passes, cela bloquerait les attaques par brute force (fail2ban)




Questions :

Quel est la différence entre nc et ssh pour les connexions distantes ?
nc (netcat) est un outil réseau assez basique, sans chiffrement ou authentification, il est utilisé pour le debug ou envoyer/recevoir des données brut via des connexions réseau tel que TCP ou DUP.
ssh est un outil securisé pour la connexion disante car il a le chiffrement de données et l'authentification, il sert a gérer des terminaux TTY et transferer des fichiers.

Pourquoi nc ouvre-t-il automatiquement un port dynamique côté client ?
Car nc fonctionne comme n'importe quel client reseau, c'est son systeme d'exploitation qui assigne ce port automatiquement.




Questions :

Quel est l'adresse IP du serveur DNS de votre réseau local ?
 Serveurs DNS. . .  . . . . . . . . . . : 192.168.1.254
 
Est-ce que le domaine ENSEA est résolvable depuis le réseau local ou doit-on aller sur Internet ?
Le domaine ENSEA est resolvable depuis le reseau local.

Pourquoi l'ENSEA a-t-elle probablement son propre serveur DNS interne ?
Pour pouvoir gérer les appareils internes plus facilement, mais aussi pour une raison de securité certaines ressources ne sont accessibles que depuis le réseau interne et aussi pour que ça soit plus rapide et perfrormant sans internet.

Il se peut que le DNS de l'école ne réponde pas la même adresse que le DNS accessible depuis internet, pourquoi ? Quel serait l'avantage d'une différence d'adresse ?
C'est assez frequent, ca sappelle le split dns, l'avantage est que en interne la connexion est directe ce qui la rend plus rapide que si elle devait passer par internet



Exercice 2
Questions d'approfondissement :

Quelle est la différence entre /etc/hosts et un serveur DNS pour la résolution locale ?
La difference est que /etc/hosts est pas centralisé donc chaque appareil doit être configuré à la main alors que DNS est une solution reseau automatique.

Comment Django devrait-il être configuré pour accepter les requêtes de cafeteria.ensea ?
Il faut ajouter la variable "ALLOWED_HOSTS = ['127.0.0.1', 'localhost', 'cafeteria.local', 'cafeteria.ensea']" dans settings.py sinon la requête sera bloquée.



Etape 11
Questions :

Pourquoi Content-Length doit-il être exact pour POST ?
Car il indique la taille (en octets) du message qu'il va recevoir donc s'il est trop petit le message sera coupé et s'il est trop long il attendra la fin indefinimment.

Que se passe-t-il si on envoie du JSON mal formé dans le corps ?
S'il y a une erreur dans le JSON, Django ne pourra pas lire les données et affichera une erreur 400 bad request.

Django valide-t-il l'email ? Comment tester ?
Oui grace au champ EmailField. On peut tester en envoyant dans le champ email un texte qui n'est pas un mail (par exemple "djenabdrameenseafr"). L'API me renvoie une erreur m'indiquant que le format n'est pas valide.

Comment faire de l'authentification (Authorization header) ?
Pour rajouter de la sécurité on peut utiliser un authorization header pour fournir des informations d'identification permettant d'authentifier un utilisateur auprès d'un serveur, autorisant ainsi l'accès aux ressources protégées.
On utilise ces lignes de code qui envoie les identifiants encodés en base64 directement dans l'en tête de chaque requête.

Authorization: <auth-scheme> <authorization-parameters>
// Basic authentication
Authorization: Basic <credentials>





