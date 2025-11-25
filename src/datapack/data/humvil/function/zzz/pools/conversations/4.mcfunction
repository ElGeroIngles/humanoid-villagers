# Expected:
# humvil:pool conversations --> Array of conversations

# Add conversations to the pool:
data modify storage humvil:pool conversations append value [{"participant": 1,"text": "'Hello World!'"},{"participant": 2,"text": "'Bye World!'"},{"participant": 3,"text": "'I like Apples :)'"},{"participant": 4,"text": "'I preffer Tomatoes'"}]
