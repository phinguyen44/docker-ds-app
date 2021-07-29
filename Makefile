# which to run without dependencies
.PHONY: 

# variables (make)
# SQL_FILE := scripts/sql/GA_combined_hits.sql
# USERNAME := PHI_NGUYEN

# targets

## input python commands here
# get-data:
#	python scripts/python/get_data.py --filepath=$(SQL_FILE) --username=$(USERNAME)


## input Docker commands here
docker-build:
	docker build -t $(pwd):/app phinguyen44/ds-project .

docker-run:
	docker run -p 9999:8888 -v $(pwd):/app phinguyen44/ds-project

docker-run-mount:
	docker run -p 9999:8888 phinguyen44/ds-project

jupyter:
	jupyter notebook --ip='*' --port=8888 --no-browser --allow-root