# 🗄️ 16x8 Dual Port Synchronous RAM – Verilog

This project implements a **16x8 Dual Port Synchronous RAM (SRAM)** in Verilog.  
The design supports **independent read and write operations** on separate ports, with synchronous operation controlled by a clock.

---

## ✨ Features

- 📦 **16 memory locations**, each **8 bits wide**.
- ✍️ **Write operation** – controlled using `we` (write enable).
- 📖 **Read operation** – controlled using `en` (enable).
- ⏳ **Synchronous design** – all operations occur on the rising edge of `clk`.
- 🧹 **Reset support** – clears all memory locations.
- 🧪 **Testbench included** for functional verification.

---

## 📂 Files Included

- `sync_dual_port_sram_16x8.v` → RTL design of the 16x8 Dual Port Synchronous RAM.
- `sync_dual_port_sram_16x8_tb.v` → Testbench for verifying the RAM functionality.
- `README.md` → Documentation (this file).

---

## 🧩 Design Details

### 🔹 Ports

| Port     | Direction | Width | Description                       |
| -------- | --------- | ----- | --------------------------------- |
| `clk`    | input     | 1-bit | Clock signal for synchronization. |
| `rst`    | input     | 1-bit | Active-high reset, clears memory. |
| `we`     | input     | 1-bit | Write enable signal.              |
| `en`     | input     | 1-bit | Read enable signal.               |
| `w_addr` | input     | 4-bit | Write address (0–15).             |
| `r_addr` | input     | 4-bit | Read address (0–15).              |
| `data_w` | input     | 8-bit | Data input for write operations.  |
| `data_r` | output    | 8-bit | Data output for read operations.  |

---

### 🔹 Functionality

1. **Reset**
   - When `rst=1`, all memory locations are cleared to `0`.
2. **Write Operation**
   - Performed when `we=1` and `en=0`.
   - `data_w` is stored at location `w_addr`.
3. **Read Operation**
   - Performed when `we=0` and `en=1`.
   - `data_r` outputs the contents of location `r_addr`.
4. **Idle State**
   - If neither read nor write is active, memory retains previous values.

---

## 📊 Simulation

The testbench performs the following sequence:

1. Applies reset to clear all memory locations.
2. Writes random values (`0–255`) to all 16 memory locations.
3. Reads back all memory locations sequentially to verify correctness.

### Example Simulation Flow

```text
Time  Operation  Addr  Data_w  Data_r
-------------------------------------
t0    Reset      -     -       0
t1    Write      0     101     -
t2    Write      1     233     -
...
t17   Read       0     -       101
t18   Read       1     -       233
```

---

## 🛠️ How to Run

### ▶️ Using ModelSim / QuestaSim

```tcl
vlog sync_dual_port_sram_16x8.v sync_dual_port_sram_16x8_tb.v
vsim -c sync_dual_port_sram_16x8_tb
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