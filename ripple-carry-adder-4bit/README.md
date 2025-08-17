# 🚀 4-Bit Ripple Carry Adder (Verilog)

This project implements a **4-bit ripple carry adder (RCA)** using **1-bit full adders** in Verilog.  
The design adds two 4-bit numbers along with an optional carry-in and produces a 4-bit sum and a carry-out.

---

## ✨ Features

- 🔢 4-bit **ripple carry adder** design.
- 🧪 Testbench included for full verification of all input combinations.
- ✅ Modular **RTL design** using **1-bit full adder** instances.
- ⚡ Supports **carry propagation** from least significant bit (LSB) to most significant bit (MSB).

---

## 📂 Files Included

- `half_adder.v` → 1-bit half adder module.
- `full_adder.v` → 1-bit full adder module.
- `ripple_carry_adder_4bit.v` → 4-bit ripple carry adder using structural modeling.
- `ripple_carry_adder_4bit_tb.v` → Testbench to verify all possible input combinations.
- `README.md` → Documentation (this file).

---

## 🧩 Design Details

### 🔹 Ports

| Module                    | Port    | Direction | Width | Description          |
| ------------------------- | ------- | --------- | ----- | -------------------- |
| `full_adder`              | `a`     | input     | 1-bit | First input bit      |
|                           | `b`     | input     | 1-bit | Second input bit     |
|                           | `cin`   | input     | 1-bit | Carry-in bit         |
|                           | `sum`   | output    | 1-bit | Sum output bit       |
|                           | `carry` | output    | 1-bit | Carry output bit     |
| `ripple_carry_adder_4bit` | `a`     | input     | 4-bit | First 4-bit operand  |
|                           | `b`     | input     | 4-bit | Second 4-bit operand |
|                           | `cin`   | input     | 1-bit | Carry-in for LSB     |
|                           | `sum`   | output    | 4-bit | Sum output           |
|                           | `carry` | output    | 1-bit | Carry-out from MSB   |

### 🔹 Functionality

1. **Full Adder Instances:**
    Four 1-bit full adders are connected in series where each adder’s carry-out propagates to the next higher-order adder’s carry-in.
2. **Carry Propagation:**
    The carry propagates from the least significant bit to the most significant bit, producing the final carry-out.

| Input `a` | Input `b` | `cin` | Output `sum` | Output `carry` |
| --------- | --------- | ----- | ------------ | -------------- |
| `0001`    | `0010`    | 0     | `0011`       | 0              |
| `1101`    | `1011`    | 1     | `1001`       | 1              |
| `0110`    | `0011`    | 0     | `1001`       | 0              |
| `1111`    | `1111`    | 1     | `1111`       | 1              |

---

## 📊 Simulation

The testbench cycles through **all possible input combinations (0–15)** for both operands and carry-in to verify correctness.

### Example Input Sequence

```text
a=0000, b=0000, cin=0
a=0000, b=0001, cin=0
a=0001, b=0001, cin=1
...
a=1111, b=1111, cin=1
```

### Example Output Log

```text
a=0001, b=0010, cin=0, sum=0011, carry=0
a=1101, b=1011, cin=1, sum=1001, carry=1
a=0110, b=0011, cin=0, sum=1001, carry=0
```

---

## 🛠️ How to Run

### ▶️ Using ModelSim / QuestaSim

```tcl
vlog half_adder.v full_adder.v ripple_carry_adder_4bit.v ripple_carry_adder_4bit_tb.v
vsim -c ripple_carry_adder_4bit_tb
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