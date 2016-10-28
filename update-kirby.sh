#/bin/bash

PATH_SCRIPT=$(pwd)

if ls $(dirname $0)/update-kirby.d/*.config 1> /dev/null 2>&1; then

	for f in $(dirname $0)/update-kirby.d/*.config
	   do
	   		source $f
	   		cd $PATH_LOCAL
				git submodule foreach --recursive git checkout master
				git submodule foreach --recursive git pull
				git add kirby
				if [ -d "$PATH_LOCAL"panel ]; then
					git add panel
				fi
				git commit -m "Update kirby"
	   		open $URL_LOCAL
	   		read -p 'Everything okay with the local version? [Enter]'
	   		rsync --delete -avze ssh ${PATH_LOCAL}kirby/ ${SSH_NAME}:${PATH_REMOTE}kirby
	   		if [ -d "$PATH_LOCAL"panel ]; then
	   			rsync --delete -avze ssh ${PATH_LOCAL}panel/ ${SSH_NAME}:${PATH_REMOTE}panel
	   		fi
	   		open $URL_REMOTE
	   		cd $PATH_SCRIPT
	   		read -p 'Great? Okay next site. [Enter]'
	   done
else
	echo "There does not seem to be any config file available in $(dirname $0)/update-kirby.d/." ; exit 1;
fi
