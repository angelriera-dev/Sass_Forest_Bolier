

install: init

init:
	python3 -m venv .venv
	.venv/bin/pip install --upgrade pip
	.venv/bin/pip install -r requirements/local.txt

run: dev

dev:
	.venv/bin/python manage.py runserver

migrate:
	.venv/bin/python manage.py migrate


## TEST QUALITY

check:
	.venv/bin/python manage.py check

test:
	.venv/bin/pytest --cov=apps --cov-report=term-missing

lint:
	.venv/bin/ruff check .

check_types:
	.venv/bin/pyright .

check_code: lint check_types test check


# Docker

APP_NAME := app

dev_container:
	@bash -lc '\
	if docker ps --filter "name=app-app" --format "{{.Names}}" | grep -q "app-app"; then \
		echo "Development container already running."; \
	else \
		echo "Starting development containers..."; \
		docker compose -f docker-compose.yml --project-name $(APP_NAME) up -d --build; \
		sleep 2; \
	fi; \
	exec docker compose -f docker-compose.yml --project-name $(APP_NAME) exec $(APP_NAME) bash'


clear_container:
	@docker compose down &&

rm-containers:
	@ids="$(shell docker ps -aq)"; \
	if [ -n "$$ids" ]; then docker stop $$ids && docker rm $$ids; else echo "no containers"; fi


temp:
	@docker run -it --rm -v .:/app -w /app  python:slim /bin/bash -c "adduser --disabled-password --gecos '' --uid 1000 devuser && su devuser"
