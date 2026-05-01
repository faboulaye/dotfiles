# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

Personal dotfiles for macOS — shell, prompt, and tool configuration. Deployment is managed with [Task](https://taskfile.dev) (`Taskfile.yaml`).

## Deploying configs

```sh
task deploy.zsh        # rsync zsh/.zshrc → $HOME/.zshrc
task deploy.starship   # rsync starship/starship.toml → $HOME/.config/starship.toml
task                   # list all available tasks
```

## Repository structure

| Path | Purpose |
|---|---|
| `zsh/.zshrc` | Oh My Zsh config — plugins, pyenv, PATH, Task autocompletion |
| `starship/starship.toml` | Starship prompt layout and module styles |
| `Taskfile.yaml` | Deployment tasks (uses `rsync`) |

## Key configuration details

**zsh**: Uses Oh My Zsh with plugins `starship git terraform helm kubectl aws pyenv nvm`. Starship is loaded as an OMZ plugin (not via `eval "$(starship init zsh)"`). pyenv is initialized via `eval "$(pyenv init -)"`. Task shell completion is enabled via `eval "$(task --completion zsh)"`.

**starship**: Prompt order is `directory → git_branch → git_status → fill → python → nodejs → package → aws → docker_context → terraform → kubernetes → helm → jobs → cmd_duration`. Nord color palette is defined but not activated by default. Kubernetes module is enabled but only triggers when a `k8s` file is present.
