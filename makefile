# MIGRATE
makemigrations:
	docker-compose exec -T web python manage.py makemigrations

migrate:
	docker-compose exec -T web python manage.py migrate

# DEV
build:
	docker-compose -f docker-compose.yaml -f docker-compose.development.yaml build

up:
	docker-compose -f docker-compose.yaml -f docker-compose.development.yaml up

down:
	docker-compose -f docker-compose.yaml -f docker-compose.development.yaml down -v

# PROD
build-prod:
	docker-compose -f docker-compose.yaml -f docker-compose.production.yaml build

up-prod:
	docker-compose -f docker-compose.yaml -f docker-compose.production.yaml up -d

down-prod:
	docker-compose -f docker-compose.yaml -f docker-compose.production.yaml down
