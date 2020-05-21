build:
	docker-compose build

up:
	docker-compose up -d

frontend-dev:
	cd exampleproject/frontend; npm run dev

migrate:
	docker-compose exec django python manage.py migrate

make-migrations:
	docker-compose exec django python manage.py makemigrations
