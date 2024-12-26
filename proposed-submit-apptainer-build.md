# Suggestions for Apptainer build submit

Example execution:

```
$ submit-apptainer-build \
	--definition=container.def \ 
    --name=container.sif \
    --path=/staging/aowen4 \
    --interactive-build=False \
    --manual-submit=False \
```

```
$ chtc-submit-apptainer-build --help

Usage: chtc-submit-apptainer-build [options] -d definition_file [additional_input_1 [additional_input_2]...]

Required:
	-d, --definition <definition_file>.def		Apptainer definition file to create Apptainer .sif image

Options:
	[additional_input_1 ...]	Additional files that must be transferred along with the .def file for the build.

	-n, --name				Name of created Apptainer image .sif file
								(default=<definition_file>.sif)
	-p, --path				If provided, will define a transfer_output_remap of the 
							.sif file to the provided destination
								(HTC default=/staging/$USER)
                                (HPC default=/home/$USER)
	-i, --interactive-build	Submit job interactively; once started, execute "run_apptainer_build.sh" script
								(default=False)
	-m, --manual-submit		Generate the necessary files to manually submit the build job.
								(default=False)
	-h, --help				Print this help message

Description:
	
	

```

