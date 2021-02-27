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

### Migrações | Migrations
- Serve para todas as variações (migrate, makemigrations, etc.) | Fit for all variations (migrate, makemigrations, etc.)
```bash
python manage.py showmigrations <OPTIONAL:app name>
```
- Migra para uma migração específica (anterior) | Migrate to a specific migration (a previous one)
```bash
python manage.py migrate <app name> <migration file name>
```

## Ambientes virtuais | Virtual environments
Se o seu Python padrão for de uma versão (3.8), mas precisa instalar outra (3.7) para um determinado projeto | If your default Python has a specific version (3.8), but you need to install another (3.7) for a project
- Instale a versão desejada | Install the desired version
```bash
sudo add-apt-repository -y ppa:deadsnakes/ppa 
sudo apt-get update
sudo apt-get install -y python3.7
```
- Crie o ambiente com tal versão | Create the environment with that version
```bash
sudo apt-get install -y python3.7-venv
python3.7 -m venv .env
source .env/bin/activate
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
- Transfere arquivos entre local e remoto | Transfer files between local and remote
```
bash
rsync -a -r --progress /local/path/ [remote user]@[remote]:/remote/path/
```

### SED (Stream Editor)
- Encontra padrão no arquivo e substitui por outro, jogando para outro arquivo | Find pattern in the file and replace it by another, saving in a new file
```bash
sed 's/<PATTERN>/<NEW PATTERN>/g' <FILE WITH PATTERN>.txt > <FILE TO SAVE>.txt
```
- Substitui aspas duplas por simples | Replace double quotes by single
```bash
sed "s/\"/'/g"
```
- Substitui apenas a primeira ocorrência do padrão | Replace only first ocurrence of pattern
```bash
sed 's/<PATTERN>/<NEW PATTERN>/'
```
- Compara sem ser sensível a letras maiúsculas/minísculas | Compare being case insensitively
```bash
sed 's/<PATTERN>/<NEW PATTERN>/gi'
```
- Faz a substituição para intervalo específico de linhas | Substitute only in specific lines by interval
```bash
sed '2,4 s/<PATTERN>/<NEW PATTERN>/g'
```
- Faz operações a partir de uma linha até o final do arquivo | Substitute from specific line until the end of file
```bash
sed '2,$ s/<PATTERN>/<NEW PATTERN>/g'
```
- Especifica várias expressões | Specify several expressions
```bash
sed -r -e 's/<PATTERN 1>/<NEW PATTERN 1>/g' -e 's/<PATTERN 2>/<NEW PATTERN 2>/g'
```       
- Mostrar algumas linhas e joga em outro arquivo | Get few lines and save them in another file
```bash
head -n <NUMBER OF LINES TO SHOW> <TABLE>.csv > <NEW TABLE>.csv
```
- Troca vírgula por tab e joga em outro arquivo | Change comma to tab and save new data in another file
```bash
sed "s/\,/\t/g" <TABLE>.csv > <NEW TABLE>.tsv
```
- Remove intervalo específico de linhas | Remove specific lines by interval
```bash
sed '2,4d'
```
- Mostra apenas intervalo de linhas específicas | See only specific lines by interval
```bash
sed -n '2,4p'
```
- Deleta linhas de acordo com padrão | Delete lines by pattern
```bash
sed -r '/<PATTERN>/d'
```
- Filtra linhas de acordo com padrão | Filter lines by pattern
```bash
sed -r -n '/<PATTERN>/p'
```

### AWK
- Compara dois arquivos e elimina entradas da coluna 1 do "FILE 2" que já existem na coluna 1 do "FILE 1" | Compare the two files and eliminate the entries from column 1 "FILE 2" that already have in column 1 "FILE 1"
```bash
awk 'FNR==NR{a[$1];next};!($1 in a)' <FILE 1>.tsv <FILE 2>.tsv
```
- Mostra o que os arquivos têm em comum | Shows what the files have in common
```bash
awk 'NR==FNR{c[$1]++;next};c[$8] > 0' png_abnormals.tsv meta.tsv > testando
```
- Adiciona coluna e cria novo arquivo | Add column and create another file
```bash
awk '{printf "%s,%s\n", NR-1,$0}' <FILE>.csv > <NEW FILE>.csv
```
- Remove todas as linhas que apareciam a expressão "...resumo...RESUMO..." na coluna 13 de um arquivo separado por tab | Remove all lines with pattern "...resumo...RESUMO..." in column 13 of a tab separated file
```bash
awk -F "\t" '$13 !~ /.*(Resumo)|(RESUMO).*/' <FILE>.tsv > <NEW FILE>.tsv
```

### GREP  (Globally search for a Regular Expression and Print matching lines or "g/re/p")
- Encontra o que está faltando no arquivo 2 a partir do arquivo 1 | Find what is missing in file 2 from file 1
```bash
grep -xvFf <FILE 1>.txt <FILE 2>.txt
```

## Expressões regulares | Regular expressions (RegEx)
- Remove vírgulas extras | Remove extra commas
```
"^,+|,+$|+(,\w)"
```
