for role in $(cat roles.md);
do
  if [ ! -d ${role} ]
  then
    hub clone devopstoolbox/${role}
  fi
done
