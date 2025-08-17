# 🚀 Bidirectional Tristate Buffer (Verilog)

This project implements a **bidirectional tristate buffer** in Verilog using **two tristate buffers**, allowing two ports (`a` and `b`) to drive each other depending on a select signal `s`.

---

## ✨ Features

- 🔁 Bidirectional data flow between ports `a` and `b`.
- ⚡ High-impedance output when the driving port is disabled.
- 🧪 Testbench included for simulation and verification.

---

## 📂 Files Included

- `tristate_buffer.v` → RTL design of the single tristate buffer.
- `bidirectional_tristate_buffer.v` → RTL design of the bidirectional buffer using two tristate buffers.
- `bidirectional_tristate_buffer_tb.v` → Testbench for verifying the bidirectional buffer.
- `README.md` → Documentation (this file).

---

## 🧩 Design Details

### 🔹 Ports: `bidirectional_tristate_buffer`

| Port | Direction | Description                                         |
| ---- | --------- | --------------------------------------------------- |
| `a`  | inout     | Bidirectional port A                                |
| `b`  | inout     | Bidirectional port B                                |
| `s`  | input     | Direction select (`0`: A drives B, `1`: B drives A) |

### 🔹 Functionality

1. When `s = 0`, port `a` drives port `b`.
2. When `s = 1`, port `b` drives port `a`.
3. The non-driving port is placed in **high-impedance (`1'bz`) state**, allowing proper bidirectional communication.

---

## 📊 Simulation

The testbench applies different combinations of inputs `i` and `j` while toggling the select signal `s` to verify correct bidirectional behavior.

### Example Test Inputs

```text
i = 0, j = 1, s = 0   -> a drives b
i = 1, j = 0, s = 1   -> b drives a
...
```

### Example Output Log

```text
a=0, b=0, i=0, j=0, s=0
a=1, b=z, i=1, j=0, s=0
a=z, b=1, i=1, j=1, s=1
...
```

---

## 🛠️ How to Run

### ▶️ Using ModelSim / QuestaSim

```tcl
vlog tristate_buffer.v bidirectional_tristate_buffer.v bidirectional_tristate_buffer_tb.v
vsim -c bidirectional_tristate_buffer_tb
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