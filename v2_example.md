# v2 Example

This is an experiment to abstract the container components even further away from the user.

Documenting the manual steps for now.

## Experiment

1. Login to the access point.
1. Submit a build job.
	
	```{text title="build.sub"}
	job_name = build

	# universe = vanilla
	log = $(job_name).log
	#container_image = file:///staging/aowen4/apptainer/ubuntu22.04.sif

	# transfer_input_files = $(job_name).sh

	#executable = $(job_name).sh
	output = $(job_name).out
	error = $(job_name).err

	+IsBuildJob = True

	#chtc_want_el8 = true
	#requirements = Machine == "build4002.chtc.wisc.edu"

	request_cpus = 4
	request_memory = 32GB
	request_disk = 60GB

	queue
	```

1. Submit interactive job

	```bash
	condor_submit -i build.sub
	```

1. Define variable data

	```bash
	export NEW_CONTAINER_NAME="build.2.0_v1"
	export BASE_CONTAINER_IMAGE="docker://ubuntu:24.04"
	```

1. Create a local sandbox copy of the base image

	```bash
	apptainer build --sandbox local_sandbox $BASE_CONTAINER_IMAGE
	```
	
	* variation: 
		* Then make a copy with the final name:
		    
			```bash
			cp -R local_sandbox $NEW_CONTAINER_NAME
			```

1. Launch writable container

	```bash
	apptainer shell --fakeroot --containall --writable local_sandbox/
	```

	* variation:
		* Launch using the sandbox with the new name:

			```bash
			apptainer shell --fakeroot --containall --writable $NEW_CONTAINER_NAME
			```

1. Run installation commands

	```bash
	chmod 777 /tmp  # required for ubuntu :eye-roll:
	apt update -y
	apt install -y bat
	```

1. Test the new package while still inside of the container.

	```bash
	batcat --help | batcat
	```

1. Exit container

	```bash
	exit
	```

1. Launch without fakeroot, contain, writable

	```bash
	apptainer shell local_sandbox
	```

	* variation:
		* Launch using the sandbox with the new name:

			```bash
			apptainer shell $NEW_CONTAINER_NAME
			```

1. Test new package

	```bash
	batcat --help | batcat
	```

	Success! Now exit

	```bash
	exit
	```

1. Create container image

	```bash
	apptainer build --fakeroot "${NEW_CONTAINER_NAME}.sif" ./local_sandbox
	```

	* variation:
		* TBD - somehow diff the two directories, then use that information to do **something**.

			```bash
			TBD
			```

	Et voila!

