#####
### REFERENCE: https://askubuntu.com/questions/1103860/script-to-check-if-some-program-is-already-installed
#####

#!/bin/bash

# set up file name
input="requirements.txt"

# for each requirement in the file
while IFS= read -r line; do

    # trim trailing whitespace
    requirements="${line}"

    # check if package exists and store in variable
    dpkg -s $requirements &> /dev/null

    # read from variable
    if [ $? -ne 0 ]
        then
            # do nothing
            echo "The package '$requirements' is not installed."
        else

            if [ $requirements == "fullcalendar" ]
                then
                    npm uninstall $requirements
            else
                # uninstall flow
                echo "The package '$requirements' is installed. Attempting to uninstall..."

                if [ $requirements == "nginx" ]
                    then
                        sudo apt remove $requirements nginx-common -y
                else
                    sudo apt remove $requirements -y
                fi

            fi

        sudo apt autoremove -y
    fi

done < "$input"
