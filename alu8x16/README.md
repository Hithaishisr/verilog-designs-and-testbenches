# 🚀 8-bit ALU with 16-bit Output (Verilog)

This project implements an **8-bit Arithmetic Logic Unit (ALU)** in Verilog which supports **arithmetic and logical operations** and produces a **16-bit output**.
 The ALU operations are selected using a **4-bit command input**, and it includes a **tri-state output enable**.

---

## ✨ Features

- 🔢 Supports arithmetic operations: ADD, SUB, INC, DEC, MUL, DIV.
- 🔄 Supports logical operations: AND, OR, INV, NAND, NOR, XOR, XNOR, BUF.
- 🛠 Tri-state output controlled by `oe`.
- 🧪 Testbench included for comprehensive simulation and verification.

---

## 📂 Files Included

- `alu8x16.v` → RTL design of the 8-bit ALU with 16-bit output.
- `alu8x16_tb.v` → Testbench for verifying all ALU operations.
- `README.md` → Documentation (this file).

---

## 🧩 Design Details

### 🔹 Ports

| Port         | Direction | Width  | Description                       |
| ------------ | --------- | ------ | --------------------------------- |
| `a_in`       | input     | 8-bit  | Operand A                         |
| `b_in`       | input     | 8-bit  | Operand B                         |
| `command_in` | input     | 4-bit  | ALU operation select              |
| `oe`         | input     | 1-bit  | Output enable (tri-state control) |
| `d_out`      | output    | 16-bit | Result of selected ALU operation  |

### 🔹 Supported Operations

| Command | Operation | Description            |
| ------- | --------- | ---------------------- |
| `0000`  | ADD       | Add A and B            |
| `0001`  | INC       | Increment A by 1       |
| `0010`  | SUB       | Subtract B from A      |
| `0011`  | DEC       | Decrement A by 1       |
| `0100`  | MUL       | Multiply A and B       |
| `0101`  | DIV       | Divide A by B          |
| `0110`  | SHL       | Shift A left by 1 bit  |
| `0111`  | SHR       | Shift A right by 1 bit |
| `1000`  | AND       | Bitwise AND            |
| `1001`  | OR        | Bitwise OR             |
| `1010`  | INV       | Bitwise NOT of A       |
| `1011`  | NAND      | Bitwise NAND           |
| `1100`  | NOR       | Bitwise NOR            |
| `1101`  | XOR       | Bitwise XOR            |
| `1110`  | XNOR      | Bitwise XNOR           |
| `1111`  | BUF       | Pass-through A         |

---

## 📊 Simulation

The testbench cycles through all ALU operations for multiple input combinations to verify correct functionality.

### Example Input

```text
a_in = 25
b_in = 17
command_in = 0000  (ADD)
```

### Example Output

```text
Input oe=1, a=25, b=17, command=ADD, Output out=42
```

The testbench iterates through all 16 commands with varying inputs for comprehensive verification.

---

## 🛠️ How to Run

### ▶️ Using ModelSim / QuestaSim

```tcl
vlog alu8x16.v alu8x16_tb.v
vsim -c alu8x16_tb
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