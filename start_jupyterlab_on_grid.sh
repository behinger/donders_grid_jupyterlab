if qstat|grep "jupyterlab.*R"
then
        echo 'job already started trying to reconnect'
else
        echo 'echo "starting new job" && bash -c ~/job_jupyterlab_grid.sh' | qsub -q interactive -l walltime=72:00:00,mem=10gb -N 'jupyterlab'
fi
# get all jobs | get dccn jobs | take most recently startes | remove the dot | get job information | get execution host | remove stuff around the hostname | remove all trailling and leading whitespace with magic awk command
servername=$(qstat | grep jupyterlab |tail -1| cut -d"." -f1 | xargs -I {} qstat -f {} | grep exec_host | cut -d"=" -f2 | sed "s/\/.*//"|awk '{$1=$1};1')
ssh -L 8999:$servername:8999 benehi@ssh.fcdonders.nl
