# 🎯 Sequence Detector: `101` (Verilog)

This project implements a **Moore FSM-based sequence detector** in Verilog that detects the binary sequence **`101`**.  
 The design outputs `1` whenever the sequence `101` is recognized in the input stream (supports overlapping sequences).

---

## ✨ Features

- ⚡ Detects **binary sequence `101`** using a Moore state machine.
- 🔄 Supports **overlapping sequences** (e.g., input `10101` detects two sequences).
- 🧪 Includes a **testbench** with reusable tasks (`initialize`, `RESET`, `stimulus`, `delay`).

---

## 📂 Files Included

- `seq_det_101.v` → RTL design of the sequence detector.
- `seq_det_101_tb.v` → Testbench for verifying the design.
- `README.md` → Documentation (this file).

---

## 🧩 Design Details

### 🔹 FSM States

| State | Binary | Meaning                      |
| ----- | ------ | ---------------------------- |
| `S0`  | 00     | Initial state / no match yet |
| `S1`  | 01     | Detected `1`                 |
| `S2`  | 10     | Detected `10`                |
| `S3`  | 11     | Detected `101` → Output `1`  |

### 🔹 Ports

| Port     | Direction | Width | Description                      |
| -------- | --------- | ----- | -------------------------------- |
| `seq_in` | input     | 1-bit | Serial input bitstream           |
| `clock`  | input     | 1-bit | Clock signal                     |
| `reset`  | input     | 1-bit | Active-high asynchronous reset   |
| `det_o`  | output    | 1-bit | Asserted `1` when `101` detected |

---

## 🔹 Functionality

1. FSM starts at **`S0`** (idle).
2. On every clock edge, it transitions depending on input bit `seq_in`.
3. When state **`S3`** is reached, `det_o` is asserted high (`1`).
4. Supports **overlapping detection**, e.g.:
   - Input: `10101` → Output: `00101`.

---

## 📊 Simulation

The testbench provides stimulus using tasks and logs state transitions with `$monitor`.

### Example Waveform Behavior

```text
Input : 1 0 1 0 1 1
State : S1 S2 S3 S2 S3 S1
Output: 0  0  1  0  1  0
```

### Example Output Log

```text
Reset=0, state=11, Din=1, Output Dout=1
Correct output at state 11
```

---

## 🛠️ How to Run

### ▶️ Using ModelSim / QuestaSim

```tcl
vlog seq_det_101.v seq_det_101_tb.v
vsim -c seq_det_101_tb
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