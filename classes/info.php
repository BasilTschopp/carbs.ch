<?php

class dbInfo {

    private $connection;

    public function __construct() {

        $db = new dbConnection();
        $this->connection = $db->getConnection();

    }

    public function dbInfoText() {

        $Query  = "SELECT * FROM info_text WHERE Inactive = 0 ORDER BY OrderNumber ASC";
        $Result = $this->connection->query($Query);
        
        return $Result;

    }

}

?>