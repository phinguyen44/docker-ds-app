# docker-ds

Lightweight image for running data science projects. Based, in some part, off of the [cookiecutter-docker-science repo](https://github.com/docker-science/cookiecutter-docker-science).

1. Create a project / team image with a base development environment (which packages, etc.)
2. Mount volume containing notebooks and data

**Goal**

1. Improve reproducibility by creating base image
2. Create optimal file and directory template
3. Allow for editing (by mounting)

## Project Structure

```
project-name
│   README.md
└───data/
└───notebooks/
└───results/
└───scripts/
```

1. **data**: contains input resources
2. **notebooks**: jupyter notebooks for EDA
3. **results**: stores results
4. **scripts**: scripts to generate models, run tests, etc.

## Usage

### Build

### Run

### Jupyter

### Edit

When we need to add libraries in `Dockerfile` or `requirements.txt` which are added to working environment in the Docker container, we need to drop the current Docker container and image, and then create them again with the latest setting. 

- `make clean-docker` - remove docker container and image
- `make docker-build` - create docker container with latest setting