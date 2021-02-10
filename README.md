<h1 align="center">
    Enviroment Configuration Playbook
</h1>

<h2 align="center">
    Quick config playbook (Compiled by Hugo Pfeffer)
</h2>

<p align="center">
    <img alt="Made By" src="https://img.shields.io/badge/Made%20By-Hugo%20Pfeffer-red">
    <img alt="Top Languages" src="https://img.shields.io/github/languages/top/HugoPfeffer/env-config-playbook">
    <img alt="License" src="https://img.shields.io/github/license/HugoPfeffer/env-config-playbook">
</p>

</br>
</br>
<h2> About the project </h2>

Repo created to assist me config my VMs and enviroments quicker after a clean OS install. My future goals for this repo is to add more and more customizations, tool installation, etc with some controlability by removing or adding roles to the plabook. 

</br>
<h2>Requirements</h2>
<ul>
    <li>Vagrant</li>
    <ul>
      <li>Used to provision the Ansible master</li>
    </ul>
    <li>Ansible</li>
    <!-- <li></li> -->
</ul>
</br>
</br>


<h2>Installation</h2>
</br>


Install vagrant, go to the project folder and run:
```sh
vagrant up && vagrant ssh
```

The ansible playbook should be executed on the box start, if not, run the playbook manually with the `ansible-playbook` command. 


<br>
<br>

<h2>Bugs</h2>

* At the installation of the Epel repo, it might fail with a GPG check. A workaround for that is to disable the GPG check with:
  ```yml
  - name: 'Adiciona Epel-release'
  dnf: 
    disable_gpg_check: yes
    name: 'https://dl.fedoraproject.org/pub/epel/epel-release-latest-8.noarch.rpm'
    state: present
  become: yes
  ```

  Or add the GPG signature manually: 
  ```yml
  - rpm_key:
    state: present
    key: https://dl.fedoraproject.org/pub/epel/RPM-GPG-KEY-EPEL-8
  ```

Some other packages might need a GPG signature, like Minikube. 


</br>











