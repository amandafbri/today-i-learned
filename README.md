# Hoje eu aprendi | Today I learned

Este repo contém coisas aleatórias que testei por diversão!

This repo has random stuff that I tested just for fun!

# Cola | Cheat sheet

Uma série de comandos úteis que uso ou já precisei usar na minha rotina de trabalho. 

Some useful commands that I use or had to use in my work routine.

## Docker Compose
```bash
docker-compose build && docker-compose up
```

## Git
- Processo para atualizar uma branch com o que tem em outra (Exemplo: Trazer do develop para sua branch de feature) | Process to update a branch with content from another (For example: from develop to your feature branch)
```bash
git checkout develop
git pull
git checkout feat/MyFeature
git pull
git merge develop
```
- Deleta todas as branches locais já mergeadas | Delete all local branches already merged
```bash
git branch --merged <BRANCH OF INTEREST> | grep -v '^[ *]*<BRANCH OF INTEREST>$' | xargs git branch -d
```

## Google Cloud
- Seleciona projeto no qual os comandos serão aplicados | Select the project that the commands will be applied
```bash
gcloud config set project <PROJECT>
```
- Pega credenciais de um cluster | Get credentials from a cluster
```bash
gcloud container clusters get-credentials <CLUSTER> --zone=<ZONE>
```

### Kubernetes
- Configura ferramenta de linha de comando kubectl | Configure kubectl command-line tool
```bash
    gcloud components install kubectl
    kubectl get pods --all-namespaces
    kubectl logs -f <POD>
```
- Modifica namespace | Change namespace
```bash
    kubectl config current-context
    kubectl config set-context <CURRENT CONTEXT> --namespace <NAMESPACE>
```

### Storage
-  Copia arquivos através de múltiplos processos (-m) para acelerar e ignora arquivos já copiados (-n de "noclobber") | Copy multiprocessed (-m) to accelerate and ignore files that already exist (-n from noclobber):
```bash
gsutil -m cp -n <LARGE FOLDER> gs://<BUCKET NAME>
```
- Copia arquivos baseado em uma lista
```bash
cat <FILE>.csv | gsutil -m cp -I <DESTINATION FOLDER>
```

### AI Platform
- Deploy de um modelo. Existem vários parâmetros possíveis, veja na documentação oficial. | Deploy model. There are many possible parameters, check the official documentation.
```bash
gcloud ai-platform models create <MODEL NAME>
gcloud ai-platform versions create <VERSION NAME> --origin <PATH TO MODEL FILE> --runtime-version 1.15 --framework TENSORFLOW --python-version 3.7
```

## Django

- Rodar script em cima da base de dados | Run script in the database
```bash
python manage.py shell < <SCRIPT>.py
```
- Criar app novo | Create new app
```bash
python manage.py startapp <APP>
```
- Roda servidor (não esqueça de setar suas variáveis de ambiente!) | Run server (don't forget to set your env variables!)
```bash
python manage.py runserver
```
- Criar o usuário principal | Create the main user
```bash
python manage.py createsuperuser
```

### Migrações
- Serve para todas as variações (migrate, makemigrations, etc.) | Fit for all variations (migrate, makemigrations, etc.)
```bash
python manage.py showmigrations <OPTIONAL:app name>
```
- Migra para uma migração específica (anterior) | Migrate to a specific migration (a previous one)
```bash
python manage.py migrate <app name> <migration file name>
```

## Linha de comando | Command-line

### General
- [11 comandos básicos | 11 basic commands](https://medium.com/better-programming/here-are-11-console-commands-every-developer-should-know-54e348ef22fa)
- Decodificar string que está em base64 | Decode base64 string
```bash
echo "STRING BASE 64" | base64 --decode
```
- Roda script, mantém mesmo fechando o terminal e salva logs em arquivo | Run script detached from terminal with log file
```bash
nohup python -u <SCRIPT>.py >> <FILE TO SAVE LOG>.txt 2>&1 & tail -f <FILE TO SAVE LOG>.txt
```
- Exporta/carrega variáveis de ambiente de um arquivo | Export/load environment variables from file
```bash
export $(grep -v '^#' <FILE>.env | xargs)
```

### Arquivos tabulares | Tabular files
- Mostrar algumas linhas e joga em outro arquivo| Get few lines and save them in another file
```bash
head -n <NUMBER OF LINES TO SHOW> <TABLE>.csv > <NEW TABLE>.csv
```
- Troca vírgula por tab e joga em outro arquivo| Change comma to tab and save new data in another file
```bash
sed "s/\,/\t/g" <TABLE>.csv > <NEW TABLE>.tsv
```
