
VENV := .venv
PYTHON := $(VENV)/bin/python
PIP := $(VENV)/bin/pip
PYTEST := $(VENV)/bin/pytest
RUFF := $(VENV)/bin/ruff
PYRIGHT := $(VENV)/bin/pyright
BANDIT := $(VENV)/bin/bandit
SEMGREP := $(VENV)/bin/semgrep

# Enfoque: Todos los comandos se ejecutan desde la raíz, apuntando a src/
SRC_DIR := src

install: init

init:
	python3 -m venv $(VENV)
	$(PIP) install --upgrade pip
	$(PIP) install -r $(SRC_DIR)/requirements/local.txt

run: dev

dev:
	$(PYTHON) $(SRC_DIR)/manage.py runserver

migrate:
	$(PYTHON) $(SRC_DIR)/manage.py migrate

# TEST QUALITY

check:
	$(PYTHON) $(SRC_DIR)/manage.py check

pytest:
	$(PYTEST) --cov=$(SRC_DIR)/apps --cov-report=term-missing

django-test:
	$(PYTHON) $(SRC_DIR)/manage.py test

lint:
	$(RUFF) check $(SRC_DIR)

check_types:
	$(PYRIGHT) $(SRC_DIR)

security_scan:
	@echo "Running Bandit (Security Linter)..."
	$(BANDIT) -r $(SRC_DIR)/apps/ $(SRC_DIR)/config/
	@echo "Running Semgrep (OWASP Scans)..."
	$(SEMGREP) scan --config auto $(SRC_DIR)

clean:
	find . -type d -name "__pycache__" -exec rm -rf {} +
	rm -rf **/.pytest_cache **/.ruff_cache **/.temp_venv **/.coverage

check_code: check lint check_types security_scan pytest

# Docker (Ajustado para buscar el Dockerfile en la raíz o donde esté)
APP_NAME := app


## No refactorizar!
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
	@docker compose down

rm-containers:
	@ids="$(shell docker ps -aq)"; \
	if [ -n "$$ids" ]; then docker stop $$ids && docker rm $$ids; else echo "no containers"; fi


temp:
	@docker run -it --rm -v .:/app -w /app  python:slim /bin/bash -c "adduser --disabled-password --gecos '' --uid 1000 devuser && su devuser"
