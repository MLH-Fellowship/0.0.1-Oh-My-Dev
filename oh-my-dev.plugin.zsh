# dev.to search from terminal

function fetch_api() {
  base_url="https://dev.to/api";
  url_path="/articles";
  url=$base_url$url_path;
  
  response=$(curl $url);
  echo $response;
}

function oh_my_dev() {
  user_exit=false;
  echo "Fetching the last 30 articles from https://dev.to";
  echo;
  api_response=$(fetch_api);
  echo;
  echo "Done";

  echo;
  echo "Previewing articles:";
  for row in $(jq -r '.[] | @base64' <<< $api_response); do
    _jq() {
      echo $row | base64 --decode | jq -r $1;
    }

    echo;
    eval $(_jq '@sh "title=\(.title) description=\(.description) name=\(.user.username) date=\(.readable_publish_date) url=\(.canonical_url)"');
    echo $title;
    echo "  - Published by $name on $date";
    echo;
    echo $description;
    echo;
    echo "Read the full article on $url";
    echo;

    if read -q "choice?Press Y/y to preview another article, or any other key to cancel: "; then
      echo;
      continue;
    else
      user_exit=true;
      echo;
      echo;
      echo "See you later!";
      break;
    fi
  done

  if [[ $user_exit = false ]]; then
    echo;
    echo "We have no more articles, please come back later!";
  fi
}

oh_my_dev;
