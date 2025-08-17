# 🚀 Full Adder (Verilog)

This project implements a **1-bit full adder** in Verilog using **two half adders**.
 It takes **three 1-bit inputs** (`a_in`, `b_in`, `c_in`) and produces a **sum** and **carry output**.

---

## ✨ Features

- 🔢 1-bit full adder using **structural design**.
- 🧪 Testbench included for **all 8 input combinations**.
- ✅ Simple **RTL design** using `half_adder` modules.
- ⚡ Clear separation of sum and carry logic.

---

## 📂 Files Included

- `half_adder.v` → RTL design of the half adder.
- `full_adder.v` → RTL design of the full adder.
- `full_adder_tb.v` → Testbench verifying all input combinations.
- `README.md` → Documentation (this file).

---

## 🧩 Design Details

### 🔹 Ports

| Port        | Direction | Width | Description      |
| ----------- | --------- | ----- | ---------------- |
| `a_in`      | input     | 1-bit | First input bit  |
| `b_in`      | input     | 1-bit | Second input bit |
| `c_in`      | input     | 1-bit | Carry input bit  |
| `sum_out`   | output    | 1-bit | Sum output       |
| `carry_out` | output    | 1-bit | Carry output     |

### 🔹 Functionality

1. Adds three 1-bit inputs (`a_in`, `b_in`, `c_in`).
2. Produces `sum_out` and `carry_out` using **two half adders**:

- **Half Adder 1** → adds `a_in` and `b_in` → outputs intermediate sum `w1` and carry `w2`.
- **Half Adder 2** → adds `w1` and `c_in` → outputs final sum `sum_out` and intermediate carry `w3`.
- **Carry out** → `carry_out = w2 | w3`.

| a_in | b_in | c_in | sum_out | carry_out |
| ---- | ---- | ---- | ------- | --------- |
| 0    | 0    | 0    | 0       | 0         |
| 0    | 0    | 1    | 1       | 0         |
| 0    | 1    | 0    | 1       | 0         |
| 0    | 1    | 1    | 0       | 1         |
| 1    | 0    | 0    | 1       | 0         |
| 1    | 0    | 1    | 0       | 1         |
| 1    | 1    | 0    | 0       | 1         |
| 1    | 1    | 1    | 1       | 1         |

---

## 📊 Simulation

The testbench cycles through **all 8 possible input combinations**.

### Example Test Inputs

```text
a_in b_in c_in
0    0    0
0    0    1
0    1    0
0    1    1
1    0    0
1    0    1
1    1    0
1    1    1
```

### Example Output Log

```text
Input a=0, b=0, c=0, Output sum=0, carry=0
Input a=0, b=0, c=1, Output sum=1, carry=0
Input a=0, b=1, c=0, Output sum=1, carry=0
Input a=0, b=1, c=1, Output sum=0, carry=1
...
Input a=1, b=1, c=1, Output sum=1, carry=1
```

---

## 🛠️ How to Run

### ▶️ Using ModelSim / QuestaSim

```tcl
vlog half_adder.v full_adder.v full_adder_tb.v
vsim -c full_adder_tb
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