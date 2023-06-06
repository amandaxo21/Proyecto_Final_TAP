<?php
// Establecer la conexión con la base de datos
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "agenda";

$conn = mysqli_connect($servername, $username, $password, $dbname);


// Verificar la conexión
if ($conn->connect_error) {
    die("Error al conectar con la base de datos: " . $conn->connect_error);
}

// Definir el usuario y contraseña a verificar

$usuario = $_POST['username']; // Obtener el valor del campo de entrada del usuario
$contraseña = $_POST['password'];

// Llamar al procedimiento almacenado
$sql = "CALL VerificarUsuario('$usuario', '$contraseña', @existe)";
$result = $conn->query($sql);

// Obtener el resultado del procedimiento almacenado
$sql = "SELECT @existe";
$result = $conn->query($sql);
$row = $result->fetch_assoc();
$existe = $row["@existe"];

if ($existe == 1) {
    echo "El usuario y contraseña existen en la base de datos.";
    //window.location.href = "agenda.html";
    header("agenda.html");
} else {
    echo "El usuario y contraseña no existen en la base de datos.";
    header("index.html");
}

// Cerrar la conexión
$conn->close();
?>