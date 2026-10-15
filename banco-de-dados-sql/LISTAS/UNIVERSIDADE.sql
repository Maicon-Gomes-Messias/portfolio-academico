CREATE TABLE `UNIVERSIDADE`.`ALUNO`  (
  `mat_aluno` varchar(255) NOT NULL,
  `nome_aluno` varchar(255),
  `dt_nasc` date,
  `sexo` varchar(50),
  `cod_curso` int(255),
  PRIMARY KEY (`mat_aluno`)
);

CREATE TABLE `UNIVERSIDADE`.`CAMPUS`  (
  `id_campus` int(255) NOT NULL AUTO_INCREMENT,
  `CNPJ` varchar(255),
  `nome_campus` varchar(255),
  `endereco` varchar(255),
  PRIMARY KEY (`id_campus`)
);

CREATE TABLE `UNIVERSIDADE`.`CURRICULO`  (
  `cod_curso` int(255) NOT NULL,
  `cod_disciplina` int(255) NOT NULL,
  `periodo` int(255),
  PRIMARY KEY (`cod_curso`, `cod_disciplina`)
);

CREATE TABLE `UNIVERSIDADE`.`CURSO`  (
  `cod_curso` int(255) NOT NULL,
  `nome_curso` varchar(255),
  `qtd_semestre` int(255),
  `id_campus` int(255),
  PRIMARY KEY (`cod_curso`)
);

CREATE TABLE `UNIVERSIDADE`.`DISCIPLINA`  (
  `cod_disciplina` int(255) NOT NULL,
  `nome_disciplina` varchar(255),
  `ementa` varchar(255),
  `carga_horaria` float,
  PRIMARY KEY (`cod_disciplina`)
);

CREATE TABLE `UNIVERSIDADE`.`DISCIPLINA_CURSADA`  (
  `mat_aluno` varchar(255) NOT NULL,
  `cod_disciplina` int(255) NOT NULL,
  `frequencia` int(255),
  `nota` float,
  PRIMARY KEY (`mat_aluno`, `cod_disciplina`)
);

ALTER TABLE `UNIVERSIDADE`.`ALUNO` ADD CONSTRAINT `fk_ALUNO_CURSO_1` FOREIGN KEY (`cod_curso`) REFERENCES `UNIVERSIDADE`.`CURSO` (`cod_curso`);
ALTER TABLE `UNIVERSIDADE`.`CURRICULO` ADD CONSTRAINT `fk_CURRICULO_CURSO_1` FOREIGN KEY (`cod_curso`) REFERENCES `UNIVERSIDADE`.`CURSO` (`cod_curso`);
ALTER TABLE `UNIVERSIDADE`.`CURRICULO` ADD CONSTRAINT `fk_CURRICULO_DISCIPLINA_1` FOREIGN KEY (`cod_disciplina`) REFERENCES `UNIVERSIDADE`.`DISCIPLINA` (`cod_disciplina`);
ALTER TABLE `UNIVERSIDADE`.`CURSO` ADD CONSTRAINT `fk_CURSO_CAMPUS_1` FOREIGN KEY (`id_campus`) REFERENCES `UNIVERSIDADE`.`CAMPUS` (`id_campus`);
ALTER TABLE `UNIVERSIDADE`.`DISCIPLINA_CURSADA` ADD CONSTRAINT `fk_DISCIPLINA_CURSADA_ALUNO_1` FOREIGN KEY (`mat_aluno`) REFERENCES `UNIVERSIDADE`.`ALUNO` (`mat_aluno`);
ALTER TABLE `UNIVERSIDADE`.`DISCIPLINA_CURSADA` ADD CONSTRAINT `fk_DISCIPLINA_CURSADA_DISCIPLINA_1` FOREIGN KEY (`cod_disciplina`) REFERENCES `UNIVERSIDADE`.`DISCIPLINA` (`cod_disciplina`);
