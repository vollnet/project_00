# Problemas Resolvidos

* SSH
  
  - Ao tentar fazer a conexão SSH a partir do VSCode Remote-SSH é emitida a mensagem de que a chave-ssh foi alterada.

    Solução: 

    Recriar/Limpar o arquivo .ssh/known_hosts

&nbsp;

* NFS

  - Utilizando a estrutura de arquivos NFS, ao inicializar a VM, é solicitada a senha do usuário 
    da máquina host.

    Solução:

    Adaptar o arquivo /etc/sudoers para que o Vagrant desabilitar a solicitação de senha.
    Os novos aliases estão declarados no arquivo 'Vagrant gerenciar NFS e exportações sem senha'
    presente no diretório raiz deste projeto.

&nbsp;

* Conexão SSH com a VM não ocorre durante 'vagrant up'

  - Durante a inicialização da VM ocorreu o erro de conexão ssh com a VM, ou seja, o Vagrant não 
    consegue obter o IP da VM via libvirt. A mensagem exibida:

    'While attempting to connect with SSH, a "no route to host" (EHOSTUNREACH) error was
     received. Please verify your network settings are correct and try again'.

    DeepSeek:

    O erro EHOSTUNREACH - No route to host ao tentar se conectar via SSH em uma VM KVM gerenciada pelo Vagrant é um sinal claro de que o caminho de rede entre o seu sistema operacional host e a máquina virtual está interrompido.

    Solução:

    Após inúmeras tentativas de resolver esta falha de conexão foi visto que a declaração
    do SOP "generic/ubuntu2204" no arquivo Vagrantfile havia sido apagada acidentalmente.
    Uma vez refeita esta declaração a inicialização ocorreu sem problemas.

&nbsp;

* Imagens das VMs

  Localização das imagens das VMs: /var/lib/libvirt/images. Foi apagada uma imagem (Generic)deste path cuja finalidade era controlar os metadados de outras imagens.  

  Solução:

  Foi recriada outra vm a partir de outro diretório de trabalho.

  [ Nunca apagar imagens desse diretório! ]

&nbsp;

* Firewall 443 

  Ao executar 'vagrant up' o módulo de Python não encontrava os endereços alvos para a 
  sua instalação. 

  Solução:

  Permitir (allow) o uso da porta 443 através do firewall da máquina host.

  ** É possível que esta situação passou a acontecer depois de fazer testes de
     captura de IP através do playbook (main.yml) via SSH. 

&nbsp;

