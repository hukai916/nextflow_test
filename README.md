# nextflow_test

## multi_input_test
When using operators like collect() or first(), the .out mysteriously becomes value channel though it is clearly defined as path output.
Switch on line 69-70 to see different effect.
Also note, with line 70, the .out becomes "DataflowVariable(value=null)" instead of "DataflowBroadcast around DataflowStream[?]".
