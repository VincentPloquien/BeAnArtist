<?php


class Database
{
    private $mysqli;

    private function connect() {
        $CONFIG = require(__DIR__ . "/config.php");
        $this->mysqli = new mysqli($CONFIG["db_adress"], $CONFIG["db_login"], $CONFIG["db_password"], $CONFIG["db_name"]);
        $this->mysqli->set_charset("utf8");
    }

    public function getDB() {
        if ($this->mysqli === NULL) {
            $this->connect();
        }

        return $this->mysqli;
    }

    public function _destruct() {
        $this->mysqli->close();
        unset($this->mysqli);
    }
}
