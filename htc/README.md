# HTC Apptainer Build Scripts

Use these scripts to submit jobs on the HTC system that convert the Apptainer .def file into an Apptainer .sif file.

To use the `chtc-submit-apptainer-build` script, copy it to your access point with

```bash
wget https://github.com/aowen-uwmad/chtc-apptainer-build/raw/refs/heads/main/htc/chtc-submit-apptainer-build
```

Then see the help text with

```bash
chtc-submit-apptainer-build --help
```

If you encounter an error `-bash: chtc-submit-apptainer-build: command not found`, preface the command with `python`:

```bash
python chtc-submit-apptainer-build --help
```
