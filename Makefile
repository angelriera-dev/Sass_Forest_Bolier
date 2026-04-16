
start:
	@docker compose --project-name django-app up -d --build  

dev:
	@if docker compose ps --status running --services | grep -q "^app$$"; then \
		echo "Development container already running."; \
	else \
		echo "Starting development containers..."; \
		docker compose --project-name django-app up -d --build;  \
	fi 
	@docker compose exec app bash

clear:
	@docker compose down

temp:
	@docker run -it --rm -v .:/app -w /app  python:slim /bin/bash -c "adduser --disabled-password --gecos '' --uid 1000 devuser && su devuser"
