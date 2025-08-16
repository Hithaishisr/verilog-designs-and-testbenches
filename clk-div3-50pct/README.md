# 🚀 Clock Divider by 3 with ~50% Duty Cycle (Verilog)

This project implements a **clock divider** in Verilog that generates a clock signal with a frequency equal to **1/3 of the input clock** and an approximately **50% duty cycle**.  

---

## ✨ Features

- ⏱️ Divides input clock by 3.  
- ⚡ Produces an output with ~50% duty cycle.  
- 🔄 Handles asynchronous reset.  
- 🧪 Testbench included for easy simulation and verification.  

---

## 📂 Files Included

- `clk_div3_50pct.v` → RTL design of the clock divider.  
- `clk_div3_50pct_tb.v` → Testbench for verifying the clock divider.  
- `README.md` → Documentation (this file).  

---

## 🧩 Clock Divider Design

### 🔹 Logic Overview

- A **2-bit counter (`d1`)** is used to track the clock cycles.  
- Output (`f`) is generated using a combination of **d1 and a delayed version `d2`** sampled at the negative edge of the clock.  
- The design ensures an **approximate 50% duty cycle** for the divided clock.  

### 🔹 State/Counter Sequence

- `d1` cycles through 0 → 1 → 3 → 0 continuously.  
- `d2` captures the least significant bit of `d1` at the negative edge.  
- Output `f` is derived from combining `d1` and `d2` to maintain ~50% duty cycle.  

---

## 📊 Simulation

The testbench generates a clock and applies a reset to verify correct output.  
The output `f` is a divided clock signal with a frequency one-third of the input clock and nearly 50% duty cycle.  

---

## 🛠️ How to Run

### ▶️ Using ModelSim / QuestaSim
```tcl
vlog clk_div3_50pct.v clk_div3_50pct_tb.v
vsim -c clk_div3_50pct_tb
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
