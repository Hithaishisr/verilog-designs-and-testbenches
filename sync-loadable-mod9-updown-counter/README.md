# 🚀 Synchronous Loadable MOD-9 Up-Down Counter (Verilog)

This project implements a **synchronous, loadable MOD-9 up-down counter** in Verilog which counts from 0 to 8.  
The counter can count **up or down** based on the control signal, and it can be **synchronously loaded** with a custom 4-bit input.

---

## ✨ Features
- 🔁 Counts from 0 to 8 in up or down direction.  
- ⬆️ Up-counting and ⬇️ down-counting functionality controlled via `control` signal.  
- 🧩 Synchronously loadable with a 4-bit input `I` when `load` is high.  
- 🔄 Asynchronous reset to 0 using `rst`.  
- 🧪 Testbench included for simulation and verification.  

---

## 📂 Files Included
- `sync_loadable_mod9_updown_counter.v` → RTL design of the MOD-9 up-down counter.  
- `sync_loadable_mod9_updown_counter_tb.v` → Testbench for verifying the counter.  
- `README.md` → Documentation (this file).  

---

## 🧩 Design Details

### 🔹 Ports
| Port      | Direction | Width | Description                          |
| --------- | --------- | ----- | ------------------------------------ |
| `clk`     | input     | 1-bit | Clock signal                         |
| `rst`     | input     | 1-bit | Asynchronous reset (resets `q` to 0) |
| `load`    | input     | 1-bit | Load enable signal                   |
| `control` | input     | 1-bit | Count direction: 1 = up, 0 = down    |
| `I`       | input     | 4-bit | Data input to load into counter      |
| `q`       | output    | 4-bit | Current count value                  |

### 🔹 Functionality
1. When `rst` is high, counter resets to 0.  
2. When `load` is high and `I < 9`, counter synchronously loads input `I`.  
3. When `control = 1`:
   - Counter increments by 1.
   - Wraps around from 8 → 0.  
4. When `control = 0`:
   - Counter decrements by 1.
   - Wraps around from 0 → 8.  

---

## 📊 Simulation
The testbench applies inputs and verifies correct up-down counting and synchronous loading.

### Example Test Scenario
```text
Reset -> q = 0
Load I=5 -> q = 5
Control=1 -> q counts up: 5, 6, 7, 8, 0, 1 ...
Control=0 -> q counts down: 0, 8, 7, 6 ...
```

---

## 🛠️ How to Run

### ▶️ Using ModelSim / QuestaSim

```tcl
vlog sync_loadable_mod9_updown_counter.v sync_loadable_mod9_updown_counter_tb.v
vsim -c sync_loadable_mod9_updown_counter_tb
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