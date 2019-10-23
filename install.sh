# loop through .sh files in ./install and execute them
for file in ./install/*.sh; do
  bash "$file" -H 
done
