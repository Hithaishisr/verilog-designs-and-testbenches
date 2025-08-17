# 🔄 4-bit Loadable Synchronous UP-DOWN Counter (Verilog)

This project implements a **4-bit synchronous loadable UP-DOWN counter** in Verilog.  
 A **testbench** is included to **simulate and verify counter behavior**, including **reset, load, up-count, and down-count functionality**.

---

## ✨ Features

- 🔹 **4-bit synchronous UP/DOWN counter**
- ⏫ **Up-counting mode** (0 → 15 with wrap-around)
- ⏬ **Down-counting mode** (15 → 0 with wrap-around)
- ⏱ **Synchronous reset** to 0
- 📝 **Load input** allows presetting the counter with any 4-bit value
- 🧪 **Testbench included** for simulation and verification

---

## 📂 Files Included

- `sync_updown_counter_4bit.v` → RTL design of the 4-bit loadable synchronous UP-DOWN counter
- `sync_updown_counter_4bit_tb.v` → Testbench to verify functionality
- `README.md` → Documentation (this file)

---

## 🧩 Design Details

### 🔹 Ports

| Port      | Direction | Width | Description                                    |
| --------- | --------- | ----- | ---------------------------------------------- |
| `clk`     | input     | 1-bit | Clock signal                                   |
| `rst`     | input     | 1-bit | Synchronous reset (resets counter to 0)        |
| `load`    | input     | 1-bit | Load enable for preset input                   |
| `control` | input     | 1-bit | Mode select → `1` = UP count, `0` = DOWN count |
| `i`       | input     | 4-bit | Preset value to load into the counter          |
| `q`       | output    | 4-bit | Current counter value (0–15)                   |

---

### 🔹 Functional Behavior

- **Reset**:
   When `rst = 1`, counter resets to `0`.
- **Load**:
   When `load = 1`, counter loads the 4-bit value `i`.
- **Counting**:
  - If `control = 1` → counter **increments by 1** each clock cycle.
  - If `control = 0` → counter **decrements by 1** each clock cycle.
- **Wrap-around**:
  - In UP mode, after 15 → rolls back to 0.
  - In DOWN mode, after 0 → rolls back to 15.

---

## 📊 Simulation

The testbench verifies:

1. **Reset functionality**
2. **Loading preset values**
3. **UP counting** when `control = 1`
4. **DOWN counting** when `control = 0`

### Example Waveform

```text
Time   clk  rst  load  control  i   q
0      0    1    0     1        0   0
10     1    0    1     1        9   9   ← load 9
20     0    0    0     1        -  10   ← up count
30     1    0    0     1        -  11
40     0    0    0     0        -  10   ← switch to down count
50     1    0    0     0        -   9
60     0    0    0     0        -   8
...
```

Tasks in the testbench (`initialize`, `monitor`, `load_in`) handle setup and stimulus, while `$monitor` continuously displays counter outputs.

---

## 🛠️ How to Run

### ▶️ Using ModelSim / QuestaSim

```tcl
vlog sync_updown_counter_4bit.v sync_updown_counter_4bit_tb.v
vsim -c sync_updown_counter_4bit_tb
run -all
```

The simulation demonstrates:

- Reset behavior
- Load operation
- Up-count and Down-count modes

---

## 🔹 License

MIT License – see [LICENSE](../LICENSE) for details.

---

## 👨‍💻 Author

**Hithaishi S R**  
 🔗 [LinkedIn](https://www.linkedin.com/in/hithaishisr)  
 ✉️ hithaishisr2002@gmail.com