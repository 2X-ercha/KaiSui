module idu_is_bju_mask (
    clk,
    rst_clk,
    rtu_global_flush,
    y_idu_is_stall_ctrl,
    idu_idu_is_vld,
    rtu_idu_is_iid,
    idu_idu_is_pipe,
    nojump,
    biq_mask_stall_ctrl,
    x_lsiq_vld,
    x_lsiq_iid
);
    // &Ports;
    input         clk;
    input         rst_clk;
    input         rtu_global_flush;
    input         y_idu_is_stall_ctrl;
    input         idu_idu_is_vld;
    input  [4 :0] rtu_idu_is_iid;
    input  [4 :0] idu_idu_is_pipe;
    input         nojump;
    output        biq_mask_stall_ctrl;
    output        x_lsiq_vld;
    output [4 :0] x_lsiq_iid;

    // &Regs;
    reg [2 :0] num;
    reg [1 :0] head_biq_ptr;
    reg [1 :0] tail_biq_ptr;
    reg [3 :0] entry_vld;
    reg [4 :0] entry0_iid;
    reg [4 :0] entry1_iid;
    reg [4 :0] entry2_iid;
    reg [4 :0] entry3_iid;

    // &Wires;
    wire        clk;
    wire        rst_clk;
    wire        rtu_global_flush;
    wire        y_idu_is_stall_ctrl;
    wire        idu_idu_is_vld;
    wire [4 :0] rtu_idu_is_iid;
    wire [4 :0] idu_idu_is_pipe;
    wire        nojump;
    wire        biq_mask_stall_ctrl;
    wire        x_lsiq_vld;
    wire [4 :0] x_lsiq_iid;
    wire [3 :0] create_vld;
    wire [3 :0] pop_vld;
    wire        create_entry_vld;
    wire        pop_entry_vld;
    wire [3 :0] to_lsiq_iid_sel;

    assign create_vld[0] = (tail_biq_ptr == 2'd0) & create_entry_vld;
    assign create_vld[1] = (tail_biq_ptr == 2'd1) & create_entry_vld;
    assign create_vld[2] = (tail_biq_ptr == 2'd2) & create_entry_vld;
    assign create_vld[3] = (tail_biq_ptr == 2'd3) & create_entry_vld;

    assign pop_vld[0] = (head_biq_ptr == 2'd0) & entry_vld[0] & nojump;
    assign pop_vld[1] = (head_biq_ptr == 2'd1) & entry_vld[1] & nojump;
    assign pop_vld[2] = (head_biq_ptr == 2'd2) & entry_vld[2] & nojump;
    assign pop_vld[3] = (head_biq_ptr == 2'd3) & entry_vld[3] & nojump;

    assign biq_mask_stall_ctrl = (num == 4);
    assign pop_entry_vld = |pop_vld;
    assign create_entry_vld = idu_idu_is_vld & ~biq_mask_stall_ctrl & idu_idu_is_pipe[2] & ~y_idu_is_stall_ctrl;

    always @(posedge clk or negedge rst_clk)
    begin
        if (!rst_clk)
            num <= 0;
        else if (rtu_global_flush)
            num <= 0;
        else if (create_entry_vld & pop_entry_vld)
            num <= num;
        else if (create_entry_vld)
            num <= num + 1;
        else if (pop_entry_vld)
            num <= num - 1;
        else
            num <= num;
    end

    always @(posedge clk or negedge rst_clk)
    begin
        if (!rst_clk)
            head_biq_ptr <= 0;
        else if (rtu_global_flush)
            head_biq_ptr <= 0;
        else if (pop_entry_vld)
            head_biq_ptr <= head_biq_ptr + 1;
        else
            head_biq_ptr <= head_biq_ptr;
    end

    always @(posedge clk or negedge rst_clk)
    begin
        if (!rst_clk)
            tail_biq_ptr <= 0;
        else if (rtu_global_flush)
            tail_biq_ptr <= 0;
        else if (create_entry_vld)
            tail_biq_ptr <= tail_biq_ptr + 1;
        else
            tail_biq_ptr <= tail_biq_ptr;
    end

    always @(posedge clk or negedge rst_clk)
    begin
        if (!rst_clk) begin
            entry_vld[0] <= 0;
            entry0_iid   <= 0;
        end
        else if (rtu_global_flush || pop_vld[0]) begin
            entry_vld[0] <= 0;
            entry0_iid   <= 0;
        end
        else if (create_vld[0]) begin
            entry_vld[0] <= 1;
            entry0_iid   <= rtu_idu_is_iid;
        end
        else begin
            entry_vld[0] <= entry_vld[0];
            entry0_iid   <= entry0_iid;
        end
    end

    always @(posedge clk or negedge rst_clk)
    begin
        if (!rst_clk) begin
            entry_vld[1] <= 0;
            entry1_iid   <= 0;
        end
        else if (rtu_global_flush || pop_vld[1]) begin
            entry_vld[1] <= 0;
            entry1_iid   <= 0;
        end
        else if (create_vld[1]) begin
            entry_vld[1] <= 1;
            entry1_iid   <= rtu_idu_is_iid;
        end
        else begin
            entry_vld[1] <= entry_vld[1];
            entry1_iid   <= entry1_iid;
        end
    end

    always @(posedge clk or negedge rst_clk)
    begin
        if (!rst_clk) begin
            entry_vld[2] <= 0;
            entry2_iid   <= 0;
        end
        else if (rtu_global_flush || pop_vld[2]) begin
            entry_vld[2] <= 0;
            entry2_iid   <= 0;
        end
        else if (create_vld[2]) begin
            entry_vld[2] <= 1;
            entry2_iid   <= rtu_idu_is_iid;
        end
        else begin
            entry_vld[2] <= entry_vld[2];
            entry2_iid   <= entry2_iid;
        end
    end

    always @(posedge clk or negedge rst_clk)
    begin
        if (!rst_clk) begin
            entry_vld[3] <= 0;
            entry3_iid   <= 0;
        end
        else if (rtu_global_flush || pop_vld[3]) begin
            entry_vld[3] <= 0;
            entry3_iid   <= 0;
        end
        else if (create_vld[3]) begin
            entry_vld[3] <= 1;
            entry3_iid   <= rtu_idu_is_iid;
        end
        else begin
            entry_vld[3] <= entry_vld[3];
            entry3_iid   <= entry3_iid;
        end
    end

    assign to_lsiq_iid_sel[0] = (head_biq_ptr == 2'd0) & entry_vld[0];
    assign to_lsiq_iid_sel[1] = (head_biq_ptr == 2'd1) & entry_vld[1];
    assign to_lsiq_iid_sel[2] = (head_biq_ptr == 2'd2) & entry_vld[2];
    assign to_lsiq_iid_sel[3] = (head_biq_ptr == 2'd3) & entry_vld[3];

    assign x_lsiq_vld = |to_lsiq_iid_sel;
    assign x_lsiq_iid = (entry0_iid & {5{to_lsiq_iid_sel[0]}})
                      | (entry1_iid & {5{to_lsiq_iid_sel[1]}})
                      | (entry2_iid & {5{to_lsiq_iid_sel[2]}})
                      | (entry3_iid & {5{to_lsiq_iid_sel[3]}});

endmodule