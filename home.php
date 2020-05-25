<?php
$i = 0;
require_once 'php/DBConnect.php';
$db = new DBConnect();
$db->auth();
// Search by Blood Group
if (isset($_POST['searchBtn'])) {
    $bloodGroup = $_POST['blood_group'];
    $city = $_POST['city'];
    $donors = $db->searchDonorWithBloodGroupCity($bloodGroup,$city);
}
//Search By City
//if (isset($_POST['searchByCityBtn'])) {
//    $city = $_POST['city'];
//    $donors = $db->searchDonorByCity($city);
//}
$title = "Home";
$setHomeActive = "active";
include 'layout/_header.php';

include 'layout/_top_nav.php';
?>
<div class="container">
    <div class="row">
        <div class="col-md-3"></div>
        <div class="col-md-6">
            <div class="form-group col-md-12">
                <form class="form-horizontal" method="post" action="home.php">
                    <div class="form-group">
                        <label class="col-sm-6">Search for Donor with Blood group and City </label>
                        <div class="col-sm-4">
                            <select name="blood_group" class="form-control">
                                <option value="O+">O+</option>
                                <option value="O-">O-</option>
                                <option value="A+">A+</option>
                                <option value="A-">A-</option>
                                <option value="B+">B+</option>
                                <option value="B-">B-</option>
                                <option value="AB+">AB+</option>
                                <option value="AB-">AB-</option>
                            </select>
                        </div>
                            <div class="col-sm-4">
                            <input type="text" name="city" value="" required="true" class="form-control"/>
                        </div>
                        <div class="col-sm-2">
                            <button class="btn btn-info btn-sm" name="searchBtn" >Search</button>
                        </div>
                    </div>
            </div>
        </div>
        <div class="col-md-3"></div>
    </div>

    <div class="row">
        <div class="col-md-1">         
        </div>
        <div class="col-md-10">
            <!-- If the donor is searched by a particular blood group -->
            <?php if(isset($_POST['searchBtn'])): ?>
                <?php if(isset($donors[0])): ?>
                    <label>Total Blood Units Available for <?= $donors[0]['b_type']; ?>:</label> <span class="emphasize"><?= count($donors); ?> Unit</span>
                <?php endif; ?>
            <?php endif; ?>
            
            <!-- If the donor is search by a particular City -->
            <?php if(isset($_POST['searchByCityBtn'])): ?>
                <?php if(isset($donors[0])): ?>
                    <label>Total Number of Donors in this City:</label> <span class="emphasize"><?= count($donors); ?></span>
                <?php endif; ?>
            <?php endif; ?>
            
            <!-- if result has been fetched succesffully -->
            <?php if (isset($donors)): ?>
                <table class="table table-condensed">
                    <tr>
                        <th>SL No</th>
                        <th>Name</th>
                        <th>Email</th>
                        <th>DOB</th>
                        <th>Gender</th>
                        <th>Blood Group</th>
                        <th>Address</th>
                        <th>City</th>
                        <th>Mobile</th>
                    <tr>
                        <?php foreach ($donors as $d): $i++; ?>
                        <tr class="<?php
                        if ($i % 2 == 0) {
                            echo "bg-success";
                        } else {
                            echo "bg-danger";
                        }
                        ?>" >
                            <td><?= $i; ?></td>
                            <td><a href="profile.php?id=<?= $d['id']; ?>"><?= $d['first_name'] ." ".$d['last_name']; ?></a></td>
                            <td><?= $d['email']; ?></td>
                            <td><?= $d['dob']; ?></td>
                            <td><?= $d['gender']; ?></td>
                            <td><?= $d['b_type']; ?></td>
                            <td><?= wordwrap($d['address'], 26,'<br>' ); ?></td>
                            <td><?= $d['city']; ?></td>
                            <td><?= $d['mobile']; ?></td>
                        </tr>
                    <?php endforeach; ?>
                </table>
            <?php endif; ?>
        </div>
        <div class="col-md-1"></div>
    </div>
</div>
<style>
    body {
        background-image: url('blood.jpg');
        background-repeat: no-repeat;
        background-attachment: fixed;
        background-size: 100% 100%;
    }
</style>
