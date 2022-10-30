module Controller(output reg selAddSub, initPartial, initA, loadLsbA, loadLsbB, loadMsbA,
                   loadMsbB, loadPartial, shiftA, muxSel, done, output reg[1:0] sel, input getA, getB, start, putOut, clk, rst, input [2:0] opc);
  reg co, cntEn, initCounter;
  reg [2:0] counter;
  reg [3:0] ns,ps;
  parameter [3:0] Idle = 0, LsbA = 1, WaitA = 2, MsbA = 3, LsbB=4, WaitB =5, MsbB=6, Select = 7, MuxSelect1 = 8, MuxSelect2 = 9;
  always@(ps, opc, co, getA, getB, start, putOut)begin
    ns = Idle;
    {initCounter, initPartial, initA, shiftA, loadLsbA, loadMsbA, loadLsbB, loadMsbB, cntEn, loadPartial, selAddSub, muxSel, done} = 13'd0;               
    case(ps)
      Idle: begin 
        ns = start ? LsbA : Idle;
       {initCounter, initPartial, initA} = 3'b111;
       end
      LsbA: begin
        ns = getA ? LsbA : WaitA;
        loadLsbA = getA ? 1'b0 : 1'b1;
      end
      WaitA: begin
        ns = getA ? MsbA : WaitA;
      end
      MsbA: begin
        ns = getA ? MsbA : LsbB;
        loadMsbA = getA ? 1'b0 : 1'b1;
      end
      LsbB: begin
        ns = getB ? LsbB : WaitB;
        loadLsbB = getB ? 1'b0 : 1'b1;
      end
      WaitB: begin
        ns = getB ? MsbB : WaitB;
      end
      MsbB: begin
        ns = getB ? MsbB : Select;
        loadMsbB = getB ? 1'b0 : 1'b1;
      end
      Select: begin
        ns = co ? MuxSelect1 : Select;
        {cntEn, shiftA, loadPartial} = 3'b111;
        if(opc == 3'b000)
          sel = 2'b11;
        else if(opc == 3'b111)
          sel = 2'b11;
        else if(opc == 3'b011)
          sel = 2'b00;
        else if(opc == 3'b100)
          sel = 2'b00;
        else if(opc[1:0] == 2'b01)
          sel = 2'b10;
        else if(opc[1:0] == 2'b10)
          sel = 2'b10;
        if(opc[2] == 0)
          selAddSub = 1'b0;
        else if(opc[2] == 1)
          selAddSub = 1'b1;
      end
      MuxSelect1: begin
        ns = putOut ? MuxSelect1 : MuxSelect2;
        muxSel = putOut ? 1'b1: 1'b0;
        done = 1'b1;
      end
      MuxSelect2: begin
        ns = ~putOut ? MuxSelect2 : Idle;
        muxSel = putOut ? 1'b1: 1'b0;
	      done = 1'b1;
      end
    endcase
  end

  always@(posedge clk, posedge rst)begin
    if(rst)
      ps <= Idle;
    else
      ps <= ns;
  end	

  always @(posedge clk, posedge rst) begin
    if(cntEn)
      counter <= counter + 1;
    if (rst)
      counter <= 3'd0;
    if(initCounter)
      counter <= 3'd0;
  end
  assign co = &counter;
endmodule