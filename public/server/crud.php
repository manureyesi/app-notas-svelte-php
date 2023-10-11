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

function createNota($nombreNota) {

    $dbLink = dbConnect();

    $query = $dbLink->prepare('INSERT INTO etiquetas(nombre) VALUES (?) RETURNING id, nombre');
    $array = array("$nombreNota");
    $query->execute($array);
}


?>
