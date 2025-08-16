
# 🚀 Moore FSM 0101 Sequence Detector (Verilog)

This project implements a **Finite State Machine (FSM)** in Verilog that detects the sequence `0101` in a serial input stream.
The FSM is designed as a **Moore machine**, where the output depends only on the current state.

---

## ✨ Features
- 🔁 Detects overlapping sequence `0101` (e.g., `010101` will trigger detection twice).
- ⏱️ Synchronous design with clock and asynchronous reset.
- 🧪 Testbench included for easy simulation and verification.

---

## 📂 Files Included
- `moore_seq0101_detector.v` → RTL design of the Moore FSM.
- `moore_seq0101_detector_tb.v` → Testbench for verifying the FSM.
- `README.md` → Documentation (this file).

---

## 🧩 FSM Design

### 🔹 States
- **S0** → Initial/Idle state (no sequence detected yet).
- **S1** → Sequence detected: `0`.
- **S2** → Sequence detected: `01`.
- **S3** → Sequence detected: `010`.
- **S4** → Sequence detected: `0101` → Output **F = 1**.

### 🔹 State Transitions
```
S0 --0--> S1
S1 --1--> S2
S2 --0--> S3
S3 --1--> S4 (F=1)
S4 --0--> S3,  S4 --1--> S0
```

---

## 📊 Simulation
The testbench (`moore_seq0101_detector_tb.v`) applies input sequences and displays results.

### Example Output Log
```
Time     rst I  -> F
20       0   0  -> 0
30       0   1  -> 0
40       0   0  -> 0
50       0   1  -> 1   (Sequence 0101 detected)
60       0   0  -> 0
70       0   1  -> 1   (Sequence 0101 detected again)
```

---

## 🛠️ How to Run

### ▶️ Using ModelSim / QuestaSim
```tcl
vlog moore_seq0101_detector.v moore_seq0101_detector_tb.v
vsim -c moore_seq0101_detector_tb
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

