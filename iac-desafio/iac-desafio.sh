#!/bin/bash

echo "Iniciando criação do script para estruturação..."

remove_existing() {
    echo "Removendo usuários, grupos e diretórios anteriores..."
    
    for user in carlos maria joao debora sebastiana roberto josefina amanda rogerio; do
        userdel -r $user 2>/dev/null
    done
    
    for group in GRP_ADM GRP_VEN GRP_SEC; do
        groupdel $group 2>/dev/null
    done

    rm -rf /publico /adm /ven /sec
}

create_groups() {
    echo "Criando grupos..."
    groupadd GRP_ADM
    groupadd GRP_VEN
    groupadd GRP_SEC
}

create_directories() {
    echo "Criando diretórios..."
    mkdir /publico /adm /ven /sec
    
    chown root:root /publico /adm /ven /sec
    
    chmod 777 /publico
    chmod 770 /adm /ven /sec
}

create_users() {
    echo "Criando usuários e adicionando aos grupos..."
    
    for user in carlos maria joao; do
        useradd -m -s /bin/bash -G GRP_ADM $user
        senha=$(openssl passwd "$user@123")
        echo "$user:$senha" | chpasswd
        echo "Senha para $user: $user@123"
    done
    
    for user in debora sebastiana roberto; do
        useradd -m -s /bin/bash -G GRP_VEN $user
        senha=$(openssl passwd "$user@123")
        echo "$user:$senha" | chpasswd
        echo "Senha para $user: $user@123"
    done
    
    for user in josefina amanda rogerio; do
        useradd -m -s /bin/bash -G GRP_SEC $user
        senha=$(openssl passwd "$user@123")
        echo "$user:$senha" | chpasswd
        echo "Senha para $user: $user@123"
    done
}

set_permissions() {
    echo "Aplicando permissões..."
    
    chown root:GRP_ADM /adm
    chown root:GRP_VEN /ven
    chown root:GRP_SEC /sec

    chmod 770 /adm /ven /sec
    chmod 777 /publico
}

remove_existing
create_groups
create_directories
create_users
set_permissions

echo "Script concluído..."