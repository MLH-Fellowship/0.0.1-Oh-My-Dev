#!/bin/zsh
# dev.to search from terminal
base_url="https://dev.to/api";
url_path="/articles";

function fetch_api() {
  url=$base_url$url_path;
  
  response=$(curl $url);
  echo $response;
}

function make_post() {
  url=$base_url$url_path;

  if [[ $publish = "y" ]]; then
    $publish = true
  else
    $publish = false
  fi

  echo "$title outputs here and the body content here too $body"
  response=$(curl -X POST -H "Content-Type: application/json" \
  -H "api-key: $key" \
  -d '{"article":{"title":"'$title'","body_markdown":"'$body'","published": "'$publish'","tags":["discuss", "javascript"]}}' \
  "$url" | jq '.')

  echo $response
}

function oh_my_dev() {
  echo "starting point"
  if [[ $1 = "make_post" ]]; then
    echo "Api key"
    read key

    echo "Enter title for your article"
    read title

    echo "Enter body content"
    read body

    echo "Do you want to publish now? Enter y to publish, anything else if not"
    read publish
    
    makePost=$(make_post $key $title $body $publish)
    echo $makePost
    #eval $(_jq '@sh "title=\(.title)"')

  else 
    api_response=$(fetch_api);
  fi
}

oh_my_dev $1;

