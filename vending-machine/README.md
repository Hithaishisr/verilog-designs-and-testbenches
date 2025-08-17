# 🥤 Vending Machine FSM (Verilog)

This project implements a **Finite State Machine (FSM)-based Vending Machine** in Verilog.  
 The design simulates coin input combinations and outputs product dispensing signals.

---

## ✨ Features

- ⚡ FSM-based vending machine design using **Moore FSM**.
- 🔄 Handles **two coin inputs** (`i`, `j`) with multiple state transitions.
- 🎁 Provides **two output signals** (`X`, `Y`) when a valid amount is reached.
- 🧪 Includes a **testbench** with reusable tasks (`initialize`, `stimulus`).

---

## 📂 Files Included

- `vending_machine.v` → RTL design of the vending machine FSM.
- `vending_machine_tb.v` → Testbench for verifying the design.
- `README.md` → Documentation (this file).

---

## 🧩 Design Details

### 🔹 FSM States

| State | Binary | Description                            |
| ----- | ------ | -------------------------------------- |
| `RST` | 000    | Reset/Initial state                    |
| `Rs1` | 001    | 1 unit inserted                        |
| `Rs2` | 010    | 2 units inserted                       |
| `Rs3` | 011    | 3 units inserted → Output `{X,Y} = 10` |
| `Rs4` | 100    | 4 units inserted → Output `{X,Y} = 11` |

---

### 🔹 Ports

| Port  | Direction | Width | Description                                  |
| ----- | --------- | ----- | -------------------------------------------- |
| `clk` | input     | 1-bit | Clock signal                                 |
| `rst` | input     | 1-bit | Active-high synchronous reset                |
| `i`   | input     | 1-bit | Coin input bit (part of `{i,j}` combination) |
| `j`   | input     | 1-bit | Coin input bit (part of `{i,j}` combination) |
| `X`   | output    | 1-bit | Vending machine product dispense signal 1    |
| `Y`   | output    | 1-bit | Vending machine product dispense signal 2    |

---

## 🔹 Functionality

1. FSM starts in **`RST`** state.
2. Based on coin inputs `{i, j}`:
   - `10` → Adds 1 unit.
   - `11` → Adds 2 units.
3. When total reaches **3 or 4 units**, outputs are triggered:
   - At `Rs3` → `{X,Y} = 10`
   - At `Rs4` → `{X,Y} = 11`
4. FSM resets back to **`RST`** after dispensing.

---

## 📊 Simulation

The testbench provides coin inputs (`i, j`) through the `stimulus` task.

### Example Simulation Behavior

```text
Time(ns) | i j | State | X Y
---------|-----|-------|----
   0     | 0 0 | RST   | 0 0
  10     | 1 0 | Rs1   | 0 0
  20     | 1 1 | Rs3   | 1 0
  30     | 1 0 | Rs1   | 0 0
  40     | 1 1 | Rs2   | 0 0
  50     | 1 1 | Rs4   | 1 1
```

---

## 🛠️ How to Run

### ▶️ Using ModelSim / QuestaSim

```tcl
vlog vending_machine.v vending_machine_tb.v
vsim -c vending_machine_tb
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