# 🚀 D Flip-Flop (DFF) with Q and Q̅ Outputs (Verilog)

This project implements a **D Flip-Flop** in Verilog with **synchronous reset**, producing both **Q** and **Q̅ (Qbar)** outputs.
 A testbench is included to **simulate clocked behavior and reset functionality**.

---

## ✨ Features

- ⏱ Synchronous D Flip-Flop with `posedge clock` operation.
- 🔄 Synchronous reset to initialize outputs.
- 🔹 Outputs include `Q_out` and `Qb_out` (complement of Q).
- 🧪 Testbench included for full verification.

---

## 📂 Files Included

- `dff.v` → RTL design of the D Flip-Flop.
- `dff_tb.v` → Testbench for verifying DFF functionality.
- `README.md` → Documentation (this file).

---

## 🧩 Design Details

### 🔹 Ports

| Port     | Direction | Width | Description                         |
| -------- | --------- | ----- | ----------------------------------- |
| `clock`  | input     | 1-bit | Clock input (rising edge triggered) |
| `reset`  | input     | 1-bit | Synchronous reset                   |
| `d_in`   | input     | 1-bit | Data input                          |
| `Q_out`  | output    | 1-bit | Flip-flop output                    |
| `Qb_out` | output    | 1-bit | Complement of Q output              |

---

## 📊 Simulation

The testbench cycles through **reset and data input sequences** to verify correct behavior of Q and Q̅.

### Example Waveform

```
Time   clk  reset  d_in  Q_out  Qb_out
0      0    1      0     0      1
5      1    1      0     0      1
10     0    0      0     0      1
15     1    0      0     0      1
20     0    0      1     1      0
25     1    0      1     1      0
...
```

The testbench applies **multiple input combinations** and uses `$monitor` to display **real-time values**.

---

## 🛠️ How to Run

### ▶️ Using ModelSim / QuestaSim

```
vlog dff.v dff_tb.v
vsim -c dff_tb
run -all
```

The simulation will show the behavior of **Q and Q̅** with respect to **clock and reset**.

---

## 🔹 License

This project is licensed under the MIT License – see the [LICENSE](../LICENSE) file for details.

---

## 👨‍💻 Author

**Hithaishi S R**  
 🔗 [LinkedIn](https://www.linkedin.com/in/hithaishisr)  
 ✉️ hithaishisr2002@gmail.com