-- ============================================================================
-- SCRIPT DML - DADOS DE EXEMPLO
-- Projeto Dasa - Sistema Aura
-- ============================================================================

INSERT INTO usuario (id_usuario, nome, email, senha, tipo, crm, data_cadastro, ativo)
VALUES (seq_usuario.NEXTVAL, 'Dr. João Silva', 'joao.silva@dasa.com', 'senha123', 'MEDICO', '12345-SP', SYSDATE, 'S');

INSERT INTO usuario (id_usuario, nome, email, senha, tipo, crm, data_cadastro, ativo)
VALUES (seq_usuario.NEXTVAL, 'Dra. Maria Santos', 'maria.santos@dasa.com', 'senha456', 'MEDICO', '67890-RJ', SYSDATE, 'S');

INSERT INTO usuario (id_usuario, nome, email, senha, tipo, crm, data_cadastro, ativo)
VALUES (seq_usuario.NEXTVAL, 'Dr. Pedro Costa', 'pedro.costa@dasa.com', 'senha789', 'MEDICO', '11111-MG', SYSDATE, 'S');

INSERT INTO usuario (id_usuario, nome, email, senha, tipo, crm, data_cadastro, ativo)
VALUES (seq_usuario.NEXTVAL, 'Ana Coordenadora', 'ana.coord@dasa.com', 'senha321', 'COORDENADOR', NULL, SYSDATE, 'S');

INSERT INTO usuario (id_usuario, nome, email, senha, tipo, crm, data_cadastro, ativo)
VALUES (seq_usuario.NEXTVAL, 'Carlos Admin', 'carlos.admin@dasa.com', 'senha654', 'COORDENADOR', NULL, SYSDATE, 'S');

-- INSERINDO PACIENTES

INSERT INTO paciente (id_paciente, nome, cpf, data_nascimento, sexo, telefone, data_cadastro)
VALUES (seq_paciente.NEXTVAL, 'José da Silva', '12345678901', TO_DATE('1980-05-15', 'YYYY-MM-DD'), 'M', '11999887766', SYSDATE);

INSERT INTO paciente (id_paciente, nome, cpf, data_nascimento, sexo, telefone, data_cadastro)
VALUES (seq_paciente.NEXTVAL, 'Maria Oliveira', '23456789012', TO_DATE('1975-10-20', 'YYYY-MM-DD'), 'F', '21988776655', SYSDATE);

INSERT INTO paciente (id_paciente, nome, cpf, data_nascimento, sexo, telefone, data_cadastro)
VALUES (seq_paciente.NEXTVAL, 'Paulo Santos', '34567890123', TO_DATE('1990-03-08', 'YYYY-MM-DD'), 'M', '31977665544', SYSDATE);

INSERT INTO paciente (id_paciente, nome, cpf, data_nascimento, sexo, telefone, data_cadastro)
VALUES (seq_paciente.NEXTVAL, 'Ana Costa', '45678901234', TO_DATE('1985-07-12', 'YYYY-MM-DD'), 'F', '11966554433', SYSDATE);

INSERT INTO paciente (id_paciente, nome, cpf, data_nascimento, sexo, telefone, data_cadastro)
VALUES (seq_paciente.NEXTVAL, 'Roberto Lima', '56789012345', TO_DATE('1970-12-25', 'YYYY-MM-DD'), 'M', '85955443322', SYSDATE);

-- INSERINDO EXAMES

INSERT INTO exame (id_exame, protocolo, id_paciente, id_medico, tipo_exame, data_coleta, status, observacoes)
VALUES (seq_exame.NEXTVAL, 'EX001-2025', 1, 1, 'Biopsia de Pele', TO_DATE('2025-09-15', 'YYYY-MM-DD'), 'PROCESSANDO', 'Lesao suspeita no braco');

INSERT INTO exame (id_exame, protocolo, id_paciente, id_medico, tipo_exame, data_coleta, status, observacoes)
VALUES (seq_exame.NEXTVAL, 'EX002-2025', 2, 2, 'Papanicolau', TO_DATE('2025-09-16', 'YYYY-MM-DD'), 'FINALIZADO', 'Exame de rotina');

INSERT INTO exame (id_exame, protocolo, id_paciente, id_medico, tipo_exame, data_coleta, status, observacoes)
VALUES (seq_exame.NEXTVAL, 'EX003-2025', 3, 1, 'Biopsia de Prostata', TO_DATE('2025-09-17', 'YYYY-MM-DD'), 'PROCESSANDO', 'PSA elevado');

