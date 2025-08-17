# 🚀 4:1 MUX using Task (Verilog)

This project implements a **4:1 multiplexer (MUX)** in Verilog using a **task-based RTL approach**.  
 The MUX selects one of the four 1-bit inputs based on a 2-bit select line `S`.

------

## ✨ Features

- 🔁 4:1 MUX using a task for output assignment.
- 🧪 Testbench included for complete verification.
- ✅ Demonstrates parameterized selection via task.

---

## 📂 Files Included

- `mux4to1_task_select.v` → RTL design of the 4:1 MUX using task.
- `mux4to1_task_select_tb.v` → Testbench for verifying the design.
- `README.md` → Documentation (this file).

---

## 🧩 Design Details

### 🔹 Ports

| Port | Direction | Width | Description         |
| ---- | --------- | ----- | ------------------- |
| `I`  | input     | 4-bit | Data inputs for MUX |
| `S`  | input     | 2-bit | Select signal       |
| `F`  | output    | 1-bit | Output of the MUX   |

### 🔹 Functionality

1. The 2-bit select signal `S` chooses which input (`I[0]` to `I[3]`) is forwarded to the output.
2. A **task `Selector`** is used to assign the selected input to the output `F`.

---

## 📊 Simulation

The testbench cycles through all possible input combinations and select signals.

### Example Test Sequence

```text
S=00, I=0001 -> F=1
S=01, I=0010 -> F=1
S=10, I=0100 -> F=1
S=11, I=1000 -> F=1
```

### Monitor Output

```text
0 s=00,I=0000,f=0
10 s=00,I=0001,f=1
20 s=01,I=0010,f=1
...
```

---

## 🛠️ How to Run

### ▶️ Using ModelSim / QuestaSim

```tcl
vlog mux4to1_task_select.v mux4to1_task_select_tb.v
vsim -c mux4to1_task_select_tb
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
