# 🚀 8×3 Priority Encoder (Verilog)

This project implements an **8-to-3 priority encoder** in Verilog. The encoder outputs the **binary code of the highest-priority bit** that is set in the 8-bit input.

---

## ✨ Features

- 🔢 8-to-3 **priority encoder** design.
- 🧪 Testbench included for full verification of all input combinations.
- ✅ Modular **RTL design** using a **priority-to-one-hot** helper module.
- ⚡ Resolves multiple active inputs by selecting the **highest-priority bit**.

---

## 📂 Files Included

- `priority_to_onehot.v` → Converts an 8-bit input to **one-hot representation** of the highest-priority bit.
- `priority_encoder8x3.v` → 8×3 priority encoder using structural modeling.
- `priority_encoder8x3_tb.v` → Testbench for verifying the priority encoder.
- `README.md` → Documentation (this file).

---

## 🧩 Design Details

### 🔹 Ports

| Module                | Port | Direction | Width | Description                                      |
| --------------------- | ---- | --------- | ----- | ------------------------------------------------ |
| `priority_to_onehot`  | `I`  | input     | 8-bit | Input vector                                     |
|                       | `F`  | output    | 8-bit | One-hot output corresponding to highest priority |
| `priority_encoder8x3` | `I`  | input     | 8-bit | Input vector                                     |
|                       | `F`  | output    | 3-bit | Binary code of highest-priority bit              |

### 🔹 Functionality

1. **Priority-to-One-Hot Conversion:**
    Converts an 8-bit input into an 8-bit one-hot signal where only the **highest-priority bit** set in the input is 1.
2. **Encoder:**
    Converts the one-hot signal into a **3-bit binary code** representing the position of the highest-priority bit.

| Input `I`  | Highest Priority Bit | Output `F` |
| ---------- | -------------------- | ---------- |
| `00000001` | Bit 0                | `000`      |
| `00000110` | Bit 2                | `010`      |
| `10010110` | Bit 7                | `111`      |
| `00000000` | None                 | `000`      |

---

## 📊 Simulation

The testbench cycles through **various input combinations**, including edge cases, to verify correct priority encoding.

### Example Input Sequence

```text
I = 00000000
I = 00000001
I = 0000001x
I = 000001xx
I = 00001xxx
I = 0001xxxx
I = 001xxxxx
I = 01xxxxxx
I = 1xxxxxxx
I = 01011010
I = 11110011
```

### Example Output Log

```text
I=00000001, F=000
I=00000110, F=010
I=01011010, F=6
I=11110011, F=7
```

---

## 🛠️ How to Run

### ▶️ Using ModelSim / QuestaSim

```tcl
vlog priority_to_onehot.v priority_encoder8x3.v priority_encoder8x3_tb.v
vsim -c priority_encoder8x3_tb
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