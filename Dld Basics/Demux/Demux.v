module example (
  input d_in,sel,
  output reg d_out1,d_out2
  );
 always @(*)
 begin 
   case(sel)
     1'b0 : {d_out1,d_out2} = {d_in,1'b0};
     1'b1 : {d_out1,d_out2} = {1'b0,d_in};
   endcase
 end
endmodule