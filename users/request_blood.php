<?php
if (isset($_POST['submitBtn'])) {
    $firstName = $_POST['firstName'];
    $lastName = $_POST['lastName'];
    $gender = $_POST['gender'];
    $bType = $_POST['blood_group'];
    $unitblood = $_POST['unitblood'];
    $hospitaladdress = $_POST['hospitaladdress'];
    $city = $_POST['city'];
    $pincode = $_POST['pincode'];
    $doctorName = $_POST['doctorName'];
    $contactName = $_POST['contactName'];
    $address = $_POST['address'];
    $dob = $_POST['dob'];
    $email = $_POST['email'];
    $mobile = $_POST['mobile'];
    $reasonblood = $_POST['reasonblood'];
    
    require_once 'php/DBConnect.php';
    $db = new DBConnect();
    $flag = $db->bloodrequest($firstName, $lastName, $gender, $bType, $unitblood, $hospitaladdress, $city, $pincode, $doctorName, $contactName, $address, $dob, $email, $mobile, $reasonblood);
    
    if($flag){
        $success = "Your Blood request is sent.Donor will contact you soon";
    } else {
        $message = "There was some technical error. Try again!";
    }
}
$title = "Request Blood";
$setNeedBloodActive = "active";
include 'layout/_header.php';

include 'layout/navbar.php';
?>

<div class="container">
    <div class="col-md-3"></div>
    <div class="col-md-6">
        
        <?php if(isset($success)): ?>
        <div class="alert-success fade-out-5"><?= $success; ?></div>
        <?php endif; ?>
        <?php if(isset($message)): ?>
        <div class="alert-danger fade-out-5"><?= $message; ?></div>
        <?php endif; ?>
        
        <div class="panel panel-info">
            <div class="panel-heading">
                <div class="col-md-3">
                    <img src="assets/request_blood.jpg" class="img img-responsive">
                </div>
                <p>Need Blood To Save Lifes</p>               
            </div>
            <div class="panel-body">
                <form method="post" action="request_blood.php" class="form-horizontal">
                    <div class="form-group">
                        <label class="col-md-4 form-label">Patient Name</label>
                        <div class="col-md-4">
                            <input type="text" name="firstName" class="form-control" placeholder="First Name" required="true">
                        </div>
                        <div class="col-md-4">
                            <input type="text" name="lastName" class="form-control" placeholder="Last Name" required="true">
                        </div>
                    </div>
                     <div class="form-group">
                        <label class="form-label col-md-4">Gender</label>
                        <div class="col-md-8">
                            <input type="radio" value="Male" checked="true" class="radio-inline" name="gender" >Male
                            <input type="radio" value="Female" class="radio-inline" name="gender" >Female
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="form-label col-md-4">Blood Group</label>
                        <div class="col-md-8">
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
                    </div>
                    <div class="form-group">
                        <label class="form-label col-md-4">Need Unit Of Blood</label>
                        <div class="col-md-8">
                            <input type="number" required="true" class="form-control" name="unitblood" >
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="form-label col-md-4">Hospital Name & Address</label>
                        <div class="col-md-8">
                            <textarea required="true" minlength="5" class="form-control" name="hospitaladdress" 
                                      rows="6" placeholder="Please fill out your complete address."></textarea>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="form-label col-md-4">City</label>
                        <div class="col-md-8">
                            <input type="text" required="true" class="form-control" name="city" >
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="form-label col-md-4">Pincode</label>
                        <div class="col-md-8">
                            <input type="number" required="true" class="form-control" name="pincode" >
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-4 form-label">Doctor Name</label>
                        <div class="col-md-8">
                            <input type="text" name="doctorName" class="form-control" placeholder="Doctor Name" required="true">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-4 form-label">Contact Name</label>
                        <div class="col-md-8">
                            <input type="text" name="contactName" class="form-control" placeholder="Contact Name" required="true">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="form-label col-md-4">Address</label>
                        <div class="col-md-8">
                            <textarea required="true" minlength="5" class="form-control" name="address" 
                                      rows="6" placeholder="Please fill out your complete address."></textarea>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="form-label col-md-4">When Required</label>
                        <div class="col-md-8">
                            <input type="date" required="true" class="form-control" name="dob" >
                        </div>
                    </div>
                     <div class="form-group">
                        <label class="form-label col-md-4">Email</label>
                        <div class="col-md-8">
                            <input type="email" required="true" class="form-control" name="email" >
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="form-label col-md-4">Mobile</label>
                        <div class="col-md-8">
                            <input type="number" required="true" class="form-control" name="mobile" >
                        </div>
                    </div>
                     <div class="form-group">
                        <label class="form-label col-md-4">Reason For Blood</label>
                        <div class="col-md-8">
                            <textarea required="true" minlength="5" class="form-control" name="reasonblood" 
                                      rows="6" placeholder="Reason For Blood."></textarea>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="form-label col-md-4"></label>
                        <div class="col-md-8">
                            <button class="btn btn-success" name="submitBtn" >Request Now</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <div class="col-md-3"></div>
</div>
<style>
    body {
        background-image: url('assets/wallpaper9.jpg');
        background-repeat: no-repeat;
        background-attachment: fixed;
        background-size: 100% 100%;
    }
</style>
