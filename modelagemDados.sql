create table editoras (
  id serial primary key,
  nome text not null,
  cnpj text unique,
  data_de_cadastro timestamp default now()
);

insert into editoras ( nome, cnpj) values ('Cubos Academy', '11223344556');

create table livros (
  isbn integer primary key,
  editora_id integer references editoras(id),
  titulo text not null,
  data_publicacao date not null
 );
 
 insert into livros (isbn, editora_id, titulo, data_publicacao) 
values
('12335', 1, 'Basico Node.js', '2021-10-04');
 
 create table enderecos (
 id serial primary key,
 editora_id integer references editoras(id),
 cep text not null,
 rua text,
 bairro text,
 cidade text,
 estado char(2),
 pais text
 );
 
 insert into enderecos ( editora_id, cep )
values (1, '44420000');


 create table categorias (
 id serial primary key,
 nome text not null
 );
 
 insert into categorias (nome) values ('Tecnologia'), ('Programação'), ('Nodejs');
 
 create table livro_categorias (
 livro_isbn integer references livros(isbn),
 categoria_id integer references categorias(id)
 );
 
insert into livro_categorias 
  (livro_isbn, categoria_id)
  values
  (12345, 1),
  (12345, 2),
  (12345, 3),
  (12335, 2);


  create table comentarios (
  id serial primary key,
  descricao text not null,
  comentario_id integer references comentarios(id),
  livro_isbn integer references livros(isbn)
  );
  
  insert into comentarios (livro_isbn, descricao ) values (12345, 'Livro excelente!');
  
  insert into comentarios (comentario_id, descricao ) values (1, 'Obrigado pelo elogio!');
  
  --edição de tabelas banco de dados
  
  alter table categorias add column descricao text; --add coluna 
  
  alter table categorias drop column descricao; --deletar coluna
  
  alter table categorias alter column descricao type varchar(100); --trocando o tipo da coluna
  
  create table telefones (
  id serial primary key,
    editora_id integer,
    numero text
  );
  
  alter table telefones 
  add constraint fk_telefones_editoras 
  foreign key (editora_id) references editoras(id); --adicionando foreign key