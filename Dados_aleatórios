import random
from faker import Faker
import psycopg2
from datetime import datetime, timedelta
import sys

# Forçar codificação UTF-8
sys.stdout.reconfigure(encoding='utf-8')

# Configurações de conexão
USER = "postgres.podaabenqntfdrapksqe"
PASSWORD = "projeto2"
HOST = "aws-0-sa-east-1.pooler.supabase.com"
PORT = "6543"
DBNAME = "postgres"
SSLMODE = "require"

# Inicializar Faker
fake = Faker('pt_BR')

# Gerar dados para Membro (50 membros)
membros = []
for i in range(1, 51):
    membros.append((
        i,
        fake.name(),
        f"M{1000 + i}",
        random.choice(['Ciência da Computação', 'Engenharia Mecânica', 'Administração', 'Engenharia Elétrica', 'Engenharia de Produção']),
        fake.email()
    ))

# Gerar dados para Cargo (exatamente 6 cargos específicos)
cargos = [
    (1, 'Presidente', 'Responsável pela liderança da organização', 'Administrativo'),
    (2, 'Vice-Presidente', 'Auxilia o presidente e assume em sua ausência', 'Administrativo'),
    (3, '1º Secretário', 'Gerencia atas e documentos oficiais', 'Administrativo'),
    (4, '2º Secretário', 'Auxilia o 1º secretário nas tarefas administrativas', 'Administrativo'),
    (5, '1º Tesoureiro', 'Gerencia finanças e orçamento', 'Administrativo'),
    (6, '2º Tesoureiro', 'Auxilia o 1º tesoureiro na gestão financeira', 'Administrativo')
]

# Gerar dados para Mandato (6 membros com os 6 cargos específicos)
mandatos = [
    (1, 1, 2025, None),
    (2, 2, 2025, None),
    (3, 3, 2025, None),
    (4, 4, 2025, None),
    (5, 5, 2025, None),
    (6, 6, 2025, None)
]

# Gerar dados para Projeto (20 projetos, com descrições em português)
temas_projetos = ['inovação', 'liderança', 'educação', 'tecnologia', 'cultura', 'empreendedorismo']
descricoes_projetos = [
    'Iniciativa para promover {} no campus universitário.',
    'Projeto voltado para {} entre os estudantes.',
    'Atividade que incentiva {} e engajamento acadêmico.',
    'Esforço colaborativo para {} na comunidade.'
]
projetos = []
for i in range(1, 21):
    data_inicio = fake.date_between(start_date='-2y', end_date='today')
    data_fim = data_inicio + timedelta(days=random.randint(30, 365))
    projetos.append((
        i,
        fake.catch_phrase(),
        random.choice(descricoes_projetos).format(random.choice(temas_projetos)),
        data_inicio,
        data_fim
    ))

# Gerar dados para Evento (15 eventos, com nomes naturais)
tipos_evento = ['Palestra', 'Workshop', 'Seminário', 'Feira', 'Encontro', 'Debate']
temas_evento = ['Tecnologia', 'Inovação', 'Carreiras', 'Liderança', 'Empreendedorismo', 'Pesquisa', 'Cultura', 'Educação']
eventos = []
for i in range(1, 16):
    nome_evento = f"{random.choice(tipos_evento)} de {random.choice(temas_evento)}"
    eventos.append((
        i,
        nome_evento,
        fake.address().split('\n')[0],
        fake.date_between(start_date='-1y', end_date='+1y'),
        random.choice(['Estudantes', 'Público geral', 'Membros'])
    ))

# Gerar dados para Departamento (5 departamentos, genéricos)
departamentos = [
    (1, 'Financeiro', 'Gerencia o orçamento do Diretório', 'Controlar finanças e arrecadações'),
    (2, 'Eventos', 'Organiza eventos acadêmicos e sociais', 'Promover integração e aprendizado'),
    (3, 'Projetos', 'Coordena projetos estudantis', 'Fomentar inovação e impacto social'),
    (4, 'Recursos Humanos', 'Gerencia membros e voluntários', 'Apoiar o desenvolvimento da equipe'),
    (5, 'Comunicação', 'Gerencia mídias e divulgação', 'Ampliar alcance do Diretório')
]

