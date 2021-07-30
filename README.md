# docker-ds

Lightweight image for running data science projects. Based, in some part, off of the [cookiecutter-docker-science repo](https://github.com/docker-science/cookiecutter-docker-science).

**Goal**

1. Improve reproducibility by creating base image
    - Base image contains the following common python packages: `sklearn`, `numpy`, `pandas`, `statsmodels`, `scipy`, `ipython`, `shap`, `beautifulsoup`, `scrapy`, `plotly`, `matplotlib`, `seaborn`
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

Docker commands can either be run directly from the command line or by using `make`. A `Makefile` provides targets that support many common Docker commands. These commands can be run by typing `make <COMMAND>`.

### Build

- `make docker-build` - build the Docker image

### Run

Running the following commands will create a Docker container from the above image. If you run `make docker-run-mount`, it mounts the project directory to `/app` of the container and therefore files can be edited directly in the host environment. The changes in the host environment are then reflected in the Docker container environment (and vice versa). 

- `make docker-run`
- `make docker-run-mount`

To launch an interactive shell from the container:

- `make docker-start`

To launch Jupyter notebook:

- `make jupyter`

To upload to Docker Hub: 

- `docker-upload`

### Edit

When we need to add libraries in `Dockerfile` or `requirements.txt` which are added to working environment in the Docker container, we need to drop the current Docker container and image, and then create them again with the latest setting. 

- `make docker-rm-container` - remove docker container
- `make docker-rm-image` - remove docker image
- `make docker-clean` - do both