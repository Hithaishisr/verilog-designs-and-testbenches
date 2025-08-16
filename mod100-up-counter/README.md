# 🔢 MOD-100 Up Counter (Verilog)

This project implements a **MOD-100 decimal up counter** in Verilog using two cascaded **MOD-10 up counters** with flag-based control.  
The design counts from `00 → 99` and then wraps back to `00`.

---

## ✨ Features
- ✅ 2-digit decimal up counter (00 → 99).  
- 🔁 Built using two MOD-10 up counters.  
- ⏱️ Synchronous design with clock and asynchronous reset.  
- 🧪 Testbench included for easy simulation and verification.  

---

## 📂 Files Included
- `mod10_up_counter_flagged.v` → RTL design of the MOD-10 counter with flag control.  
- `mod100_up_counter.v` → RTL design of the MOD-100 counter (cascaded MOD-10).  
- `mod100_up_counter_tb.v` → Testbench for verifying the MOD-100 counter.  
- `README.md` → Documentation (this file).  

---

## 🧩 Design Overview

### 🔹 MOD-10 Up Counter with Flag
- Counts from 0 → 9.  
- On reaching 9, resets to 0 and raises a flag.  
- The flag is used to enable the next stage (tens counter).  

### 🔹 MOD-100 Up Counter
- Built using two MOD-10 counters (ones and tens).  
- Ones counter increments on every clock pulse.  
- Tens counter increments only when the ones counter rolls over from 9 → 0.  
- Output is 8 bits wide: `[7:4] = tens digit`, `[3:0] = ones digit`.  

---

## 📊 Simulation
The testbench (`mod100_up_counter_tb.v`) applies clock and reset signals, and runs long enough to observe rollover beyond 99.

---

## 🛠️ How to Run

### ▶️ Using ModelSim / QuestaSim
```tcl
vlog mod10_up_counter_flagged.v mod100_up_counter.v mod100_up_counter_tb.v
vsim -c mod100_up_counter_tb
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
