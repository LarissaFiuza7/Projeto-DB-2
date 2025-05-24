-- Consulta 1: Membros mais ativos em projetos e eventos (com base em participações)
SELECT 
    m.nome,
    m.curso,
    COUNT(DISTINCT mp.id_projeto) AS total_projetos,
    COUNT(DISTINCT me.id_evento) AS total_eventos,
    COUNT(DISTINCT mp.id_projeto) + COUNT(DISTINCT me.id_evento) AS total_atividades
FROM Membro m
LEFT JOIN MembroEmProjeto mp ON m.id_membro = mp.id_membro
LEFT JOIN MembroEmEvento me ON m.id_membro = me.id_membro
GROUP BY m.id_membro, m.nome, m.curso
ORDER BY total_atividades DESC


-- Consulta 2: Projetos com maior duração (em dias)
SELECT 
    nome,
    descricao,
    data_inicio,
    data_fim,
    COALESCE(data_fim, CURRENT_DATE) - data_inicio AS duracao_dias
FROM Projeto
WHERE data_fim IS NOT NULL OR data_fim > CURRENT_DATE
ORDER BY duracao_dias DESC

-- Consulta 3: Eventos com maior número de participantes
SELECT 
    e.nome,
    e.data,
    e.publico_alvo,
    COUNT(me.id_membro) AS total_participantes
FROM Evento e
LEFT JOIN MembroEmEvento me ON e.id_evento = me.id_evento
GROUP BY e.id_evento, e.nome, e.data, e.publico_alvo
ORDER BY total_participantes DESC

-- Consulta 4: Membros que não participaram de eventos
SELECT 
    m.nome,
    m.email,
    m.curso
FROM Membro m
LEFT JOIN MembroEmEvento me ON m.id_membro = me.id_membro
WHERE me.id_membro IS NULL
ORDER BY m.nome;

-- Consulta 5: Produtos mais vendidos (baseado na quantidade em compras)
SELECT 
    p.nome AS produto,
    SUM(c.quantidade) AS total_comprado
FROM Compra c
JOIN Produto p ON c.id_produto = p.id_produto
GROUP BY p.id_produto, p.nome
ORDER BY total_comprado DESC

-- Consulta 6: Membros com maior dedicação em projetos (horas dedicadas)
SELECT 
    m.nome,
    m.curso,
    SUM(mp.horas_dedicadas) AS total_horas
FROM MembroEmProjeto mp
JOIN Membro m ON mp.id_membro = m.id_membro
GROUP BY m.id_membro, m.nome, m.curso
ORDER BY total_horas DESC

-- Consulta 7: Listar eventos futuros com público-alvo
SELECT 
    nome,
    local,
    data,
    publico_alvo
FROM Evento
WHERE data >= CURRENT_DATE
ORDER BY data;

-- Consulta 8: Listar projetos em andamento (sem data de fim ou com data de fim futura)
SELECT 
    id_projeto,
    nome,
    descricao,
    data_inicio,
    data_fim
FROM Projeto
WHERE data_fim IS NULL OR data_fim > CURRENT_DATE
ORDER BY data_inicio;

-- Consulta 9: Listar projetos com maior número de participantes
SELECT 
    p.nome,
    p.descricao,
    COUNT(mp.id_membro) AS total_participantes
FROM Projeto p
LEFT JOIN MembroEmProjeto mp ON p.id_projeto = mp.id_projeto
GROUP BY p.id_projeto, p.nome, p.descricao
ORDER BY total_participantes DESC

-- Consulta 10: Membros que participaram de eventos como palestrantes
SELECT 
    m.nome,
    e.nome AS evento,
    e.data
FROM MembroEmEvento me
JOIN Membro m ON me.id_membro = m.id_membro
JOIN Evento e ON me.id_evento = e.id_evento
WHERE me.funcao = 'Palestrante'
ORDER BY e.data;
