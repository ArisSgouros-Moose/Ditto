#!/bin/bash
path_ditto='../../ditto-opt'
$path_ditto -i ex11_transient_long.i stime=0.0 etime=9.0

# generate mesh and initial configuration
$path_ditto -i ex11_transient_rest_init.i
cp ex11_transient_rest_init_out.e ex11_transient_rest.e-s000

$path_ditto -i ex11_transient_rest.i stime=0.0 etime=3.0 mesh_file=ex11_transient_rest.e-s000
cp ex11_transient_rest_out.e ex11_transient_rest.e-s001
$path_ditto -i ex11_transient_rest.i stime=3.0 etime=6.0 mesh_file=ex11_transient_rest.e-s001
cp ex11_transient_rest_out.e ex11_transient_rest.e-s002
$path_ditto -i ex11_transient_rest.i stime=6.0 etime=9.0 mesh_file=ex11_transient_rest.e-s002
cp ex11_transient_rest_out.e ex11_transient_rest.e-s003
