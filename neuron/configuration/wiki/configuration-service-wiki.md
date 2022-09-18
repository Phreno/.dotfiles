
# Mise en place du service Neuron

: Étapes d'installation [ici](neuron)

### Préparation user unit


1. Mettre à jour neuron.service

Le fichier `~/.dotfiles/conf/systemd/user.control/neuron.service` sert à créer un service utilisateur.
```
[Unit]
Description=Neuron
[Service]
ExecStart=/usr/local/bin/neuron -d /home/<utilisateur>/neuron gen -ws localhost:4321
[Install]
WantedBy=multi-user.target
```

Remplacer `<utilisateur>` par le résultat de la commande `whoami`

TODO: faire une commande qui remplace `<utilisateur>` dans `~/.dotfiles/install`

2. Recharger le daemon

On active avec `systemctl --user enable neuron.service`

3. Lancement du service
4. Aliases



