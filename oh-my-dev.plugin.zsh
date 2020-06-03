# dev.to search from terminal

function fetch_api() {
  base_url="https://dev.to/api";
  path="/articles";
  
  response=$(curl "$base_url$path");

  return response;
}

function oh_my_dev() {
  fetch_api;
}
  
oh_my_dev;
