# 🧠 Asynchronous Single-Port RAM (16x8) – Verilog

This project implements an **Asynchronous Single-Port RAM** in Verilog.  
 The design supports **read and write operations** using a shared data bus with **tri-state logic**.

---

## ✨ Features

- 📦 **16-word RAM** with **8-bit word size**.
- 🔄 **Single-port architecture** with shared read/write data lines (`inout`).
- ⏳ **Asynchronous operation** – read and write occur based on control signals (`we_in`, `enable_in`) without a clock.
- 🧹 **High-impedance (`Z`) bus support** when idle.
- 🧪 **Testbench included** for simulation and verification.

---

## 📂 Files Included

- `async_ram_16x8.v` → RTL design of the Asynchronous Single-Port RAM.
- `async_ram_16x8_tb.v` → Testbench for verifying the design.
- `README.md` → Documentation (this file).

---

## 🧩 Design Details

### 🔹 Ports

| Port        | Direction | Width | Description                                       |
| ----------- | --------- | ----- | ------------------------------------------------- |
| `we_in`     | input     | 1-bit | Write enable (`1` = write, `0` = read)            |
| `enable_in` | input     | 1-bit | Read enable (`1` = read, `0` = write)             |
| `addr_in`   | input     | 4-bit | Address (0–15)                                    |
| `data`      | inout     | 8-bit | Data bus (input during write, output during read) |

---

### 🔹 Functionality

1. **Write Operation**
   - If `we_in=1` and `enable_in=0`, `data` is written to `mem[addr_in]`.
2. **Read Operation**
   - If `we_in=0` and `enable_in=1`, `data` outputs `mem[addr_in]`.
3. **High-Impedance State**
   - If neither read nor write is active, `data` is set to `Z` (high-impedance).

---

## 📊 Simulation

The testbench performs:

1. **Write phase** → Stores address-indexed data (`addr=0..15, data=0..15`).
2. **Read phase** → Reads back stored data from all addresses.

### Example Simulation Flow

```text
Writing: Addr=0 Data=0
Writing: Addr=1 Data=1
...
Writing: Addr=15 Data=15

Reading: Addr=0 -> Data=0
Reading: Addr=1 -> Data=1
...
Reading: Addr=15 -> Data=15
```

---

## 🛠️ How to Run

### ▶️ Using ModelSim / QuestaSim

```tcl
vlog async_ram_16x8.v async_ram_16x8_tb.v
vsim -c async_ram_16x8_tb
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