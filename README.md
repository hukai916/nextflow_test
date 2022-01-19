# nextflow_test

## multi_input_test
The issue: when using operators like collect() or first(), the .out mysteriously becomes value channel though it is clearly defined as path output in the module definition.

To replicate: switch on and off line 53-54 to see the different effect.

Also note, with line 54, the "println MODULE1.out.file1" becomes "DataflowVariable(value=null)" instead of "DataflowBroadcast around DataflowStream[?]".
