/******************************************************************************
*                                                                             *
* Copyright 2016 myStorm Copyright and related                                *
* rights are licensed under the Solderpad Hardware License, Version 0.51      *
* (the “License”); you may not use this file except in compliance with        *
* the License. You may obtain a copy of the License at                        *
* http://solderpad.org/licenses/SHL-0.51. Unless required by applicable       *
* law or agreed to in writing, software, hardware and materials               *
* distributed under this License is distributed on an “AS IS” BASIS,          *
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or             *
* implied. See the License for the specific language governing                *
* permissions and limitations under the License.                              *
*                                                                             *
******************************************************************************/

module chip (
    // 100MHz clock input
    input  clk,
    // SRAM Memory lines
    output [18:0] ADR,
    output [15:0] DAT,
    output RAMOE,
    output RAMWE,
    output RAMCS,
    // All PMOD outputs
    output [55:0] PMOD,
    // QuadSPI
    input QCK,
    input QCS,
    inout QD0, QD1, QD2, QD3
  );

  logic [3:0] QDOU, QDEN, QDIN;

  wire rst = 1'b0; // Reset is active high

  // SRAM signals are not use in this design, lets set them to default values
  assign ADR[18:0] = {19{1'b0}};
  assign DAT[15:0] = {16{1'b0}};
  assign RAMOE = 1'b1;
  assign RAMWE = 1'b1;
  assign RAMCS = 1'b1;

  // Set unused pmod pins to default
  assign PMOD[55:0] = {56{1'bz}};

  SB_IO #(
    .PIN_TYPE(6'b 1010_01), .PULLUP(1'b 0)
  ) uQD0 (
    .PACKAGE_PIN(QD0), .OUTPUT_ENABLE(QDEN[0]), .D_OUT_0(QDOU[0]), .D_IN_0(QDIN[0])
  );

  SB_IO #(
    .PIN_TYPE(6'b 1010_01), .PULLUP(1'b 0)
  ) uQD1 (
    .PACKAGE_PIN(QD1), .OUTPUT_ENABLE(QDEN[1]), .D_OUT_0(QDOU[1]), .D_IN_0(QDIN[1])
  );

  SB_IO #(
    .PIN_TYPE(6'b 1010_01), .PULLUP(1'b 0)
  ) uQD2 (
    .PACKAGE_PIN(QD2), .OUTPUT_ENABLE(QDEN[2]), .D_OUT_0(QDOU[2]), .D_IN_0(QDIN[2])
  );

  SB_IO #(
    .PIN_TYPE(6'b 1010_01), .PULLUP(1'b 0)
  ) uQD3 (
    .PACKAGE_PIN(QD3), .OUTPUT_ENABLE(QDEN[3]), .D_OUT_0(QDOU[3]), .D_IN_0(QDIN[3])
  );

  qspi u_qspi (
    .clk  (clk),
    .qck  (QCK),
    .qcs  (QCS),
    .din  (QDIN),
    .dou  (QDOU),
    .den  (QDEN)
  );

endmodule
