nextflow.enable.dsl = 2

process MODULE0 {
    publishDir 'module0'

    input:
    path file0

    output:
    path file0, emit: file0

    script:
    """
    echo $file0 > summary.txt
    """
}

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

  MODULE0(file1)
  // MODULE1(MODULE0.out.file0) // this works as expected
  MODULE1(MODULE0.out.file0.collect()) // when using collect() or first(), MODULE1.out mysteriously becomes a value channel
  MODULE2(file2)

  // println MODULE0.out.file0
  // println MODULE1.out.file1
  MODULE1.out.file1.first().view()

  MODULE3(MODULE1.out.file1, MODULE2.out.file2)
  MODULE3.out.files.view()
}
