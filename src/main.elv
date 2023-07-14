var flush_any = { |content|
  print "\x02"$content"\x05\n"
}

var flush_utf8 = { |content|
  $flush_any "utf8:"(repr $content)
}

$flush_utf8 "Elvish 0.19.2"

while true {
  var line = (read-line)
  var result = [ (eval $line) ]
  $flush_utf8 (repr (to-string $@result))
}
