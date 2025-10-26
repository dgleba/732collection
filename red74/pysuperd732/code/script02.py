import time
from datetime import datetime

# =================================================

#!/usr/bin/env python3
import time
import math
import sys
import multiprocessing
import signal

# Configuration
INITIAL_UTILIZATION = 20  # Start at 20% CPU
UTILIZATION_STEP = 10     # Increase by 10% each interval
MEMORY_STEP_MB = 100      # Initial memory allocation step
INTERVAL_DURATION = 30    # Seconds between increases

def generate_cpu_load(utilization):
    """Generate controlled CPU load using arithmetical operations"""
    start_time = time.time()
    while time.time() - start_time < utilization/100.0:
        math.factorial(100)  # CPU-intensive operation
    time.sleep(1 - utilization/100.0)

def memory_consumer():
    """Gradually allocate increasing amounts of memory"""
    memory_allocated = []
    try:
        while True:
            # Allocate memory in increasing chunks
            chunk_size = MEMORY_STEP_MB * 1024 * 1024  # Convert MB to bytes
            memory_allocated.append('A' * chunk_size)
            print(f"Allocated {len(memory_allocated)*MEMORY_STEP_MB} MB")
            time.sleep(1)
    except MemoryError:
        print("Memory allocation failed - triggering OOM")
        sys.exit(1)

def signal_handler(sig, frame):
    print(f"Received signal {sig} - exiting")
    sys.exit(0)

if __name__ == "__main__":


    signal.signal(signal.SIGTERM, signal_handler)
    
    # Start memory consumer in separate process
    memory_process = multiprocessing.Process(target=memory_consumer)
    memory_process.start()

    current_utilization = INITIAL_UTILIZATION
    try:
        while True:
        
            timestamp = datetime.now().strftime('%Y-%m-%d %H:%M:%S')
            print(f"[{timestamp}] v02 script.py running using supervisord... Ctrl+C to stop.")
            
            print(f"Testing at {current_utilization}% CPU utilization")
            
            # Create CPU load processes
            processes = []
            for _ in range(multiprocessing.cpu_count()):
                p = multiprocessing.Process(target=generate_cpu_load, 
                                          args=(current_utilization,))
                p.start()
                processes.append(p)
            
            # Wait for interval duration
            time.sleep(INTERVAL_DURATION)
            
            # Cleanup CPU processes
            for p in processes:
                p.terminate()
            
            # Increase utilization for next interval
            current_utilization = min(current_utilization + UTILIZATION_STEP, 100)
            MEMORY_STEP_MB *= 2  # Double memory allocation each interval
            
    except KeyboardInterrupt:
        memory_process.terminate()
        sys.exit(0)

# =================================================

"""
while True:
    timestamp = datetime.now().strftime('%Y-%m-%d %H:%M:%S')
    print(f"[{timestamp}] script.py Still running using supervisord... Ctrl+C to stop.")
    time.sleep(20)
    
    from pathlib import Path
    #Path("heartbeat-health.txt").touch()
"""

# =================================================
