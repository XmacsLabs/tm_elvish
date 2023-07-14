use platform 

var install = { |p|
  rm -rf $p/elvish
  mkdir $p/elvish
  cp -r src $p/elvish
  cp -r progs $p/elvish
}

if $platform:is-windows {
  $install $E:APPDATA/TeXmacs/plugins
  $install $E:APPDATA/Xmacs/plugins
}
