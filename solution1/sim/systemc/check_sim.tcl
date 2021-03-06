# ==============================================================
# File generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
# Version: 2014.1
# Copyright (C) 2014 Xilinx Inc. All rights reserved.
# 
# ==============================================================

proc sc_sim_check { ret err logfile } {
    set errfile "err.log"
    if {[file exists $errfile] && [file size $errfile] != 0} {
        set fl [open $errfile r]
        while {[gets $fl line] >= 0} {
            if {[string first "AESL_mErrNo = " $line] == 0} {
                set mismatch_num [string range $line [string length "AESL_mErrNo = "] end]
                if {$mismatch_num != 0} {
                    puts "@E SystemC simulation FAILED with ${mismatch_num} mismatches detected."
                    break
                }
            }
        }
    }
    if {$ret || $err != ""} {
        if { [lindex $::errorCode 0] eq "CHILDSTATUS"} {
            set status [lindex $::errorCode 2]
            if {$status != ""} {
                puts "@E Simulation failed: Function \'main\' returns nonzero value \'$status\'."
            } else {
                puts "@E Simulation failed."
            }
        } else {
            puts "@E Simulation failed."
        }
    }
    if {[file exists $logfile]} {
        set cmdret [catch {eval exec "grep \"Error:\" $logfile"} err]
        file delete -force $logfile
        if {$cmdret == 0} {
            puts "@E Simulation failed."
        }
    }
}
proc check_tvin_file {} {
    set rtlfilelist {
         "c.ap_ctl_handler.autotvin_ap_ready_in.dat"
         "c.ap_ctl_handler.autotvin_ap_done_in.dat"
         "c.ap_ctl_handler.autotvin_ap_idle_in.dat"
         "c.ap_ctl_handler.autotvout_ap_start_out.dat"
    }
    foreach rtlfile $rtlfilelist {
        if {[file isfile $rtlfile]} {
        } else {
            puts "Can't find file $rtlfile."
            return 1
        }
        set ret [catch {eval exec "grep /runtime $rtlfile"} err]
        if { $ret } {
            puts "$rtlfile file format is incorrect, please rerun cosim."
            return 1
        }
    }
    return 0
}

proc check_tvout_file {} {
    set rtlfilelist {
         "rtl.ap_ctl_handler.autotvout_ap_start_out.dat"
    }
    foreach rtlfile $rtlfilelist {
        if {[file isfile $rtlfile]} {
        } else {
            puts "Can't find file $rtlfile."
            return 1
        }
        set ret [catch {eval exec "grep /runtime $rtlfile"} err]
        if { $ret } {
            puts "$rtlfile file format is incorrect, please rerun cosim."
            return 1
        }
    }
    return 0
}
