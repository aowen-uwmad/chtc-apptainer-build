#!/bin/bash

container_name=${1}
staging_path="/staging/aowen4/apptainer"

echo -e "Building container ${container_name} on $(hostname).\n"

export PATH

chmod 777 ./tmp

apptainer build --bind ./tmp:/tmp ${container_name}.sif ${container_name}.def 2>&1 | tee ${container_name}.log

if [ ! -f "${container_name}.sif" ]; then
	echo -e "\nContainer build failed - see build_${container_name}.err for details."
	exit 1
else
	mv ${container_name}.sif ${staging_path}/
	touch success.txt
	echo -e "\nContainer build successful. The container has been moved to ${staging_path}/${container_name}.sif".
	exit 0
fi

