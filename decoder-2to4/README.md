# 🚀 2:4 Decoder (Verilog)

This project implements a **2-to-4 line decoder** in Verilog which takes **2 input bits** and produces **4 output lines**.
 Each output corresponds to one of the possible input combinations.

---

## ✨ Features

- 🔢 2-to-4 line decoder.
- 🧪 Testbench included for simulation and verification.
- ✅ Simple **dataflow style RTL** design.

---

## 📂 Files Included

- `decoder_2to4.v` → RTL design of the 2×4 decoder.
- `decoder_2to4_tb.v` → Testbench for verifying the design.
- `README.md` → Documentation (this file).

---

## 🧩 Design Details

### 🔹 Ports

| Port | Direction | Width | Description     |
| ---- | --------- | ----- | --------------- |
| `a`  | input     | 1-bit | Input bit 0     |
| `b`  | input     | 1-bit | Input bit 1     |
| `I`  | output    | 4-bit | Decoder outputs |

### 🔹 Functionality

1. Takes **2 input bits (`a` and `b`)**.
2. Produces **4 outputs (`I[3:0]`)**, where only **one output is high** based on the input combination:
   - `00` → `I[0] = 1`
   - `01` → `I[1] = 1`
   - `10` → `I[2] = 1`
   - `11` → `I[3] = 1`

---

## 📊 Simulation

The testbench cycles through all input combinations to verify correct decoding.

### Example Test Inputs

```text
a = 0, b = 0
a = 0, b = 1
a = 1, b = 0
a = 1, b = 1
```

### Example Output Log

```text
a=0, b=0 -> I=0001
a=0, b=1 -> I=0010
a=1, b=0 -> I=0100
a=1, b=1 -> I=1000
```

---

## 🛠️ How to Run

### ▶️ Using ModelSim / QuestaSim

```tcl
vlog decoder_2to4.v decoder_2to4_tb.v
vsim -c decoder_2to4_tb
run -all
```

---

## 🔹 License

This project is licensed under the MIT License – see the [LICENSE](../LICENSE) file for details.

---

## 👨‍💻 Author

**Hithaishi S R**  
 🔗 [LinkedIn ](https://www.linkedin.com/in/hithaishisr)  
 ✉️ hithaishisr2002@gmail.com