<?php
$githubTags = 'https://api.github.com/repos/craftcms/cms/tags';
$page = 1;

do {
    $tags = json_decode(getUrl($githubTags.'?page='.$page),true);
    $tags = array_map(function($t){
        return $t['name'];
    },$tags);
    $tags = array_filter($tags, function($t){
        return $t[0] === '3';
    });

    foreach($tags as $tag){
        passthru('make build VERSION='.$tag);
    }

    $page++;
}while(count($tags));


function getUrl($url){
    $curl = curl_init();
// Set some options - we are passing in a useragent too here
    curl_setopt_array($curl, [
        CURLOPT_RETURNTRANSFER => 1,
        CURLOPT_URL =>$url,
        CURLOPT_USERAGENT => 'user agent'
    ]);
// Send the request & save response to $resp
    $resp = curl_exec($curl);
// Close request to clear up some resources
    curl_close($curl);
    return $resp;
}