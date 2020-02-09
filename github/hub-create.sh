for role in $(ls -d */);
do
  cd $role
  hub create devopstoolbox.$(basename $PWD)
  git push -u origin master
  cd ..
done
