---
title: 从零到上线：我的博客是怎么搭起来的
date: 2026-11-02 17:00:00
categories:
  - 技术笔记
tags:
  - Hexo
  - GitHub Pages
  - 建站
---

> 花了一个下午，这个博客从空白文件夹变成了一个能在浏览器里打开的网站。这篇文章记录整个过程，给未来的自己，也给想动手的你。

## 为什么选择静态博客

市面上的建站方案很多：WordPress、语雀、知乎专栏、Notion……最后我选了最"程序员"的那条路——**静态博客**，理由很实际：

- **完全免费**：GitHub Pages 托管，不花一分钱，也不用续费服务器
- **写作体验**：就是写 Markdown 文件，跟写笔记没区别
- **速度快**：纯静态 HTML，没有数据库、没有后端，加载飞快
- **零运维**：没有服务器要打补丁，不用担心被黑

技术栈最终确定为：**Hexo + Butterfly 主题 + GitHub Pages**。

## 搭建全流程

### 1. 环境准备

需要的东西很少：Node.js 和 Git。装好后一条命令搞定 Hexo：

```bash
npm install -g hexo-cli
hexo init blog && cd blog && npm install
```

### 2. 挑主题

Hexo 官网主题多到眼花，最后选了 [Butterfly](https://github.com/jerryc127/hexo-theme-butterfly)：颜值在线、功能齐全（评论、搜索、暗色模式都有）、中文文档详细。安装也很简单：

```bash
npm install hexo-theme-butterfly
```

然后在 `_config.yml` 里把 `theme` 改成 `butterfly` 就完事了。

### 3. 部署到 GitHub Pages

思路很简单：Hexo 把 Markdown 生成一堆 HTML 文件（在 `public/` 目录），推到 GitHub 仓库，GitHub 免费帮你托管。

仓库命名为 `用户名.github.io` 有个魔法：这个特定名字的仓库，站点直接挂在 `https://用户名.github.io` 根路径下，没有子路径前缀。

本地只写了一个发布脚本，日常更新一条命令：

```bash
./deploy.sh
```

### 4. 想买的域名被占了

本来想注册一个 `.me` 域名，一查——**已经被别人注册了**，还是个隐私保护账号，连持有人是谁都看不到。域名的世界，手慢无。不过这个不着急，先用免费的 `github.io` 跑起来，以后想买了再绑，Hexo 这边预留了 CNAME，切换是零成本的事。

## 踩过的坑

过程也不是一帆风顺，记录两个印象最深的：

1. **锁文件风暴**：本机的安全组件某次异常后，所有程序的文件删除操作被卡住，Git 依赖的锁文件（`index.lock`）删不掉，导致 `git commit` 完全瘫痪。排查了一圈发现是残留锁文件，清掉后瞬间恢复。教训：**遇到 "Another git process seems to be running"，先看锁文件的时间戳，八成是残留。**

2. **npm 缓存权限**：`~/.npm` 目录属主异常导致安装报错，绕过方式是给 npm 指定一个临时缓存目录。

## 以后这里会写什么

- 🛠 技术笔记和踩坑记录（像这篇一样）
- 📚 读过的书、看过的文章的思考
- 🌱 一些生活随想

> 写博客最大的好处不是给别人看，而是逼自己把模糊的理解整理成清晰的表达。能写明白，才是真的懂了。

第一篇，就到这里。这个博客见。
