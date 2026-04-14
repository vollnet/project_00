### Os arquivos 'sshd_config' e 'sudoers' devem ser validados pelo sistema operacional em uso! Fazer a devida substituição nos paths: 

* /etc/ssh/sshd_config

  Após a substituição:

  $ sudo systemctl restart sshd

  $ sudo systemctl status ssh


* /etc/sudoers

  $ sudo visudo (para alterar o arquivo 'sudoers')

  $ sudo visudo -c (para validar: parser ok ou parser error ...)

    -  Atenção! 

      Após a validação (somente da sintaxe), uma vez salvo, as alterações do
      arquivo 'sudoers' serão assumidas pelo sistema operacional sem a necessidade
      de reinicialização do mesmo.

