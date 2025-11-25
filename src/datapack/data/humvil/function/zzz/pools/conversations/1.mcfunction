# Expected:
# humvil:pool conversations --> Array of conversations

# Add conversations to the pool:
data modify storage humvil:pool conversations append value [{"participant": 1,"text": "'Hello World!'"}]
