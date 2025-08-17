# 🚀 4-bit Loadable Synchronous UP Counter (Verilog)

This project implements a **4-bit synchronous loadable up-counter**.  
 A **testbench** is included to **simulate and verify counter behavior**, including **load and reset functionality**.

---

## ✨ Features

- 🔹 **4-bit synchronous counter**
- 🔄 **Up-counting** with wrap-around from 15 → 0 (full 4-bit range)
- ⏱ **Synchronous reset** to 0
- 📝 **Load input** allows presetting the counter
- 🧪 **Testbench included** for simulation and verification

---

## 📂 Files Included

- `loadable_sync_up_counter_4b.v` → RTL design of the 4-bit loadable synchronous up-counter
- `loadable_sync_up_counter_4b_tb.v` → Testbench to verify functionality
- `README.md` → Documentation (this file)

---

## 🧩 Design Details

### 🔹 Ports

| Port   | Direction | Width | Description                             |
| ------ | --------- | ----- | --------------------------------------- |
| `clk`  | input     | 1-bit | Clock signal                            |
| `rst`  | input     | 1-bit | Synchronous reset (resets counter to 0) |
| `load` | input     | 1-bit | Load enable for preset input            |
| `i`    | input     | 4-bit | Preset value to load into the counter   |
| `q`    | output    | 4-bit | Current counter value (0–15)            |

### 🔹 Functional Behavior

- **Reset**: When `rst = 1`, counter resets to 0
- **Load**: When `load = 1`, counter loads the value `i`
- **Counting**: On each positive clock edge, if not loading, counter increments by 1
- **Wrap-around**: After 15, counter rolls back to 0

---

## 📊 Simulation

The testbench verifies:

1. Counter **resets correctly** on `rst = 1`
2. **Load functionality** works at any 4-bit value
3. Proper **counting and wrap-around** from 15 → 0

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
70     1    0    0     -  12
...
```

Tasks in the testbench handle **initialization** and **loading preset values**, while `$monitor` displays real-time counter outputs.

---

## 🛠️ How to Run

### ▶️ Using ModelSim / QuestaSim

```tcl
vlog loadable_sync_up_counter_4b.v loadable_sync_up_counter_4b_tb.v
vsim -c loadable_sync_up_counter_4b_tb
run -all
```

The simulation demonstrates:

- Reset behavior
- Loading preset values
- Synchronous counting and wrap-around

---

## 🔹 License

MIT License – see [LICENSE](../LICENSE) for details.

---

## 👨‍💻 Author

**Hithaishi S R**  
 🔗 [LinkedIn](https://www.linkedin.com/in/hithaishisr)  
 ✉️ hithaishisr2002@gmail.com