module mchip (
    c_ck, c_ncs, c_se, c_so, c_si, c_en,
    ck, ncs, sd0, sd1, sd2, sd3
);

    // controller side
    input        c_ck;
    input        c_ncs;
    input  [3:0] c_se;
    input  [7:0] c_so;
    output [7:0] c_si;
    // phy enable signal
    input        c_en;

    // pad side
    output       ck;
    output       ncs;
    inout        sd0, sd1, sd2, sd3;

    wire         p_ck;
    wire         p_ncs;
    wire   [3:0] p_se;
    wire   [3:0] p_so;
    wire   [3:0] p_si;

mphy umphy (
    .c_ck(c_ck),
    .c_ncs(c_ncs),
    .c_se(c_se),
    .c_so(c_so),
    .c_si(c_si),
    .c_en(c_en),

    .p_ck(p_ck),
    .p_ncs(p_ncs),
    .p_se(p_se),
    .p_so(p_so),
    .p_si(p_si)
);

assign ncs = p_ncs;
assign ck = p_ck;

SB_IO #(
  .PIN_TYPE(6'b 1010_01), .PULLUP(1'b 0)
) uQD0 (
  .PACKAGE_PIN(sd0), .OUTPUT_ENABLE(p_se[0]), .D_OUT_0(p_so[0]), .D_IN_0(p_si[0])
);

SB_IO #(
  .PIN_TYPE(6'b 1010_01), .PULLUP(1'b 0)
) uQD1 (
  .PACKAGE_PIN(sd1), .OUTPUT_ENABLE(p_se[1]), .D_OUT_0(p_so[1]), .D_IN_0(p_si[1])
);

SB_IO #(
  .PIN_TYPE(6'b 1010_01), .PULLUP(1'b 0)
) uQD2 (
  .PACKAGE_PIN(sd2), .OUTPUT_ENABLE(p_se[2]), .D_OUT_0(p_so[2]), .D_IN_0(p_si[2])
);

SB_IO #(
  .PIN_TYPE(6'b 1010_01), .PULLUP(1'b 0)
) uQD3 (
  .PACKAGE_PIN(sd3), .OUTPUT_ENABLE(p_se[3]), .D_OUT_0(p_so[3]), .D_IN_0(p_si[3])
);

endmodule
