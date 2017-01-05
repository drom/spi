###############################################################################
#                                                                             #
# Copyright 2016 myStorm Copyright and related                                #
# rights are licensed under the Solderpad Hardware License, Version 0.51      #
# (the “License”); you may not use this file except in compliance with        #
# the License. You may obtain a copy of the License at                        #
# http://solderpad.org/licenses/SHL-0.51. Unless required by applicable       #
# law or agreed to in writing, software, hardware and materials               #
# distributed under this License is distributed on an “AS IS” BASIS,          #
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or             #
# implied. See the License for the specific language governing                #
# permissions and limitations under the License.                              #
#                                                                             #
###############################################################################

# chip.bin: ../mchip.v ../../mphy.v blackice.pcf
# arachne-pnr -d 8k -P tq144:4k -p blackice.pcf --post-place-blif chip.post.blif chip.blif -o chip.asc

chip.bin: ../mchip.v ../../mphy.v
	yosys -q -p "read_verilog -sv ../mchip.v ; read_verilog ../../mphy.v ; synth_ice40 -blif chip.blif"
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
