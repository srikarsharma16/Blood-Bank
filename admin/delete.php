<?php
$id = $_GET['id'];
if (isset($_POST['yesBtn'])) {
    require_once 'php/DBConnect.php';
    $db = new DBConnect();
    $id = $_POST['id'];
    $flag = $db->remove($id);

    if ($flag) {
        header("Location: http://localhost/online-blood-bank-management-system-in-php-master/admin/employee.php");
    }
}
if (isset($_POST['noBtn'])) {
    header("Location: http://localhost/online-blood-bank-management-system-in-php-master/admin/employee.php");
}

$title = "Remove Employee";
include 'layout/_header.php';
?>

<div class="container">
    <div class="row">
        <div class="col-md-3"></div>
        <div class="col-md-6">
            <div class="panel panel-danger">
                <div class="panel-heading">
                    <h5>Are you sure you want to remove this employee from the database!!!</h5>
                </div>
                <div class="panel-body">
                    <center>
                        <div class="form-group">
                            <form method="post" action="delete.php">
                                <input type="hidden" name="id" value="<?= $id; ?>" />
                                <button class="btn btn-danger btn-lg" type="submit" name="yesBtn">YES</button>
                                <button class="btn btn-success btn-lg" type="submit" name="noBtn">NO</button>
                            </form>
                        </div>
                    </center>
                </div>
            </div>
        </div>
        <div class="col-md-3"></div>
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
