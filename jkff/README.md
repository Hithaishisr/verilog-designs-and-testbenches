# 🚀 JK Flip-Flop (JKFF) with Q and Q̅ Outputs (Verilog)

This project implements a **JK Flip-Flop** in Verilog with **synchronous reset**, producing both **Q** and **Q̅ (Qbar)** outputs.
 A testbench is included to **simulate clocked behavior and verify J/K input functionality**.

---

## ✨ Features

- ⏱ JK Flip-Flop with `posedge clock` operation.
- 🔄 Synchronous reset to initialize outputs.
- 🔹 Outputs include `Q` and `Q̅` (complement of Q).
- 🧪 Testbench included for **full verification of JK behavior** including Hold, Set, Reset, and Toggle conditions.

---

## 📂 Files Included

- `jkff.v` → RTL design of the JK Flip-Flop.
- `jkff_tb.v` → Testbench for verifying JKFF functionality.
- `README.md` → Documentation (this file).

---

## 🧩 Design Details

### 🔹 Ports

| Port   | Direction | Width | Description                         |
| ------ | --------- | ----- | ----------------------------------- |
| `clk`  | input     | 1-bit | Clock input (rising edge triggered) |
| `rst`  | input     | 1-bit | Synchronous reset                   |
| `j`    | input     | 1-bit | J input                             |
| `k`    | input     | 1-bit | K input                             |
| `q`    | output    | 1-bit | Flip-flop output                    |
| `qbar` | output    | 1-bit | Complement of Q output              |

---

## 📊 Simulation

The testbench cycles through **reset and J/K input sequences** to verify correct behavior of Q and Q̅.

### JK Operation Table

| J    | K    | Next Q | Next Q̅ |
| ---- | ---- | ------ | ------ |
| 0    | 0    | Hold   | Hold   |
| 0    | 1    | 0      | 1      |
| 1    | 0    | 1      | 0      |
| 1    | 1    | Toggle | Toggle |

### Example Waveform

```text
Time   clk  rst  J  K  Q  Qbar
0      0    1    0  0  0   1
5      1    1    0  0  0   1
10     0    0    0  1  0   1
15     1    0    0  1  0   1
20     0    0    1  0  1   0
25     1    0    1  1  0   1
...
```

The testbench applies **all JK input combinations** and uses `$monitor` to display **real-time values**.

---

## 🛠️ How to Run

### ▶️ Using ModelSim / QuestaSim

```tcl
vlog jkff.v jkff_tb.v
vsim -c jkff_tb
run -all
```

The simulation will show the behavior of **Q and Q̅** with respect to **clock, reset, and J/K inputs**.

---

## 🔹 License

This project is licensed under the MIT License – see the [LICENSE](../LICENSE) file for details.

---

## 👨‍💻 Author

**Hithaishi S R**  
 🔗 [LinkedIn](https://www.linkedin.com/in/hithaishisr)  
 ✉️ hithaishisr2002@gmail.com