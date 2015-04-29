#!/bin/bash

mingw="i686-w64-mingw32"
mingw_package="mingw-w64" # ?
tcl="8.6.4"

# Preconditions
false && {
  apt-get install "$mingw_package" # etc. pp. ...
  # ggf. Installieren per
  # sudo aptitude
  #  /mingw- (fuer Suchen nach Paketnamen)
  #  + (fuer "soll installiert werden)
  #  g,g (fuer "go")
}

# Compile and install
set -e
cd `dirname "$0"`
dir=`pwd -P`

(
  # set -e
  cd tcl"$tcl"/win
  CC="$mingw"-gcc \
  GCC="$CC" \
  RC="$mingw"-windres \
  AR="$mingw"-ar \
  RANLIB="$mingw"-ranlib \
  ./configure --host="$mingw" --disable-threads --disable-64bit --prefix="$dir"/"$tcl"
  make
  make install
)

cat << EOD
# Apply patches
# - init.tcl for spaces in TCLLIBPATH
- set auto_path $env(TCLLIBPATH)
+ set auto_path [list $env(TCLLIBPATH)]

# Archive as 3rdparty package (complete)
rsync -av --delete "$tcl"/ tcl
tar cjf "$tcl".tbz2 tcl

# Remove non-devel things from devel
cd "$tcl"

rm -rf share
rm -rf man
rm -rf bin

find lib/ -maxdepth 1 -not -name "*.a" -not -path "lib/" | xargs rm -rf
EOD
