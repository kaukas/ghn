/.data.resource.state/ {
  $1 = ""
  state = substr($0, 2)
  if (state == "OPEN") {
    printf colored("white", "green", " ⓘ open ")
  } else if (state == "CLOSED") {
    printf colored("white", "red", " ⓘ closed ")
  }
}

/.data.resource.number/ { $1 = ""; printf colored("blue", "", " #%d "), substr($0, 2) }
/.data.resource.title/ { $1 = ""; print "\033[1m" substr($0, 2) "\033[0m" }

/.data.resource.body/ {
  $1 = ""
  body = substr($0, 2)
  gsub("\\\\n", "\n", body)
  print ""
  print body
}
