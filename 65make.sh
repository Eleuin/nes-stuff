if [ -f test.o ]; then
    rm test.o
fi

ca65 test.asm -o test.o

if [ -f test.o ]; then
    ld65 test.o -C nes.ini -o test.nes
fi
