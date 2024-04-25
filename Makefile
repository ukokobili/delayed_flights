####################################################################################################################
# Build docker image

docker-up:
	docker compose up --build -d

extract:
	docker compose run flights ./scripts/extract.sh

load: 
	docker compose run flights python ./scripts/load.py

###################################################################################################################
# Debuf and run dbt models

dbt-debug:
	docker compose run flights dbt debug

dbt-deps:
	docker compose run flights dbt deps

dbt-compile:
	docker compose run flights dbt compile
	
dbt-run:
	docker compose run flights dbt run

dbt-test:
	docker compose run flights dbt test

dbt-docs:
	docker compose run flights dbt docs generate 

dbt-build:
	docker compose run flights dbt build

####################################################################################################################
# Auto formatting, hecks, & Lint checks

sqlfmt:
	docker compose run flights ./models

format:
	docker compose run flights python -m black -S --line-length 79 .

lint: 
	docker compose run flights flake8 ./scripts/load.py

ci: docker-up dbt-deps sqlfmt dbt-compile dbt-run dbt-test dbt-docs 

