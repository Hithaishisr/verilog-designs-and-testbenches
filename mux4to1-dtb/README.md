# 🚀 4:1 Multiplexer Using Decoder & Tristate Buffer (Verilog)

This project implements a **4-to-1 multiplexer (MUX)** in Verilog using a **2×4 decoder** and **tristate buffers**.
 The MUX selects **one of four input lines** based on a **2-bit select signal**.

---

## ✨ Features

- 🔢 4-to-1 multiplexer using **decoder + tristate buffers**.
- 🧪 Testbench included for full verification of all select/input combinations.
- ✅ Modular **RTL design**: separate decoder and tristate buffer modules.
- ⚡ High-impedance (`1'bz`) output when input is not selected.

---

## 📂 Files Included

- `tristate_buffer.v` → RTL for the tristate buffer.
- `decoder_2to4.v` → RTL for the 2×4 decoder.
- `mux4to1_dtb.v` → 4×1 MUX built using decoder and tristate buffers.
- `mux4to1_dtb_tb.v` → Testbench for verifying the MUX design.
- `README.md` → Documentation (this file).

---

## 🧩 Design Details

### 🔹 Ports

| Module            | Port | Direction | Width | Description                       |
| ----------------- | ---- | --------- | ----- | --------------------------------- |
| `tristate_buffer` | `i`  | input     | 1-bit | Data input                        |
|                   | `s`  | input     | 1-bit | Enable signal                     |
|                   | `f`  | output    | 1-bit | Output (`i` if enabled, else `z`) |
| `decoder_2to4`    | `a`  | input     | 1-bit | MSB of select                     |
|                   | `b`  | input     | 1-bit | LSB of select                     |
|                   | `I`  | output    | 4-bit | One-hot decoded output            |
| `mux4to1_dtb`     | `s`  | input     | 2-bit | Select input                      |
|                   | `I`  | input     | 4-bit | Multiplexer data inputs           |
|                   | `f`  | output    | 1-bit | Multiplexed output                |

### 🔹 Functionality

1. **Decoder:** Converts 2-bit select `s[1:0]` to **one-hot 4-bit signals** `w[3:0]`.
2. **Tristate Buffers:** Each input `I[n]` is gated with corresponding one-hot signal `w[n]`.
3. Only the selected input propagates to the output `f`; unselected inputs go **high-impedance (`z`)**.

| Select `s` | Input Selected | Output `f` |
| ---------- | -------------- | ---------- |
| `00`       | `I[0]`         | `I[0]`     |
| `01`       | `I[1]`         | `I[1]`     |
| `10`       | `I[2]`         | `I[2]`     |
| `11`       | `I[3]`         | `I[3]`     |

---

## 📊 Simulation

The testbench cycles through **all select signals (00-11)** and **all input combinations (0000-1111)**.

### Example Test Inputs

```text
s = 00, I = 0000
s = 01, I = 1010
s = 10, I = 0110
s = 11, I = 1111
```

### Example Output Log

```text
s=00, I=1010 -> f=1
s=01, I=1010 -> f=0
s=10, I=0110 -> f=1
s=11, I=1111 -> f=1
```

---

## 🛠️ How to Run

### ▶️ Using ModelSim / QuestaSim

```tcl
vlog tristate_buffer.v decoder_2to4.v mux4to1_dtb.v mux4to1_dtb_tb.v
vsim -c mux4to1_dtb_tb
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