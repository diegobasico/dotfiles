On a new machine, initialize chezmoi with your dotfiles repo:
$ chezmoi init https://github.com/diegobasico/dotfiles

Add files to chezmoi repo:
$ chezmoi add ~/.bashrc

Commit your changes:
$ chezmoi cd
$ git add .
$ git commit -m "Initial commit"



Check what changes that chezmoi will make to your home directory by running:
$ chezmoi diff

If you are happy with the changes that chezmoi will make then run:
$ chezmoi apply -v

On any machine, you can pull and apply the latest changes from your repo with:
$ chezmoi update -v
