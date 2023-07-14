use platform 

if $platform:is-windows {
  var PLUGIN_DIR = $E:APPDATA/Xmacs/plugins
  rm -rf $PLUGIN_DIR/elvish
  mkdir $PLUGIN_DIR/elvish
  cp -r src $PLUGIN_DIR/elvish
  cp -r progs $PLUGIN_DIR/elvish
}
