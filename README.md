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

- **list**: Exibe todos os ambientes criados e seu respectivos apps.
```sh
Aux $ list
Environment: env1
Apps: 
	Spotify
	Firefox
	Sublime Text



Environment: env2
Apps: 
	Notes
	Calculator
```

* **create**: Cria um novo ambiante.
```sh
Aux $ create env1
Pages     Dropbox   Safari
Firefox   iMovie    Xcode
Keynote   Spotify   Numbers


Enter the applications you want to select separated by 2 space
Ex: Spotify  Safari  Pages

Aux $ Keynote  Pages  Safari
Trying to create env1 environment.
The env1 was created successfully.
```
Obs: entre cada app é necessário 2 espaços.

* **run**: Executa um ambiente.
```sh
Aux $ run env1
Trying to run Keynote.app
Running Keynote.app
Trying to run Pages.app
Running Pages.app
Trying to run Safari.app
Running Safari.app
```



* **delete**: Exclui um ambiente.
```sh
Aux $ delete env1
$ Are you sure about delete the "env1" environment? [y/n] y
The env1 environment was deleted successfully.
```


* **exit**: Finaliza a aplicação.
```sh
Aux $ exit
Program ended with exit code: 0
```

* **help**: Exibe comandos válidos do sistema.
```sh
Aux $ help

COMMANDS

list: Displays all created environments.
create _envName_: Try to crete a new environment.
run _envName_: Try to run an evironment.
delete _envName_: Delete an environment.
exit: Terminate the application.
help: Displays valid commands.

You must replace _envName_ with the name of the environment.
```

