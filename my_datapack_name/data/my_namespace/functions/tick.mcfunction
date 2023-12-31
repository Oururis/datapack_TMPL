#tick.mcfunction：这个函数文件会在每个游戏刻（Tick）中自动执行一次Ticks 是 Minecraft 中的游戏循环周期，游戏在每个 Tick 中处理各种事务，比如移动实体、检测碰撞、更新方块状态等在 tick.mcfunction 中编写的命令会以每个 Tick 的频率执行一次，因此适合处理需要持续性操作的功能

# 特定命名的函数文件可以帮助在特定的游戏事件发生时自动执行命令，从而实现更灵活和自动化的功能请注意，这些特殊函数文件的命名是固定的，不要随意修改它们的名称，否则游戏将无法识别并自动调用这些函数