nextflow.enable.dsl = 2

process MODULE1 {
   publishDir 'module1'

   input:
   path file1

   output:
   path file1, emit: file1

   script:
   """
   echo $file1 > summary.txt
   """
}

process MODULE2 {
   publishDir 'module2'

   input:
   path file2

   output:
   path file2, emit: file2

   script:
   """
   echo $file2 > summary.txt
   """
}

process MODULE3 {
   publishDir 'module3'

   input:
   path file1
   path file2

   output:
   tuple path(file1), path(file2), emit: files

   script:
   """
   echo $file1, $file2 > summary.txt
   """
}

workflow {
 file1 = Channel.fromPath("test_files/a_1.txt")
 file2 = Channel.fromPath("test_files/b_*.txt")

 MODULE1(file1) // MODULE3 spawns 1 job as expected
 // MODULE1(file1.collect()) // when using collect() or first(), MODULE1.out seems mysteriously becomes a value-like channel, and MODULE3 spawns 3 jobs

 // println MODULE1.out.file1
 MODULE2(file2)
 MODULE3(MODULE1.out.file1, MODULE2.out.file2)
}
