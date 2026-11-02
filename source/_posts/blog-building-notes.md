---
title: 'From Zero to Live: How I Built This Blog'
date: 2026-11-02 17:00:00
categories:
  - Notes
tags:
  - Hexo
  - GitHub Pages
  - Blogging
---

> One afternoon, an empty folder turned into a website you can open in a browser. This is the whole process — for my future self, and for anyone thinking about doing the same.

## Why a static blog

There are plenty of options out there: WordPress, Medium, Notion, Substack. I picked the most "engineer" path — a **static blog** — for very practical reasons:

- **Completely free**: hosted on GitHub Pages. No server bills, no renewals.
- **Writing feels like note-taking**: plain Markdown files, nothing else.
- **Fast**: pure static HTML. No database, no backend, no cold starts.
- **Zero maintenance**: nothing to patch, nothing to get hacked.

The final stack: **Hexo + Butterfly theme + GitHub Pages**.

## Step by step

### 1. Prerequisites

Very little: Node.js and Git. Then one command installs Hexo:

```bash
npm install -g hexo-cli
hexo init blog && cd blog && npm install
```

### 2. Picking a theme

The Hexo theme gallery is overwhelming. I settled on [Butterfly](https://github.com/jerryc127/hexo-theme-butterfly): good looks, batteries included (comments, search, dark mode), and thorough documentation. Installation is one line:

```bash
npm install hexo-theme-butterfly
```

Then set `theme: butterfly` in `_config.yml`. Done.

### 3. Deploying to GitHub Pages

The idea is simple: Hexo compiles Markdown into a pile of HTML files in `public/`, you push that folder to a GitHub repository, and GitHub hosts it for free.

There's one naming trick: a repository called `username.github.io` is served from the **root** of `https://username.github.io`, with no sub-path prefix. That's the one you want.

Publishing is a single command:

```bash
./deploy.sh
```

### 4. The domain I wanted was taken

I had a `.me` domain in mind. Checked it — **already registered**, and the owner is behind a privacy service, so you can't even see who it is. That's how domains work: blink and it's gone. Not urgent though. Start free on `github.io`, attach the domain later — the CNAME is already prepared, so switching costs nothing.

## Things that went wrong

Two incidents worth remembering:

1. **The lock-file storm.** A local security component glitched and silently blocked every file deletion on the machine. Git depends on creating and removing lock files (`index.lock`), so `git commit` was completely dead. After a long detour, the culprit was a leftover lock file — delete it and everything recovered instantly. Lesson: **when Git says "Another git process seems to be running", check the lock file's timestamp first. It's almost always a leftover.**

2. **npm cache permissions.** An ownership problem in `~/.npm` broke installs. The workaround was pointing npm at a temporary cache directory.

## What you'll find here

- 🛠 Engineering notes and post-mortems (like this one)
- 📚 Thoughts on books and articles worth keeping
- 🌱 Occasional life updates

> The real benefit of a blog isn't an audience — it's the pressure to turn fuzzy understanding into clear writing. If you can explain it, you actually understand it.

That's post number one. See you around.
