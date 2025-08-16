# 🚀 Mealy FSM 1011 Sequence Detector (Verilog)

This project implements a **Finite State Machine (FSM)** in Verilog that detects the sequence `1011` in a serial input stream.  
The FSM is designed as a **Mealy machine**, where the output depends on both the current state **and** the current input.

---

## ✨ Features
- 🔁 Detects overlapping sequence `1011`.  
- ⏱️ Synchronous design with clock and reset.  
- 🧪 Testbench included for easy simulation and verification.  

---

## 📂 Files Included
- `mealy_1011_sequence_detector.v` → RTL design of the Mealy FSM.  
- `mealy_1011_sequence_detector_tb.v` → Testbench for verifying the FSM.  
- `README.md` → Documentation (this file).  

---

## 🧩 FSM Design

### 🔹 States
- **S0** → Initial/Idle state (no sequence detected yet).  
- **S1** → Sequence detected: `1`.  
- **S2** → Sequence detected: `10`.  
- **S3** → Sequence detected: `101`.  

### 🔹 State Transitions
```text
S0 --1--> S1
S1 --0--> S2
S2 --1--> S3
S3 --1--> S1 (F=1)
S3 --0--> S2
```

---

## 📊 Simulation
The testbench (`mealy_1011_sequence_detector_tb.v`) applies input sequences and observes the output.

### Example Input Sequence
```
0 → 1 → 0 → 1 → 1
```

### Expected Output
```
F = 1 at the last '1' (sequence 1011 detected)
```

---

## 🛠️ How to Run

### ▶️ Using ModelSim / QuestaSim
```tcl
vlog mealy_1011_sequence_detector.v mealy_1011_sequence_detector_tb.v
vsim -c mealy_1011_sequence_detector_tb
run -all
```

---

## 🔹 License
This project is licensed under the MIT License – see the [LICENSE](../LICENSE) file for details.

---

## 👨‍💻 Author

**Hithaishi S R**  
💼 Professional VLSI Trainee | ⚡ Advanced VLSI Design and Verification @ Maven Silicon
