# datapack_TMPL  
**数据包模板-高强度学习**<sub>待更新……</sub>

在创建一个数据包时，特殊命名的函数文件应该放在 `functions` 文件夹中，并按照它们的特殊命名规则进行命名在 Minecraft 数据包的目录结构中，应该按照以下方式组织这些文件：

```
my_datapack_name/
└── data/
    └── my_namespace/
        ├── advancements/
        |   └── my_advancement.json
        ├── loot_tables/
        |   └── my_loot_table.json
        ├── predicates/
        |   └── my_predicate.json
        ├── recipes/
        |   └── my_recipe.json
        ├── tags/
        |   ├── blocks/
        |   |   └── my_block_tag.json
        |   ├── items/
        |   |   └── my_item_tag.json
        |   └── entity_types/
        |       └── my_entity_tag.json
        └── worldgen/
            ├── configured_carvers/
            |   └── my_configured_carver.json
            ├── configured_feature/
            |   └── my_configured_feature.json
            └── configured_structure_feature/
                └── my_configured_structure_feature.json

```

1. `my_datapack_name`：这是创建的数据包的名称，可以根据自己的喜好命名它

2. `data`：这个目录存放所有数据包的数据文件

3. `my_namespace`：这是数据包的命名空间，它是为了避免与其他数据包产生冲突而设定的，可以给数据包起一个独特的命名空间，比如游戏用户名，或者其他简洁明了的标识符,详见data目录下的`注解`

4. `functions`：这个目录用于存放数据包中的所有函数文件，包括特殊命名的函数文件（如 `tick.mcfunction`、`load.mcfunction` 等）和其他自定义函数

5. `loot_tables`：这个目录用于存放数据包中自定义的战利品表文件，如果有需要更改实体的掉落物品，可以在这里添加自定义的战利品表文件  

6. `advancements/`：包含进度（Advancement）文件，用于定义玩家在游戏中取得进度的条件和奖励

7.  `loot_tables/`：包含战利品表（Loot Table）文件，用于定义实体、方块等掉落物品的规则

8.  `predicates/`：包含谓词（Predicate）文件，用于定义实体的属性和匹配规则

9.  `recipes/`：包含配方（Recipe）文件，用于定义制作物品、烹饪食物等配方规则

10. `tags/`：包含标签（Tag）文件，用于将多个方块、物品或实体归为一类

11. `worldgen/`：包含世界生成相关的配置文件，用于自定义世界的生成特征和结构(自定义群系)

上述的 `my_namespace` 命名空间是用于标识数据包，如果数据包不是用于发布或与其他数据包共享，也没有命名冲突的需求，可以将 `my_namespace` 设置为 `minecraft` 或者其他随意的名称，但建议在创建较为复杂的数据包时，这对使用自己独特的命名空间是很有帮助的

这些目录和文件的名称可以根据数据包的命名空间和需求进行自定义，每个目录中可能包含多个文件，具体文件名和内容取决于数据包的功能和用途

确保按照上述目录结构组织函数文件，然后将整个数据包文件夹放入 Minecraft 存档的 `datapacks` 目录中重新加载存档或进入游戏后，数据包中的函数文件将被加载并执行

---
***函数间的调用***  

当在同一个数据包中有多个命名空间，并且涉及多层级目录时，函数间的相互调用可能会变得稍微复杂

**例子 1：在同一个数据包下，不同命名空间之间函数的互相调用：**

在这个例子中，我们有两个命名空间 `namespace1` 和 `namespace2`，它们位于同一个数据包中我们希望在 `namespace1` 中的函数调用 `namespace2` 中的函数

`namespace1` 中的函数 `function1.mcfunction`：

```mcfunction
# function1.mcfunction
# 在 namespace1 中调用 namespace2 中的 function2
execute as @a run function namespace2:function2
```

`namespace2` 中的函数 `function2.mcfunction`：

```mcfunction
# function2.mcfunction
say 这是 namespace2 中的 function2
```

**例子 2：在同一个数据包下，不同命名空间下有多层目录的情况下函数的相互调用：**

