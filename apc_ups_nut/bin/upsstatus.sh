#!/bin/sh
 
ups="$1"
key="$2"
 
if [ "$key" = "ups.status" ]; then
 
        state=`upsc $ups ups.status`
        case $state in
                OL) echo 'On line (mains is present)' ;;
                OB) echo 'On battery (mains is not present)' ;;
                LB) echo 'Low battery' ;;
                RB) echo 'The battery needs to be replaced' ;;
                CHRG) echo 'The battery is charging' ;;
                DISCHRG) echo 'The battery is discharging (inverter is providing load power)' ;;
                BYPASS)  echo 'UPS bypass circuit is active echo no battery protection is available' ;;
                CAL)    echo 'UPS is currently performing runtime calibration (on battery)' ;;
                OFF)     echo 'UPS is offline and is not supplying power to the load' ;;
                OVER)    echo 'UPS is overloaded' ;;
                TRIM)    echo 'UPS is trimming incoming voltage (called "buck" in some hardware)' ;;
                BOOST)   echo 'UPS is boosting incoming voltage' ;;
				"OL CHRG") echo 'On line (mains is present) + The battery is charging' ;;
                * ) echo 'unknown state' ;;
        esac
 
else
        upsc $ups $key
fi
