CREATE TABLE percurso (
  id_percurso INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  descricao VARCHAR(255) NULL,
  bairro VARCHAR(255) NULL,
  PRIMARY KEY(id_percurso)
);

CREATE TABLE sala (
  id_sala INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  numero INTEGER NOT NULL,
  numero_lugares INTEGER NOT NULL,
  PRIMARY KEY(id_sala)
);

CREATE TABLE usuario (
  id_usuario INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  nome VARCHAR(255) NOT NULL,
  email VARCHAR(255) NOT NULL,
  telefone VARCHAR(20) NOT NULL,
  cpf VARCHAR(20) NULL,
  passaporte VARCHAR(20) NULL,
  ususario VARCHAR(45) NOT NULL,
  senha VARCHAR(20) NOT NULL,
  PRIMARY KEY(id_usuario)
);

CREATE TABLE categoria (
  id_categoria INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  descricao INTEGER UNSIGNED NULL,
  PRIMARY KEY(id_categoria)
);

CREATE TABLE veiculo (
  id_veiculo INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  categoria_id_categoria INTEGER UNSIGNED NOT NULL,
  placa VARCHAR(20) NOT NULL,
  modelo VARCHAR(20) NOT NULL,
  ano_fabricacao INTEGER NOT NULL,
  cor VARCHAR(20) NOT NULL,
  marca VARCHAR(45) NOT NULL,
  PRIMARY KEY(id_veiculo),
  FOREIGN KEY(categoria_id_categoria)
    REFERENCES categoria(id_categoria)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
);

CREATE TABLE instrutor (
  id_instrutor INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  usuario_id_usuario INTEGER UNSIGNED NOT NULL,
  PRIMARY KEY(id_instrutor),
  FOREIGN KEY(usuario_id_usuario)
    REFERENCES usuario(id_usuario)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
);

CREATE TABLE turmas (
  id_aula_teorica INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  sala_id_sala INTEGER UNSIGNED NOT NULL,
  instrutor_id_instrutor INTEGER UNSIGNED NOT NULL,
  nome_turma VARCHAR(45) NOT NULL,
  data_inicio DATE NULL,
  data_fim DATE NULL,
  PRIMARY KEY(id_aula_teorica),
  FOREIGN KEY(instrutor_id_instrutor)
    REFERENCES instrutor(id_instrutor)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(sala_id_sala)
    REFERENCES sala(id_sala)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
);

CREATE TABLE aluno (
  id_aluno INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  turmas_id_aula_teorica INTEGER UNSIGNED NOT NULL,
  usuario_id_usuario INTEGER UNSIGNED NOT NULL,
  PRIMARY KEY(id_aluno),
  FOREIGN KEY(usuario_id_usuario)
    REFERENCES usuario(id_usuario)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(turmas_id_aula_teorica)
    REFERENCES turmas(id_aula_teorica)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
);

CREATE TABLE aula_pratica (
  id_aula INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  percurso_id_percurso INTEGER UNSIGNED NOT NULL,
  aluno_id_aluno INTEGER UNSIGNED NOT NULL,
  instrutor_id_instrutor INTEGER UNSIGNED NOT NULL,
  veiculo_id_veiculo INTEGER UNSIGNED NULL,
  tipo INTEGER UNSIGNED NOT NULL,
  data_aula DATE NULL,
  PRIMARY KEY(id_aula),
  FOREIGN KEY(veiculo_id_veiculo)
    REFERENCES veiculo(id_veiculo)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(instrutor_id_instrutor)
    REFERENCES instrutor(id_instrutor)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(aluno_id_aluno)
    REFERENCES aluno(id_aluno)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(percurso_id_percurso)
    REFERENCES percurso(id_percurso)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
);


