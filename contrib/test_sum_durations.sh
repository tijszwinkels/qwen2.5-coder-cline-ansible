#!/bin/bash

# Sample log content
log_content="Nov 29 11:02:35 qwen ollama[2678]: [GIN] 2024/11/29 - 11:02:35 | 200 | 10.048285398s |       127.0.0.1 | POST     \"/v1/chat/completions\"
Nov 29 11:02:46 qwen ollama[2678]: [GIN] 2024/11/29 - 11:02:46 | 200 | 12.839245698s |       127.0.0.1 | POST     \"/v1/chat/completions\"
Nov 29 11:02:54 qwen ollama[2678]: [GIN] 2024/11/29 - 11:02:54 | 200 |  9.064086875s |       127.0.0.1 | POST     \"/v1/chat/completions\"
Nov 29 11:03:00 qwen ollama[2678]: [GIN] 2024/11/29 - 11:03:00 | 200 |  9.158279506s |       127.0.0.1 | POST     \"/v1/chat/completions\"
Nov 29 11:03:10 qwen ollama[2678]: [GIN] 2024/11/29 - 11:03:10 | 200 |  8.731248613s |       127.0.0.1 | POST     \"/v1/chat/completions\"
Nov 29 11:03:21 qwen ollama[2678]: [GIN] 2024/11/29 - 11:03:21 | 200 | 12.940719573s |       127.0.0.1 | POST     \"/v1/chat/completions\"
Nov 29 11:04:10 qwen ollama[2678]: [GIN] 2024/11/29 - 11:04:10 | 200 | 10.358232024s |       127.0.0.1 | POST     \"/v1/chat/completions\"
Nov 29 11:05:13 qwen ollama[2678]: [GIN] 2024/11/29 - 11:05:13 | 200 | 27.361187814s |       127.0.0.1 | POST     \"/v1/chat/completions\"
Nov 29 11:05:45 qwen ollama[2678]: [GIN] 2024/11/29 - 11:05:45 | 200 | 20.404375452s |       127.0.0.1 | POST     \"/v1/chat/completions\"
Nov 29 11:06:07 qwen ollama[2678]: [GIN] 2024/11/29 - 11:06:07 | 200 |         1m17s |       127.0.0.1 | POST     \"/v1/chat/completions\"
Nov 29 11:08:24 qwen ollama[2678]: [GIN] 2024/11/29 - 11:08:24 | 200 |   27.616745ms |       127.0.0.1 | POST     \"/api/show\"
Nov 29 11:08:24 qwen ollama[2678]: [GIN] 2024/11/29 - 11:08:24 | 200 |   27.621075ms |       127.0.0.1 | POST     \"/api/show\"
Nov 29 11:08:24 qwen ollama[2678]: [GIN] 2024/11/29 - 11:08:24 | 200 |   27.874977ms |       127.0.0.1 | POST     \"/api/show\""

# Run the sum_durations.py script with the sample log content
echo "$log_content" | python3 sum_durations.py
