# NinjaFlix

Projeto referente ao curso do Q.A Ninja. Automação de testes em software que simula a administração e gerenciamento de filmes da empresa Netflix. Para acesso-lo terá que utilizar o Docker para subir os containers de API's e banco de dados.

#Criando Redes

docker network rm skynet

docker network create --driver bridge skynet

#Subindo API's

docker pull papitoio/nflix-api-users

docker pull papitoio/nflix-api-movies

docker pull papitoio/nflix-api-gateway

docker run --name nflix-api-users --network=skynet -e "DATABASE=pgdb" -p 3001:3001 -d papitoio/nflix-api-users

docker run --name nflix-api-movies --network=skynet -e "DATABASE=pgdb" -p 3002:3002 -d papitoio/nflix-api-movies

docker run --name nflix-api-gateway --network=skynet -e "API_USERS=http://nflix-api-users:3001" -e "API_MOVIES=http://nflix-api-movies:3002" -p 3000:3000 -d papitoio/nflix-api-gateway

#Subindo Banco de Dados

docker pull postgres

docker pull dpage/pgadmin4

docker run --name pgdb --network=skynet -e "POSTGRES_PASSWORD=qaninja" -p 5432:5432 -v var/lib/postgresql/data -d postgresdocker run --name pgadmin --network=skynet -p 15432:80 -e "PGADMIN_DEFAULT_EMAIL=root@qaninja.io" -e "PGADMIN_DEFAULT_PASSWORD=qaninja" -d dpage/pgadmin4

#Subindo WebApps

docker pull papitoio/nflix-web

docker run --name nflix-web --network=skynet -e "VUE_APP_API=http://nflix-api-gateway:3000" -p 8000:8000 -d papitoio/nflix-web2
