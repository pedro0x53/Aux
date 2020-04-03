# Aux
## O que é?
O Aux é um organizador de mesas de trabalho, que, basicamente, cria uma lista de apps escolhidos pelo usuário e os inicia sempre que solicitados.

## Como usar

### Compilando e executando
Após fazer o download dos arquivos ou o clone do repositório, navegue pelo teminal até a pasta em que os arquivos **.swift** se encontram.

Para compilar utilize o comando:
```sh
$ swiftc aux.swift core.swift main.swift -o aux
$ ./aux
```

### Comandos

- **list**: Exibe todos os ambientes criados.
```sh
$ list
mesa1 mesa2
```

* **create**: Cria um novo ambiante.
```sh
$ create mesa1
Pages.app     Dropbox.app   Safari.app		
Firefox.app   iMovie.app    Xcode.app
Keynote.app   Spotify.app   Numbers.app

Enter the applications you want to select separated by 2 space
Ex: Spotify  Safari  Pages

$ Keynote  Pages  Safari
Trying to create mesa1 environment.
The mesa1 was created successfully.
```
Obs: entre cada app é necessário 2 espaços.

* **run**: Executa um ambiente.
```sh
$ run mesa1
Trying to run Keynote.app
Running Keynote.app
Trying to run Pages.app
Running Pages.app
Trying to run Safari.app
Running Safari.app
```



* **delete**: Exclui um ambiente.
```sh
$ delete mesa1
$ Are you sure about delete the "mesa1" environment? [y/n] y
The mesa1 environment was deleted successfully.
```


* **exit**: Finaliza a aplicação.
```sh
$ exit
Program ended with exit code: 0
```

