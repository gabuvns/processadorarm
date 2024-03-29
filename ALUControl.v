//ALU Control (iOpcode, iALUOperacao, oControlSignal); 

module ALUControl (iOpcode, iALUOp, oControlSignal);


/* I/O type definition */
input wire [10:0] iOpcode;
input wire [1:0] iALUOp;
output reg [3:0] oControlSignal;

wire DefOp = {iOpcode[9:8], iOpcode[3]};

always @(iALUOp)
begin
	case (iALUOp)
		2'b00:
			oControlSignal <=	OPADD;	//DEFINICAO DE (LDUR STUR B + X0 CBZ)
 		2'b01:
			oControlSignal <=	OPSUB;	//	DEFINICAO DE (BRANCH - REGISTER)
		2'b10:
			begin
				case (DefOp)
					3'b001:	//ADD
						oControlSignal <= OPADD;	//DEFINICAO DE SOMA
					3'b101: 	//SUB
						oControlSignal <= OPSUB;	//DEFINICAO DE SUBTRACAO
					3'b000:	//AND
						oControlSignal <= OPAND;	//DEFINICAO DE AND
					3'b010:	//ORR
						oControlSignal <= OPORR;	//DEFINICAO DE OR
					default:
						oControlSignal <= 4'b0000;
				endcase
			end
	endcase
end

endmodule
