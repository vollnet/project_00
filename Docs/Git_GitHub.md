### Git/GitHub

* Ações externas à máquina host:

  > - Abrir uma conta no GitHub

  > - Acessar a conta do GitHub
 
  > - Criar o REPOSITÓRIO do projeto (project_00) no GitHub
 
&nbsp;

* Ações na máquina de trabalho (real ou VM):

  > - Instalar o Git na máquina do projeto

            $ sudo apt update -y

            $ sudo apt install git-all

  > - Criar a pasta do projeto

            $ mkdir my_project

  > -  Iniciar o Git na pasta do projeto
       (O git deverá ser iniciado em cada pasta de projeto, distintamente) 

            $ git init 

  > - Criar o projeto

            $ npx create-next-app@latest

            (NodeJS é uma das dependências para projetos NextJS)      

  > - Validar o projeto (testes/correções, otimizações, aprovação)

            Status do projeto: Aprovado para subir projeto no GitHub

  > -  Na raiz da pasta do projeto, subir o projeto para o GitHub

            Executat uma única vez, depois de iniciar o Git na pasta do projeto:

            $ git config --global user.name vollnet

            $ git config --global user.email vollnet.br@gmail.com
            
            continuando, 

            $ git remote add origin https://github.com/vollnet/project_00.git

            $ git remote -v (checando...)

            $ git add .

            $ git commit -m "Ambiente Devops do Projeto"

            $ git push -u origin main
            Enumerating objects: 41, done.
            Counting objects: 100% (41/41), done.
            Delta compression using up to 8 threads
            Compressing objects: 100% (32/32), done.
            Writing objects: 100% (41/41), 20.01 KiB | 661.00 KiB/s, done.
            Total 41 (delta 3), reused 0 (delta 0), pack-reused 0 (from 0)
            remote: Resolving deltas: 100% (3/3), done.
            To https://github.com/vollnet/project_00.git
            * [new branch]      main -> main
            branch 'main' set up to track 'origin/main'.            

            (Sucesso, projeto subiu! Verifique no GitHub)

&nbsp;


  
