echo Hi there! My name is Helga. Would you like to commit stuff? \(y/n\)?
read reply
echo Your message was: $reply
if [ "$reply" == "y" ]; then
	echo "OK, committing to your repo"
	echo What is your commit message?
	read yourmessage2
	echo Your message was: $yourmessage2
	echo committing to your repo
	# add path to your repo below
	cd repo
	git pull
	git add .
	git commit -a -m "$yourmessage2"
	git pull
	git push
	git pull
	echo committing to your repo
elif [ "$reply" == "yes helga" ]; then
	echo "Have some bacon, committing to your repo"
	echo What is your commit message?
	read yourmessage2
	echo Your message was: $yourmessage2
	echo committing to your repo
	# add path to your repo below
	cd repo
	git pull
	git add .
	git commit -a -m "$yourmessage2"
	git pull
	git push
	git pull
	echo commit and push is complete
elif [ "$reply" == "yes" ]; then
	echo "OK, committing to your repo"
	echo What is your commit message?
	read yourmessage2
	echo Your message was: $yourmessage2
	echo committing to your repo
	# add path to your repo below
	cd repo
	git pull
	git add .
	git commit -a -m "$yourmessage2"
	git pull
	git push
	git pull
	echo commit and push is complete
else
	echo "OK, I can see you are not ready for commitment. It's cool."
fi

echo My work here is done. Enjoy the bacon.