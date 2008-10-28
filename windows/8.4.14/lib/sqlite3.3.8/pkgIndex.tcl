#
# Tcl package index file
#
# Note sqlite*3* init specifically
#
package ifneeded sqlite3 3.3.8 \
    [list load [file join $dir sqlite338.dll] Sqlite3]
