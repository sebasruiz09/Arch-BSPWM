
#!/bin/bash
netextender_info=$(ps aux | grep "netExtender")

# Verificar si NetExtender está en ejecución
if [[ "$netextender_info" == *"CONTROLBOX"* ]]; then
    echo " controlbox"
else
    echo " "
fi
