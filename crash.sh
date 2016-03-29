#!/bin/sh

gcc nwrites_to_crash.c -o nwrites_to_crash
#set_crash sets n_writes_to_crash
./ nwrites_to_crash 4

cd test

#For each of the following commands, nwrites_to_crash decrements by 1
#But all commands are executed normally

echo 'hello' >> hello.txt
 
echo 'hi' > color.txt

ln world.txt copy_of_world.txt

ln -s hello.txt symlink_to_hello

#Anything following this line should silently fail

ln world.txt sym.txt

rm copy_of_world.txt

echo 'red blue green' >> color.txt

unlink symlink_to_hello

cd ..

#Restore the OSPFS system so that we can use the file system normally

./nwrites_to_crash -1

cd test 

#Now if you try to access things added or removed during the incorrect 

#sym.txt does not exist
ln sym.txt sym2.txt

#cd copy_of_world.txt still exists
cat copy_of_world.txt

#Only contains 'hi'
cat color.txt