# [simple-taiko-node](https://taiko.xyz/docs/guides/run-a-taiko-node)

Voici un guide pour démarrer un nœud RPC Taiko à l'aide de [simple-taiko-node](https://github.com/taikoxyz/simple-taiko-node).

## Prérequis

[Docker](https://docs.docker.com/engine/install/) est installé et en cours d'exécution.

[Git](https://github.com/git-guides/install-git/) est installé.

Si vous utilisez Windows, vous devriez installer [Git BASH](https://gitforwindows.org/) ou [WSL](https://learn.microsoft.com/en-us/windows/wsl/install) pour utiliser comme terminal.

Respectez [les exigences matérielles minimales de Geth](https://github.com/ethereum/go-ethereum#hardware-requirements), sauf l'exigence de stockage, car les nœuds Taiko nécessiteront moins de stockage. 

À partir du 18 septembre 2023, un nœud utilise moins de 10 Go. 100 Go devraient être suffisants pour l'avenir si vous prévoyez de faire fonctionner votre nœud pendant un certain temps.

## Étapes

### Cloner simple-taiko-node

```bash
git clone https://github.com/taikoxyz/simple-taiko-node.git
cd simple-taiko-node
```

### Copier les fichiers .env d'exemple

```bash
cp .env.sample .env
```

### Configurer les valeurs requises dans le fichier .env

Tout d'abord, ouvrez le fichier .env dans votre éditeur de texte préféré :

```bash
nano .env
```

Ensuite, vous allez définir les points de terminaison du nœud d'archive L1.

Vous pouvez utiliser n'importe quel point de terminaison L1 de Sepolia, mais il doit pointer vers un nœud d'archive pour accéder à la trie d'état au-delà des 128 derniers blocs.

Il est recommandé de suivre le guide Local ci-dessous, sinon vous devrez peut-être utiliser un compte payant pour un fournisseur RPC de Sepolia. Alchemy et Infura fonctionneront temporairement, mais limiteront éventuellement les demandes pour un compte gratuit, et votre nœud cessera de se synchroniser.

Si vous rencontrez des problèmes de limitation de taux, de nombreux membres de la communauté ont réussi en changeant le point de terminaison HTTPS en https://rpc.sepolia.org.

Si vous exécutez un nœud Sepolia local, vous ne pouvez pas référencer les points de terminaison L1 en tant que http://127.0.0.1:8545 et ws://127.0.0.1:8546 car cela est local à l'intérieur de l'image Docker simple-taiko-node. En fonction de votre configuration de pare-feu, vous pouvez faire quelques choses. Vous pouvez essayer :

Utiliser host.docker.internal (voir : stack overflow)

Utiliser l'adresse IP privée de votre machine (utilisez quelque chose comme ip addr show pour obtenir cette adresse IP)

Enfin, définissez les points de terminaison L1 suivants dans votre fichier .env :
```bash
L1_ENDPOINT_HTTP
L1_ENDPOINT_WS
```

Consultez les commentaires au-dessus de ces valeurs dans le fichier .env.sample pour savoir comment les configurer.

### Démarrer un nœud
Assurez-vous que Docker est en cours d'exécution, puis exécutez la commande suivante pour démarrer le nœud :
```bash
docker compose up -d
```

Remarque : Vous devrez peut-être utiliser sudo docker compose up -d si vous n'êtes pas dans le groupe docker.

Si vous avez exécuté précédemment un nœud de testnet, assurez-vous d'abord d'exécuter docker compose down -v pour supprimer les anciens volumes.

### Vérifier que le nœud est en cours d'exécution

#### Option 1 : Vérifier avec le tableau de bord du nœud

Un tableau de bord du nœud sera en cours d'exécution en localhost sur le PORT_GRAFANA que vous avez défini dans votre fichier .env, qui par défaut est 3001 : http://localhost:3001/d/L2ExecutionEngine/l2-execution-engine-overview.

Vous pouvez vérifier que votre nœud est en train de se synchroniser en vérifiant que le dernier bloc (chain head) sur le tableau de bord (voir ci-dessus) augmente. Une fois que le dernier bloc correspond à celui de l'explorateur de blocs, vous êtes entièrement synchronisé.

![image](https://github.com/taikoxyz/simple-taiko-node/assets/110025570/7c299785-584a-4eaa-998e-e166d62dc196)

#### Option 2 : Vérifier avec des commandes curl

### Vérifiez si le client de la couche d'exécution est connecté à Taiko L2 :

```bash
curl http://localhost:8547 \
  -X POST \
  -H "Content-Type: application/json" \
  --data '{"method":"eth_chainId","params":[],"id":1,"jsonrpc":"2.0"}'
```

Ce qui devrait renvoyer le chainId comme 0x28c5f (167007) :

```json
{ "jsonrpc": "2.0", "id": 1, "result": "0x28c5f" }
```

Vérifiez si le client de la couche d'exécution est synchronisé en demandant le dernier bloc Taiko L2 / L3 au client de la couche d'exécution :

```bash
curl http://localhost:8547 \
  -X POST \
  -H "Content-Type: application/json" \
  --data '{"method":"eth_blockNumber","params":[],"id":1,"jsonrpc":"2.0"}'
```

Si la valeur de réponse de blockNumber est 0 ou ne croît pas, vérifiez les journaux Taiko L2 ici :

```bash
docker compose logs -f
```

Remarque : Vous devrez peut-être utiliser sudo docker compose logs -f si vous n'êtes pas dans le groupe docker.

### Fonctionnement du nœud

Vous pouvez trouver toutes les opérations du nœud (par ex. arrêter le nœud, mettre à jour le nœud, supprimer le nœud, afficher les journaux) dans [le manuel de l'exécuteur de nœud](https://taiko.xyz/docs/manuals/node-runner-manual).

### Vidéos

[Exécuter un nœud Taiko L2 (YouTube)](https://www.youtube.com/watch?v=l_tVvDcuK5o) (obsolète, mais toujours utile)

### Dépannage

Consultez [la référence de dépannage du nœud](https://taiko.xyz/docs/reference/node-troubleshooting) pour obtenir de l'aide sur les codes d'erreur / problèmes courants.

Consultez les journaux du nœud (voir toutes les commandes de journal dans le [manuel de l'exécuteur de nœud](https://taiko.xyz/docs/manuals/node-runner-manual)).
