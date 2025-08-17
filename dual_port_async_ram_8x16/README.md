# 🧠 Dual-Port Asynchronous RAM (8x16) – Verilog

This project implements a **Dual-Port Asynchronous RAM** with **separate read and write clocks** in Verilog.  
 The design allows **simultaneous read and write operations** through independent ports, making it suitable for **FIFO buffers, multi-clock domain designs, and memory-mapped systems**.

---

## ✨ Features

- 📦 **8-word RAM** with **16-bit word size**.
- ⏳ **Dual-port architecture** with **independent read (`clk_r`) and write (`clk_w`) clocks**.
- 🔄 **Asynchronous operation** – read and write ports function independently.
- 🧹 **Synchronous reset** clears memory contents.
- 🧪 **Testbench included** for simulation and verification.

---

## 📂 Files Included

- `dual_port_async_ram_8x16.v` → RTL design of the Dual-Port Asynchronous RAM.
- `dual_port_async_ram_8x16_tb.v` → Testbench for verifying the design.
- `README.md` → Documentation (this file).

---

## 🧩 Design Details

### 🔹 Ports

| Port     | Direction | Width  | Description                      |
| -------- | --------- | ------ | -------------------------------- |
| `we`     | input     | 1-bit  | Write enable                     |
| `en`     | input     | 1-bit  | Read enable                      |
| `rst`    | input     | 1-bit  | Reset (clears memory and output) |
| `clk_w`  | input     | 1-bit  | Write clock                      |
| `clk_r`  | input     | 1-bit  | Read clock                       |
| `addr_w` | input     | 3-bit  | Write address (0–7)              |
| `addr_r` | input     | 3-bit  | Read address (0–7)               |
| `data_w` | input     | 16-bit | Data to be written               |
| `data_r` | output    | 16-bit | Data read from memory            |

---

### 🔹 Functionality

1. **Write Operation**
   - Triggered on `posedge clk_w`.
   - If `we=1` and `en=0`, `data_w` is written to `mem[addr_w]`.
2. **Read Operation**
   - Triggered on `posedge clk_r`.
   - If `we=0` and `en=1`, `data_r` is updated with `mem[addr_r]`.
3. **Reset**
   - Clears all memory locations and output `data_r` to `0`.

---

## 📊 Simulation

The testbench writes random values into the RAM and then reads them back.

### Example Simulation Flow

```text
Reset memory → All locations set to 0
Write phase  → Data written at addresses [0–7]
Read phase   → Data read back and compared
```

### Expected Output Log (conceptual)

```text
Writing: Addr=0 Data=123
Writing: Addr=1 Data=45
...
Reading: Addr=0 -> Data=123
Reading: Addr=1 -> Data=45
...
```

---

## 🛠️ How to Run

### ▶️ Using ModelSim / QuestaSim

```tcl
vlog dual_port_async_ram_8x16.v dual_port_async_ram_8x16_tb.v
vsim -c dual_port_async_ram_8x16_tb
run -all
```

---

## 🔹 License

This project is licensed under the MIT License – see the [LICENSE](../LICENSE) file for details.

---

## 👨‍💻 Author

**Hithaishi S R**  
 🔗 [LinkedIn](https://www.linkedin.com/in/hithaishisr)  
 ✉️ hithaishisr2002@gmail.com