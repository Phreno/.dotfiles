
## Installation de neuron 

Suivre cette procédure d'installation
- https://neuron.zettel.page/install

copier le bin dans `/usr/local/bin`

### Préparation user unit

Le dossier `systemd` est mis à disposition dans `~/.config`
- unit: `~/.dotfiles/conf/systemd/user.control/neuron.service`

On active avec `systemctl --user enable neuron.service`

