-- ============================================================================
-- SCRIPT DQL - CONSULTAS SQL
-- Projeto Dasa - Sistema Aura
-- ============================================================================

SELECT 
    e.protocolo AS "Protocolo",
    p.nome AS "Paciente",
    p.cpf AS "CPF",
    e.tipo_exame AS "Tipo de Exame",
    r.parametro AS "Parâmetro",
    r.valor_medido AS "Valor Medido",
    r.unidade_medida AS "Unidade",
    r.valor_referencia AS "Referência",
    r.status_resultado AS "Status",
    e.data_coleta AS "Data Coleta"
FROM 
    resultado_exame r
INNER JOIN 
    exame e ON r.id_exame = e.id_exame
INNER JOIN 
    paciente p ON e.id_paciente = p.id_paciente
WHERE 
    r.status_resultado IN ('ALTERADO', 'CRITICO')
ORDER BY 
    r.status_resultado DESC,
    e.data_coleta DESC;

SELECT 
    e.tipo_exame AS "Tipo de Exame",
    r.status_resultado AS "Status do Resultado",
    COUNT(*) AS "Quantidade de Resultados",
    ROUND(COUNT(*) * 100.0 / SUM(COUNT(*)) OVER (PARTITION BY e.tipo_exame), 2) AS "Percentual (%)",
    COUNT(DISTINCT e.id_exame) AS "Total de Exames"
FROM 
    exame e
INNER JOIN 
    resultado_exame r ON e.id_exame = r.id_exame
GROUP BY 
    e.tipo_exame, 
    r.status_resultado
ORDER BY 
    e.tipo_exame,
    CASE r.status_resultado
        WHEN 'CRITICO' THEN 1
        WHEN 'ALTERADO' THEN 2
        WHEN 'NORMAL' THEN 3
    END;

SELECT 
    p.nome AS "Paciente",
    p.data_nascimento AS "Nascimento",
    p.sexo AS "Sexo",
    e.protocolo AS "Protocolo",
    e.tipo_exame AS "Tipo de Exame",
    r.parametro AS "Parâmetro Crítico",
    r.valor_medido AS "Valor Medido",
    r.valor_referencia AS "Valor de Referência",
    u.nome AS "Médico Responsável",
    u.crm AS "CRM",
    d.diagnostico_final AS "Diagnóstico",
    d.usou_ia AS "Usou IA"
FROM 
    resultado_exame r
INNER JOIN 
    exame e ON r.id_exame = e.id_exame
INNER JOIN 
    paciente p ON e.id_paciente = p.id_paciente
INNER JOIN 
    usuario u ON e.id_medico = u.id_usuario
INNER JOIN 
    diagnostico d ON e.id_exame = d.id_exame
WHERE 
    r.status_resultado = 'CRITICO'
    AND u.tipo = 'MEDICO'
ORDER BY 
    e.data_coleta DESC,
    p.nome;
