# dotfiles

Personal dotfiles for macOS — shell, prompt, and productivity tooling configuration managed as source files and deployed with [Task](https://taskfile.dev).

## Requirements

- [Task](https://taskfile.dev/installation/) — task runner (`brew install go-task`)
- [Oh My Zsh](https://ohmyz.sh/) — zsh framework
- [Starship](https://starship.rs/) — cross-shell prompt
- [pyenv](https://github.com/pyenv/pyenv) — Python version management (`brew install pyenv`)
- [nvm](https://github.com/nvm-sh/nvm) — Node.js version management
- [AWS CLI v2](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html) + [yawsso](https://github.com/victorskl/yawsso) (`pip install yawsso`) — for AWS SSO tasks

## What's included

| Config | Source | Deploys to |
| --- | --- | --- |
| Zsh | `zsh/.zshrc` | `~/.zshrc` |
| Starship prompt | `starship/starship.toml` | `~/.config/starship.toml` |
| Global Taskfile | `task/Taskfile.yml.template` | `~/Taskfile.yaml` |

## Deploying

Deploy everything at once or individually. Existing files are backed up with a `.bak` suffix before being overwritten.

```sh
task deploy.all       # deploy all configs (recommended for first-time setup)

task deploy.zsh       # deploy zsh config only
task deploy.starship  # deploy Starship prompt config only
task deploy.task      # deploy global Taskfile only
```

After deploying `.zshrc`, reload your shell:

```sh
source ~/.zshrc
```

## Global tasks (`~/Taskfile.yaml`)

Once deployed, the global Taskfile provides utility tasks available from anywhere via `task -g`:

### AWS SSO login

Authenticate with AWS SSO and sync temporary credentials to `~/.aws/credentials` (required for tools that don't natively support SSO profiles):

```sh
task -g aws:sso PROFILE=<your-profile>
```
