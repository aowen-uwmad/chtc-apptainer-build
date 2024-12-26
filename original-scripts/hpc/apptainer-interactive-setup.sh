#!/bin/bash

export JOB_TMP_PATH=/local/$USER/${SLURM_JOB_ID}
export TMPDIR=$JOB_TMP_PATH/tmp
export APPTAINER_TMPDIR=$JOB_TMP_PATH/apptainer
mkdir -p $TMPDIR && chmod 777 $TMPDIR
mkdir -p $APPTAINER_TMPDIR

alias exit='/usr/bin/echo "Removing local tmp dir" && /usr/bin/rm -rf $JOB_TMP_PATH && exit'

echo '    Apptainer ready to use. Local tmp directory will be removed on exit'

