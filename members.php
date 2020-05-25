<?php

$i=0;
require_once 'users/php/DBConnect.php';

$db = new DBConnect();
$users = $db->getUsers();

$title="Our Members";$setMemberActive="active";$bg_background="bg-warning";
include 'layout/_header.php';

include 'layout/_top_nav.php';
?>

<?php include 'users/layout/_usermember_layout.php'; ?>
<style>
    body {
        background-image: url('simple.jpg');
        background-repeat: no-repeat;
        background-attachment: fixed;
        background-size: 100% 100%;
    }
</style>
