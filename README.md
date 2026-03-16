# [Godot]魔女兵器

基于 Godot 引擎重制的《魔女兵器》同人项目。

## 版本信息

当前版本：**1.2.1β**

## ⚠️ 重要声明

**本项目为《魔女兵器》的同人重制项目，仅供学习交流使用，严禁用于任何商业目的。**

### 版权说明

- **原游戏版权**：《魔女兵器》及其相关的美术素材、音乐、字体、角色设定、剧情等内容的版权归 **北京水琴铃信息技术有限公司** 所有
- **本项目代码**：由开发者 YANG301 使用 Godot 引擎原创开发
- **开源引擎**：本项目使用 [Godot Engine](https://godotengine.org/)，遵循 MIT 许可证

### 免责声明

1. 本项目**不是官方作品**，与原游戏公司无任何关联
2. 本项目**不用于商业目的**，不接受任何形式的捐赠或付费
3. 本项目使用的游戏素材版权归原公司所有，如有侵权请联系删除
4. 使用者应遵守相关法律法规，自行承担使用风险

## 📋 项目简介

本项目旨在使用 Godot 引擎学习游戏开发技术，通过重制《魔女兵器》来实践游戏开发的各个方面。

### 技术特点

- 使用 Godot 4.6 引擎开发
- GDScript 脚本语言编写
- 场景化的项目结构设计
- 使用 Godot 原生 VideoStreamPlayer 实现视频播放（资源统一为 OGV）
- 全局单例系统管理游戏配置和状态
- 支持 GL Compatibility 渲染模式
- 自定义 UI 交互和点击特效系统

## 🚀 快速开始

### 环境要求

- **Godot 引擎**：4.6 或更高版本
- **操作系统**：Windows 10/11（推荐）、Linux、macOS
- **视频播放**：已改为 Godot 原生 VideoStreamPlayer，无需额外插件
- **最低配置**：
  - CPU: 双核处理器
  - 内存: 4GB RAM
  - 显卡: 支持 OpenGL 3.3 或更高版本
- **推荐配置**：
  - CPU: 四核处理器
  - 内存: 8GB RAM
  - 显卡: 支持 OpenGL 4.5 或更高版本

### 运行项目

> 注意：项目视频资源已统一为 `res://assets/video/*.ogv`（Theora/Vorbis）。


1. **克隆本仓库**
```bash
git clone https://github.com/YANG301/Witch-Weapon-Godot-.git
cd Witch-Weapon-Godot-
```

2. **下载并安装 Godot 引擎**
   - 访问 [Godot 官网](https://godotengine.org/download) 下载 Godot 4.6 或更高版本
   - 推荐下载标准版（Standard version）

3. **打开项目**
   - 启动 Godot 引擎
   - 点击"导入"按钮
   - 选择项目目录中的 `project.godot` 文件
   - 点击"导入并编辑"

4. **运行游戏**
   - 在 Godot 编辑器中按 `F5` 或点击右上角的"播放"按钮
   - 首次运行可能需要一些时间来编译资源

### 导出游戏

项目已配置好导出预设，可以直接导出为 Windows 可执行文件：

1. 在 Godot 编辑器中选择"项目" -> "导出"
2. 选择对应的平台（Windows、Linux、macOS）
3. 点击"导出项目"按钮

## 📖 开发计划

- [x] 设置功能
- [x] 音乐鉴赏（网页端）
- [ ] 魔女人物图鉴
- [x] Mod 支持
- [ ] 同人画廊
- [ ] 原作梗介绍
- [ ] 世界观介绍

## 🤝 贡献指南

欢迎提交 Issue 和 Pull Request，但请注意：

1. 所有贡献必须遵守本项目的许可证
2. 不得提交侵犯版权的内容
3. 贡献的代码将同样以本项目许可证开源

## 📄 许可证

本项目采用自定义开源许可证，详见 [LICENSE](./LICENSE) 文件。

**核心条款：**
- ✅ 允许：学习、研究、修改、分享
- ❌ 禁止：商业使用、闭源分发
- 📝 要求：署名、相同方式共享

## 📧 联系方式

- 开发者：YANG301
- 邮箱：yangyi35@outlook.com

### 侵权处理

如本项目侵犯了您的合法权益，请通过上述邮箱联系，我们将及时处理。

## 🙏 致谢

- 感谢 [Godot Engine](https://godotengine.org/) 提供优秀的开源游戏引擎
- 感谢 Godot Engine 生态社区的工具与资料（本项目已迁移为原生视频播放方案，无需 godot-vlc）
- 感谢《魔女兵器》原作为我们提供学习灵感
- 感谢所有为本项目做出贡献的开发者

### 特别感谢

<table>
<tr>
<td align="center" width="33.33%">
<a href="https://space.bilibili.com/28626">
<img src="https://i0.hdslb.com/bfs/face/db69c5b3e23454a366ec340e577bf58e480ec62a.jpg@160w_160h_1c_1s.webp" width="100px;" alt="樱天澈"/>
<br />
<sub><b>樱天澈</b></sub>
</a>
</td>
<td align="center" width="33.33%">
<a href="https://space.bilibili.com/364706064">
<img src="https://i0.hdslb.com/bfs/face/ba517bc898138b931678327a8be9c39085de7d4a.jpg@96w_96h_1c_1s_!web-avatar.avif" width="100px;" alt="不死扶苏233"/>
<br />
<sub><b>不死扶苏233</b></sub>
</a>
</td>
<td align="center" width="33.33%">
<a href="https://space.bilibili.com/3546683193428662">
<img src="https://i1.hdslb.com/bfs/face/cff2b11ae8495ab602153e4ada205f6ee7f5486f.jpg" width="100px;" alt="白烛Official"/>
<br />
<sub><b>白烛Official</b></sub>
</a>
</td>
</tr>
<tr>
<td align="center" width="33.33%">
<a href="https://space.bilibili.com/6105216">
<img src="https://i0.hdslb.com/bfs/face/c1dc5df20b8d83a29af0d1251dddc20c00863752.jpg@128w_128h_1c_1s.webp" width="100px;" alt="雪凌殇"/>
<br />
<sub><b>雪凌殇</b></sub>
</a>
</td>
<td align="center" width="33.33%">
<a href="https://space.bilibili.com/274983449">
<img src="https://i0.hdslb.com/bfs/face/3328cd30de04b8f024145d3fc57a4386c6d7ed13.jpg@96w_96h_1c_1s_!web-avatar.avif" width="100px;" alt="见习食神懒羊羊"/>
<br />
<sub><b>见习食神懒羊羊</b></sub>
</a>
</td>
<td align="center" width="33.33%">
<a href="https://github.com/ProjektMing">
<img src="https://avatars.githubusercontent.com/u/73031259?v=4" width="100px;" alt="ProjektMing"/>
<br />
<sub><b>ProjektMing</b></sub>
</a>
</td>
</tr>
<tr>
<td align="center" width="33.33%">
<a href="https://github.com/basket-ball">
<img src="https://avatars.githubusercontent.com/u/53385583?v=4" width="100px;" alt="basket_ball"/>
<br />
<sub><b>basket_ball</b></sub>
</a>
</td>
<td align="center" width="33.33%"></td>
<td align="center" width="33.33%"></td>
</tr>
</table>

- QQ群：1078249413 魔女兵器编辑器测试群

---

**再次强调：本项目仅供学习交流，严禁商业使用。请尊重原作版权。**



