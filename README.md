# Dual-Boot Bluetooth Sync Guide (Pop!_OS & Windows 11)



**Complete step-by-step guide** to permanently fix Bluetooth pairing loops, audio stuttering, and connection issues when dual-booting **Pop!_OS** and **Windows 11** on a **Lenovo Yoga 6 (13ABR8)** (and similar hardware) using the [`bt-dualboot`](https://github.com/x2es/bt-dualboot) tool.



## 🔍 The Problem



When dual-booting, pairing a Bluetooth device on one OS overwrites the pairing keys stored in the Bluetooth adapter. Switching OSes causes key mismatches, leading to failed connections or severe audio stuttering/lag.



Tested devices: *Boult Audio Airbass*, and other common headphones/earbuds.



## 🛠️ Complete Step-by-Step Solution



### Step 1: Initial Device Pairing

1. Boot into **Windows 11** and pair your Bluetooth headphones normally.

2. Reboot into **Pop!_OS** and pair your Bluetooth headphones again.



### Step 2: Install System Prerequisites

```bash

sudo apt update

sudo apt install chntpw python3-venv

```



### Step 3: Setup Python Virtual Environment

```bash

# Clean up any previous mistyped directories

rm -rf ./~ 2>/dev/null || true



# Create virtual environment

python3 -m venv ~/bt-venv



# Activate it

source ~/bt-venv/bin/activate

```



*(Your prompt should now show `(bt-venv)`)*



### Step 4: Install bt-dualboot

```bash

pip install bt-dualboot

```



### Step 5: Mount Windows Drive

1. Open the **Files** app in Pop!_OS.

2. Click on your **Windows/NVMe SSD** drive in the sidebar to mount it.



### Step 6: Execute the Sync

```bash

sudo ~/bt-venv/bin/bt-dualboot -b --sync-all

```



The `-b` flag automatically backs up your Windows registry.



**Expected successful output:**

```text

Syncing...

===========

[41:42:FF:69:4F:34] Boult Audio Airbass

...done

```



Reboot into Windows 11 — your device should now work seamlessly on both OSes.



## 🔄 Long-Term Maintenance & Automation



Add a quick alias:



```bash

nano ~/.bashrc

```



Add this line at the bottom:

```bash

alias sync-bt="sudo ~/bt-venv/bin/bt-dualboot -b --sync-all"

```



Save, then run:

```bash

source ~/.bashrc

```



Now just mount your Windows drive and type `sync-bt` whenever needed.



### 💡 Golden Rules

- Disable **Windows Fast Startup** (highly recommended).

- Never "Forget Device" in Windows — use the sync command instead.

- Re-run the sync after major Windows Updates.



---



**Credits**

Powered by [x2es/bt-dualboot](https://github.com/x2es/bt-dualboot).



Tested on: Lenovo Yoga 6 (13ABR8) + Pop!_OS + Windows 11.



---



## Contributing

See [CONTRIBUTING.md](CONTRIBUTING.md)



## License

This guide is licensed under [MIT License](LICENSE).

```
