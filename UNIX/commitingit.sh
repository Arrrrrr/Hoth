echo Hi! I am your buddy Spuddy, wanna commit stuff?
read uhyeah
echo Sweet! What is your commit message?
read tacos
echo Your message was: $tacos


cd directory
git add .
git commit -a -m "$tacos"
git push
git pull

cd ..