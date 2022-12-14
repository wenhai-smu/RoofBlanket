<?php
// required headers
header("Access-Control-Allow-Origin: *");
header("Access-Control-Expose-Headers: Content-Length, X-JSON");
header('Access-Control-Allow-Methods: GET, POST, PATCH, PUT, DELETE, OPTIONS');
header("Access-Control-Allow-Headers: *");
header("Content-Type: application/json; charset=UTF-8");


spl_autoload_register(function ($class) { 

    $pathConfig= '../config/' . $class . '.php';
    $pathObject = '../objects/' . $class . '.php';
    // $pathFunction = $class . '.php';

    if (file_exists($pathConfig)) {
        require_once $pathConfig;
    } elseif (file_exists($pathObject)) {
        require_once $pathObject;
    } 
    // elseif (file_exists($pathModels )) {
    //     require_once $pathModels ;
    // }
});

  
// initialize object
$messageDAO = new MessageDAO();

$current_user_id = $_GET["current_user_id"];
$other_user_id = $_GET["other_user_id"];
$homeless_id = $_GET["homeless_id"];
// $other_user_id = 10001;

if(  isset($current_user_id) && isset($other_user_id) && isset($homeless_id)  ) {
    $messages = $messageDAO->retrieve_user_message($current_user_id, $other_user_id, $homeless_id);

    $date = new DateTime('now', new DateTimeZone('Asia/Singapore'));
    $messages["info"] = array(
        "author" => "Roof Blanket",
        "response_datetime_singapore" => $date->format('Y-m-d H:i:sP')
    );

    http_response_code(200);
    
        // show products data
    echo json_encode($messages);

    }

else {
    // set response code - 404 Not found
    http_response_code(404);
  
    // tell the user no items found
    echo json_encode(
        array("Message" => "Query parameters are not set. No results.")
    );
    exit;
}

?>