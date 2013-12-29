if [[ $UID -gt 499 && ! -e $HOME/.ssh/id_rsa ]]; then
	echo "You don't seem to have SSH keys setup"
	echo "Generating a SSH key for you now!"
	ssh-keygen -t rsa -f $HOME/.ssh/id_rsa -N ""
	cat $HOME/.ssh/id_rsa.pub >> $HOME/.ssh/authorized_keys
	chmod 600 $HOME/.ssh/*
fi
