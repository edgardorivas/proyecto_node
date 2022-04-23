DROP DATABASE IF EXISTS proyecto_node;
CREATE DATABASE proyecto_node;
USE proyecto_node;
/*-*/

CREATE TABLE usuario (
    id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL,
    clave  VARCHAR(40) NOT NULL,
    rol  ENUM('ADMI','USUARIO') DEFAULT 'USUARIO',
    fecha_creacion DATE NOT NULL
    
)ENGINE=innoDB;

/*-*/
CREATE TABLE cuenta_instagram(
    id int UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    cantidad_post int UNSIGNED,
    numero_historia int UNSIGNED,
    cantidad_like int UNSIGNED,
    cantidad_comentario int UNSIGNED,
    veces_guardados int UNSIGNED,
    veces_compartidas int UNSIGNED,
    cantidad_impresiones int UNSIGNED,
    seguidores int UNSIGNED,
    usuarios_ID int UNSIGNED not null,

    CONSTRAINT id_usuarios
    FOREIGN KEY(usuarios_ID)
    REFERENCES usuario(id)
    ON UPDATE CASCADE
    ON DELETE CASCADE

    
    
)ENGINE=innoDB;
/*-*/
CREATE TABLE publicaciones(
    id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    visitas_perfil int UNSIGNED,
    descubrimiento varchar (100),
    impresiones_hashtaghs varchar(100),
    impresione_perfil varchar(100),
    nuevos_seguidores int UNSIGNED,
    reacciones int UNSIGNED,
    comentarios int UNSIGNED,
    guardados int UNSIGNED,
    direct varchar (100)not null,
    cuenta_instagram_publicaciones_ID int UNSIGNED not null,

    CONSTRAINT id_cuenta_instagram_publicaciones_ID
    FOREIGN KEY(cuenta_instagram_publicaciones_ID)
    REFERENCES cuenta_instagram(id)
    ON UPDATE CASCADE
    ON DELETE cascade


)ENGINE=innoDB;


/*-*/

CREATE TABLE hashtag(
    id int UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    nombre varchar(20) NOT NULL,
    descripcion varchar(100)
    /*categoria:no la veo necesaria ya que esta seria 
    la references de la tabla categoria,
    no se a que se refiere con ir*/
)ENGINE=innoDB;
/*-*/

CREATE TABLE categoria(
    id TINYINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(30) NOT NULL,
    descripcion TEXT

)ENGINE=innoDB;


CREATE TABLE categoria_hashtag(
    id int UNSIGNED PRIMARY key AUTO_INCREMENT,
    categoria_ID TINYINT UNSIGNED not null,
    hashtag_piv_ID int  UNSIGNED not null,

    CONSTRAINT id_categoria_ID
    FOREIGN KEY(categoria_ID)
    REFERENCES categoria(id)
    ON UPDATE CASCADE
    ON DELETE restrict,

    CONSTRAINT id_hashtag_piv_ID
    FOREIGN KEY(hashtag_piv_ID)
    REFERENCES hashtag(id)
    ON UPDATE CASCADE
    ON DELETE restrict


)ENGINE=innoDB;
/*-*/

CREATE TABLE plantilla(
    id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    descripcion VARCHAR(100) ,
    imagen_url VARCHAR (150),/*borre hashtag por innecesario esperar respuesta de francis*/
    usuario_id_plantilla int UNSIGNED not null,
    

    CONSTRAINT idusuario_id_plantilla
    FOREIGN KEY(usuario_id_plantilla)
    REFERENCES usuario(id)
    ON UPDATE CASCADE
    ON DELETE restrict

)ENGINE=innoDB;
/*-*/

