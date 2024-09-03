#!/bin/bash

# Define output file names
TEXT_FILE="system_info.txt"
PDF_FILE="system_info.pdf"

# Collect system information
{
  echo "System Information Report"
  echo "========================="
  echo ""
  
  # Basic info
  echo "Date and Time:"
  date
  echo ""
  
  # Uptime
  echo "System Uptime:"
  uptime
  echo ""
  
  # OS Info
  echo "OS Information:"
  uname -a
  echo ""
  
  # Disk Usage
  echo "Disk Usage:"
  df -h
  echo ""
  
  # Memory Usage
  echo "Memory Usage:"
  free -h
  echo ""
  
  # CPU Info
  echo "CPU Information:"
  lscpu
  echo ""
  
  # Network Info
  echo "Network Information:"
  ip addr
  echo ""
  
  # Top Processes
  echo "Top Processes:"
  top -b -n 1 | head -n 20
} > "$TEXT_FILE"

# Convert the text file to PDF using enscript and ps2pdf
enscript "$TEXT_FILE" -o - | ps2pdf - "$PDF_FILE"

# Clean up
rm "$TEXT_FILE"

echo "System information has been saved to $PDF_FILE."