# Gerar dados para Produto (10 produtos, com nomes e descrições em português)
nomes_produtos = ['Caneca', 'Camiseta', 'Caderno', 'Chaveiro', 'Adesivo', 'Mochila', 'Garrafa', 'Boné', 'Pen Drive', 'Planner']
descricoes_produtos = [
    'Produto personalizado com o logo do Diretório Acadêmico.',
    'Item exclusivo para membros, ideal para o dia a dia.',
    'Feito com materiais de alta qualidade, apoio à causa estudantil.',
    'Perfeito para presentear ou usar no campus.'
]
produtos = []
for i in range(1, 11):
    produtos.append((
        i,
        random.choice(nomes_produtos),
        round(random.uniform(10.0, 100.0), 2),
        random.randint(0, 100),
        random.choice(descricoes_produtos)
    ))

# Gerar dados para MembroEmProjeto (40 associações, garantindo unicidade)
membro_em_projeto = []
combinacoes_projeto = random.sample([(m, p) for m in range(1, 51) for p in range(1, 21)], 40)
for i, (id_membro, id_projeto) in enumerate(combinacoes_projeto, 1):
    membro_em_projeto.append((
        id_membro,
        id_projeto,
        random.choice(['Líder', 'Colaborador', 'Consultor']),
        random.randint(10, 200)
    ))

# Gerar dados para MembroEmEvento (30 associações, garantindo unicidade)
membro_em_evento = []
combinacoes_evento = random.sample([(m, e) for m in range(1, 51) for e in range(1, 16)], 30)
for i, (id_membro, id_evento) in enumerate(combinacoes_evento, 1):
    membro_em_evento.append((
        id_membro,
        id_evento,
        random.choice(['Organizador', 'Voluntário', 'Palestrante']),
        random.choice(['Manhã', 'Tarde', 'Noite'])
    ))

# Gerar dados para Compra (50 compras, garantindo unicidade)
compras = []
combinacoes_compra = random.sample([(m, p) for m in range(1, 51) for p in range(1, 11)], 50)
for i, (id_membro, id_produto) in enumerate(combinacoes_compra, 1):
    compras.append((
        id_membro,
        id_produto,
        fake.date_between(start_date='-1y', end_date='today'),
        random.randint(1, 5)
    ))

def connect_db():
    try:
        conn = psycopg2.connect(
            user=USER,
            password=PASSWORD,
            host=HOST,
            port=PORT,
            dbname=DBNAME,
            sslmode=SSLMODE
        )
        print("Conexão com o banco de dados estabelecida com sucesso!")
        return conn
    except Exception as e:
        print(f"Erro ao conectar ao banco de dados: {e}")
        sys.exit(1)

def drop_tables():
    conn = connect_db()
    cursor = conn.cursor()
    try:
        cursor.execute("""
            DROP TABLE IF EXISTS Mandato CASCADE;
            DROP TABLE IF EXISTS MembroEmProjeto CASCADE;
            DROP TABLE IF EXISTS MembroEmEvento CASCADE;
            DROP TABLE IF EXISTS Compra CASCADE;
            DROP TABLE IF EXISTS Membro CASCADE;
            DROP TABLE IF EXISTS Cargo CASCADE;
            DROP TABLE IF EXISTS Projeto CASCADE;
            DROP TABLE IF EXISTS Evento CASCADE;
            DROP TABLE IF EXISTS Departamento CASCADE;
            DROP TABLE IF EXISTS Produto CASCADE;
        """)
        conn.commit()
        print("Tabelas apagadas com sucesso!")
    except Exception as e:
        print(f"Erro ao apagar tabelas: {e}")
        conn.rollback()
    finally:
        cursor.close()
        conn.close()
        print("Conexão com o banco de dados fechada.")

