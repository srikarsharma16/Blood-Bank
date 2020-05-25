<?php
require_once 'php/DBConnect.php';
$db = new DBConnect();
$db->auth();

$employees = $db->getEmployees();

$title="Employee"; $setEmployeeActive="active";
include 'layout/_header.php'; 
include 'layout/navbar.php';

?>

<div class="container">
    <div class="row">
        <div class="panel panel-default">
            <div class="panel-heading">
                <h5>Employees List</h5>
            </div>
            <div class="panel-body">
                <?php if(isset($employees)): ?>
                <table class="table table-condensed">
                    <thead>
                    <th>Name</th>
                    <th>Username</th>
                    <th>Password</th>
                    <th>Date Of Birth</th>
                    <th>Employee ID</th>
                    <th>Designation</th>
                    <th>Landline</th>
                    <th>Mobile</th>
                    </thead>
                    
                    <tbody>
                        <?php foreach($employees as $e): ?>
                        <tr>
                            <td><?= $e['f_name']." ".$e['m_name']." ".$e['l_name']; ?></td>
                            <td><?= $e['username']; ?></td>
                            <td><?= $e['password']; ?></td>
                            <td><?= $e['b_day']; ?></td>
                            <td><?= $e['prc_nr']; ?></td>
                            <td><?= $e['designation']; ?></td>
                            <td><?= $e['landline']; ?></td>
                            <td><?= $e['mobile_nr']; ?></td>
                            <td><a href="edit.php?id=<?= $e['id']; ?>">Edit</a></td>
                            <td><a href="delete.php?id=<?= $e['id']; ?>">Delete</a></td>    
                        </tr>
                        <?php endforeach; ?>
                    </tbody>
                </table>
                <?php endif; ?>
            </div>
        </div>
                 
    </div>
</div>
<style>
    body {
        background-image: url('assets/adminwallpaper.jpg');
        background-repeat: no-repeat;
        background-attachment: fixed;
        background-size: 100% 100%;
    }
</style>


