<?php
$contents = file_get_contents('/var/www/composer.json');
$json = json_decode($contents,true);
$json['minimum-stability'] = 'dev';
$json['prefer-stable'];
if(!isset($json['repositories'])){
    $json['repositories'] = [];
}
$json['repositories'][] = ['type'=>'path','url'=>'/plugin'];

$jsonString = json_encode($json,JSON_PRETTY_PRINT | JSON_UNESCAPED_SLASHES);
file_put_contents('/var/www/composer.json', $jsonString);
