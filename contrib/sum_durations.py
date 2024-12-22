import re
import sys

def sum_durations(log_content):
    # Improved regex patterns
    sec_pattern = r'\|\s+(\d+(\.\d+)?)s\s+\|'
    ms_pattern = r'\|\s+(\d+(\.\d+)?)ms\s+\|'
    min_sec_pattern = r'\|\s+(\d+)m(\d+\.\d+)s\s+\|'
    alt_min_sec_pattern = r'\|\s+(\d+)m(\d+)s\s+\|'
    
    total_seconds = 0.0
    
    for line in log_content.split('\n'):
        sec_matches = re.findall(sec_pattern, line)
        if sec_matches:
            for match in sec_matches:
                duration = float(match[0])
                total_seconds += duration
        
        ms_matches = re.findall(ms_pattern, line)
        if ms_matches:
            for match in ms_matches:
                duration = float(match[0]) / 1000
                total_seconds += duration
        
        min_sec_matches = re.findall(min_sec_pattern, line)
        if min_sec_matches:
            for match in min_sec_matches:
                minutes = float(match[0])
                seconds = float(match[1])
                duration = (minutes * 60) + seconds
                total_seconds += duration
        
        alt_min_sec_matches = re.findall(alt_min_sec_pattern, line)
        if alt_min_sec_matches:
            for match in alt_min_sec_matches:
                minutes = float(match[0])
                seconds = float(match[1])
                duration = (minutes * 60) + seconds
                total_seconds += duration
    
    return total_seconds

if __name__ == "__main__":
    log_content = sys.stdin.read()
    total_duration = sum_durations(log_content)
    print(f"Total GPU time used: {total_duration:.6f} seconds")