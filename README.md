# Humanoid Villagers
This datapack aims to replace the boring villagers found in villages and replace them with the new Mannequin entity with randomized names and skins which can be easily expanded on!

> [!NOTE]  
> This proyect is still VERY in early development so everything here is very experimental and way not work, but it has been open sourced in order to show everyone the new things this new entity has to offer and more.

# Usage
```mcfunction
# Run the "humvil:lib/transform/humanize_villager" function as any entity (preferably a villager) and a humanoid version of it will spawn in its location:
execute as @n[type=minecraft:villager] run function humvil:lib/transform/humanize_villager
```

# Add custom names and skins
To add new custom names to the pool you can add your own custom ones using another datapack adding a function to one of the following:
- `#humvil:pool/names/male`: For masculine names
- `#humvil:pool/names/female`: For femenine names
- `#humvil:pool/names/all`: For both genders

For example, if you would like to add new masculine names you would need to add a new function that will be used to add them to the pool, so in this case it will be on `#humvil:pool/names/male`:
```json
{
    "replace": false,
    "values": [
        "foo:my_new_custom/names/male"
    ]
}
```
And inside of `foo:my_new_custom/names/male` you would need to add your new names to the `humvil:pool names` storages array as `SNBT`:
```mcfunction
# foo:my_new_custom/names/male
# Expected:
# humvil:pool names --> Array of names

# Add names to the pool:
data modify storage humvil:pool names append value '{translate:"names.foo.male.1"}'
data modify storage humvil:pool names append value '{text:"Gary"}'
```
> [!WARNING]  
> Always append to "humvil:pool names", never override its contents.

To add new custom skins to the pool you can add follow a similar structure, the function tags are now:
- `#humvil:pool/skins/male/wide`: For male wide skins
- `#humvil:pool/skins/male/slim`: For male slim skins
- `#humvil:pool/skins/female/wide`: For female wide skins
- `#humvil:pool/skins/female/slim`: For female slim skins
- `#humvil:pool/skins/both/wide`: For both genders wide skins
- `#humvil:pool/skins/both/slim`: For both genders slim skins

And the way to add skins to the pool is like this:
```mcfunction
# foo:my_new_custom/skins/male/slim
# Expected:
# humvil:pool skins --> Array of textures

# Add skins to the pool (first using a texture file and second without):
data modify storage humvil:pool skins append value 'texture:"foo:path/to/texture/without/the/png/extension"'
data modify storage humvil:pool skins append value 'id:[I;-2095468200,-46704017,-1371613937,1122824981],properties:[{name:"textures",value:"e3RleHR1cmVzOntTS0lOOnt1cmw6Imh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvZTFmZTRiYWJkNzVjMjhkYmVhY2ExNGE5Y2I0MmQyM2NlODgzZWEzMzA5NzM4NGRlNDU2Y2Q2NjU5MTI2OGIifX19"}]'
```
> [!WARNING]  
> Always append to "humvil:pool skins", never override its contents.
