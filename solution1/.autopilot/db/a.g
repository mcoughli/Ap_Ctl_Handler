#!/bin/sh
lli=${LLVMINTERP-lli}
exec $lli \
    /media/D/xilinx_workspace/Ap_Ctl_Handler/solution1/.autopilot/db/a.g.bc ${1+"$@"}
