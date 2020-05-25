<?php
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of DBConnect
 *
 * @author srikar
 */
class DBConnect {
    private $db = NULL;

    const DB_SERVER = "localhost";
    const DB_USER = "root";
    const DB_PASSWORD = "srikar";
    const DB_NAME = "donor";

    public function __construct() {
        $dsn = 'mysql:dbname=' . self::DB_NAME . ';host=' . self::DB_SERVER;
        try {
            $this->db = new PDO($dsn, self::DB_USER, self::DB_PASSWORD);
        } catch (PDOException $e) {
            throw new Exception('Connection failed: ' .
            $e->getMessage());
        }
        return $this->db;
    }
    
    public function getDonorsByBloodType($bloodType){
        $stmt = $this->db->prepare("SELECT * FROM users WHERE b_type LIKE ?");
        $stmt->execute(["%".$bloodType."%"]);
        return $stmt->fetchAll();
    }

    public function bloodrequest($firstName,$lastName,$gender,$bType,$unitblood,$hospitaladdress,$city,$pincode,$doctorName,$contactName,$address,$dob,$email,$mobile,$reasonblood)
    {
        $stmt = $this->db->prepare("INSERT INTO blood_request 
            (firstName,lastName,gender,blood_group,unitblood,hospitaladdress,city,pincode,doctorName,contactName,address,dob,email,mobile,reasonblood) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");

        $stmt->execute([$firstName,$lastName,$gender,$bType,$unitblood,$hospitaladdress,$city,$pincode,$doctorName,$contactName,$address,$dob,$email,$mobile,$reasonblood]);
        return true;
    }

    public function registerUser($firstName,$lastName,$email,$dob,$gender,$b_type,$address,$city,$mobile){
        $stmt = $this->db->prepare("INSERT INTO users (first_name,last_name,email,dob,gender,b_type,address,city,mobile) VALUES (?,?,?,?,?,?,?,?,?)");
        $stmt->execute([$firstName,$lastName,$email,$dob,$gender,$b_type,$address,$city,$mobile]);
        return true;
    }
    public function getOrganisationmember(){
        $stmt = $this->db->prepare("SELECT * FROM member_admin");
        $stmt->execute();
        return $stmt->fetchAll();
    }
    
    public function getUsers(){
        $stmt = $this->db->prepare("SELECT * FROM users");
        $stmt->execute();
        return $stmt->fetchAll();
    }

    public function getBloodbank(){
        $stmt = $this->db->prepare("SELECT * FROM blood_banks");
        $stmt->execute();
        return $stmt->fetchAll();
    }
    
    public function getrequest(){
        $stmt = $this->db->prepare("SELECT * FROM blood_request");
        $stmt->execute();
        return $stmt->fetchAll();
    }
    
    
    
}
