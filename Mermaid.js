
erDiagram

  Membro {
    int id_membro PK
    string nome
    string matricula
    string curso
    string email
  }

  Cargo {
    int id_cargo PK
    string nome
    string descricao
    string tipo
  }

  Mandato {
    int id_mandato PK
    int ano_inicio
    int ano_fim
  }

  Projeto {
    int id_projeto PK
    string nome
    string descricao
    date data_inicio
    date data_fim
  }

  Evento {
    int id_evento PK
    string nome
    string local
    date data
    string publico_alvo
  }

  Departamento {
    int id_departamento PK
    string nome
    string descricao
    string objetivo
  }

  Produto {
    int id_produto PK
    string nome
    string descricao
    decimal preco
  }

  Compra {
    int id_compra PK
    int quantidade
    date data_compra
  }

  MembroEmProjeto {
    int id_membro FK
    int id_projeto FK
    int horas_dedicadas
  }

  MembroEmEvento {
    int id_membro FK
    int id_evento FK
    string funcao
  }

  Membro ||--o{ Mandato : possui
  Cargo ||--o{ Mandato : ocupa
  Membro ||--o{ MembroEmProjeto : participa
  Projeto ||--o{ MembroEmProjeto : recebe
  Membro ||--o{ MembroEmEvento : comparece
  Evento ||--o{ MembroEmEvento : ocorre_em
  Departamento ||--o{ Membro : pertence_a
  Membro ||--o{ Compra : realiza
  Produto ||--o{ Compra : contém
