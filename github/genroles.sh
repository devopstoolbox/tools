init_role(){
  role=$1
  molecule init template \
    --url https://github.com/cmihai-ansible/cookiecutter-role.git \
    --no-input \
    --role-name ${role}
}

gen_role(){
  role=$1
  echo mkdir ${role}
}

for role in $(cat roles.md);
do
  if [ ! -d ${role} ]
  then
    init_role $role
  fi
done
