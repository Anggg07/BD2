CREATE DATABASE TablasNormalizacion

USE TablasNormalizacion

CREATE TABLE restaurante (
    id INT PRIMARY KEY,
    nombre VARCHAR(100),
    direccion VARCHAR(100),
    ciudad VARCHAR(50),
    platos VARCHAR(255),
    chef VARCHAR(100),
    telefono BIGINT
);

INSERT INTO restaurante VALUES
(1, 'La Parrilla', 'Calle 10 #20', 'Medellín', 'Pizza, Pasta', 'Carlos Piña', 3127893405),
(2, 'El Sabor', 'Av. 33 #45', 'Bogotá', 'Hamburguesa, Papas', 'Isaac Flores', 3450812467),
(3, 'Tierra Querida', 'Cra 22 #15', 'Cali', 'Arepa, Empanada', 'Ana Lopera', 3134023974),
(4, 'Animal', 'Calle 5 #30', 'Medellín', 'Sushi, Ramen, Tempura', 'Sofia Torres', 3234184653),
(5, 'Gourmet house', 'Av. 80 #12', 'Bogotá', 'Pollo, Arroz', 'Valeria Giraldo', 3122441105);

CREATE TABLE colegio (
    id INT PRIMARY KEY,
    nombre VARCHAR(100),
    direccion VARCHAR(100),
    ciudad VARCHAR(50),
    cursos VARCHAR(255),
    rector VARCHAR(100),
    telefono BIGINT
);

INSERT INTO colegio VALUES
(1, 'San José', 'Cra 45 #12', 'Bogotá', 'Matemáticas, Inglés', 'Marta Gomez', 3101112222),
(2, 'Ferrini', 'Calle 20 #5', 'Medellín', 'Historia, Química', 'Kely Serpa', 3202223333),
(3, 'La Salle', 'Av. 33 #10', 'Cali', 'Física, Biología', 'Angie Lopera', 3004445555),
(4, 'San Ignacio', 'Cra 12 #8', 'Bogotá', 'Español, Filosofía', 'Melissa Torres', 3116667777),
(5, 'Montessori', 'Calle 50 #22', 'Medellín', 'Arte, Música, Educación Física', 'Ashley Restrepo', 3128889999);

CREATE TABLE clinica (
    id INT PRIMARY KEY,
    nombre VARCHAR(100),
    direccion VARCHAR(100),
    ciudad VARCHAR(50),
    especialidades VARCHAR(255),
    director_medico VARCHAR(100),
    telefono BIGINT
);

INSERT INTO clinica VALUES
(1, 'Vid', 'Av. 33 #45', 'Medellín', 'Pediatría, Cardiología', 'Kenda Sotf', 3101112222),
(2, 'Pablo Tobón', 'Cra 12 #8', 'Bogotá', 'Dermatología, Cirugía', 'Sofia Hernandez', 3109998888),
(3, 'San Rafael', 'Calle 40 #22', 'Cali', 'Ginecología, Obstetricia', 'Miguel Arismendi', 3205556666),
(4, 'La Esperanza', 'Cra 18 #10', 'Medellín', 'Neurología, Psiquiatría', 'Juliana Betancur', 3117778888),
(5, 'Bienestar', 'Av. 60 #25', 'Bogotá', 'Ortopedia, Medicina General', 'Andrés López', 3129990000);


