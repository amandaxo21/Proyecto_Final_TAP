
	CREATE TABLE Cliente
	(
	Id_Cliente varchar(30) not null primary key, 
	Nombre varchar(60), 
	Telefono varchar(30), 
	FechaNacimiento date, 
	)

	insert into Cliente values ('OM01','Eric Otuño Moles',3411456733,'02/09/1999')
	insert into Cliente values ('CG02','Pablo Calleja Galvez',3411223345,'12/10/1990')
	insert into Cliente values ('AL03','Ximena Soledad Villanueva',3415597643,'3/25/1970')
	insert into Cliente values ('AL04','Octavia del Maza',3416095960,'01/13/1997')
	insert into Cliente values ('AL05','Luna Pizarro Guerra',3419751979,'10/05/1999')
	insert into Cliente values ('AL06','Melania Velázquez Palacios',3417991882,'05/12/2001')
	insert into Cliente values ('AL07','Viviana Rico Contreras',3414110640,'01/10/2009')
	insert into Cliente values ('AL08','Aureliano Jimenez Velázquez',3414074688,'01/11/2002')
	insert into Cliente values ('AL09','Francisco Jose Cárdenas Hernandez',3416386083,'09/23/2002')
	insert into Cliente values ('AL10','Aristides Méndez Iglesias',3417295129,'12/21/2003')
	insert into Cliente values ('AL11','Juan Carlos de Galiano Perez',3413059562,'08/05/1991')
	insert into Cliente values ('AL12','Daniela Gonzalez Expósito',3416053930,'09/30/2004')
	insert into Cliente values ('AL13','José Antonio Bastida',3418625723,'01/01/2007')
	insert into Cliente values ('AL14','Ivan Rosales Santana',3412698865,'10/25/1996')
	insert into Cliente values ('AL15','Miriam Franco Rivera',419775966,'06/29/2008')
	insert into Cliente values ('AL16','Rosario Velazquez Campos',3412628396,'11/04/2000')
	insert into Cliente values ('AL17','Alondra Carvajal Barrera',3416873007,'06/29/1999')
	insert into Cliente values ('AL18','Salvador Hernandez Suarez',3417715366,'12/01/1985')
	insert into Cliente values ('AL19','Cesar Del Toro Contreras',3414373045,'08/01/1996')
	insert into Cliente values ('AL20','Nora Villalobos Dominguez',3410713775,'04/3/2005')
	
	select * from Cliente
	drop table Cliente

	
	CREATE TABLE Usuario 
	(
	Id_Cliente varchar(30) FOREIGN KEY (Id_Cliente) REFERENCES Cliente (Id_Cliente) not null,
	Correo varchar(50),
	Contraseña varchar(15)
	)

	Select * from Usuario

	drop table Usuario


	Insert into Usuario values ('OM01','Willcarv007@hotmail.com', 'Quesopapa')
	Insert into Usuario values ('CG02', 'papes@hotmail.com', 'enchilaDas3')
	Insert into Usuario values ('AL03', 'xime@hotmail.com', '12345')


	CREATE TABLE Cita
	(
	IdCita varchar(30) not null primary key,
	FechaCita date,
	Hora varchar(6),
	Id_Cliente varchar(30) FOREIGN KEY (Id_Cliente)  REFERENCES Cliente (Id_Cliente) not null
	)

	Select * from Cita
	--drop table Cita
	Insert into Cita values ('Cita1', '01/02/23','2:00', 'OM01')
	Insert into Cita values ('Cita2', '01/03/23','6:30', 'CG02')
	Insert into Cita values ('Cita3', '01/04/23','3:00', 'AL03')
	Insert into Cita values ('Cita4', '01/05/23','9:30')
	Insert into Cita values ('Cita5', '01/06/23','6:00')
	Insert into Cita values ('Cita6', '01/07/23','7:30')


	CREATE TABLE Expediente
	(
	Id_Exp varchar(30) not null primary key,
	Id_Cliente varchar(30) FOREIGN KEY (Id_Cliente) REFERENCES Cliente (Id_Cliente) not null
	)

	Insert into Expediente values ('001', 'OM01')
	Insert into Expediente values ('002', 'CG02')
	Insert into Expediente values ('003', 'AL03')
	Insert into Expediente values ('004', 'OM01')

	Select * from Expediente



	CREATE TABLE Antecedentes
	(
	Id_Exp varchar(30) FOREIGN KEY (Id_Exp) REFERENCES Expediente (Id_Exp) not null,
	Alergia varchar(100),
	Analisis varchar(200),
	Enfermedades varchar(100)
	)

	Select * from Antecedentes
	Insert into Antecedentes values ('001', 'Camaron, cacahuates','Se realizara una extraccion de las muelas del juicio', 'Diabetes')
	Insert into Antecedentes values ('002', 'nueces','Se realizara un cambio de ligas', 'Enfermedadad en el corazon')
	Insert into Antecedentes values ('003', 'Piña','Se realizara una extraccion de un diente', 'Enfermedad cerebrovascular')
	Insert into Antecedentes values ('004', 'Anestesia','Se realizara una limpieza de rutina', 'Hipertension')

	--drop table Antecedentes


	CREATE TABLE Historial
	(
	Id_Exp varchar(30) FOREIGN KEY (Id_Exp) REFERENCES Expediente (Id_Exp) not null,
	Tratamiento varchar(200),
	Procedimientos varchar (200)
	)
	--drop table Historial

	Select * from Historial

	Insert into Historial values ('001','Hacer gargaras de agua con sal', 'Extraccion de muelas del juicio')
	Insert into Historial values ('002','Hacer gargaras de agua con sal', 'Extraccion de muelas del juicio')
	
		------PROCEDIMIENTOS------
	BEGIN
    SET p_existe = 0;
    SELECT COUNT(*) INTO p_existe
    FROM Usuarios
    WHERE nombre = p_usuario AND contraseña = p_contraseña;
END

BEGIN
    INSERT INTO Cita (fecha, hora, descripcion)
    VALUES (p_fecha, p_hora, p_descripcion);
END

BEGIN
    SET NOCOUNT ON;

    INSERT INTO Cliente (Id_Cliente, Nombre, Telefono, FechaNacimiento)
    VALUES (@Id_Cliente, @Nombre, @Telefono, @FechaNacimiento);
END

CREATE PROCEDURE InsertarUsuario
    @Id_Cliente varchar(30),
    @Correo varchar(50),
    @Contraseña varchar(15)
AS

BEGIN
    SET NOCOUNT ON;

    INSERT INTO Usuario (Id_Cliente, Correo, Contraseña)
    VALUES (@Id_Cliente, @Correo, @Contraseña);
END

BEGIN
    SET NOCOUNT ON;

    INSERT INTO Cita (IdCita, FechaCita, Hora, Id_Cliente)
    VALUES (@IdCita, @FechaCita, @Hora, @Id_Cliente);
END

BEGIN
    SET NOCOUNT ON;

    INSERT INTO Expediente (Id_Exp, Id_Cliente)
    VALUES (@Id_Exp, @Id_Cliente);
END

BEGIN
    SET NOCOUNT ON;

    INSERT INTO Antecedentes (Id_Exp, Alergia, Analisis, Enfermedades)
    VALUES (@Id_Exp, @Alergia, @Analisis, @Enfermedades);
END

BEGIN
    SET NOCOUNT ON;

    INSERT INTO Historial (Id_Exp, Tratamiento, Procedimientos)
    VALUES (@Id_Exp, @Tratamiento, @Procedimientos);
END


