<div class="container">
    <div class="row">
        <div class="col-md-1"></div>
        <div class="col-md-10">
            <?php if(isset($users)): $i++;?>
            <table class="table table-condensed">
                <thead>
                <th>Patient Name</th>
                <th>Gender</th>
                <th>Blood Group</th>
                <th>Need Unit Of Blood</th>
                <th>Hospital Name & Address</th>
                <th>City</th>
                <th>Pincode</th>
                <th>Doctor Name</th>
                <th>Contact Name</th>
                <th>Address</th>
                <th>When Required</th>
                <th>Email</th>
                <th>Mobile</th>
                <th>Reason For Blood</th>    
                </thead>
                <?php foreach($users as $u): $i++;?>
                <tr class="<?php if($i%2==0){echo $bg_background;}else{echo 'bg-danger';} ?>">
                    <td><?= $u['firstName']." ".$u['lastName']; ?></td>
                    <td><?= $u['gender']; ?></td>
                    <td><?= $u['blood_group']; ?></td>
                    <td><?= $u['unitblood']; ?></td>
                    <td><?= wordwrap($u['hospitaladdress'], 26, '<br>'); ?></td>
                    <td><?= $u['city']; ?></td>
                    <td><?= $u['pincode']; ?></td>
                    <td><?= $u['doctorName']; ?></td>
                    <td><?= $u['contactName']; ?></td>
                    <td><?= wordwrap($u['address'], 26, '<br>'); ?></td>
                    <td><?= $u['dob']; ?></td>
                    <td><?= $u['email']; ?></td>
                    <td><?= $u['mobile']; ?></td>
                    <td><?= wordwrap($u['reasonblood'], 26, '<br>'); ?></td>
                </tr>
                <?php endforeach; ?>
            </table>
            <?php endif; ?>
        </div>
        <div class="col-md-1"></div>
    </div>
</div>