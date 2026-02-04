# Render 部署指南（Free 方案）

本指南基于仓库内置的 `render.yaml` Blueprint，适配 Render Free 方案（无持久盘）。

> **重要**：Free 方案会在空闲 15 分钟后休眠，且无持久化磁盘，配置会在重启后丢失。

---

## 1. 一键部署

打开链接（替换为你自己的 fork 仓库地址）：

```
https://render.com/deploy?repo=https://github.com/foobar-ai/openclaw
```

Render 会读取仓库根目录的 `render.yaml` 并完成部署。

---

## 2. 关键配置说明

`render.yaml` 主要改动：

- **plan**: `free`
- **startCommand**: `bash scripts/render-start.sh`
- **OPENCLAW_GATEWAY_BIND=lan`** → 允许外部访问控制台
- **OPENCLAW_GATEWAY_PORT=$PORT** → Render 规范端口

脚本 `scripts/render-start.sh`：

- 使用 Render 提供的 `PORT`
- 自动设置 `OPENCLAW_GATEWAY_PORT`
- 允许无配置启动（便于首次 Setup）

---

## 3. 必填环境变量

在 Render 部署过程中会提示填写：

- `SETUP_PASSWORD`（必填，用于首次 setup）

系统自动生成：

- `OPENCLAW_GATEWAY_TOKEN`

---

## 4. 首次初始化

部署完成后访问：

```
https://<your-service>.onrender.com/setup
```

输入 `SETUP_PASSWORD` 完成配置向导。

---

## 5. 访问控制台

初始化完成后访问：

```
https://<your-service>.onrender.com/openclaw
```

---

## 6. Free 方案注意事项

- **无持久化磁盘**：配置、OAuth、会话会丢失
- **冷启动**：空闲 15 分钟后休眠，唤醒需要几秒
- **建议升级**：如需持久化，请升级到 Starter 及以上

---

## 7. 更新部署

只需 push 最新代码到 GitHub，然后在 Render 里触发 redeploy 即可。

---

如果需要我帮你再完善 `render.yaml` 或加入持久盘，请告诉我。
