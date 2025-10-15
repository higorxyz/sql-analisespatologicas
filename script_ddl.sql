-- ============================================================================
-- SCRIPT DDL - SISTEMA AURA
-- Projeto Dasa - Análise Patológica com IA
-- ============================================================================

CREATE SEQUENCE seq_usuario START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE seq_paciente START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE seq_exame START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE seq_resultado START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE seq_imagem START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE seq_analise START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE seq_diagnostico START WITH 1 INCREMENT BY 1;

CREATE TABLE usuario (
    id_usuario NUMBER(10) PRIMARY KEY,
    nome VARCHAR2(100) NOT NULL,
    email VARCHAR2(80) NOT NULL UNIQUE,
    senha VARCHAR2(100) NOT NULL,
    tipo VARCHAR2(15) CHECK (tipo IN ('MEDICO', 'COORDENADOR')) NOT NULL,
    crm VARCHAR2(15),
    data_cadastro DATE DEFAULT SYSDATE,
    ativo CHAR(1) DEFAULT 'S' CHECK (ativo IN ('S', 'N'))
);

CREATE TABLE paciente (
    id_paciente NUMBER(10) PRIMARY KEY,
    nome VARCHAR2(100) NOT NULL,
    cpf VARCHAR2(15) NOT NULL UNIQUE,
    data_nascimento DATE NOT NULL,
    sexo CHAR(1) CHECK (sexo IN ('M', 'F')),
    telefone VARCHAR2(15),
    data_cadastro DATE DEFAULT SYSDATE
);

CREATE TABLE exame (
    id_exame NUMBER(10) PRIMARY KEY,
    protocolo VARCHAR2(20) NOT NULL UNIQUE,
    id_paciente NUMBER(10) NOT NULL,
    id_medico NUMBER(10) NOT NULL,
    tipo_exame VARCHAR2(50) NOT NULL,
    data_coleta DATE NOT NULL,
    status VARCHAR2(15) DEFAULT 'COLETADO' CHECK (status IN ('COLETADO', 'PROCESSANDO', 'FINALIZADO')),
    observacoes VARCHAR2(500)
);

CREATE TABLE resultado_exame (
    id_resultado NUMBER(10) PRIMARY KEY,
    id_exame NUMBER(10) NOT NULL,
    parametro VARCHAR2(100) NOT NULL,
    valor_medido VARCHAR2(50) NOT NULL,
    unidade_medida VARCHAR2(20),
    valor_referencia VARCHAR2(100),
    status_resultado VARCHAR2(20) CHECK (status_resultado IN ('NORMAL', 'ALTERADO', 'CRITICO')),
    data_resultado DATE DEFAULT SYSDATE
);

CREATE TABLE imagem (
    id_imagem NUMBER(10) PRIMARY KEY,
    id_exame NUMBER(10) NOT NULL,
    nome_arquivo VARCHAR2(100) NOT NULL,
    caminho VARCHAR2(200) NOT NULL,
    tamanho NUMBER(10),
    data_captura DATE DEFAULT SYSDATE,
    resolucao VARCHAR2(15)
);

CREATE TABLE analise_ia (
    id_analise NUMBER(10) PRIMARY KEY,
    id_imagem NUMBER(10) NOT NULL,
    resultado VARCHAR2(1000),
    confianca NUMBER(5,2) CHECK (confianca BETWEEN 0 AND 100),
    sugestao VARCHAR2(500),
    data_analise DATE DEFAULT SYSDATE,
    tempo_processamento NUMBER(8,2)
);

CREATE TABLE diagnostico (
    id_diagnostico NUMBER(10) PRIMARY KEY,
    id_exame NUMBER(10) NOT NULL,
    id_medico NUMBER(10) NOT NULL,
    diagnostico_final VARCHAR2(1000) NOT NULL,
    usou_ia CHAR(1) DEFAULT 'N' CHECK (usou_ia IN ('S', 'N')),
    data_diagnostico DATE DEFAULT SYSDATE,
    observacoes VARCHAR2(500)
);

ALTER TABLE exame ADD CONSTRAINT fk_exame_paciente 
    FOREIGN KEY (id_paciente) REFERENCES paciente(id_paciente);

ALTER TABLE exame ADD CONSTRAINT fk_exame_medico 
    FOREIGN KEY (id_medico) REFERENCES usuario(id_usuario);

ALTER TABLE resultado_exame ADD CONSTRAINT fk_resultado_exame 
    FOREIGN KEY (id_exame) REFERENCES exame(id_exame);

ALTER TABLE imagem ADD CONSTRAINT fk_imagem_exame 
    FOREIGN KEY (id_exame) REFERENCES exame(id_exame);

ALTER TABLE analise_ia ADD CONSTRAINT fk_analise_imagem 
    FOREIGN KEY (id_imagem) REFERENCES imagem(id_imagem);

ALTER TABLE diagnostico ADD CONSTRAINT fk_diagnostico_exame 
    FOREIGN KEY (id_exame) REFERENCES exame(id_exame);

ALTER TABLE diagnostico ADD CONSTRAINT fk_diagnostico_medico 
    FOREIGN KEY (id_medico) REFERENCES usuario(id_usuario);


