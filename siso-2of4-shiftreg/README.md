# 🚀 SISO 2-of-4 Shift Register (Verilog)

This project implements a **Serial-In Serial-Out (SISO) shift register** in Verilog, which shifts **only during the first 2 clock cycles of every 4-clock cycle window**.  
The design allows controlled, time-gated shifting of input bits.

---

## ✨ Features
- 🔁 SISO shift register with configurable width (`n_bit`).  
- ⏱️ Shifts input only during the **first 2 cycles out of every 4**.  
- 🧪 Testbench included for simulation and verification.  

---

## 📂 Files Included
- `siso_2of4_shiftreg.v` → RTL design of the SISO 2-of-4 shift register.  
- `siso_2of4_shiftreg_tb.v` → Testbench for verifying the design.  
- `README.md` → Documentation (this file).  

---

## 🧩 Design Details

### 🔹 Ports
| Port  | Direction | Width | Description                          |
| ----- | --------- | ----- | ------------------------------------ |
| `clk` | input     | 1-bit | Clock signal                         |
| `rst` | input     | 1-bit | Active-high reset                    |
| `I`   | input     | 1-bit | Serial data input                    |
| `F`   | output    | 1-bit | Serial data output (MSB of register) |

### 🔹 Functionality
1. On every **positive edge of the clock**, the internal counter `count` tracks a 4-cycle window.  
2. The shift register `temp` **shifts left** and loads input `I` **only when `count` is 0 or 1**.  
3. During the remaining 2 cycles (`count` 2 or 3), the register holds its value.  
4. The output `F` always reflects the **MSB** of the register.

---

## 📊 Simulation
The testbench applies random input values to verify correct shifting behavior.

### Example Output Log
```text
Cycle 0 -> F = 0
Cycle 1 -> F = 1
Cycle 2 -> F = 1 (hold)
Cycle 3 -> F = 1 (hold)
Cycle 4 -> F = 3
Cycle 5 -> F = 7
...
```

This pattern repeats, showing the **2-of-4 clock shift behavior**.

---

## 🛠️ How to Run

### ▶️ Using ModelSim / QuestaSim

```tcl
vlog siso_2of4_shiftreg.v siso_2of4_shiftreg_tb.v
vsim -c siso_2of4_shiftreg_tb
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