# dev.to search from terminal

function fetch_api() {
  base_url="https://dev.to/api";
  url_path="/articles";
  url=$base_url$url_path;
  
  response=$(curl $url);
  echo $response;
}

function ohmydev_tag() {
  counter=0
  FGBLUE=`echo "\033[35m"`
  NORMAL=`echo "\033[m"`

  base_url="https://dev.to/api/articles?tag=$1&per_page=9";
  response=$(curl $base_url);
  
  title=$(echo $response | jq ".[$counter].title")
  description=$(echo $response | jq ".[$counter].title")
  url=$(echo $response | jq ".[$counter].url")
  
  echo "\n${FGBLUE}title: ${NORMAL}$title \n${FGBLUE}description: ${NORMAL}$description \n${FGBLUE}url: ${NORMAL}$url\n"
  
  read "?See more [y/Y] [n/N] " input
  while [ $input = "y" ]
  do
    counter=$((counter+1))

    title=$(echo $response | jq ".[$counter].title")
    description=$(echo $response | jq ".[$counter].title")
    url=$(echo $response | jq ".[$counter].url")
  
    echo "\n${FGBLUE}title: ${NORMAL}$title \n${FGBLUE}description: ${NORMAL}$description \n${FGBLUE}url: ${NORMAL}$url\n"
  
    read "?See more [y/Y] [n/N] " input
  done
}

function oh_my_dev() {
  api_response=$(fetch_api);
}

alias oh_my_dev='oh_my_dev';
alias oh_my_dev_tag="ohmydev_tag $1";

ohmydev_tag $1;
