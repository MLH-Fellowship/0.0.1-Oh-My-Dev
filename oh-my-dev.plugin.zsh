# dev.to search from terminal

function fetch_api() {
  base_url="https://dev.to/api";
  url_path="/articles";
  url="$base_url$url_path?tag=$1&per_page=3";
  
  response=$(curl $url);
  echo $response;
}

function color() {
  echo $fg[$1]$2$reset_color;
}

function format_and_print_article() {
  echo;
  echo "----------";
  eval $(echo $1 | base64 --decode | jq -r '@sh "title=\(.title) description=\(.description) name=\(.user.username) date=\(.readable_publish_date) url=\(.canonical_url)"');
  echo $(color yellow $title);
  echo "  Published by $(color yellow $name) on $(color yellow $date)";
  echo;
  echo $(color yellow $description);
  echo;
  echo "Read the full article on $(color yellow $url)";
  echo "----------";
  echo;
}

function oh_my_dev() {
  user_exit=false;
  echo "Fetching the last 30 articles from https://dev.to";
  echo;
  api_response=$(fetch_api $1);
  echo;
  echo "Done";

  echo;
  echo "Previewing articles:";
  for row in $(jq -r '.[] | @base64' <<< $api_response); do
    format_and_print_article $row;

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

oh_my_dev $1;