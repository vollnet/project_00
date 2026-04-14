## Process ID

> Ao tentar fazer alguma operação 'vagrant command', é exibida a mensagem:
>
> '...another process is already executing on the machine...'

- Listar os processos atuais:

```
   $ ps
   PID TTY          TIME CMD
    3404 pts/0    00:00:00 bash
   12552 pts/0    00:00:00 bash
   12553 pts/0    00:00:00 vagrant
   12557 pts/0    00:01:26 ruby
   14854 pts/0    00:00:03 ansible-playboo
   14935 pts/0    00:00:00 ansible-playboo
   14952 pts/0    00:00:00 sh
   14953 pts/0    00:00:00 sh
   15476 pts/0    00:00:00 ps
```

- Matar (kill) os processos:

```
    $ kill -9 12553 12557

```
