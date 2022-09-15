
## Configuration de awesome

https://pavelmakhov.com/awesome-wm-widgets/


## Dépendances

- lolcat
- fortune ubuntu / fortune-mod arch





## Installation de neuron 

Suivre cette procédure d'installation
- https://neuron.zettel.page/install

copier le bin dans `/usr/local/bin`

### Préparation user unit

Le dossier `systemd` est mis à disposition dans `~/.config`
- unit: `~/.dotfiles/conf/systemd/user.control/neuron.service`

On active avec `systemctl --user enable neuron.service`

