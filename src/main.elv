var flush_start = {
  print "\x02"
}
var flush_end = {
  print "\x05\r\n"
}

var flush_utf8 = { |content|
  $flush_start
  print "utf8:"$content
  $flush_end
}

$flush_utf8 "Elvish 0.19.2"

while true {
  var line = (read-line)
  var result = [ (eval $line) ]
  $flush_utf8 (repr (to-string $@result))
}
