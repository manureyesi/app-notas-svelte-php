<?php

function dbConnect() {
    try {
        $configArray = parse_ini_file("config");
        $dbConnection = new PDO('mysql:dbname=' . $configArray["dbName"] . ';host=' . $configArray["dbHost"] .';charset=utf8', $configArray["dbUser"], $configArray["dbPassword"]);
        return $dbConnection;
    } catch (PDOException $e) {
        echo "Connection failed: " . $e->getMessage();
    }
}

// Actualizar nota
function actualizarNota ($contenido, $terminado, $id) {

    $dbLink = dbConnect();

    $query = $dbLink->prepare('UPDATE elementos_listas SET contenido = ?, terminado = ? WHERE id = ?');
    $array = array("$contenido", $terminado, $id);
    $query->execute($array);

}

function createNota($nombreNota) {

    $dbLink = dbConnect();

    $query = $dbLink->prepare('INSERT INTO etiquetas(nombre) VALUES (?) RETURNING id, nombre');
    $array = array("$nombreNota");
    $query->execute($array);
}


?>
