# Projeto de IaC - Infraestrutura como Código - Automação de Usuários e Permissões

## 📋 Descrição
Este projeto implementa um script bash de Infraestrutura como Código (IaC) para Linux, automatizando a criação de estrutura de usuários, diretórios e permissões. A abordagem permite que novas máquinas sejam configuradas rapidamente com as mesmas definições.

## 🚀 Funcionalidade
O script executa as seguintes tarefas:
- Remove usuários, grupos e diretórios previamente criados.
- Cria novos grupos de usuários.
  - `GRP_ADM`
  - `GRP_VEN`
  - `GRP_SEC`
- Cria diretórios específicos para cada grupo.
  - `/publico`
  - `/adm`
  - `/ven`
  - `/sec`
- Adiciona usuários aos respectivos grupos.
  - `GRP_ADM`: carlos, maria, joao
  - `GRP_VEN`: debora, sebastiana, roberto
  - `GRP_SEC`: josefina, amanda, rogerio
- Define permissões de acesso adequadas para cada diretório.
  - `/publico`: acesso total para todos (777)
  - `/adm`: acesso total para root e grupo GRP_ADM (770)
  - `/ven`: acesso total para root e grupo GRP_VEN (770)
  - `/sec`: acesso total para root e grupo GRP_SEC (770)
- Gera senhas personalizadas para cada usuário no formato usuario@123.

## 🛠️ Pré-requisitos
- Sistema operacional Linux
- Permissões de superusuário (root)

## 📦 Como usar

### Faça o download do script

### Dê permissão de execução ao script:
```
chmod +x iac-desafio.sh
```
### Execute o script como root:
```
sudo ./iac-desafio.sh
```

## ⚠️ Atenção
Este script fará alterações significativas no sistema, incluindo a criação e remoção de usuários e diretórios. Certifique-se de executá-lo em um ambiente controlado ou de teste.