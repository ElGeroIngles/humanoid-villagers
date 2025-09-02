# > humvil:lib/pool/random/main
# Get a random item of an array
# Macros:
# $(random_index) --> The randomzied index
# $(array) --> Storage array to get the random item

# Get the random item:
$data modify storage humvil:lib output set from storage $(array)[$(random_index)]
