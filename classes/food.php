<?php

class dbFood {

    private $connection;

    public function __construct() {

        $db = new dbConnection();
        $this->connection = $db->getConnection();

    }

    public function dbItems() {

        $Query  = "SELECT ";
        $Query .= "i.*, ";
        $Query .= "u.UnitName, ";
        $Query .= "GROUP_CONCAT(s.ServingName) AS ArrayServingName, ";
        $Query .= "GROUP_CONCAT(s.ServingSize) AS ArrayServingSize, ";
        $Query .= "(SELECT COUNT(s2.ServingSize) FROM items_servings s2 WHERE FIND_IN_SET(s2.ID, i.ServingID) > 0) AS CountServings ";
        $Query .= "FROM items_food i ";
        $Query .= "LEFT JOIN items_units u ON u.ID = i.UnitID ";
        $Query .= "LEFT JOIN items_servings s ON FIND_IN_SET(s.ID, i.ServingID) > 0 ";
        $Query .= "WHERE i.Inactive = 0 ";
        $Query .= "GROUP BY i.ID "; 
        $Query .= "ORDER BY i.ItemName ASC";

        $Result = $this->connection->query($Query);
        
        return $Result;

    }

    public function dbItem($ItemID) {

        $Query  = "SELECT ";
        $Query .= "i.*, ";
        $Query .= "u.UnitName, ";
        $Query .= "(SELECT COUNT(s.ServingSize) FROM items_servings s WHERE FIND_IN_SET(s.ID, i.ServingID) > 0) AS CountServings ";
        $Query .= "FROM items_food i ";
        $Query .= "LEFT JOIN items_units u ON u.ID = i.UnitID ";
        $Query .= "LEFT JOIN items_servings s ON FIND_IN_SET(s.ID, i.ServingID) > 0 ";
        $Query .= "WHERE i.ID = ".$ItemID." ";
        $Query .= "GROUP BY i.ID "; 

        $Result = $this->connection->query($Query);
        
        return $Result;
        
    }

    public function dbServings($ItemID) {

        $Query  = "SELECT ";
        $Query .= "s.ID, s.ServingName, s.ServingSize, u.UnitName ";
        $Query .= "FROM items_food i ";
        $Query .= "LEFT JOIN items_units u ON u.ID = i.UnitID ";
        $Query .= "INNER JOIN items_servings s ON FIND_IN_SET(s.ID, i.ServingID) > 0 ";
        $Query .= "WHERE i.ID = ".$ItemID." ";
        $Query .= "ORDER BY s.ServingSize ASC "; 

        $Result = $this->connection->query($Query);
        
        return $Result;

    }
}

?>