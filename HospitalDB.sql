-- =========================================
-- CREAR BASE DE DATOS
-- =========================================
CREATE DATABASE HospitalDB;
GO

USE HospitalDB;
GO

-- =========================================
-- TABLA 1: PACIENTES
-- =========================================
CREATE TABLE Pacientes (
    id_paciente INT IDENTITY(1,1) PRIMARY KEY,
    nombre VARCHAR(100),
    apellido VARCHAR(100),
    fecha_nacimiento DATE,
    telefono VARCHAR(20),
    direccion VARCHAR(150)
);

-- =========================================
-- TABLA 2: DOCTORES
-- =========================================
CREATE TABLE Doctores (
    id_doctor INT IDENTITY(1,1) PRIMARY KEY,
    nombre VARCHAR(100),
    especialidad VARCHAR(100),
    telefono VARCHAR(20)
);

-- =========================================
-- TABLA 3: ESPECIALIDADES
-- =========================================
CREATE TABLE Especialidades (
    id_especialidad INT IDENTITY(1,1) PRIMARY KEY,
    nombre VARCHAR(100)
);

-- =========================================
-- TABLA 4: CITAS
-- =========================================
CREATE TABLE Citas (
    id_cita INT IDENTITY(1,1) PRIMARY KEY,
    id_paciente INT,
    id_doctor INT,
    fecha DATE,
    hora TIME,
    motivo VARCHAR(200),
    FOREIGN KEY (id_paciente) REFERENCES Pacientes(id_paciente),
    FOREIGN KEY (id_doctor) REFERENCES Doctores(id_doctor)
);

-- =========================================
-- TABLA 5: HISTORIAL MEDICO
-- =========================================
CREATE TABLE HistorialMedico (
    id_historial INT IDENTITY(1,1) PRIMARY KEY,
    id_paciente INT,
    diagnostico VARCHAR(200),
    tratamiento VARCHAR(200),
    fecha DATE,
    FOREIGN KEY (id_paciente) REFERENCES Pacientes(id_paciente)
);

-- =========================================
-- TABLA 6: HABITACIONES
-- =========================================
CREATE TABLE Habitaciones (
    id_habitacion INT IDENTITY(1,1) PRIMARY KEY,
    numero INT,
    tipo VARCHAR(50),
    estado VARCHAR(50)
);

-- =========================================
-- TABLA 7: INTERNACIONES
-- =========================================
CREATE TABLE Internaciones (
    id_internacion INT IDENTITY(1,1) PRIMARY KEY,
    id_paciente INT,
    id_habitacion INT,
    fecha_ingreso DATE,
    fecha_salida DATE,
    FOREIGN KEY (id_paciente) REFERENCES Pacientes(id_paciente),
    FOREIGN KEY (id_habitacion) REFERENCES Habitaciones(id_habitacion)
);

-- =========================================
-- INSERTAR DATOS
-- =========================================

-- PACIENTES
INSERT INTO Pacientes VALUES
('Juan', 'Perez', '1990-05-10', '3001234567', 'Medellín'),
('Maria', 'Gomez', '1985-08-22', '3019876543', 'Bogotá'),
('Carlos', 'Lopez', '2000-01-15', '3024567890', 'Cali');

-- DOCTORES
INSERT INTO Doctores VALUES
('Dr. Ramirez', 'Cardiología', '3101112233'),
('Dra. Torres', 'Pediatría', '3102223344'),
('Dr. Silva', 'Dermatología', '3103334455');

-- ESPECIALIDADES
INSERT INTO Especialidades VALUES
('Cardiología'),
('Pediatría'),
('Dermatología');

-- CITAS
INSERT INTO Citas VALUES
(1, 1, '2026-04-20', '08:00', 'Chequeo general'),
(2, 2, '2026-04-21', '10:30', 'Control pediátrico'),
(3, 3, '2026-04-22', '14:00', 'Problema de piel');

-- HISTORIAL MEDICO
INSERT INTO HistorialMedico VALUES
(1, 'Hipertensión', 'Medicamentos', '2026-04-01'),
(2, 'Gripe', 'Reposo', '2026-04-05'),
(3, 'Alergia', 'Antihistamínicos', '2026-04-10');

-- HABITACIONES
INSERT INTO Habitaciones VALUES
(101, 'Individual', 'Disponible'),
(102, 'Doble', 'Ocupada'),
(103, 'UCI', 'Disponible');

-- INTERNACIONES
INSERT INTO Internaciones VALUES
(1, 2, '2026-04-01', '2026-04-05'),
(2, 3, '2026-04-03', NULL);


-- CONSULTAS

SELECT * FROM Pacientes;
SELECT nombre, telefono FROM Pacientes;

SELECT
    P.nombre AS Paciente,
    D.nombre AS Doctor,
    C.fecha,
    C.hora,
    C.motivo
FROM Citas C
JOIN Pacientes P ON C.id_paciente = P.id_paciente
JOIN Doctores D ON C.id_doctor = D.id_doctor;

SELECT
    P.nombre,
    H.diagnostico,
    H.tratamiento,
    H. fecha
FROM HistorialMedico H
JOIN Pacientes P ON H.id_paciente = P.id_paciente
WHERE P.nombre = 'Juan';

SELECT COUNT(*) AS TotalPacientes FROM Pacientes;

SELECT * FROM Habitaciones
WHERE estado = 'Disponible';

SELECT
    P.nombre,
    H.numero AS Habitacion,
    I.fecha_ingreso
FROM Internaciones I
JOIN Pacientes P ON I.id_paciente = P.id_paciente
JOIN Habitaciones H ON I.id_habitacion = H.id_habitacion
WHERE I.fecha_salida IS NULL;

SELECT
    D.nombre AS Doctor,
    COUNT(C.id_cita) AS TotalCitas
FROM Doctores D
LEFT JOIN Citas C ON D.id_doctor = C.id_doctor
GROUP BY D.nombre;


