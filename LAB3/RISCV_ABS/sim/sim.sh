#!/bin/bash
source /software/scripts/init_msim6.2g
rm -r work
vlib work
vcom -93 -work ./work ../src/myTypes.vhd
vcom -93 -work ./work ../src/fd.vhd
vcom -93 -work ./work ../src/mux3to1_A.vhd
vcom -93 -work ./work ../src/mux3to1_B.vhd
vcom -93 -work ./work ../src/register.vhd
vcom -93 -work ./work ../src/register_file.vhd
vcom -93 -work ./work ../src/ALU.vhd
vcom -93 -work ./work ../src/DataHazardUnit.vhd
vcom -93 -work ./work ../src/ForwardingUnit.vhd
vcom -93 -work ./work ../src/