def create_tables():
    conn = connect_db()
    cursor = conn.cursor()
    try:
        cursor.execute("""
            CREATE TABLE Membro (
                id_membro INT PRIMARY KEY,
                nome VARCHAR(100) NOT NULL,
                matricula VARCHAR(20) NOT NULL UNIQUE,
                curso VARCHAR(50) NOT NULL,
                email VARCHAR(100) NOT NULL
            );
            CREATE TABLE Cargo (
                id_cargo INT PRIMARY KEY,
                nome VARCHAR(50) NOT NULL,
                descricao TEXT,
                tipo VARCHAR(50) NOT NULL
            );
            CREATE TABLE Projeto (
                id_projeto INT PRIMARY KEY,
                nome VARCHAR(100) NOT NULL,
                descricao TEXT,
                data_inicio DATE NOT NULL,
                data_fim DATE
            );
            CREATE TABLE Evento (
                id_evento INT PRIMARY KEY,
                nome VARCHAR(100) NOT NULL,
                local VARCHAR(200) NOT NULL,
                data DATE NOT NULL,
                publico_alvo VARCHAR(50) NOT NULL
            );
            CREATE TABLE Departamento (
                id_departamento INT PRIMARY KEY,
                nome VARCHAR(100) NOT NULL,
                descricao TEXT,
                objetivo TEXT
            );
            CREATE TABLE Produto (
                id_produto INT PRIMARY KEY,
                nome VARCHAR(100) NOT NULL,
                preco FLOAT NOT NULL,
                estoque INT NOT NULL,
                descricao TEXT
            );
            CREATE TABLE Mandato (
                id_membro INT REFERENCES Membro(id_membro),
                id_cargo INT REFERENCES Cargo(id_cargo),
                ano_inicio INT NOT NULL,
                ano_fim INT,
                PRIMARY KEY (id_membro, id_cargo)
            );
            CREATE TABLE MembroEmProjeto (
                id_membro INT REFERENCES Membro(id_membro),
                id_projeto INT REFERENCES Projeto(id_projeto),
                papel VARCHAR(50) NOT NULL,
                horas_dedicadas INT NOT NULL,
                PRIMARY KEY (id_membro, id_projeto)
            );
            CREATE TABLE MembroEmEvento (
                id_membro INT REFERENCES Membro(id_membro),
                id_evento INT REFERENCES Evento(id_evento),
                funcao VARCHAR(50) NOT NULL,
                turno VARCHAR(20) NOT NULL,
                PRIMARY KEY (id_membro, id_evento)
            );
            CREATE TABLE Compra (
                id_membro INT REFERENCES Membro(id_membro),
                id_produto INT REFERENCES Produto(id_produto),
                data_compra DATE NOT NULL,
                quantidade INT NOT NULL,
                PRIMARY KEY (id_membro, id_produto, data_compra)
            );
        """)
        conn.commit()
        print("Tabelas criadas com sucesso!")
    except Exception as e:
        print(f"Erro ao criar tabelas: {e}")
        conn.rollback()
    finally:
        cursor.close()
        conn.close()
        print("Conexão com o banco de dados fechada.")

def insert_data():
    conn = connect_db()
    cursor = conn.cursor()
    try:
        for membro in membros:
            cursor.execute("INSERT INTO Membro (id_membro, nome, matricula, curso, email) VALUES (%s, %s, %s, %s, %s)", membro)
        for cargo in cargos:
            cursor.execute("INSERT INTO Cargo (id_cargo, nome, descricao, tipo) VALUES (%s, %s, %s, %s)", cargo)
        for mandato in mandatos:
            cursor.execute("INSERT INTO Mandato (id_membro, id_cargo, ano_inicio, ano_fim) VALUES (%s, %s, %s, %s)", mandato)
        for projeto in projetos:
            cursor.execute("INSERT INTO Projeto (id_projeto, nome, descricao, data_inicio, data_fim) VALUES (%s, %s, %s, %s, %s)", projeto)
        for evento in eventos:
            cursor.execute("INSERT INTO Evento (id_evento, nome, local, data, publico_alvo) VALUES (%s, %s, %s, %s, %s)", evento)
        for departamento in departamentos:
            cursor.execute("INSERT INTO Departamento (id_departamento, nome, descricao, objetivo) VALUES (%s, %s, %s, %s)", departamento)
        for produto in produtos:
            cursor.execute("INSERT INTO Produto (id_produto, nome, preco, estoque, descricao) VALUES (%s, %s, %s, %s, %s)", produto)
        for mp in membro_em_projeto:
            cursor.execute("INSERT INTO MembroEmProjeto (id_membro, id_projeto, papel, horas_dedicadas) VALUES (%s, %s, %s, %s)", mp)
        for me in membro_em_evento:
            cursor.execute("INSERT INTO MembroEmEvento (id_membro, id_evento, funcao, turno) VALUES (%s, %s, %s, %s)", me)
        for compra in compras:
            cursor.execute("INSERT INTO Compra (id_membro, id_produto, data_compra, quantidade) VALUES (%s, %s, %s, %s)", compra)
        conn.commit()
        print("Dados inseridos com sucesso!")
    except Exception as e:
        print(f"Erro ao inserir dados: {e}")
        conn.rollback()
    finally:
        cursor.close()
        conn.close()
        print("Conexão com o banco de dados fechada.")

