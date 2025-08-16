# 🚀 FSM 101 Sequence Detector (Verilog)

This project implements a **Finite State Machine (FSM)** in Verilog that detects the sequence `101` in a serial input stream.  
The FSM is designed as a **Moore machine** where the output depends only on the current state.

---

## ✨ Features
- 🔁 Detects overlapping sequence `101` (e.g., `10101` will trigger detection twice).  
- ⏱️ Synchronous design with clock and asynchronous reset.  
- 🧪 Testbench included for easy simulation and verification.  

---

## 📂 Files Included
- `fsm_detect_101_sequence.v` → RTL design of the FSM (Moore machine).  
- `fsm_detect_101_sequence_tb.v` → Testbench for verifying the FSM.  
- `README.md` → Documentation (this file).  

---

## 🧩 FSM Design

### 🔹 States
- **S0** → Initial/Idle state (no sequence detected yet).  
- **S1** → Sequence detected: `1`.  
- **S2** → Sequence detected: `10`.  
- **S3** → Sequence detected: `101` → Output **F = 1**.  

### 🔹 State Transitions
```text
S0 --1--> S1
S1 --0--> S2
S2 --1--> S3 (F=1)
S3 --0--> S2,  S3 --1--> S1
```

---

## 📊 Simulation
The testbench (`fsm_detect_101_sequence_tb.v`) applies input sequences and displays results.

### Example Output Log
```text
Time     rst I  -> F
20       0   1  -> 0
30       0   0  -> 0
40       0   1  -> 1   (Sequence 101 detected)
50       0   0  -> 0
60       0   1  -> 1   (Sequence 101 detected again)
```

---

## 🛠️ How to Run

### ▶️ Using ModelSim / QuestaSim
```tcl
vlog fsm_detect_101_sequence.v fsm_detect_101_sequence_tb.v
vsim -c fsm_detect_101_sequence_tb
run -all
```

---

## 🔹 License
This project is licensed under the MIT License – see the [LICENSE](../LICENSE) file for details.

---

## 👨‍💻 Author

**Hithaishi S R**  
💼 Professional VLSI Trainee | ⚡ Advanced VLSI Design and Verification @ Maven Silicon
