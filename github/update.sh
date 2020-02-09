#mydir=$1
#find ${mydir} -type f -exec sed -i 's#devopstoolbox.#devopstoolbox.#g' {} \;
for role in $(ls -d */);
do
  cd $role
  git add .
  git commit -m 'Move from devops-toolbox to devopstoolbox'
  git push -u origin master
  cd ..
done
