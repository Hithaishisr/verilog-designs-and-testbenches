# 🚀 4:1 MUX using Functions (Verilog)

This project implements a **4:1 multiplexer (MUX)** in Verilog using **functions** to select the output.  
It takes four 1-bit inputs and a 2-bit select line, producing a single-bit output.

---

## ✨ Features
- 🔁 4:1 MUX using a function for input selection.  
- 🧪 Testbench included for simulation and verification.  
- ✅ Simple and modular design using Verilog functions.  

---

## 📂 Files Included
- `mux4to1_func_select.v` → RTL design of the 4:1 MUX using functions.  
- `mux4to1_func_select_tb.v` → Testbench for verifying the design.  
- `README.md` → Documentation (this file).  

---

## 🧩 Design Details

### 🔹 Ports
| Port | Direction | Width | Description |
|------|----------|-------|-------------|
| `I`  | input    | 4-bit | Input vector `[I3 I2 I1 I0]` |
| `S`  | input    | 2-bit | Select signal |
| `F`  | output   | 1-bit | Output based on selected input |

### 🔹 Functionality
1. The **function `Select`** simply returns the input value passed to it.  
2. The **always block with case statement** selects the input bit according to the 2-bit select signal `S`.  
3. Output `F` reflects the chosen input value.

---

## 📊 Simulation
The testbench cycles through all possible input and select combinations to verify correct functionality.

### Example Test Inputs
```text
S = 0 -> I = 1001  -> F = 1 (I0 selected)
S = 1 -> I = 1001  -> F = 0 (I1 selected)
S = 2 -> I = 1001  -> F = 0 (I2 selected)
S = 3 -> I = 1001  -> F = 1 (I3 selected)
```

### Example Output Log
```text
0 s=00,I=0000,f=0
10 s=00,I=0001,f=1
20 s=00,I=0010,f=0
...
```

---

## 🛠️ How to Run

### ▶️ Using ModelSim / QuestaSim
```tcl
vlog mux4to1_func_select.v mux4to1_func_select_tb.v
vsim -c mux4to1_func_select_tb
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
