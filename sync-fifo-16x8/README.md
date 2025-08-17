# 🧠 Synchronous FIFO (16x8) – Verilog

This project implements a **Synchronous FIFO (First-In-First-Out) buffer** with **16 entries of 8-bit width** in Verilog.  
 The design uses a **single clock** for both read and write operations, with **full and empty flag generation** for proper data handling.

---

## ✨ Features

- 📦 **16-depth FIFO** with **8-bit data width**.
- ⏳ **Single clock domain** for both read and write operations.
- 🟢 **Full and Empty flag logic** using read/write pointers.
- 🔄 **Circular buffer implementation** with 5-bit pointers.
- 🧹 **Asynchronous reset** clears memory and pointers.
- 🧪 **Testbench included** for simulation and verification.

---

## 📂 Files Included

- `sync_fifo_16x8.v` → RTL design of the FIFO.
- `sync_fifo_16x8_tb.v` → Testbench for verifying the design.
- `README.md` → Documentation (this file).

---

## 🧩 Design Details

### 🔹 Ports

| Port       | Direction | Width | Description                    |
| ---------- | --------- | ----- | ------------------------------ |
| `clk`      | input     | 1-bit | System clock                   |
| `rst`      | input     | 1-bit | Active-low asynchronous reset  |
| `data_in`  | input     | 8-bit | Data input for write operation |
| `read_n`   | input     | 1-bit | Read enable (active high)      |
| `write_n`  | input     | 1-bit | Write enable (active high)     |
| `data_out` | output    | 8-bit | Data output for read operation |
| `full`     | output    | 1-bit | Indicates FIFO is full         |
| `empty`    | output    | 1-bit | Indicates FIFO is empty        |

---

### 🔹 Functionality

1. **Write Operation**
   - On `posedge clk`, if `write_n=1` and FIFO not `full`, the `data_in` is stored at the write pointer location.
   - `write_ptr` increments after every successful write.
2. **Read Operation**
   - On `posedge clk`, if `read_n=1` and FIFO not `empty`, `data_out` is updated from the read pointer location.
   - `read_ptr` increments after every successful read.
3. **Full/Empty Flags**
   - `empty = 1` when both pointers are equal.
   - `full = 1` when pointers wrap around and overlap with opposite MSB values.
4. **Reset**
   - Clears memory, resets `write_ptr`, `read_ptr`, and `data_out`.

---

## 📊 Simulation

The testbench performs the following steps:

- Resets FIFO (clears all locations).
- Writes **16 random values** into the FIFO.
- Reads back data from the FIFO after some cycles.

### Example Simulation Flow (conceptual)

```text
Reset FIFO → All memory = 0
Write phase → Data written sequentially at FIFO locations
Full flag set when 16th element is written
Read phase → Data read back in FIFO order
Empty flag set when FIFO is drained
```

---

## 🛠️ How to Run

### ▶️ Using ModelSim / QuestaSim

```tcl
vlog sync_fifo_16x8.v sync_fifo_16x8_tb.v
vsim -c sync_fifo_16x8_tb
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