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

var ns = (ns [&tm_elvish="0.0.1"])

$flush_utf8 "Elvish 0.19.2"

while true {
  var line = (read-line)
  if (not (eq $line "<EOF>")) {
    try {
      var result = [ (eval &ns=$ns $line) ]
      $flush_utf8 (repr (to-string $@result))
    } catch e {
      $flush_utf8 (to-string $e)
    }
  }
}
