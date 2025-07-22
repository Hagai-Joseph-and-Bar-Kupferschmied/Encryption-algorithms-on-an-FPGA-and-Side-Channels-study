module debounce(
    input clk,           // System clock
    input rst,
    input noisy_in,      // Raw key input
    output reg clean_out // Debounced output (1 clock pulse per press)
);
    reg [15:0] cnt;
    reg sync_0, sync_1, state;

    // Synchronize to clock domain
    always @(posedge clk) begin
        sync_0 <= noisy_in;
        sync_1 <= sync_0;
    end

    // Debounce logic
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            cnt <= 0;
            state <= 0;
            clean_out <= 0;
        end else begin
            if (sync_1 == state) begin
                cnt <= 0;
                clean_out <= 0;
            end else begin
                cnt <= cnt + 1;
                if (cnt == 16'hFFFF) begin
                    state <= sync_1;
                    clean_out <= sync_1; // One pulse when state changes
                end else begin
                    clean_out <= 0;
                end
            end
        end
    end
endmodule
