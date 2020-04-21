/.data.resource.state/ {
  $1 = ""
  state = substr($0, 2)
  if (state == "OPEN") {
    printf colored("white", "green", " ⤽ open ")
  } else if (state == "CLOSED") {
    printf colored("white", "red", " ⤽ closed ")
  } else if (state == "MERGED") {
    printf colored("white", "magenta", " ⤽ merged ")
  }
}

/.data.resource.number/ { $1 = ""; printf colored("blue", "", " #%d "), substr($0, 2) }
/.data.resource.title/ { $1 = ""; print "\033[1m" substr($0, 2) "\033[0m" }
/.data.resource.headRepository.nameWithOwner/ { $1 = ""; printf blue(substr($0, 2)) }
/.data.resource.headRefName/ { $1 = ""; printf blue(":%s"), substr($0, 2) }
/.data.resource.baseRepository.nameWithOwner/ { $1 = ""; printf " -> %s", blue(substr($0, 2)) }
/.data.resource.baseRefName/ { $1 = ""; printf blue(":%s\n"), substr($0, 2) }

/.data.resource.body/ {
  $1 = ""
  body = substr($0, 2)
  gsub("\\\\n", "\n", body)
  print ""
  printf body
}
