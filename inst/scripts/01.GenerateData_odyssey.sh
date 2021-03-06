#!/bin/sh

# Anatomy of a SLURM script
# http://informatics.fas.harvard.edu/anatomy-of-a-slurm-script/
# Convenient SLURM Commands
# https://rc.fas.harvard.edu/resources/documentation/convenient-slurm-commands/
# Running Jobs
# https://www.rc.fas.harvard.edu/resources/running-jobs/

# Lmod modules — introduction and instructions
# https://rc.fas.harvard.edu/resources/documentation/software-on-odyssey/intro/
# Integrating R Workflows on Odyssey
# https://rc.fas.harvard.edu/integrating-r-workflows-on-odyssey/


# Give data file names as arguments for the entire script

# Set slurm log directory (make sure ~ is expanded)
slurm_log_dir=`echo ./log_odyssey/`

# Set number of cores to use
n_cores=4

# RAM memory per core. To avoid confusion, it's best to include a size unit, one of K, M, G, T for kilobytes, megabytes, etc. So e.g. --mem-per-cpu=8G asks for 8 GB per core.
mem_per_cpu=6G

# specified in minutes. (Format is (D-)HH:MM:SS If one colon used, runtime is specified in MM:SS.)
run_time=12:00:00

# SLURM partitions
# https://rc.fas.harvard.edu/resources/running-jobs/#SLURM_partitions
partition="serial_requeue"

# email notification status
mail_type="FAIL"

# email address
email="kazukiyoshida@mail.harvard.edu"


# Define a function
RunScript() {
    # Argument 1 is R script name
    r_script=$1


    # Generate slurm log file names (remove path)
    slurm_out_txt=${r_script%\.*}.out.txt
    slurm_err_txt=${r_script%\.*}.err.txt

    # Generate script name
    script_name=${r_script%\.*}.slurm


    # This part creates the script
    # This flushes the file if it exists
    echo "#!/bin/bash" > ${script_name}

    echo "#SBATCH -n "${n_cores}" # Number of cores requested" >> ${script_name}
    echo "#SBATCH -N 1 # Ensure that all cores are on one machine" >> ${script_name}
    echo "#SBATCH -t "${run_time}" # Runtime in minutes" >> ${script_name}
    echo "#SBATCH -p "${partition}" # Partition to submit to" >> ${script_name}
    echo "#SBATCH --mem-per-cpu="${mem_per_cpu}" # real memory required per cpu" >> ${script_name}
    echo "#SBATCH -o "${slurm_log_dir}${slurm_out_txt}" # Standard out goes to this file" >> ${script_name}
    echo "#SBATCH -e "${slurm_log_dir}${slurm_err_txt}" # Standard err goes to this file" >> ${script_name}
    echo "#SBATCH --mail-type="${mail_type}" # Type of email notification: BEGIN, END, FAIL, ALL" >> ${script_name}
    echo "#SBATCH --mail-user="${email}" # Email to which notifications will be sent" >> ${script_name}

    echo "# Use new module system" >> ${script_name}
    echo "source new-modules.sh" >> ${script_name}

    echo "# Load R" >> ${script_name}
    echo "module load gcc" >> ${script_name}
    echo "module load R/3.4.2-fasrc01" >> ${script_name}

    echo "# Configure R local package directory AFTER R has been loaded" >> ${script_name}
    echo "export R_LIBS_USER=$HOME/apps/R:$R_LIBS_USER" >> ${script_name}

    echo "# Invoke simulation runner with file name" >> ${script_name}
    echo "Rscript" ${r_script} ${n_cores} >> ${script_name}

    # Show script
    echo ""
    echo "Running this script"
    cat ${script_name}
    echo ""

    # This part runs the script
    echo sbatch ${script_name}
    sbatch ${script_name}

    # This part removes the script
    echo rm ${script_name}
    rm ${script_name}
}

RunScript 01.GenerateData.R
