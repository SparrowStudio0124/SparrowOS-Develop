BOCHSRC  = ./bochsrc

MAKE     = make -r
BOCHS	 = bochs -f $(BOCHSRC) -q

# デフォルト動作

default : boot.asm
	$(MAKE) img

boot.img : boot.asm
	nasm boot.asm -o boot.bin
	dd if=boot.bin of=boot.img bs=512 count=1 conv=notrunc 


# コマンド

img :
	$(MAKE) boot.img

run :
	$(MAKE) img
	echo c | $(BOCHS) -q

run-only :
	echo c | $(BOCHS) -q

clean :
	rm *.bin
