var flush_any = { |content|
  print "\x02"$content"\x05\n"
}

var flush_utf8 = { |content|
  $flush_any "utf8:"$content
}

var line = "Elvish 0.19.2"
while (not (eq $line "quit")) {
  $flush_utf8 $line
  set line = (read-line)
}