在这个例子中，我们有两个命名空间 `namespace1` 和 `namespace2`，它们位于同一个数据包中,同时,在 `namespace2` 中有多层目录结构

`namespace1` 中的函数 `function1.mcfunction`：

```mcfunction
# function1.mcfunction
# 在 namespace1 中调用 namespace2 中的子目录 my_subdir 下的 function2
execute as @a run function namespace2:my_subdir/function2
```

`namespace2` 中的函数 `my_subdir/function2.mcfunction`：

```mcfunction
# my_subdir/function2.mcfunction
say 这是 namespace2 中的 my_subdir/function2
```

**例子 3：在同一个数据包下，同一命名空间下的函数相互调用：**

在这个例子中，我们有一个命名空间 `namespace1`，并在其中定义了多个函数，这些函数彼此之间相互调用

`namespace1` 中的函数 `function1.mcfunction`：

```mcfunction
# function1.mcfunction
# 调用同一命名空间下的其他函数 function2
execute as @a run function namespace1:function2
```

`namespace1` 中的函数 `function2.mcfunction`：

```mcfunction
# function2.mcfunction
# 调用同一命名空间下的其他函数 function3
execute as @a run function namespace1:function3
```

`namespace1` 中的函数 `function3.mcfunction`：

```mcfunction
# function3.mcfunction
say 这是 namespace1 中的 function3
```

**例子 4：在同一个数据包下，同一命名空间下有多层级目录的情况下函数的相互调用：**

在这个例子中，我们有一个命名空间 `namespace1`，并在其中定义了多层目录结构的函数，这些函数彼此之间相互调用

`namespace1` 中的函数 `my_subdir/function1.mcfunction`：

```mcfunction
# my_subdir/function1.mcfunction
# 调用同一命名空间下的子目录 my_subdir2 下的 function2
execute as @a run function namespace1:my_subdir2/function2
```

`namespace1` 中的函数 `my_subdir2/function2.mcfunction`：

```mcfunction
# my_subdir2/function2.mcfunction
# 调用同一命名空间下的子目录 my_subdir2 下的子目录 my_subdir3 下的 function3
execute as @a run function namespace1:my_subdir2/my_subdir3/function3
```

`namespace1` 中的函数 `my_subdir2/my_subdir3/function3.mcfunction`：

```mcfunction
# my_subdir2/my_subdir3/function3.mcfunction
say 这是 namespace1 中的 my_subdir2/my_subdir3/function3
```

注意，函数的调用格式仍然是 `function namespace:function_name`，不同命名空间和目录结构只是影响了命名空间部分的名称

---

当有多个不同的命名空间时，函数间的调用需要以完整的命名空间格式来书写，格式为：`namespace:function_name`这样才能确保 Minecraft 正确识别并调用其他命名空间中的函数下面举几个例子来说明函数间的调用：  

假设我们有两个数据包，分别有以下命名空间：

1. `namespace1`
2. `namespace2`

现在在 `namespace1` 数据包中有一个函数文件 `function1.mcfunction`，在 `namespace2` 数据包中有一个函数文件 `function2.mcfunction`

**在 `namespace1` 的 `function1.mcfunction` 中调用 `namespace2` 的函数 `function2`：**

```mcfunction
# 在 namespace1 的 function1.mcfunction 中调用 namespace2 的 function2
execute as @a run function namespace2:function2
```

**在 `namespace2` 的 `function2.mcfunction` 中调用 `namespace1` 的函数 `function1`：**

```mcfunction
# 在 namespace2 的 function2.mcfunction 中调用 namespace1 的 function1
execute as @a run function namespace1:function1
```

注意，在调用函数时，`namespace` 部分需要使用完整的命名空间名称，后跟一个冒号 `:`，然后是要调用的函数的名称 `function_name`

当然，如果函数的调用位于相同的数据包中，或者位于 Minecraft 内置命名空间 `minecraft` 中的函数，可以省略命名空间部分，直接写函数的名称即可，如：`function:function_name` 或 `minecraft:function_name`

确保在函数调用时使用正确的命名空间格式，这样 Minecraft 才能正确找到并执行相应的函数