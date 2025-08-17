# 🔄 4-bit SISO Right Shift Register – Verilog

This project implements a **4-bit Serial-In Serial-Out (SISO) Right Shift Register** in Verilog.  
 The design shifts input data bits to the right on each clock cycle, with the final bit appearing at the output.

---

## ✨ Features

- 📦 **4-bit storage capacity** implemented using flip-flops.
- 🔄 **Right shift operation** – data enters serially from the input (`i`).
- ⏳ **Synchronous design** – operation controlled by a clock (`clk`).
- 🧹 **Reset support** – clears all stored values.
- 🧪 **Testbench included** for simulation and verification.

---

## 📂 Files Included

- `siso_4bit_rshift.v` → RTL design of the 4-bit SISO Right Shift Register.
- `siso_4bit_rshift_tb.v` → Testbench for verifying the design.
- `README.md` → Documentation (this file).

---

## 🧩 Design Details

### 🔹 Ports

| Port  | Direction | Width | Description                              |
| ----- | --------- | ----- | ---------------------------------------- |
| `clk` | input     | 1-bit | Clock signal for synchronization.        |
| `rst` | input     | 1-bit | Active-high reset, clears all registers. |
| `i`   | input     | 1-bit | Serial input bit.                        |
| `f`   | output    | 1-bit | Serial output bit (last shifted value).  |

---

### 🔹 Functionality

1. **Reset**
   - When `rst=1`, all flip-flops and output `f` are cleared to `0`.
2. **Shift Operation**
   - On every rising edge of `clk`:
     - `i` is loaded into the register.
     - Existing bits are shifted **one position to the right**.
     - Output `f` reflects the most significant bit after shifting.

---

## 📊 Simulation

The testbench performs the following steps:

1. Applies reset to clear the shift register.
2. Serially shifts in the sequence: `0 → 1 → 1 → 0`.
3. Observes the output `f` after each clock edge.

### Example Simulation Flow

```text
Time  Input(i)  Register(w)  Output(f)
--------------------------------------
t0    Reset     000          0
t1    0         000          0
t2    1         001          0
t3    1         011          0
t4    0         110          1
t5    -         100          1
```

---

## 🛠️ How to Run

### ▶️ Using ModelSim / QuestaSim

```tcl
vlog siso_4bit_rshift.v siso_4bit_rshift_tb.v
vsim -c siso_4bit_rshift_tb
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