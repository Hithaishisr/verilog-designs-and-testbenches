# 🚀 SR Latch with Q and Q̅ Outputs (Verilog)

This project implements a **Set-Reset (SR) Latch** in Verilog, producing both **Q** and **Q̅ (Qbar)** outputs.  
 A **testbench** is included to **simulate all input combinations and verify latch behavior**.

---

## ✨ Features

- 🔹 SR Latch using **NAND or NOR gates**.
- ⏱ Immediate output response based on **S and R inputs**.
- 🔄 Outputs include `Q` and `Q̅` (complement of Q).
- 🧪 Testbench included for **full verification of latch behavior**, including Set, Reset, and Hold conditions.

---

## 📂 Files Included

- `sr_latch.v` → RTL design of the SR Latch.
- `sr_latch_tb.v` → Testbench for verifying SR Latch functionality.
- `README.md` → Documentation (this file).

---

## 🧩 Design Details

### 🔹 Ports

| Port   | Direction | Width | Description            |
| ------ | --------- | ----- | ---------------------- |
| `s`    | input     | 1-bit | Set input              |
| `r`    | input     | 1-bit | Reset input            |
| `q`    | output    | 1-bit | Latch output           |
| `qbar` | output    | 1-bit | Complement of Q output |

### 🔹 Gate-Level Implementation

- **NOR-based Latch**:

  ```verilog
  nor g1 (q, r, qbar);
  nor g2 (qbar, s, q);
  ```

- **NAND-based Latch**:

  ```verilog
  nand g1 (q, ~s, qbar);
  nand g2 (qbar, ~r, q);
  ```

---

## 📊 Simulation

The testbench cycles through **all S/R input combinations** to verify correct behavior of Q and Q̅.

### SR Latch Operation Table

| S    | R    | Next Q      | Next Q̅      |
| ---- | ---- | ----------- | ----------- |
| 0    | 0    | Hold        | Hold        |
| 0    | 1    | 0           | 1           |
| 1    | 0    | 1           | 0           |
| 1    | 1    | Invalid / X | Invalid / X |

### Example Waveform

```text
Time   S  R  Q  Qbar
0      0  0  0  1
5      0  1  0  1
10     1  0  1  0
15     1  1  x  x
...
```

The testbench applies **all S/R input combinations** and uses `$monitor` to display **real-time values**.

---

## 🛠️ How to Run

### ▶️ Using ModelSim / QuestaSim

```tcl
vlog sr_latch.v sr_latch_tb.v
vsim -c sr_latch_tb
run -all
```

The simulation will show the behavior of **Q and Q̅** for all **S/R input combinations**.

---

## 🔹 License

This project is licensed under the MIT License – see the [LICENSE](../LICENSE) file for details.

---

## 👨‍💻 Author

**Hithaishi S R**  
 🔗 [LinkedIn](https://www.linkedin.com/in/hithaishisr)  
 ✉️ hithaishisr2002@gmail.com