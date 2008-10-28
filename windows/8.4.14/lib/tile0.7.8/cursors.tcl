#
# $Id: cursors.tcl,v 1.2 2006/07/22 16:37:19 jenglish Exp $
#
# Tile package: Symbolic cursor names.
#
# @@@ TODO: Figure out appropriate platform-specific cursors
#	for the various functions.
#

namespace eval tile {

    variable Cursors;

    switch -glob $::tcl_platform(platform) {

	"windows" {
	    array set Cursors {
		hresize 	sb_h_double_arrow
		vresize 	sb_v_double_arrow
		seresize	size_nw_se
	    }
	}

	"unix" - 
	* {
	    array set Cursors {
		hresize 	sb_h_double_arrow
		vresize 	sb_v_double_arrow
		seresize	bottom_right_corner
	    }
	}

    }
}

#*EOF*
