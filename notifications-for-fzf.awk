function green(s) {
  return "\033[0;32m" s "\033[0m"
}

function blue(s) {
  return "\033[0;34m" s "\033[0m"
}

function format_owner_repo(owner, repo, max_len) {
  owner_min_len = 5
  total_length = length(owner "/" repo)
  len_diff = total_length - max_len

  sub_from_owner = length(owner) - owner_min_len
  if (len_diff < sub_from_owner) {
    sub_from_owner = len_diff
  }
  owner = substr(owner, 0, length(owner) - sub_from_owner)
  len_diff = len_diff - sub_from_owner

  repo = substr(repo, 0, length(repo) - len_diff)

  return owner "/" green(repo)
}

{
  url_parts_size = split($1, url, "/")
  id = "#" url[url_parts_size]
  printf green("%7s "), id

  if ($4 == "true") {
    printf blue("• ")
  } else {
    printf "  "
  }

  if ($3 == "PullRequest") {
    printf "⤽ "
  } else if ($3 == "Issue") {
    printf "ⓘ "
  }

  printf "%-27s ", format_owner_repo($6, $7, 15)
  printf blue("@%s  "), $5
  printf "%s ", $8

  printf "\n"
}
