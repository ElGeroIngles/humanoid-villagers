# Get a random item of an array
# Macros:
# $(index) --> Max index of the pool's name
# $(array) --> Storage array to get the random item

# Get a random index:
$execute store result storage humvil:temp macro.random_index int 1 run random value 0..$(index)

# Save random item to $(array):
function humvil:lib/pool/random/get with storage humvil:temp macro
