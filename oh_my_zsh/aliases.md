# Aliases

Um *alias* é um atalho personalizado para um comando de terminal.

É possível criar aliases que rodam scripts:
```
alias run="bash django_configuration.sh"
```

Para abrir um repositório no Visual Studio Code e fechar o terminal:
```
alias repo="code /path/to/repo; exit"
```

Facilitar os comandos de Git:
```
alias gcm="git commit -m"
alias gs="git status"
```

# Oh My Zsh
https://ohmyz.sh/

Para atualizar o terminal com os aliases, basta editar o arquivo ```.zshrc```, acrescentando os comandos da seção anterior.
