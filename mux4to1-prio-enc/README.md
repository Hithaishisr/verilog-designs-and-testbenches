
# 🚀 4:1 MUX with 8-bit Input and Priority Encoded Output (Verilog)

This project implements a **4:1 multiplexer (MUX)** in Verilog which takes four 8-bit inputs and produces a **3-bit priority encoded output**.  
The output represents the position of the **highest-priority active bit** from the selected input.

---

## ✨ Features
- 🔁 4:1 MUX with 8-bit inputs.  
- 🏆 Priority encoder output (3-bit) based on the highest active input bit.  
- 🧪 Testbench included for simulation and verification.  

---

## 📂 Files Included
- `mux4to1_prio_enc.v` → RTL design of the 4:1 MUX with priority encoder.  
- `mux4to1_prio_enc_tb.v` → Testbench for verifying the design.  
- `README.md` → Documentation (this file).  

---

## 🧩 Design Details

### 🔹 Ports
| Port | Direction | Width | Description |
|------|----------|-------|-------------|
| `I0` | input    | 8-bit | Input 0 |
| `I1` | input    | 8-bit | Input 1 |
| `I2` | input    | 8-bit | Input 2 |
| `I3` | input    | 8-bit | Input 3 |
| `S`  | input    | 2-bit | Select signal |
| `F`  | output   | 3-bit | Priority encoded output |

### 🔹 Functionality
1. Select one of the four 8-bit inputs based on the 2-bit select line `S`.  
2. Encode the selected input using **priority encoding**:
   - Checks from MSB (bit 7) down to LSB (bit 0).  
   - Output `F` gives the index of the highest-priority active bit.  

---

## 📊 Simulation
The testbench applies specific input values to verify correct priority encoding.

### Example Test Inputs
```text
I0 = 156  (10011100)
I1 = 23   (00010111)
I2 = 56   (00111000)
I3 = 7    (00000111)
```

### Example Output Log
```text
Select S=0 -> F = 7 (highest bit in I0)
Select S=1 -> F = 4 (highest bit in I1)
Select S=2 -> F = 5 (highest bit in I2)
Select S=3 -> F = 2 (highest bit in I3)
```

---

## 🛠️ How to Run

### ▶️ Using ModelSim / QuestaSim
```tcl
vlog mux4to1_prio_enc.v mux4to1_prio_enc_tb.v
vsim -c mux4to1_prio_enc_tb
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
