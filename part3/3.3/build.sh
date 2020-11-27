echo "giev repo"
read repo
git clone $repo repository && cd repository
echo "Dockerhub username"
read user
echo "images name"
read imageName
docker build -t $user/$imageName .
docker push $user/$imageName