COMMENT ON TABLE usuario IS 'Profissionais do sistema (médicos e coordenadores).';
COMMENT ON COLUMN usuario.id_usuario IS 'Identificador único do usuário.';
COMMENT ON COLUMN usuario.nome IS 'Nome completo do usuário.';
COMMENT ON COLUMN usuario.email IS 'Email único para autenticação/contato.';
COMMENT ON COLUMN usuario.senha IS 'Hash/Senha do usuário.';
COMMENT ON COLUMN usuario.tipo IS 'Papel do usuário: MEDICO ou COORDENADOR.';
COMMENT ON COLUMN usuario.crm IS 'Registro profissional quando aplicável.';
COMMENT ON COLUMN usuario.data_cadastro IS 'Data de criação do registro.';
COMMENT ON COLUMN usuario.ativo IS 'Indica se o usuário está ativo (S/N).';

COMMENT ON TABLE paciente IS 'Pacientes atendidos no sistema.';
COMMENT ON COLUMN paciente.id_paciente IS 'Identificador único do paciente.';
COMMENT ON COLUMN paciente.nome IS 'Nome completo do paciente.';
COMMENT ON COLUMN paciente.cpf IS 'CPF do paciente (único).';
COMMENT ON COLUMN paciente.data_nascimento IS 'Data de nascimento do paciente.';
COMMENT ON COLUMN paciente.sexo IS 'Sexo do paciente (M/F).';
COMMENT ON COLUMN paciente.telefone IS 'Telefone de contato do paciente.';
COMMENT ON COLUMN paciente.data_cadastro IS 'Data de cadastro do paciente.';

COMMENT ON TABLE exame IS 'Exames solicitados para pacientes.';
COMMENT ON COLUMN exame.id_exame IS 'Identificador do exame.';
COMMENT ON COLUMN exame.protocolo IS 'Código/protocolo único do exame.';
COMMENT ON COLUMN exame.id_paciente IS 'FK para o paciente do exame.';
COMMENT ON COLUMN exame.id_medico IS 'FK para o médico solicitante.';
COMMENT ON COLUMN exame.tipo_exame IS 'Tipo do exame realizado.';
COMMENT ON COLUMN exame.data_coleta IS 'Data de coleta do material.';
COMMENT ON COLUMN exame.status IS 'Status do exame (COLETADO/PROCESSANDO/FINALIZADO).';
COMMENT ON COLUMN exame.observacoes IS 'Observações gerais do exame.';

COMMENT ON TABLE resultado_exame IS 'Resultados estruturados dos exames.';
COMMENT ON COLUMN resultado_exame.id_resultado IS 'Identificador do resultado.';
COMMENT ON COLUMN resultado_exame.id_exame IS 'FK para o exame.';
COMMENT ON COLUMN resultado_exame.parametro IS 'Nome do parâmetro analisado.';
COMMENT ON COLUMN resultado_exame.valor_medido IS 'Valor obtido para o parâmetro.';
COMMENT ON COLUMN resultado_exame.unidade_medida IS 'Unidade do valor medido.';
COMMENT ON COLUMN resultado_exame.valor_referencia IS 'Faixa/valor de referência.';
COMMENT ON COLUMN resultado_exame.status_resultado IS 'Classificação do resultado (NORMAL/ALTERADO/CRITICO).';
COMMENT ON COLUMN resultado_exame.data_resultado IS 'Data do lançamento do resultado.';

COMMENT ON TABLE imagem IS 'Imagens associadas aos exames.';
COMMENT ON COLUMN imagem.id_imagem IS 'Identificador da imagem.';
COMMENT ON COLUMN imagem.id_exame IS 'FK para o exame associado.';
COMMENT ON COLUMN imagem.nome_arquivo IS 'Nome do arquivo da imagem.';
COMMENT ON COLUMN imagem.caminho IS 'Caminho completo do arquivo.';
COMMENT ON COLUMN imagem.tamanho IS 'Tamanho do arquivo (bytes).';
COMMENT ON COLUMN imagem.data_captura IS 'Data/hora de captura da imagem.';
COMMENT ON COLUMN imagem.resolucao IS 'Resolução da imagem.';

COMMENT ON TABLE analise_ia IS 'Resultados de análises por IA sobre imagens.';
COMMENT ON COLUMN analise_ia.id_analise IS 'Identificador da análise por IA.';
COMMENT ON COLUMN analise_ia.id_imagem IS 'FK para a imagem analisada.';
COMMENT ON COLUMN analise_ia.resultado IS 'Resumo/achados da IA.';
COMMENT ON COLUMN analise_ia.confianca IS 'Confiança da IA (0-100).';
COMMENT ON COLUMN analise_ia.sugestao IS 'Sugestão/hipótese da IA.';
COMMENT ON COLUMN analise_ia.data_analise IS 'Data da análise por IA.';
COMMENT ON COLUMN analise_ia.tempo_processamento IS 'Tempo de processamento em segundos.';

COMMENT ON TABLE diagnostico IS 'Diagnóstico final emitido pelo médico.';
COMMENT ON COLUMN diagnostico.id_diagnostico IS 'Identificador do diagnóstico.';
COMMENT ON COLUMN diagnostico.id_exame IS 'FK para o exame diagnosticado.';
COMMENT ON COLUMN diagnostico.id_medico IS 'FK para o médico responsável.';
COMMENT ON COLUMN diagnostico.diagnostico_final IS 'Descrição do diagnóstico.';
COMMENT ON COLUMN diagnostico.usou_ia IS 'Indica se a IA foi utilizada (S/N).';
COMMENT ON COLUMN diagnostico.data_diagnostico IS 'Data do diagnóstico.';
COMMENT ON COLUMN diagnostico.observacoes IS 'Observações complementares.';
