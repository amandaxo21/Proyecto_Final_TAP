<?php
// Obtener los datos del formulario
$fecha = $_POST['fecha'];
$hora = $_POST['hora'];
$descripcion = $_POST['descripcion'];

// Conexión a la base de datos
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "agenda";

$conn = mysqli_connect($servername, $username, $password, $dbname);

// Verificar la conexión
if ($conn->connect_error) {
    die("Error de conexión: " . $conn->connect_error);
}

// Insertar la cita en la base de datos
$sql = "CALL agregar_cita('$fecha', '$hora', '$descripcion')";
$result = mysqli_query($conn, $sql);

if (!$result) {
    $error = mysqli_error($conn);
    echo "Error en la consulta SQL: " . $error;
    // Puedes realizar alguna acción adicional en caso de error, como registrar el error en un archivo de registro
}
if ($conn->query($sql) === TRUE) {
   
    echo "cita guardada.";
    header("index.html");
    exit();
} else {
    
    echo "Cita no guardada";

    header("index.html");
    // header("Location: index.php?error=" . urlencode($errorMessage));
    exit();
}

$conn->close();
?>
