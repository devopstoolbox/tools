grep -R 'Ansible Role' devopstoolbox.github.io/docs \
  | awk -F'(' '{print $3}'  \
  | sed 's/)//' \
  | sed 's#https://galaxy.ansible.com/devopstoolbox.##'
