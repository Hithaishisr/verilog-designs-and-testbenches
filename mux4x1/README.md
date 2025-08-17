# 🚀 4:1 Multiplexer (Verilog)

This project implements a **4-to-1 multiplexer** in Verilog, which selects one of **four input lines** based on a **2-bit select signal** and produces a single output.
 The design is hierarchical, using **2:1 MUX modules** to build the 4:1 MUX.

---

## ✨ Features

- 🔢 4-to-1 multiplexer.
- 🧪 Testbench included to simulate all input and select signal combinations.
- ✅ Simple **RTL design** using `always @(*)` for combinational logic.
- ⚡ Hierarchical design approach using **2:1 MUX building blocks**.

---

## 📂 Files Included

- `mux2x1.v` → RTL design of the 2×1 multiplexer.
- `mux4x1.v` → RTL design of the 4×1 multiplexer (uses `mux2x1` instances).
- `mux4x1_tb.v` → Testbench to verify the 4×1 MUX.
- `README.md` → Documentation (this file).

---

## 🧩 Design Details

### 🔹 Ports

| Port | Direction | Width | Description               |
| ---- | --------- | ----- | ------------------------- |
| `I`  | input     | 4-bit | Input data lines          |
| `s`  | input     | 2-bit | Select signal             |
| `f`  | output    | 1-bit | Output of the multiplexer |

### 🔹 Functionality

1. Uses **two 2:1 MUXes** to select between the four inputs.
2. **Select lines (`s[1:0]`)** determine which input (`I[3:0]`) is passed to the output `f`.

| Select `s` | Output `f` |
| ---------- | ---------- |
| `00`       | `I0`       |
| `01`       | `I1`       |
| `10`       | `I2`       |
| `11`       | `I3`       |

---

## 📊 Simulation

The testbench iterates through **all 16 input combinations** (`I=0000` to `1111`) for **each select signal** (`s=00` to `11`) to verify correct operation.

### Example Test Inputs

```text
s = 00, I = 0000
s = 00, I = 0001
s = 01, I = 0010
...
s = 11, I = 1111
```

### Example Output Log

```text
s=00, I=0000 -> f=0
s=00, I=0001 -> f=1
s=01, I=0010 -> f=0
...
s=11, I=1111 -> f=1
```

---

## 🛠️ How to Run

### ▶️ Using ModelSim / QuestaSim

```tcl
vlog mux2x1.v mux4x1.v mux4x1_tb.v
vsim -c mux4x1_tb
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