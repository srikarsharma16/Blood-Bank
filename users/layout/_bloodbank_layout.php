<div class="container">
    <div class="row">
        <div class="col-md-1"></div>
        <div class="col-md-10">
            <?php if(isset($users)): $i++;?>
            <table class="table table-condensed">
                <thead>
                <th>Hospital ID</th>
                <th>Hospital Name</th>
                <th>Hospital Address</th>
                <th>City</th>
                <th>Contact</th>
                </thead>
                <?php foreach($users as $u): $i++;?>
                <tr class="<?php if($i%2==0){echo $bg_background;}else{echo 'bg-danger';} ?>">
                    <td><?= $u['hospital_id']; ?></td>
                    <td><?= $u['hospital_name']; ?></td>
                    <td><?= wordwrap($u['hospital_address'], 26, '<br>'); ?></td>
                    <td><?= $u['city']; ?></td>
                    <td><?= $u['contact']; ?></td>
                </tr>
                <?php endforeach; ?>
            </table>
            <?php endif; ?>
        </div>
        <div class="col-md-1"></div>
    </div>
</div>