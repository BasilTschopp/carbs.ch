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
        // Prepare the SQL query with placeholders
        $Query = "
            SELECT i.*, 
                   u.UnitName, 
                   (SELECT COUNT(s.ServingSize) 
                    FROM items_servings s 
                    WHERE FIND_IN_SET(s.ID, i.ServingID) > 0) AS CountServings 
            FROM items_food i 
            LEFT JOIN items_units u ON u.ID = i.UnitID 
            LEFT JOIN items_servings s ON FIND_IN_SET(s.ID, i.ServingID) > 0 
            WHERE i.ID = ? 
            GROUP BY i.ID";
        
        // Prepare the statement
        if ($stmt = $this->connection->prepare($Query)) {
            // Bind the $ItemID parameter to the placeholder
            $stmt->bind_param("i", $ItemID);
    
            // Execute the statement
            $stmt->execute();
    
            // Get the result
            $Result = $stmt->get_result();
    
            // Return the result
            return $Result;
        } else {
            // Handle query preparation error
            return false;
        }
    }

    public function dbServings($ItemID) {
        // Prepare the SQL query with placeholders
        $Query = "
            SELECT s.ID, s.ServingName, s.ServingSize, u.UnitName
            FROM items_food i
            LEFT JOIN items_units u ON u.ID = i.UnitID
            INNER JOIN items_servings s ON FIND_IN_SET(s.ID, i.ServingID) > 0
            WHERE i.ID = ?
            ORDER BY s.ServingSize ASC";
    
        // Prepare the statement
        if ($stmt = $this->connection->prepare($Query)) {
            // Bind the $ItemID parameter to the placeholder
            $stmt->bind_param("i", $ItemID);
    
            // Execute the statement
            $stmt->execute();
    
            // Get the result
            $Result = $stmt->get_result();
    
            // Return the result
            return $Result;
        } else {
            // Handle query preparation error
            return false;
        }
    }
}
?>