INSERT INTO exame (id_exame, protocolo, id_paciente, id_medico, tipo_exame, data_coleta, status, observacoes)
VALUES (seq_exame.NEXTVAL, 'EX004-2025', 4, 3, 'Biopsia de Mama', TO_DATE('2025-09-18', 'YYYY-MM-DD'), 'FINALIZADO', 'Nodulo detectado');

INSERT INTO exame (id_exame, protocolo, id_paciente, id_medico, tipo_exame, data_coleta, status, observacoes)
VALUES (seq_exame.NEXTVAL, 'EX005-2025', 5, 2, 'Biopsia Pulmonar', TO_DATE('2025-09-19', 'YYYY-MM-DD'), 'COLETADO', 'Nodulo no pulmao');

INSERT INTO resultado_exame (id_resultado, id_exame, parametro, valor_medido, unidade_medida, valor_referencia, status_resultado, data_resultado)
VALUES (seq_resultado.NEXTVAL, 1, 'Espessura da lesao', '2.5', 'mm', '< 1.0 mm', 'ALTERADO', SYSDATE);

INSERT INTO resultado_exame (id_resultado, id_exame, parametro, valor_medido, unidade_medida, valor_referencia, status_resultado, data_resultado)
VALUES (seq_resultado.NEXTVAL, 1, 'Indice mitotico', '8', 'mitoses/mm2', '< 1 mitose/mm2', 'CRITICO', SYSDATE);

INSERT INTO resultado_exame (id_resultado, id_exame, parametro, valor_medido, unidade_medida, valor_referencia, status_resultado, data_resultado)
VALUES (seq_resultado.NEXTVAL, 1, 'Ulceracao', 'Presente', NULL, 'Ausente', 'ALTERADO', SYSDATE);

INSERT INTO resultado_exame (id_resultado, id_exame, parametro, valor_medido, unidade_medida, valor_referencia, status_resultado, data_resultado)
VALUES (seq_resultado.NEXTVAL, 1, 'Margem cirurgica', 'Livre', 'mm', 'Livre', 'NORMAL', SYSDATE);

INSERT INTO resultado_exame (id_resultado, id_exame, parametro, valor_medido, unidade_medida, valor_referencia, status_resultado, data_resultado)
VALUES (seq_resultado.NEXTVAL, 1, 'Invasao vascular', 'Ausente', NULL, 'Ausente', 'NORMAL', SYSDATE);

INSERT INTO resultado_exame (id_resultado, id_exame, parametro, valor_medido, unidade_medida, valor_referencia, status_resultado, data_resultado)
VALUES (seq_resultado.NEXTVAL, 2, 'Celulas escamosas', 'Normal', NULL, 'Normal', 'NORMAL', SYSDATE);

INSERT INTO resultado_exame (id_resultado, id_exame, parametro, valor_medido, unidade_medida, valor_referencia, status_resultado, data_resultado)
VALUES (seq_resultado.NEXTVAL, 2, 'Celulas glandulares', 'Normal', NULL, 'Normal', 'NORMAL', SYSDATE);

INSERT INTO resultado_exame (id_resultado, id_exame, parametro, valor_medido, unidade_medida, valor_referencia, status_resultado, data_resultado)
VALUES (seq_resultado.NEXTVAL, 2, 'Atipias celulares', 'Ausente', NULL, 'Ausente', 'NORMAL', SYSDATE);

INSERT INTO resultado_exame (id_resultado, id_exame, parametro, valor_medido, unidade_medida, valor_referencia, status_resultado, data_resultado)
VALUES (seq_resultado.NEXTVAL, 2, 'Flora bacteriana', 'Lactobacillus', NULL, 'Lactobacillus', 'NORMAL', SYSDATE);

INSERT INTO resultado_exame (id_resultado, id_exame, parametro, valor_medido, unidade_medida, valor_referencia, status_resultado, data_resultado)
VALUES (seq_resultado.NEXTVAL, 2, 'Processo inflamatorio', 'Ausente', NULL, 'Ausente', 'NORMAL', SYSDATE);

INSERT INTO resultado_exame (id_resultado, id_exame, parametro, valor_medido, unidade_medida, valor_referencia, status_resultado, data_resultado)
VALUES (seq_resultado.NEXTVAL, 3, 'Gleason Score', '7', 'pontos', '< 6', 'ALTERADO', SYSDATE);

