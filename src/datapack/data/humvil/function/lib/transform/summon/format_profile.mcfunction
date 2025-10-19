# Setup the profile for the mannequin:
# Macros:
# $(model_type) --> Its model type (wide or slim)
# $(skin) --> Profile containing the skin texture to use

# Set profile:
$data modify storage humvil:random mannequin.profile set value 'model:"$(model_type)",$(skin)'
