# 🔢 MOD-10 Up Counter with Flag (Verilog)

This project implements a **MOD-10 Up Counter** in Verilog with a **flag-based control mechanism**.  
The counter counts from `0` to `9`, then resets to `0`. The internal `flag` introduces a hold/resume effect, making this design slightly different from a standard mod-10 counter.

---

## ✨ Features
- 🔂 Counts sequentially from `0` to `9` (decimal).  
- ⚡ Asynchronous reset (active high).  
- 🏁 Resets to `0` automatically after reaching `9`.  
- 🚩 Uses an internal flag to control increment/hold behavior.  
- 🧪 Testbench included for simulation and verification.  

---

## 📂 Files Included
- `mod10_up_counter_flagged.v` → RTL design of the MOD-10 counter with flag.  
- `mod10_up_counter_flagged_tb.v` → Testbench for verifying the counter.  
- `README.md` → Documentation (this file).  

---

## 🧩 Design Overview

### 🔹 Counter Behavior
- **Reset (`rst=1`)** → Counter resets to `0` and clears `flag`.  
- **Counting** → Increments on each positive clock edge, but when `f == 9`, it resets to `0` and sets the flag.  
- **Flag** → On the next clock, flag allows increment before being cleared again.  

---

## 📊 Simulation
The testbench (`mod10_up_counter_flagged_tb.v`) generates clock and reset signals and runs the counter.

### Example Behavior
```text
Time     rst clk  -> f
10       1   ↑    -> 0   (reset active)
30       0   ↑    -> 1
50       0   ↑    -> 2
...
170      0   ↑    -> 9
190      0   ↑    -> 0   (reset after 9, flag set)
210      0   ↑    -> 1   (flag used, then cleared)
```

---

## 🛠️ How to Run

### ▶️ Using ModelSim / QuestaSim
```tcl
vlog mod10_up_counter_flagged.v mod10_up_counter_flagged_tb.v
vsim -c mod10_up_counter_flagged_tb
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
