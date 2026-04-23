

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


# TEST QUALITY

check:
	.venv/bin/python manage.py check

pytest:
	.venv/bin/pytest --cov=apps --cov-report=term-missing

test:
	.venv/bin/python manage.py test

lint:
	.venv/bin/ruff check .

check_types:
	.venv/bin/pyright .

security_scan:
	@echo "Running Bandit (Security Linter)..."
	.venv/bin/bandit -r apps/ config/
	@echo "Running Semgrep (OWASP Scans)..."
	.venv/bin/semgrep scan --config auto

clean:
	find . -type d -name "__pycache__" -exec rm -rf {} +
	rm -rf .pytest_cache .ruff_cache .temp_venv .coverage

check_code: check lint check_types security_scan pytest


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
