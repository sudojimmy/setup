./HEncode < 'test/a/a.txt'> student_encode.out
wc -c student_encode.out > student.size
diff huff.freq 'test/a/huff.freq'
diff huff.wpl 'test/a/huff.wpl'
./HDecode < student_encode.out > student_decode.out
diff student_decode.out 'test/a/a.txt'

./HEncode < 'test/b/b.txt'> student_encode.out
wc -c student_encode.out > student.size
diff huff.freq 'test/b/huff.freq'
diff huff.wpl 'test/b/huff.wpl'
./HDecode < student_encode.out > student_decode.out
diff student_decode.out 'test/b/b.txt'
