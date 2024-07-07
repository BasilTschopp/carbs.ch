<?php

class dbConnection {

    private $Host     = DB_HOST;
    private $User     = DB_USER;
    private $Password = DB_PASSWORD;
    private $Database = DB_NAME;
    private $Connection;

    public function __construct() {

        $this->Connection = new mysqli($this->Host, $this->User, $this->Password, $this->Database);

        if ($this->Connection->connect_error) {
            die('Error: ' . $this->Connection->connect_error);
        }
    }

    public function getConnection() {

        return $this->Connection;
    }
}

?>