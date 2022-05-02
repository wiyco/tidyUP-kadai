#!/bin/bash
home_dir="kd"

echo -e "\n###########################################################################\n"
echo "A script to automatically generate the folder & change directory for tasks."
echo "* Please use at your own risk! *"
echo -e "\n###########################################################################\n"

# input a task no.
read -p "Task No.? (1,3,5...): " task_no
if [[ ! $task_no =~ ^[0-9]+$ ]]; then
    echo -e "Error: Invalid value.\n"; return 0
elif [ `expr $task_no % 2` == 0 ]; then
    echo -e "Error: Isn't odd number.\n"; return 0
else
    task_id="$(printf "%02d" $task_no)-$(printf "%02d" `expr $task_no + 1`)"
fi
# check the directory exists.
if [ -d "$home_dir/kd$task_id" ]; then
    echo -e "\n* \"kd$task_id\" folder already exists in \"$home_dir/\". *\n"
else
    mkdir "$home_dir/kd$task_id"
    echo -e "\n\"kd$task_id\" folder has been created successfully in \"$home_dir/\".\n"
fi
# cd to the target
cd "$home_dir/kd$task_id"
