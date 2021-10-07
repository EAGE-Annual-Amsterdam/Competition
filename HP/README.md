#  Horizon detection

The objective of Horizon Detection is to determine a set of distinctly visible boundaries on seismic data, that correspond to drastic changes in rock properties. In this task, we want to extend a sparse carcass of a horizon onto the whole field range.

## Data:

Participants are provided with a SEG-Y cube and a sparce labeled horizon in a CHARISMA format. The objective is to create labeling for entire field and submit produced picking in CHARISMA format for evaluation.


* Examples
	- [SEG-Y file with seismic data](./data/demo_cube.sgy)
	- [CHARISMA csv-like file with carcass labeling](./data/carcass_0.char)
	- [CHARISMA csv-like file with horizon labeling](./data/horizon_0.char). Note that the only difference of this to a carcass is in field coverage.

## Submission process:

There are two ways to participate in Competition:

### **I. Container submission**
Participants should prepare a docker image with all the necessary software and scripts required for automated first break picking, upload image to a docker registry and submit the link to the image and credentials to pull it via email: [competition@eage-annual-amsterdam.org](mailto:competition@eage-annual-amsterdam.org).

Those containers will operate on a `autotest.sgy` file, which will not be published.

See details about container submission below.

* #### Examples
	- [Dockerfile](../Dockerfile) - Dockerfile to build an example image.
	- [inference.sh](../inference.sh) - Example of the inference script.
	- [sample submission file](./data/horizon_0.char) - Example of the resulting submission.

Docker images are going to be run on a server with 64 GB of RAM, 512 GB of storage, and 1 GPU with NVIDIA driver version 470.57.

Example of container execution command:
```bash
    docker run --gpus all \
               -v $(pwd)/competition:/competition \
               -v $(pwd)/imagename_result:/result \
               %imagename%:latest
```

* #### Folder structure:
Participants should assume the following folder structure inside the container:
```
/
├───result
└───competition
    |    autotest.sgy
```

Resulting files with predicted horizons should be named `submission.csv` and placed in a subdirectory `results`:

```
/
├───result
|   |    submission.csv
└───competition
    |    autotest.sgy
```

* #### Timing

Docker container execution time will be displayed as the timing of the solution.

### **II. File submission**

Those who cannot prepare and submit a container are encouraged to apply their tools to `competition_test.sgy`, which will be available at the start of the competition. Participants should submit link to the resulting csv file with predicted horizons along with credentials needed to download it via email: [competition@eage-annual-amsterdam.org](mailto:competition@eage-annual-amsterdam.org).

Such solutions will not have an *automated* badge on leaderboard and their solutions' worktime will be measured differently.

* #### Timing

Solutions' worktime will be displayed as the time passed from the dataset publication till the file submission.


## Metric:

The metric used to score participants' submits is mean absolute difference between predictions and expert labeling for the same horizons.
