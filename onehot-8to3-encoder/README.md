# 🚀 8:3 One-Hot Encoder (Verilog)

This project implements an **8-to-3 one-hot encoder** in Verilog which takes **8 input lines** (one-hot) and produces a **3-bit binary output**.  
Each output corresponds to the binary index of the active input.

---

## ✨ Features

- 🔢 8-to-3 one-hot encoder.
- 🧪 Testbench included for simulation and verification of all cases.
- ✅ Simple **RTL design** using `if-else` (or `case`) statements.
- ⚡ Handles invalid inputs by outputting high-impedance (`3'bzzz`).

---

## 📂 Files Included

- `onehot_8to3_encoder.v` → RTL design of the 8×3 one-hot encoder.  
- `onehot_8to3_encoder_tb.v` → Testbench for verifying the design.  
- `README.md` → Documentation (this file).  

---

## 🧩 Design Details

### 🔹 Ports

| Port | Direction | Width | Description                 |
| ---- | --------- | ----- | --------------------------- |
| `I`  | input     | 8-bit | One-hot input lines         |
| `F`  | output    | 3-bit | Encoded 3-bit binary output |

### 🔹 Functionality

1. Takes **8 input lines (`I[7:0]`)**, expecting **only one input high at a time**.  
2. Produces **3-bit output (`F[2:0]`)** representing the index of the active input:  

| Input `I`          | Output `F` |
| ------------------ | ---------- |
| `00000001`         | `000`      |
| `00000010`         | `001`      |
| `00000100`         | `010`      |
| `00001000`         | `011`      |
| `00010000`         | `100`      |
| `00100000`         | `101`      |
| `01000000`         | `110`      |
| `10000000`         | `111`      |
| Invalid / multiple | `zzz`      |

---

## 📊 Simulation

The testbench cycles through **all one-hot input combinations** and also tests **invalid inputs**.

### Example Test Inputs

```text
I = 00000001
I = 00000010
I = 00000100
...
I = 10000000
I = 00000011  (invalid)
I = 10101010  (invalid)
I = 00000000  (invalid)
```

### Example Output Log

```text
I=00000001 -> F=000
I=00000010 -> F=001
I=00000100 -> F=010
...
I=10000000 -> F=111
Invalid input -> F=zzz
```

---

## 🛠️ How to Run

### ▶️ Using ModelSim / QuestaSim

```tcl
vlog onehot_8to3_encoder.v onehot_8to3_encoder_tb.v
vsim -c onehot_8to3_encoder_tb
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