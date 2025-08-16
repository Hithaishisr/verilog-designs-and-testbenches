# 🔄 Synchronous Up-Down Counter (Range: 5 to 31)

This project implements a **synchronous up-down counter** in Verilog that counts between **5 and 31 (inclusive)** with wrap-around behavior.  
The counter can be **loaded with a custom value**, reset to `5`, and configured to **count up or down**.

---

## ✨ Features
- ⏱️ **Synchronous design** with clocked operation.  
- 🔄 **Up/Down counting** controlled by `mode` input.  
- 🎯 **Range-limited counter** (wraps between 5 and 31).  
- 📥 **Load functionality** for custom initialization.  
- 🧪 Testbench included for verification.  

---

## 📂 Files Included
- `sync_updown_counter_5to31.v` → RTL design of the counter.  
- `sync_updown_counter_5to31_tb.v` → Testbench for simulation.  
- `README.md` → Documentation (this file).  

---

## ⚙️ Counter Design

### 🔹 Inputs
- **clk** → Clock signal.  
- **rst** → Synchronous reset (resets counter to 5).  
- **load** → Enables loading a custom value (`i`).  
- **mode** → Select counting direction:  
  - `1` → Count **up**.  
  - `0` → Count **down**.  
- **i[4:0]** → Input value for loading (must be within range 5–31).  

### 🔹 Outputs
- **q[4:0]** → Current counter value.  

### 🔹 Behavior
- On `rst`, counter initializes to **5**.  
- If `load` is enabled, `i` is loaded into the counter (only if within 5–31).  
- If `mode=1` → counter counts up, wraps from **31 → 5**.  
- If `mode=0` → counter counts down, wraps from **5 → 31**.  

---

## 📊 Simulation

The provided **testbench** applies reset, load, and mode signals to verify functionality.

### Example Simulation Flow
```text
Time    Action
0ns     Reset applied → q=5
30ns    Load value 8 → q=8
120ns   Mode=1 (Up counting starts)
200ns   q wraps from 31 → 5
```

---

## 🛠️ How to Run

### ▶️ Using ModelSim / QuestaSim
```tcl
vlog sync_updown_counter_5to31.v sync_updown_counter_5to31_tb.v
vsim -c sync_updown_counter_5to31_tb
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
