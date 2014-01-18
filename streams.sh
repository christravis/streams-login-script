if [[ $UID -gt 499 && -e /etc/alternatives/infosphere-streams-3/bin/streamsprofile.sh ]]; then
	source /etc/alternatives/infosphere-streams-3/bin/streamsprofile.sh

	if [ -e /etc/alternatives/infosphere-streams-3/java/bin/java ]; then
		export JAVA_HOME=/etc/alternatives/infosphere-streams-3/java
		export PATH=$JAVA_HOME/bin:$PATH
	fi

	if [ ! -e $HOME/.streams/key/$USER.pem ]; then
		echo "You don't seem to have a Streams key! :("
		echo "I'm going to try and create one for you!"
		streamtool genkey
		if [ -e $HOME/.streams/key/$USER.pem ]; then
			STREAMS_KEY=`cat $HOME/.streams/key/$USER.pem`
			echo -e "`date`\n\nJust created Streams key for $USER on $HOSTNAME\n\n\n$STREAMS_KEY" | mail \
				-s "New Streams Developer" \
				-r server@domain.co.uk \
				root@domain.co.uk
			echo "$STREAMS_KEY" > /tmp/$USER.pem
			chmod 644 /tmp/$USER.pem
		else
			echo "Something went wrong creating your Streams Key :'("
		fi
	fi
fi
