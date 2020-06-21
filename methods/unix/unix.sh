#!/usr/bin/env bash
# Kaggle: https://www.kaggle.com/jamesmcguigan/unix-compression-benchmarks
set -x

INPUT_FILE=./input/enwik9
OUTPUT_FILE=./compressed/unix/enwik9
mkdir -p `dirname ${OUTPUT_FILE}`

# Times measured on 2011 MacBook Pro (i7 2.6GHz x 8)
#1000000000 == Input Size
# 116673681 == Competition Record
stat -c %s ${INPUT_FILE}

#1000001536 in 2.5s | tar
time tar -cf ${OUTPUT_FILE}.tar ${INPUT_FILE}
stat -c %s ${OUTPUT_FILE}.tar

# 322592222 in 0m2.5s | Apple zip -9
time zip -9 ${INPUT_FILE} -O ${OUTPUT_FILE}.gz
stat -c %s ${OUTPUT_FILE}.gz

# 322592222 in 0m1.5s | gzip -9
time gzip -9 ${OUTPUT_FILE}.gz ${INPUT_FILE}
stat -c %s ${OUTPUT_FILE}.gz

# 323941587 in  0m48s | tar.gz
time tar -czf ${OUTPUT_FILE}.tar.gz ${INPUT_FILE}
stat -c %s ${OUTPUT_FILE}.tar.gz

# 295663934 in 2m05s | bzip2 --best
# 295663934 in 1m52s | bzip2 --fast
time bzip2 --best ${INPUT_FILE} -c > ${OUTPUT_FILE}.bz2
stat -c %s ${OUTPUT_FILE}.bz2

# 253982044 in 1m35s | tar.bz2
time tar -cjf ${OUTPUT_FILE}.tar.bz2 ${INPUT_FILE}
stat -c %s ${OUTPUT_FILE}.tar.bz2

# 230152580 in 29m03s | tar.xz
time tar -cf --xz ${OUTPUT_FILE}.tar.xz ${INPUT_FILE}
stat -c %s ${OUTPUT_FILE}.tar.xz


# DOCS: https://superuser.com/questions/281573/what-are-the-best-options-to-use-when-compressing-files-using-7-zip
# 230138596 in 6m00s | .tar.z7
# 230135777 in 7m20s | .z7
# 218546221          | .7z.ultra
# 198245824 in 65m0s | .7z.ultra+
time 7z a ${OUTPUT_FILE}.tar.7z ${OUTPUT_FILE}.tar
stat -c %s ${OUTPUT_FILE}.tar.7z
time 7z a ${OUTPUT_FILE}.7z ${INPUT_FILE}
stat -c %s ${OUTPUT_FILE}.7z
time 7z a -t7z -mx=9 -mfb=64  -ms=on -md=32m   -m0=lzma   ${OUTPUT_FILE}.7z.ultra ${INPUT_FILE}
stat -c %s ${OUTPUT_FILE}.7z.ultra
time 7z a -t7z -mx=9 -mfb=273 -ms=on -md=1536m -myx=9 -mtm=- -mmt -mmtf -mmf=bt3 -mmc=10000 -mpb=0 -mlc=0 ${OUTPUT_FILE}.7z.ultra+ ${INPUT_FILE}
stat -c %s ${OUTPUT_FILE}.7z.ultra+

# Display filesizes
#-rw-r--r-- 1 jamie staff 1000001536 Jun 21 21:59 ./compressed/unix/enwik9.tar
#-rw-r--r-- 1 jamie staff  323941587 Jun 21 19:58 ./compressed/unix/enwik9.tar.gz
#-rw-r--r-- 1 jamie staff  322592222 Jun 21 22:54 ./compressed/unix/enwik9.gz
#-rw-r--r-- 1 jamie staff  322548087 Jun 21 19:52 ./compressed/unix/enwik9.zip.gz
#-rw-r--r-- 1 jamie staff  295663934 Jun 21 20:17 ./compressed/unix/enwik9.bz2
#-rw-r--r-- 1 jamie staff  253977891 Jun 21 20:11 ./compressed/unix/enwik9.tar.bz
#-rw-r--r-- 1 jamie staff  230152580 Jun 21 22:36 ./compressed/unix/enwik9.tar.xz
#-rw-r--r-- 1 jamie staff  230138596 Jun 21 22:08 ./compressed/unix/enwik9.tar.7z
#-rw-r--r-- 1 jamie staff  230135777 Jun 21 22:17 ./compressed/unix/enwik9.7z
#-rw-r--r-- 1 jamie staff  218546221 Jun 21 20:41 ./compressed/unix/enwik9.7z.ultra
#-rw-r--r-- 1 jamie staff  198245824 Jun 21 21:55 ./compressed/unix/enwik9.7z.ultra+
ls -laS ${INPUT_FILE} ${OUTPUT_FILE}.*
