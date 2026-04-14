# -*- mode: ruby -*-
# vi: set ft=ruby :

##################################
#                                #
#        Hipervisor KVM          #
#                                #
#         HERMES 001-A           #
#              by                #
#     Vollnet Smart Business     #
#             @2026              #
##################################

# Vagrantfile Vs. 0.0.1-A - 2026/04/10 - Hipervisor KVM
#

# Para o sistema detectar dinamicamente o ID de usuário e o ID de grupo atuais da máquina host,
# geralmente usados ​​para mapear pastas compartilhadas (pastas de sincronização) e garantir que
# a máquina virtual convidada tenha as mesmas permissões de arquivo que o host definimos:
user_uid = Process.uid
user_gid = Process.gid
#
# Esses comandos evitam incompatibilidades de permissões de arquivos entre o host e a máquina
# virtual (convidado), especificamente ao usar provedores como KVM (libvirt).


# Variáveris do arquivo Vagrantfile
#
require 'yaml'
settings = YAML.load_file 'vagrant.yml'

# Definição das pastas para sincronização entre host e guest
#
host_folder = settings['sync_work']
guest_folder = settings['sync_guest']

# Garantir que a pasta vm-host exista na máquina host
#
unless File.directory?(host_folder)
  FileUtils.mkdir_p(host_folder)
  puts "Pasta '#{host_folder}' criada na máquina host."
end

# fase project definition
  fase_name = settings['fase_project']

# Configurações da vm usando o Vagrant
#
Vagrant.configure("2") do |config|
  # VBox padrão para usar com o libvirt (API de interação com vm-kvm, virsh e virt-manager)
  # 
  config.vm.box = settings['type_vbox']
  config.vm.box_version = settings['type_version']

  # Configuração SSH para o VSCode (porta fixa)
  config.vm.network "forwarded_port", guest: 22, host: 2222, id: "ssh"

  # conexão ssh para o provedor libvirt
  config.vm.provider :libvirt do |connect|
    connect.username = settings['vagrant_user']
    connect.password = settings['vagrant_pw']
  end 

  # 
  # Pasta sincronizada usando NFS (uma opção confiável para KVM/libvirt)
  # 
  # Em '/configs/sudoers' incluir as configurações abaixo:
  #   
  #   - Vagrant NFS: Permite gerenciar exportações sem senha
  #   - Permitir Vagrant gerenciar NFS sem senha
  #
  # na máquina HOST, verificar a versão atual de gcc e make.
  #
  config.vm.synced_folder host_folder, guest_folder, type: "nfs", nfs_udp: false

  # Rede privada com IP fixo, necessária para o NFS
  config.vm.network "private_network", ip: settings['ip_address']

  config.vm.provider :libvirt do |network|
    # ponte de rede virtual criada automaticamente pelo libvirt
    network.management_network_device = 'virbr0'

    # padrão aberto de drivers paravirtualizados de alto desempenho para máquinas virtuais KVM/QEMU
    network.nic_model_type = 'virtio'
  end 

  # vm timeout para o provedor libvirt, pois a inicialização pode levar 
  # mais tempo do que o padrão
  config.vm.boot_timeout = 600  

  config.vm.define fase_name do |voll|
    #################################
    #  Project Fases:               #
    #################################
    # 00 SKETCH: ............... SKE
    # 01 DEVELOPMENT: .......... DEV
    # 02 TESTING: .............. TES
    # 03 RELEASE: .............. REL
    # 04 PRE-PRODUCTION: ....... PRE
    # 05 HOMOLOGATION: ......... HOM
    # 06 PRODUCTION: ........... PRO
    # 07 MAINTENANCE: .......... MAN
    # 08 MINIMUM VIABLE PRODUCT: MVP
    # 09 ARCHIVED: ............. ARC
    ################################# 
  end

  # configuração da saida de video   
  config.vm.provider :video do |vb|
    vb.gui = true
    vb.linked_clone = false
  end

  # Configuração específica para o provedor libvirt
  config.vm.provider :libvirt do |hardware|
    hardware.driver = "kvm" 
    hardware.memory = settings['vm_memory']
    hardware.cpus = settings['vm_cpus']
    #
  end

  # Provisionamento de VMs com Ansible
  #
  config.vm.provision :shell, inline: "echo Provisionamento da vbox"
    #
    config.vm.provision "ansible" do |ansible|
      ansible.compatibility_mode = "2.0"
      ansible.playbook = settings['ansible_path']
      ansible.verbose = "v"
    end

end

# 
# $ vagrant up --provider=libvirt
#
# $ vagrant status
#
# $ vagrant ssh
#
# $ vagrant provision
#
# $ vagrant reload
#
# $ vagrant halt
#
# $ vagrant destroy -f
#