def validate_membro(cursor):
    print("\nValidando tabela Membro...")
    cursor.execute("SELECT id_membro, nome, matricula, curso, email FROM Membro")
    membros = cursor.fetchall()
    if len(membros) != 50:
        print(f"Erro: Esperado 50 membros, encontrado {len(membros)}")
    matriculas = [m[2] for m in membros]
    if len(matriculas) != len(set(matriculas)):
        print("Erro: Matrículas duplicadas encontradas")
    for m in membros:
        if not all([m[1], m[2], m[3], m[4]]):
            print(f"Erro: Campos obrigatórios nulos no membro {m[0]}")

def validate_cargo(cursor):
    print("\nValidando tabela Cargo...")
    cursor.execute("SELECT id_cargo, nome, tipo FROM Cargo")
    cargos = cursor.fetchall()
    if len(cargos) != 6:
        print(f"Erro: Esperado 6 cargos, encontrado {len(cargos)}")
    for c in cargos:
        if not all([c[1], c[2]]):
            print(f"Erro: Campos obrigatórios nulos no cargo {c[0]}")

def validate_mandato(cursor):
    print("\nValidando tabela Mandato...")
    cursor.execute("SELECT id_membro, id_cargo, ano_inicio, ano_fim FROM Mandato")
    mandatos = cursor.fetchall()
    if len(mandatos) != 6:
        print(f"Erro: Esperado 6 mandatos, encontrado {len(mandatos)}")
    cursor.execute("SELECT id_membro FROM Membro")
    membros_validos = {m[0] for m in cursor.fetchall()}
    cursor.execute("SELECT id_cargo FROM Cargo")
    cargos_validos = {c[0] for c in cursor.fetchall()}
    for m in mandatos:
        if m[0] not in membros_validos:
            print(f"Erro: id_membro {m[0]} inválido no mandato")
        if m[1] not in cargos_validos:
            print(f"Erro: id_cargo {m[1]} inválido no mandato")
        if m[2] < 2000 or m[2] > datetime.now().year:
            print(f"Erro: Ano de início inválido no mandato: {m[2]}")
        if m[3] is not None and m[3] <= m[2]:
            print(f"Erro: Ano de fim {m[3]} menor ou igual ao ano de início {m[2]}")

def validate_projeto(cursor):
    print("\nValidando tabela Projeto...")
    cursor.execute("SELECT id_projeto, nome, data_inicio, data_fim FROM Projeto")
    projetos = cursor.fetchall()
    if len(projetos) != 20:
        print(f"Erro: Esperado 20 projetos, encontrado {len(projetos)}")
    for p in projetos:
        if not p[1]:
            print(f"Erro: Nome nulo no projeto {p[0]}")
        if p[3] and p[3] < p[2]:
            print(f"Erro: Data de fim {p[3]} anterior à data de início {p[2]} no projeto {p[0]}")

def validate_evento(cursor):
    print("\nValidando tabela Evento...")
    cursor.execute("SELECT id_evento, nome, local, data, publico_alvo FROM Evento")
    eventos = cursor.fetchall()
    if len(eventos) != 15:
        print(f"Erro: Esperado 15 eventos, encontrado {len(eventos)}")
    for e in eventos:
        if not all([e[1], e[2], e[3], e[4]]):
            print(f"Erro: Campos obrigatórios nulos no evento {e[0]}")

def validate_departamento(cursor):
    print("\nValidando tabela Departamento...")
    cursor.execute("SELECT id_departamento, nome FROM Departamento")
    departamentos = cursor.fetchall()
    if len(departamentos) != 5:
        print(f"Erro: Esperado 5 departamentos, encontrado {len(departamentos)}")
    for d in departamentos:
        if not d[1]:
            print(f"Erro: Nome nulo no departamento {d[0]}")

def validate_produto(cursor):
    print("\nValidando tabela Produto...")
    cursor.execute("SELECT id_produto, nome, preco, estoque FROM Produto")
    produtos = cursor.fetchall()
    if len(produtos) != 10:
        print(f"Erro: Esperado 10 produtos, encontrado {len(produtos)}")
    for p in produtos:
        if not all([p[1], p[2] is not None, p[3] is not None]):
            print(f"Erro: Campos obrigatórios nulos no produto {p[0]}")
        if p[2] < 0:
            print(f"Erro: Preço negativo no produto {p[0]}: {p[2]}")
        if p[3] < 0:
            print(f"Erro: Estoque negativo no produto {p[0]}: {p[3]}")

