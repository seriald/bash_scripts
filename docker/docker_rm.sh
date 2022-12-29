sudo docker ps
read = container
echo ""
echo "Closing $container"
sudo docker container stop $container
echo ""
echo "Deleting Container $container"
sudo docker container rm $container"
