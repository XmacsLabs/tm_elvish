var line = "Elvish 0.19.2"
while (not (eq $line "quit")) {
  print "\x02utf8:"$line"\x05\n"
  set line = (read-line)
}
