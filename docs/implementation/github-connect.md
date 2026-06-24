# GATO — Connect to GitHub

## Local repo ready
- All commits are on branch `main`.
- No remote is configured yet.
- GitHub is not authenticated in this environment, so remote push must be done manually.

## Exact commands to finish GitHub connection

1. Create the repo on GitHub (website or CLI):
```
gh repo create Giantz-Solutions/gato --public --source=. --remote=origin --push
```

2. Or, if you already created the GitHub repo manually:
```
git remote add origin git@github.com:Giantz-Solutions/gato.git
git push -u origin main
```

## Notes
- Replace `Giantz-Solutions/gato` with the actual GitHub owner/repo.
- If using SSH, ensure `~/.ssh/id_ed25519` (or `id_rsa`) exists and `ssh -T git@github.com` works.
