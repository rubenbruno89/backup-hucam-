# backup-hucam-

Este script em lote realiza um backup de usuários do sistema operacional para uma pasta de destino especificada pelo usuário. O usuário precisa fornecer o drive onde está instalado o sistema operacional (por exemplo, C:), o caminho de destino do backup (por exemplo, E:\172520) e a quantidade de usuários que deseja fazer backup. 

O script inicia pedindo ao usuário o drive onde o sistema operacional está instalado e o caminho de destino para o backup. Em seguida, solicita o número de usuários que o usuário deseja fazer backup e o nome de login de cada usuário. O script armazena esses nomes de login em um arquivo de texto chamado "usuarios.txt". 

Em seguida, o script usa o comando "robocopy" para copiar os dados do usuário e arquivos do Firefox e Chrome para a pasta de destino do backup. Ele ignora certas pastas (como "AppData", "tihucam", "OneDrive - EBSERH", "OneDrive", "Google Drive" e "Dropbox") e copia tudo o mais. O script também registra um arquivo de log "logbackup.txt" no caminho de destino do backup.

O script faz o backup de cada usuário na lista de "usuarios.txt" individualmente. Ele cria uma pasta para cada usuário na pasta de destino do backup e copia todos os dados do usuário, incluindo arquivos de configuração do Firefox e Chrome. O script também para o serviço de spooler de impressão antes de iniciar o backup e depois reinicia o serviço no final do script.
