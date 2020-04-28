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
  # Will be hidden.
  printf "%s ", $1
  printf "%s ", $3

  printf "%-26s ", format_owner_repo($6, $7, 15)

  if ($3 == "PullRequest") {
    printf "↰ "
  } else if ($3 == "Issue") {
    printf "ⓘ "
  }

  url_parts_size = split($1, url, "/")
  id = "#" url[url_parts_size]
  printf green("%7s "), id

  if ($4 == "true") {
    printf blue("• ")
  } else {
    printf "  "
  }

  printf blue("@%s "), $5
  printf "%s ", $8

  printf "\n"
}
