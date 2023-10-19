<?php

    include "crud.php";

    // Comprobar authorization
    if (!isset($_POST["Authorization"]) && $_POST["Authorization"] == "abc123.") {
        $data = array("error" => "El campo Authorización non é correcto", "exception" => "");
    } else {

        if ($_GET["api"] == "/api/crear/nota") {

            try {
                actualizarNota($_POST["contenido"], $_POST["terminado"], $_POST["id"]);
            } catch (Exception $e) {
                $data = array("error" => "Error al actualizar nota", "exception" => $e);
            }

        } else if ($_GET["api"] == "/api/crear/") {

        }

    }

    header("Content-Type: application/json");
    echo json_encode($data);

?>
