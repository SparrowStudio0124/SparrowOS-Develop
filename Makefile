BOCHSRC  = ./bochsrc

MAKE     = make -r
BOCHS	 = bochs -f $(BOCHSRC) -q
DEL      = rm

default :
	$(MAKE) img

boot.img : boot.asm Makefile
	nasm boot.asm -o boot.bin
	dd if=boot.bin of=boot.img bs=512 count=1 conv=notrunc 

img :
	$(MAKE) boot.img

run :
	$(MAKE) img
	-echo c | $(BOCHS) -q

run-only :
	-echo c | $(BOCHS) -q

clean :
	-$(DEL) *.bin