CREATE TABLE hashtag_plantilla(
    id int UNSIGNED PRIMARY key AUTO_INCREMENT,
    plantilla_ID int UNSIGNED not null,
    hashtag_ID int  UNSIGNED not null,

    CONSTRAINT id_plantilla_ID
    FOREIGN KEY(plantilla_ID)
    REFERENCES plantilla(id)
    ON UPDATE CASCADE
    ON DELETE cascade,

    CONSTRAINT id_hashtag_ID
    FOREIGN KEY(hashtag_ID)
    REFERENCES hashtag(id)
    ON UPDATE CASCADE
    ON DELETE cascade


)ENGINE=innoDB;
/*-*/
CREATE TABLE resultados_comparacion(
    id int UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    puntuacion_total int NOT NULL,
    cuenta_instagram_com_ID  int UNSIGNED not null,/*relacion*/

    CONSTRAINT id_cuenta_instagram_com_ID
    FOREIGN KEY(cuenta_instagram_com_ID)
    REFERENCES cuenta_instagram(id)
    ON UPDATE CASCADE
    ON DELETE restrict
)ENGINE=innoDB;
/*-*/
CREATE TABLE comparacion_cuentas(
    id int UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    cuenta_instagram_pivot_ID  int UNSIGNED not null,/*relacion*/
    resultados_comparacion_pivot_ID int UNSIGNED not null,

    CONSTRAINT id_cuenta_instagram_pivot
    FOREIGN KEY(cuenta_instagram_pivot_ID)
    REFERENCES cuenta_instagram(id)
    ON UPDATE CASCADE
    ON DELETE restrict,

    CONSTRAINT id_resultados_comparacion_pivot_ID
    FOREIGN KEY(resultados_comparacion_pivot_ID)
    REFERENCES resultados_comparacion(id)
    ON UPDATE CASCADE
    ON DELETE restrict
)ENGINE=innoDB;


 
                                      
create table departamento(                             
    id int UNSIGNED primary key AUTO_INCREMENT,        
    nombre_departamento varchar(100) not null          
)ENGINE=innoDB;                                        
                                                       
create table usuario_departamento(                     
    id int UNSIGNED primary key AUTO_INCREMENT,          
    id_departamento int UNSIGNED not null,                      
    id_usuario int UNSIGNED not null,                          
                                                      
    CONSTRAINT id_departamento_ID                      
    FOREIGN key(id_departamento)                       
    references departamento(id)
    on update cascade
    on delete restrict,

    CONSTRAINT id_Usuario_ID
    FOREIGN KEY (id_usuario)
    references usuario(id)
    on update cascade
    on delete cascade
)ENGINE=innoDB;

create table tarea(
    id int UNSIGNED primary key AUTO_INCREMENT,
    titulo varchar(100) not null,
    descripcion text not null,
    fecha_publicacion date not null,
    fecha_entrega date not null,
    estado TINYINT(1) default 0 not null,
    dirigido varchar(50) ,
    archivo varchar(100) ,
    id_usuario_departamento int UNSIGNED not null,

    CONSTRAINT id_usuario_departamento_ID
    FOREIGN key(id_usuario_departamento)
    REFERENCES usuario_departamento(id)
    on UPDATE cascade
    on DELETE cascade

)ENGINE=innoDB;

create table tipo_historial(

    id int  unsigned AUTO_INCREMENT primary key,
    nombre varchar(100) not null,
    descripcion text

)ENGINE=innoDB;

create table historial(
    id int unsigned primary key AUTO_INCREMENT,
    id_usuario_his INT UNSIGNED not null,
    id_tipo_historial int  unsigned not null,
    fecha_ejecucion DATETIME  not null,
    data_modificada text not null,
    estatus ENUM('EXITOSO','FALLIDO') not null,
    descripcion text ,

    CONSTRAINT id_usuario_historial_ID
    FOREIGN key(id_usuario_his)
    REFERENCES usuario(id)
    on UPDATE cascade
    on DELETE cascade,

    CONSTRAINT id_tipo_historial_ID
    FOREIGN key(id_tipo_historial)
    REFERENCES tipo_historial(id)
    on UPDATE cascade
    on DELETE restrict

)ENGINE=innoDB;

CREATE OR REPLACE VIEW vista_historial AS 
SELECT 
h.id, 
u.nombre as nombre_usuario, 
t.nombre, 
t.descripcion as sentencia_descipcion, 
h.fecha_ejecucion, 
h.data_modificada, 
h.estatus, 
h.descripcion 
FROM historial h 
INNER JOIN usuario u ON h.id_usuario_his = u.id 
INNER JOIN tipo_historial t ON t.id = h.id_tipo_historial;

CREATE OR REPLACE VIEW vista_plantilla AS
SELECT
p.id as id,
p.caption as caption,
p.imagen_url as imagen,
h.nombre as hashtag,
u.nombre as responsable
FROM hashtag_plantilla hp
INNER JOIN plantilla p ON hp.plantilla_ID = p.id
INNER JOIN usuario u ON p.usuario_id_plantilla = u.id
INNER JOIN hashtag h ON hp.hashtag_ID = h.id;