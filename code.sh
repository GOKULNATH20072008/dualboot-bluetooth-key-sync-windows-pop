

sudo apt update
sudo apt install chntpw python3-venv

# Clean up any previous mistyped directories
rm -rf ./~ 2>/dev/null || true

# Create virtual environment
python3 -m venv ~/bt-venv

# Activate it
source ~/bt-venv/bin/activate

pip install bt-dualboot

sudo ~/bt-venv/bin/bt-dualboot -b --sync-all



# Long-Term Maintenance & Automation
nano ~/.bashrc
alias sync-bt="sudo ~/bt-venv/bin/bt-dualboot -b --sync-all"
source ~/.bashrc

