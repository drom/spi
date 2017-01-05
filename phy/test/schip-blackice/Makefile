chip.bin: ../schip.v ../../sphy.v
	yosys -q -p "read_verilog -sv ../schip.v ; read_verilog ../../sphy.v ; synth_ice40 -blif chip.blif"
	arachne-pnr -d 8k -P tq144:4k --post-place-blif chip.post.blif chip.blif -o chip.asc
	yosys -q -o chip.post.json chip.post.blif
	icetime -j chip.sta.json -d hx8k chip.asc
	icepack chip.asc chip.bin

.PHONY: upload
upload:
	cat chip.bin >/dev/ttyUSB0

.PHONY: clean
clean:
	$(RM) -f chip.blif chip.post.blif chip.post.json chip.sta.json chip.asc chip.ex chip.bin