def validate_membro_em_projeto(cursor):
    print("\nValidando tabela MembroEmProjeto...")
    cursor.execute("SELECT id_membro, id_projeto, papel, horas_dedicadas FROM MembroEmProjeto")
    membros_projeto = cursor.fetchall()
    if len(membros_projeto) != 40:
        print(f"Erro: Esperado 40 associações em MembroEmProjeto, encontrado {len(membros_projeto)}")
    cursor.execute("SELECT id_membro FROM Membro")
    membros_validos = {m[0] for m in cursor.fetchall()}
    cursor.execute("SELECT id_projeto FROM Projeto")
    projetos_validos = {p[0] for p in cursor.fetchall()}
    for mp in membros_projeto:
        if mp[0] not in membros_validos:
            print(f"Erro: id_membro {mp[0]} inválido em MembroEmProjeto")
        if mp[1] not in projetos_validos:
            print(f"Erro: id_projeto {mp[1]} inválido em MembroEmProjeto")
        if not mp[2]:
            print(f"Erro: Papel nulo para membro {mp[0]} em projeto {mp[1]}")
        if mp[3] <= 0:
            print(f"Erro: Horas dedicadas inválidas ({mp[3]}) para membro {mp[0]} em projeto {mp[1]}")

def validate_membro_em_evento(cursor):
    print("\nValidando tabela MembroEmEvento...")
    cursor.execute("SELECT id_membro, id_evento, funcao, turno FROM MembroEmEvento")
    membros_evento = cursor.fetchall()
    if len(membros_evento) != 30:
        print(f"Erro: Esperado 30 associações em MembroEmEvento, encontrado {len(membros_evento)}")
    cursor.execute("SELECT id_membro FROM Membro")
    membros_validos = {m[0] for m in cursor.fetchall()}
    cursor.execute("SELECT id_evento FROM Evento")
    eventos_validos = {e[0] for e in cursor.fetchall()}
    for me in membros_evento:
        if me[0] not in membros_validos:
            print(f"Erro: id_membro {me[0]} inválido em MembroEmEvento")
        if me[1] not in eventos_validos:
            print(f"Erro: id_evento {me[1]} inválido em MembroEmEvento")
        if not all([me[2], me[3]]):
            print(f"Erro: Campos obrigatórios nulos para membro {me[0]} em evento {me[1]}")

def validate_compra(cursor):
    print("\nValidando tabela Compra...")
    cursor.execute("SELECT id_membro, id_produto, data_compra, quantidade FROM Compra")
    compras = cursor.fetchall()
    if len(compras) != 50:
        print(f"Erro: Esperado 50 compras, encontrado {len(compras)}")
    cursor.execute("SELECT id_membro FROM Membro")
    membros_validos = {m[0] for m in cursor.fetchall()}
    cursor.execute("SELECT id_produto FROM Produto")
    produtos_validos = {p[0] for p in cursor.fetchall()}
    for c in compras:
        if c[0] not in membros_validos:
            print(f"Erro: id_membro {c[0]} inválido em Compra")
        if c[1] not in produtos_validos:
            print(f"Erro: id_produto {c[1]} inválido em Compra")
        if c[3] <= 0:
            print(f"Erro: Quantidade inválida ({c[3]}) na compra de membro {c[0]} para produto {c[1]}")

def validate_data():
    conn = connect_db()
    cursor = conn.cursor()
    try:
        validate_membro(cursor)
        validate_cargo(cursor)
        validate_mandato(cursor)
        validate_projeto(cursor)
        validate_evento(cursor)
        validate_departamento(cursor)
        validate_produto(cursor)
        validate_membro_em_projeto(cursor)
        validate_membro_em_evento(cursor)
        validate_compra(cursor)
        print("\nValidação concluída!")
    except Exception as e:
        print(f"Erro durante a validação: {e}")
    finally:
        cursor.close()
        conn.close()
        print("Conexão com o banco de dados fechada.")

if _name_ == "_main_":
    drop_tables()  # Apaga as tabelas existentes
    create_tables()  # Cria as tabelas
    insert_data()  # Insere os dados
    validate_data()  # Valida os dados inseridos
