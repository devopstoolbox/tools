#mydir=$1
#find ${mydir} -type f -exec sed -i 's#devopstoolbox.#devopstoolbox.#g' {} \;
for role in $(ls -d */);
do
  cd $role
  git init
  git add .
  git commit -m "DevOps Toolbox - ${role} Role"
  cd ..
done
