ENV ?= development

# Common docker-compose method and arguments
COMPOSE = docker-compose -f docker-compose.yml -f docker-compose.$(ENV).yml -p acoustic-garden

# Tasks
build: ## Build containers
	$(COMPOSE) build

up: ## Start containers in background
	$(COMPOSE) up -d

down: ## Stop containers
	$(COMPOSE) down

delete: ## Stop containers, delete volumes
	$(COMPOSE) down -v

clean: ## Remove temporary files
	rm -rf .tmp

.PHONY: build up down delete clean