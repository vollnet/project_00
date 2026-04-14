# <p style="color: green; font-weight: bold"> Instalação dos Recursos da KVM </p>

&nbsp;

* <p style="color: #836FFF; font-weight: bold"> Procedimentos para serem executados na VM-Host: </p>

    &nbsp;
    - Checar se a CPU que executa a VM-Host suporta virtualização:

        $ egrep -c '(svm|vmx)' /proc/cpuinfo 

        &nbsp;
        4

        ** A resposta deverá ser um valor inteiro diferente de zero. Neste caso,
           a CPU que executa a VM-Host possue 4 núcleos (vCPUs)

    &nbsp;
    - Checar quantas vCPUs (núcleos) foram habilitados para a VM-Host pelo hypervisor VMWare Workstation:

        $ cat /proc/cpuinfo | grep processor | wc -l 

        &nbsp;
        2

        ** vCPUs definidas no hypervisor VMWare Workstation, em 'Hardware'/Processors (Number of Processors)'

    &nbsp;
    - Checar se a virtualização KVM está disponível na VM_Host:

        $ kvm-ok
        INFO: /dev/kvm exists
        KVM acceleration can be used

        ** Se não obter esta informação, instalar o utilitário cpu-checker:

        $ sudo apt install -y cpu-checker
    
    &nbsp;
    - Instalar os recursos necessários de interação coma a virtualização (KVM) da VM_Host:

        $ sudo apt -y install qemu-kvm libvirt-daemon-system libvirt-clients bridge-utils virt-manager libvirt-dev
        
        ** Dependendo do ambiente atual da VM-Host poderão ser necessário instalar outros recursos.

    &nbsp;
    - Adicionar usuário local à virtualização:

        $ sudo usermod -aG libvirt developer

        $ sudo usermod -aG kvm developer
        
        ** Onde 'developer' é o usuário local da VM_Host

    &nbsp;
    - Testar se o utilitário 'virsh' está ok:

        $ sudo virsh -c qemu:///system

        ** Deverá ser exibido o prompt 'virsh#'

    &nbsp;
    >> VM-Host apta para a instalação da aplicação Vagrant!
