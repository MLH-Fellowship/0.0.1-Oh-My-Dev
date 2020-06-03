# dev.to search from terminal

function fetch_api() {
  base_url="https://dev.to/api";
  url_path="/articles";
  url=$base_url$url_path;
  
  response=$(curl $url);
  echo $response;
}

function oh_my_dev() {
  api_response=$(fetch_api);
}

oh_my_dev;
