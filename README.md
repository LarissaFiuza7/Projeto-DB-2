# Projeto 2 - Banco de Dados: Gestão de Diretório Acadêmico

## Integrantes do Grupo

- Fabio Martins Botelho – RA: 22.122.068-4
- Larissa Santos Fiuza – RA: 22.123.042-8

## Descrição do Projeto

Este projeto simula um sistema de gestão de um Diretório Acadêmico universitário, incluindo gerenciamento de membros, projetos, eventos, produtos e departamentos.

### Funcionalidades Modeladas

- Cadastro e participação de membros em projetos e eventos;
- Estrutura organizacional com cargos e mandatos;
- Organização de eventos com diversos públicos;
- Venda e controle de produtos relacionados ao Diretório;
- Departamentos com objetivos distintos e missões.

## Modelo Entidade-Relacionamento

![image (1)](https://github.com/user-attachments/assets/a3676e06-ee76-4b9d-916a-a80ecf3a5558)


## Modelo RelacionaL na 3FN

![image](https://github.com/user-attachments/assets/6d157d4b-aed4-445c-8089-06edc6aac948)


```mermaid
erDiagram
    Membro ||--o{ MembroEmProjeto : participa
    Membro ||--o{ MembroEmEvento : participa
    Membro ||--o| Mandato : ocupa
    Membro }o--|| Departamento : pertence
    Projeto ||--o{ MembroEmProjeto : possui
    Evento ||--o{ MembroEmEvento : organiza
    Compra }|--|| Membro : feita_por
    Compra }|--|| Produto : refere_se
    Cargo ||--|| Mandato : ocupa