INSERT INTO resultado_exame (id_resultado, id_exame, parametro, valor_medido, unidade_medida, valor_referencia, status_resultado, data_resultado)
VALUES (seq_resultado.NEXTVAL, 3, 'PSA', '12.5', 'ng/mL', '< 4.0 ng/mL', 'ALTERADO', SYSDATE);

INSERT INTO resultado_exame (id_resultado, id_exame, parametro, valor_medido, unidade_medida, valor_referencia, status_resultado, data_resultado)
VALUES (seq_resultado.NEXTVAL, 3, 'Percentual de comprometimento', '40', '%', '< 5%', 'CRITICO', SYSDATE);

INSERT INTO resultado_exame (id_resultado, id_exame, parametro, valor_medido, unidade_medida, valor_referencia, status_resultado, data_resultado)
VALUES (seq_resultado.NEXTVAL, 3, 'Invasao perineural', 'Presente', NULL, 'Ausente', 'ALTERADO', SYSDATE);

INSERT INTO resultado_exame (id_resultado, id_exame, parametro, valor_medido, unidade_medida, valor_referencia, status_resultado, data_resultado)
VALUES (seq_resultado.NEXTVAL, 3, 'Extensao extraprostática', 'Ausente', NULL, 'Ausente', 'NORMAL', SYSDATE);

INSERT INTO resultado_exame (id_resultado, id_exame, parametro, valor_medido, unidade_medida, valor_referencia, status_resultado, data_resultado)
VALUES (seq_resultado.NEXTVAL, 4, 'Tipo histologico', 'Carcinoma ductal invasivo', NULL, 'Tecido normal', 'ALTERADO', SYSDATE);

INSERT INTO resultado_exame (id_resultado, id_exame, parametro, valor_medido, unidade_medida, valor_referencia, status_resultado, data_resultado)
VALUES (seq_resultado.NEXTVAL, 4, 'Grau histologico', 'II', NULL, 'Ausente', 'ALTERADO', SYSDATE);

INSERT INTO resultado_exame (id_resultado, id_exame, parametro, valor_medido, unidade_medida, valor_referencia, status_resultado, data_resultado)
VALUES (seq_resultado.NEXTVAL, 4, 'Receptor estrogenio', 'Positivo 90%', '%', 'Negativo', 'ALTERADO', SYSDATE);

INSERT INTO resultado_exame (id_resultado, id_exame, parametro, valor_medido, unidade_medida, valor_referencia, status_resultado, data_resultado)
VALUES (seq_resultado.NEXTVAL, 4, 'Receptor progesterona', 'Positivo 70%', '%', 'Negativo', 'ALTERADO', SYSDATE);

INSERT INTO resultado_exame (id_resultado, id_exame, parametro, valor_medido, unidade_medida, valor_referencia, status_resultado, data_resultado)
VALUES (seq_resultado.NEXTVAL, 4, 'HER2', 'Negativo', NULL, 'Negativo', 'NORMAL', SYSDATE);

INSERT INTO resultado_exame (id_resultado, id_exame, parametro, valor_medido, unidade_medida, valor_referencia, status_resultado, data_resultado)
VALUES (seq_resultado.NEXTVAL, 5, 'Tamanho do nodulo', '3.2', 'cm', '< 3.0 cm', 'ALTERADO', SYSDATE);

INSERT INTO resultado_exame (id_resultado, id_exame, parametro, valor_medido, unidade_medida, valor_referencia, status_resultado, data_resultado)
VALUES (seq_resultado.NEXTVAL, 5, 'Celularidade', 'Alta', NULL, 'Baixa', 'ALTERADO', SYSDATE);

INSERT INTO resultado_exame (id_resultado, id_exame, parametro, valor_medido, unidade_medida, valor_referencia, status_resultado, data_resultado)
VALUES (seq_resultado.NEXTVAL, 5, 'Necrose tumoral', 'Presente', '%', 'Ausente', 'ALTERADO', SYSDATE);

INSERT INTO resultado_exame (id_resultado, id_exame, parametro, valor_medido, unidade_medida, valor_referencia, status_resultado, data_resultado)
VALUES (seq_resultado.NEXTVAL, 5, 'Marcador TTF-1', 'Positivo', NULL, 'Variavel', 'ALTERADO', SYSDATE);

INSERT INTO resultado_exame (id_resultado, id_exame, parametro, valor_medido, unidade_medida, valor_referencia, status_resultado, data_resultado)
VALUES (seq_resultado.NEXTVAL, 5, 'Ki-67', '60', '%', '< 20%', 'CRITICO', SYSDATE);

