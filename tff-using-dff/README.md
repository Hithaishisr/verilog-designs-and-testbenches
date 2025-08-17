# 🔄 T Flip-Flop using D Flip-Flop (Verilog)

This project implements a **T (Toggle) Flip-Flop** using a **D Flip-Flop** in Verilog.  
 A **testbench** is included to **simulate and verify behavior**, including **reset and toggle functionality**.

---

## ✨ Features

- 🔹 **T Flip-Flop built using D Flip-Flop**
- ⏱ **Synchronous reset**
- 🔄 **Toggle behavior** → `Q` toggles on every clock when `T=1`
- ➖ **Hold behavior** → `Q` holds previous state when `T=0`
- 🧪 **Testbench included** for simulation and verification

---

## 📂 Files Included

- `tff_using_dff.v` → RTL design of the T Flip-Flop using D Flip-Flop
- `tff_using_dff_tb.v` → Testbench to verify functionality
- `README.md` → Documentation (this file)

---

## 🧩 Design Details

### 🔹 Ports

| Port   | Direction | Width | Description                    |
| ------ | --------- | ----- | ------------------------------ |
| `clk`  | input     | 1-bit | Clock signal                   |
| `rst`  | input     | 1-bit | Reset (resets output `Q` to 0) |
| `t`    | input     | 1-bit | Toggle input                   |
| `q`    | output    | 1-bit | Flip-Flop output               |
| `qbar` | output    | 1-bit | Complement of output `Q`       |

---

### 🔹 Functional Behavior

- **Reset**:
   When `rst = 1`, `Q` resets to `0`.
- **Toggle Mode (T = 1)**:
   Output `Q` **toggles** on every positive clock edge.
- **Hold Mode (T = 0)**:
   Output `Q` **holds its value**.

---

## 📊 Simulation

The testbench verifies:

1. **Reset functionality**
2. **Hold behavior (T=0)**
3. **Toggle behavior (T=1)**

### Example Waveform

```text
Time   clk  rst  T   Q   Qbar
0      0    1    0   0    1   ← Reset active
10     1    0    0   0    1   ← Hold (T=0)
20     0    0    1   1    0   ← Toggle (Q=1)
30     1    0    1   0    1   ← Toggle again
40     0    0    0   0    1   ← Hold (T=0)
```

Tasks in the testbench (`initialize`, `stimulus`, `monitor`) handle setup and stimulus, while `$monitor` continuously prints output states.

---

## 🛠️ How to Run

### ▶️ Using ModelSim / QuestaSim

```tcl
vlog tff_using_dff.v tff_using_dff_tb.v
vsim -c tff_using_dff_tb
run -all
```

The simulation demonstrates:

- Reset operation
- Toggle behavior (T=1)
- Hold behavior (T=0)

---

## 🔹 License

MIT License – see [LICENSE](../LICENSE) for details.

---

## 👨‍💻 Author

**Hithaishi S R**  
 🔗 [LinkedIn](https://www.linkedin.com/in/hithaishisr)  
 ✉️ hithaishisr2002@gmail.com