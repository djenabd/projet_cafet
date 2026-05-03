Rapport du projet 

Difficultés rencontrées 
Le début était assez compliqué et long mais une fois que c'était compris tout est allée plus vite.

Voilà les erreurs "basiques" avec lesquelles on a le plus appris
- Dès qu'on faisait un changement dans une partie du code, ça "cassait" d'autres parties. Au début on ne se rendait pas forcement compte que les différentes parties du codes étaient liées et que si on en changeait une il fallait changer les autres.

- Les commandes basiques qu'on oubliait de faire tel que "python manage.py migrate" après avoir installer cas_ng_django, 

- L'implementation de JavaScript pour pouvoir ameliorer le site notamment sur la partie "Mon espace". On s'est servi de forum internet tel que Reddit ou de vidéos youtube pour faire cette partie. 

- Une petite erreur de frappe (un s en trop ou une virgule mal placé par exemple) empeche le code de fonctionner et le chercher partout nous a pris beaucoup temps. Quand on a commencé à veririfer tout ce qu'on ecrivait à chaque fois au lieu de faire 6 choses en même temps on avait plus ce problème.









Etape 8 : Compréhension de la Stack TCP/IP

Remplir le tableau comparatif :



Questions pour aller plus loin :

Quel est le protocole utilisé pour que votre PC reçoive automatiquement une adresse IP ?
C'est le protocole DHCP, il permet d'attribuer des adresses IP à chaque appareils qui se connectent au reseau.

Pourquoi certains réseaux utilisent-ils un masque /19 au lieu de /24 ?
Cela permet de gérer plus d'appareils car un masque /19 a 13 bits disponibles comparé à un masque /24 qui en a 8. (2^13 > 2^8)

Quelle est la différence entre IPv4 et IPv6 ? (Vous verrez des adresses comme fe80::1/64 pour IPv6)
IPv4 utilise des adresses sur 32bits alors que IPv6 sur 128 bits ce qui offre un nombre beaucoup plus grand d'adresse. Aussi IPv4 s'ecrit en décimal alors que IPv6 s'écrit en héxadecimal d'où des adresses comme celle ci fe80::1/64.

Pouvez-vous communiquer directement avec une machine sur le réseau Eduroam si vous êtes sur le réseau ethernet de la salle ? Pourquoi ?
Non pas directement car ce sont deux sous-réseaux differents. Il faudrait un routeur ou un pare-feu.





Questions :

Pourquoi le port client change-t-il à chaque connexion ?
C'est un port ephemere qui change a chaque fois pour permettre plusieurs connexion simultanement.

Que se passe-t-il si vous exécutez ssh user@ip-voisin deux fois en parallèle ? Quel port aura la deuxième connexion ?
Il y a deux connexions distinctes, le serveur est le meme (22) mais les deux utilise des ports differents.

Pourquoi le serveur SSH écoute toujours sur le port 22 pendant que la connexion utilise un autre port ?
Le serveur SSH utilise un port fixe 22 pour etre facilement trouvable, c'est un port d'ecoute.

Quels sont les risques de garder le port SSH (22) ouvert et accessible depuis le réseau ? Comment peut-on sécuriser un serveur SSH ? (Indice : authentification par clés, changement du port, firewall, fail2ban...)
Les risques sont les attaques par brute force ou l'exploitation des failles de securité (notamment si pas à jour). Pour le sécuriser on peut remplacer les mots de passes par des clés SSH privées, changer de port pour éviter les robots qui ne scannent que le port 22. On peut aussi utiliser un pare feu pour autoriser seulemtn que les adresses IP de confiance a se connecter ou un logiciel qui bloque une adresse IP automatiquement apres trop d'erreur de mot de passes, cela bloquerait les attaques par brute force (fail2ban)




Questions :

Quel est la différence entre nc et ssh pour les connexions distantes ?
nc (netcat) est un outil reseau assez basique, sans chiffrement ou authentification, il est utilisé pour le debug ou envoyer/recevoir des données brut via des connexions reseau tel que TCP ou DUP.
ssh est un outil securise pour la connexion disante car il a le chiffremetnt de donnes et l'authentification, il sert a gere des terminaux TTY et transfere des fichiers 

Pourquoi nc ouvre-t-il automatiquement un port dynamique côté client ?
Car nc fonctionne comme n'importe quel client reseau, cest son systeme d'exploitation qui assigne ce port automatiquement.





Questions :

Quel est l'adresse IP du serveur DNS de votre réseau local ?
 Serveurs DNS. . .  . . . . . . . . . . : 192.168.1.254
 
Est-ce que le domaine ENSEA est résolvable depuis le réseau local ou doit-on aller sur Internet ?
Le domaine ENSEA est resolvable depuis le reseau local, 

Pourquoi l'ENSEA a-t-elle probablement son propre serveur DNS interne ?
Pour pouvoir gerer les appareils internes plus facilement, pour une raison e securite aussi certaines ressources ne sont accessibles que depuis le reseau interne et aussi pour que ca soit plus rapide et perfrormant sans internet

Il se peut que le DNS de l'école ne réponde pas la même adresse que le DNS accessible depuis internet, pourquoi ? Quel serait l'avantage d'une différence d'adresse ?
C'est assez frequent, ca sappelle le split dns, l'avantage est que en interne la connexion est directe ce qui la rend plus rapide que si elle devait passer par internet



Exercice 2
Questions d'approfondissement :

Quelle est la différence entre /etc/hosts et un serveur DNS pour la résolution locale ?
La difference est que /etc/hosts est pas centralisé donc chaque appareil doit etre configure a la main alors que DNS est une solution reseau automatique.

Comment Django devrait-il être configuré pour accepter les requêtes de cafeteria.ensea ?
Il faut ajouter la variable "ALLOWED_HOSTS = ['127.0.0.1', 'localhost', 'cafeteria.local', 'cafeteria.ensea']" dans settings.py parce que sinon la requete sera bloquée