INSERT INTO imagem (id_imagem, id_exame, nome_arquivo, caminho, tamanho, data_captura, resolucao)
VALUES (seq_imagem.NEXTVAL, 1, 'pele_001.jpg', '/imagens/2025/09/pele_001.jpg', 1024000, SYSDATE, '1920x1080');

INSERT INTO imagem (id_imagem, id_exame, nome_arquivo, caminho, tamanho, data_captura, resolucao)
VALUES (seq_imagem.NEXTVAL, 1, 'pele_002.jpg', '/imagens/2025/09/pele_002.jpg', 987000, SYSDATE, '1920x1080');

INSERT INTO imagem (id_imagem, id_exame, nome_arquivo, caminho, tamanho, data_captura, resolucao)
VALUES (seq_imagem.NEXTVAL, 2, 'cito_001.jpg', '/imagens/2025/09/cito_001.jpg', 756000, SYSDATE, '1600x1200');

INSERT INTO imagem (id_imagem, id_exame, nome_arquivo, caminho, tamanho, data_captura, resolucao)
VALUES (seq_imagem.NEXTVAL, 3, 'prostata_001.jpg', '/imagens/2025/09/prostata_001.jpg', 1200000, SYSDATE, '2048x1536');

INSERT INTO imagem (id_imagem, id_exame, nome_arquivo, caminho, tamanho, data_captura, resolucao)
VALUES (seq_imagem.NEXTVAL, 4, 'mama_001.jpg', '/imagens/2025/09/mama_001.jpg', 1100000, SYSDATE, '1920x1440');

INSERT INTO analise_ia (id_analise, id_imagem, resultado, confianca, sugestao, data_analise, tempo_processamento)
VALUES (seq_analise.NEXTVAL, 1, 'Celulas atipicas detectadas', 85.5, 'Suspeita de melanoma', SYSDATE, 12.5);

INSERT INTO analise_ia (id_analise, id_imagem, resultado, confianca, sugestao, data_analise, tempo_processamento)
VALUES (seq_analise.NEXTVAL, 2, 'Bordas irregulares identificadas', 78.2, 'Requer analise detalhada', SYSDATE, 8.3);

INSERT INTO analise_ia (id_analise, id_imagem, resultado, confianca, sugestao, data_analise, tempo_processamento)
VALUES (seq_analise.NEXTVAL, 3, 'Celulas normais', 92.1, 'Dentro da normalidade', SYSDATE, 5.7);

INSERT INTO analise_ia (id_analise, id_imagem, resultado, confianca, sugestao, data_analise, tempo_processamento)
VALUES (seq_analise.NEXTVAL, 4, 'Padroes de malignidade', 88.9, 'Suspeita de adenocarcinoma', SYSDATE, 15.2);

INSERT INTO analise_ia (id_analise, id_imagem, resultado, confianca, sugestao, data_analise, tempo_processamento)
VALUES (seq_analise.NEXTVAL, 5, 'Celulas neoplasicas', 91.3, 'Carcinoma ductal invasivo', SYSDATE, 18.7);

INSERT INTO diagnostico (id_diagnostico, id_exame, id_medico, diagnostico_final, usou_ia, data_diagnostico, observacoes)
VALUES (seq_diagnostico.NEXTVAL, 1, 1, 'Melanoma maligno confirmado', 'S', SYSDATE, 'Recomendado tratamento imediato');

INSERT INTO diagnostico (id_diagnostico, id_exame, id_medico, diagnostico_final, usou_ia, data_diagnostico, observacoes)
VALUES (seq_diagnostico.NEXTVAL, 2, 2, 'Citologia normal', 'S', SYSDATE, 'Manter acompanhamento anual');

INSERT INTO diagnostico (id_diagnostico, id_exame, id_medico, diagnostico_final, usou_ia, data_diagnostico, observacoes)
VALUES (seq_diagnostico.NEXTVAL, 3, 1, 'Adenocarcinoma de prostata', 'S', SYSDATE, 'Grau intermediario');

INSERT INTO diagnostico (id_diagnostico, id_exame, id_medico, diagnostico_final, usou_ia, data_diagnostico, observacoes)
VALUES (seq_diagnostico.NEXTVAL, 4, 3, 'Carcinoma ductal invasivo', 'S', SYSDATE, 'Estadio inicial');

INSERT INTO diagnostico (id_diagnostico, id_exame, id_medico, diagnostico_final, usou_ia, data_diagnostico, observacoes)
VALUES (seq_diagnostico.NEXTVAL, 5, 2, 'Em analise', 'N', SYSDATE, 'Aguardando mais resultados');

COMMIT;
