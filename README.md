# AURA AI – Database Design (Sprint 04)

Projeto acadêmico (FIAP – 2ESS) para o desafio DASA: Sistema de Análise Patológica com apoio de IA. Este repositório contém os scripts SQL da Sprint 04.

## Visão geral

  - `script_ddl.sql` (estrutura do banco)
  - `script_dml.sql` (dados de exemplo)
  - `script_dql.sql` (consultas)

## O que foi feito nos códigos

### DDL (`script_ddl.sql`)
- Criação das tabelas: `usuario`, `paciente`, `exame`, `resultado_exame`, `imagem`, `analise_ia`, `diagnostico`.
- Geração de sequências: `seq_usuario`, `seq_paciente`, `seq_exame`, `seq_resultado`, `seq_imagem`, `seq_analise`, `seq_diagnostico`.
- Constraints principais:
  - PKs em todas as tabelas.
  - FKs: `exame(id_paciente)→paciente`, `exame(id_medico)→usuario`, `resultado_exame(id_exame)→exame`, `imagem(id_exame)→exame`, `analise_ia(id_imagem)→imagem`, `diagnostico(id_exame)→exame`, `diagnostico(id_medico)→usuario`.
  - UNIQUE: `usuario.email`, `paciente.cpf`, `exame.protocolo`.
  - CHECK: domínios como `usuario.tipo` (MEDICO/COORDENADOR), `usuario.ativo` (S/N), `paciente.sexo` (M/F), `exame.status` (COLETADO/PROCESSANDO/FINALIZADO), `analise_ia.confianca` (0–100).
- Comentários (documentação no banco): `COMMENT ON TABLE/COLUMN` para todas as tabelas e principais colunas.
- Decisões:
  - `exame.protocolo` é único (evita duplicidade operacional).
  - `analise_ia.tempo_processamento` definido como `NUMBER(8,2)` para maior margem.

### DML (`script_dml.sql`)
- Dados de exemplo com pelo menos 5 registros por tabela.
- Ajustes feitos para garantir integridade:
  - Remoção de duplicatas que violavam `UNIQUE` e correção de duplicatas acidentais em `resultado_exame`/`imagem`.

### DQL (`script_dql.sql`)
- 3 consultas solicitadas no enunciado:
  1) JOIN entre tabelas para resultados alterados/críticos, com `WHERE` e `ORDER BY`.
  2) Agrupamento por tipo de exame e status (`GROUP BY`) com percentual por tipo.
  3) Consulta com múltiplos JOINs e filtro por resultado crítico, classificada por data e paciente.
- Correção de “SELECT” órfãos para execução limpa do arquivo.


## Como executar (Oracle)

Ordem recomendada:
1. Executar `script_ddl.sql` (criação de sequences, tabelas, constraints e comentários).
2. Executar `script_dml.sql` (carga de dados de exemplo).
3. Executar `script_dql.sql` (consultas de verificação/entrega).

Ferramentas sugeridas: Oracle SQL Developer, SQLcl ou SQL*Plus.