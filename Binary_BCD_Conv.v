module Binary_to_BCD (
    input wire [7:0] binary_in,    
    output reg [3:0] bcd_hundreds, 
    output reg [3:0] bcd_tens,     
    output reg [3:0] bcd_ones      
);

    reg [19:0] shift_reg;         
    integer i;                    

    
    reg [3:0] temp;               

    always @(*) begin
       
        shift_reg = {12'b000000000000, binary_in};

        
        for (i = 0; i < 8; i = i + 1) begin
            
            if (shift_reg[19:16] >= 5) begin
                shift_reg[19:16] = shift_reg[19:16] + 4'b0011; 
            end

           
            if (shift_reg[15:12] >= 5) begin
                shift_reg[15:12] = shift_reg[15:12] + 4'b0011; 
            end

            
            if (shift_reg[11:8] >= 5) begin
                shift_reg[11:8] = shift_reg[11:8] + 4'b0011; 
            end

            
            shift_reg = shift_reg << 1;
        end

        
        bcd_hundreds = shift_reg[19:16];
        bcd_tens     = shift_reg[15:12];
        bcd_ones     = shift_reg[11:8];
    end
endmodule
