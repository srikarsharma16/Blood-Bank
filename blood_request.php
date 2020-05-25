<?php

$i=0;
require_once 'users/php/DBConnect.php';

$db = new DBConnect();
$users = $db->getrequest();

$title="Blood Requested";$setNeedBloodActive="active";$bg_background="bg-success";
include 'layout/_header.php';

include 'layout/_top_nav.php';
?>

<?php include 'users/layout/_bloodrequest_layout.php'; ?>
<style>
    body {
        background-image: url('wallpaper9.jpg');
        background-repeat: no-repeat;
        background-attachment: fixed;
        background-size: 100% 100%;
    }
</style>
