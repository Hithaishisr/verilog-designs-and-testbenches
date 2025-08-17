# 🚀 4-bit Synchronous MOD-12 UP Counter (Verilog)

This project implements a **4-bit synchronous up-counter** that counts from **0 to 11** (MOD-12).  
 A **testbench** is included to **simulate and verify counter behavior**, including **load and reset functionality**.

---

## ✨ Features

- 🔹 **4-bit synchronous counter** with MOD-12 behavior.
- 🔄 **Up-counting**: counts from 0 to 11, then wraps to 0.
- ⏱ **Synchronous reset** and **load inputs** for flexibility.
- 🧪 **Testbench included** to verify counting, reset, and load operations.

---

## 📂 Files Included

- `sync_mod12_counter.v` → RTL design of the 4-bit MOD-12 UP counter.
- `sync_mod12_counter_tb.v` → Testbench for verifying counter functionality.
- `README.md` → Documentation (this file).

---

## 🧩 Design Details

### 🔹 Ports

| Port   | Direction | Width | Description                             |
| ------ | --------- | ----- | --------------------------------------- |
| `clk`  | input     | 1-bit | Clock signal                            |
| `rst`  | input     | 1-bit | Synchronous reset (resets counter to 0) |
| `load` | input     | 1-bit | Load enable for preset input            |
| `i`    | input     | 4-bit | Preset value to load into the counter   |
| `q`    | output    | 4-bit | Current counter value (0–11)            |

### 🔹 Functional Behavior

- **Reset**: When `rst = 1`, counter resets to 0.
- **Load**: When `load = 1` and `i < 12`, the counter loads the value `i`.
- **Counting**: On each positive clock edge, if not loading and `q < 11`, counter increments by 1.
- **Wrap-around**: If `q = 11`, the next count wraps to 0.

---

## 📊 Simulation

The testbench verifies:

1. Counter **resets correctly** on `rst = 1`.
2. **Load functionality** with values `< 12`.
3. Proper **counting and wrap-around** from 11 → 0.

### Example Waveform

```text
Time   clk  rst  load  i   q
0      0    1    0     0   0
10     1    0    1     6   6
20     0    0    0     -   7
30     1    0    0     -   8
40     0    0    0     -   9
50     1    0    0     -  10
60     0    0    0     -  11
70     1    0    0     -   0
...
```

The testbench uses `$monitor` to display **real-time counter values**, and tasks to **initialize and load preset inputs**.

---

## 🛠️ How to Run

### ▶️ Using ModelSim / QuestaSim

```tcl
vlog sync_mod12_counter.v sync_mod12_counter_tb.v
vsim -c sync_mod12_counter_tb
run -all
```

The simulation will demonstrate:

- Reset behavior
- Loading preset values (<12)
- Synchronous counting and wrap-around

---

## 🔹 License

This project is licensed under the MIT License – see the [LICENSE](../LICENSE) file for details.

---

## 👨‍💻 Author

**Hithaishi S R**  
 🔗 [LinkedIn](https://www.linkedin.com/in/hithaishisr)  
 ✉️ hithaishisr2002@gmail.com