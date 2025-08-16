# 🚀 Moore 100 & 010 Sequence Detector with Toggle (Verilog)

This project implements a **Finite State Machine (FSM)** in Verilog that detects the sequences `100` and `010` in a serial input stream.  
The FSM is designed as a **Moore machine**, where the output depends only on the current state, supports **overlapping sequences**, and includes a **toggle mechanism** on detection.

---

## ✨ Features
- 🔁 Detects overlapping sequences `100` and `010`.  
- 🔄 **Toggle output**: Output flips when a sequence is detected, useful for toggle-based designs.  
- ⏱️ Synchronous design with clock and asynchronous reset.  
- 🧪 Testbench included for easy simulation and verification.  

---

## 📂 Files Included
- `moore_seq_detector_100_010.v` → RTL design of the FSM (Moore machine).  
- `moore_seq_detector_100_010_tb.v` → Testbench for verifying the FSM.  
- `README.md` → Documentation (this file).  

---

## 🧩 FSM Design

### 🔹 States
- **S0** → Initial/Idle state (no sequence detected yet).  
- **S1** → Sequence detected: first bit of `100` or `010`.  
- **S2** → Sequence progressing: `10` or `01`.  
- **S3** → Sequence `100` detected → Output **F toggles**.  
- **S4** → Sequence `010` detected → Output **F toggles**.  

### 🔹 State Transitions (with Toggle)
```text
S0 --1--> S1,  S0 --0--> S2
S1 --0--> S3 (F toggles),  S1 --1--> S1
S2 --1--> S4 (F toggles),  S2 --0--> S2
S3/S4 transitions continue for overlapping sequences
```

---

## 📊 Simulation
The testbench (`moore_seq_detector_100_010_tb.v`) applies input sequences and displays results.

### Example Input Sequence
```text
1 0 0 1 0 0 1 1 0 1 0 1 0 0
```

### Expected Output
```text
Time     rst I  -> F
20       0   1  -> 0
30       0   0  -> 0
40       0   0  -> 1   (Sequence 100 detected, F toggled)
50       0   1  -> 1
60       0   0  -> 0   (Sequence 010 detected, F toggled)
...
```

---

## 🛠️ How to Run

### ▶️ Using ModelSim / QuestaSim
```tcl
vlog moore_seq_detector_100_010.v moore_seq_detector_100_010_tb.v
vsim -c moore_seq_detector_100_010_tb
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
