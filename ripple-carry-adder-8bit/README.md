# 🚀 8-bit Ripple Carry Adder (RCA) in Verilog

This project implements an **8-bit Ripple Carry Adder (RCA)** in Verilog using a **hierarchy of half adders and full adders**.  
It adds two 8-bit numbers with an optional carry-in and produces an 8-bit sum and a carry-out.

---

## ✨ Features
- ➕ 8-bit addition using **Ripple Carry Adder architecture**.  
- 🧩 Hierarchical design using **half adders** and **full adders**.  
- 🧪 Exhaustive testbench included to verify **all possible input combinations**.  

---

## 📂 Files Included
- `half_adder.v` → RTL for 1-bit half adder.  
- `full_adder.v` → RTL for 1-bit full adder using half adders.  
- `ripple_carry_adder_8bit.v` → 8-bit RCA using full adders with generate loop.  
- `ripple_carry_adder_8bit_tb.v` → Testbench that checks all 131,072 input combinations.  
- `README.md` → Documentation (this file).  

---

## 🧩 Design Details

### 🔹 Ports
| Port   | Direction | Width | Description    |
| ------ | --------- | ----- | -------------- |
| `A`    | input     | 8-bit | First operand  |
| `B`    | input     | 8-bit | Second operand |
| `Cin`  | input     | 1-bit | Carry input    |
| `S`    | output    | 8-bit | Sum output     |
| `Cout` | output    | 1-bit | Carry output   |

### 🔹 Functionality
1. Adds **two 8-bit numbers** with optional `Cin`.  
2. Uses **full adders** built from half adders for bitwise addition.  
3. Carry propagates from LSB to MSB.  
4. Final sum is available on `S`, and the carry-out on `Cout`.  

---

## 📊 Simulation
The testbench verifies **all input combinations**.

### Example Test Cases
```text
A = 15  (00001111)
B = 27  (00011011)
Cin = 1
S = 43  (00101011)
Cout = 0
A = 255 (11111111)
B = 1   (00000001)
Cin = 0
S = 0   (00000000)
Cout = 1
```

The testbench prints an error only if the DUT output does not match the expected sum.

---

## 🛠️ How to Run

### ▶️ Using ModelSim / QuestaSim

```tcl
vlog half_adder.v full_adder.v ripple_carry_adder_8bit.v ripple_carry_adder_8bit_tb.v
vsim -c tb_ripple_carry_adder_8bit
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