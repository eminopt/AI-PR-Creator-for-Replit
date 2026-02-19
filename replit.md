# AI PR Creator for Replit

## Overview
A CLI utility that automatically creates GitHub Pull Requests from Replit Agent-generated code. It creates feature branches and uses GitHub Actions to auto-open PRs.

## Project Architecture
- `scripts/initiate-ai-pr.sh` - Shell script to create feature branches and commit changes
- `.github/workflows/initiate-ai-pr.yml` - GitHub Actions workflow that auto-creates PRs when AI branches are pushed

## Tech Stack
- Bash scripting
- GitHub Actions
- Git

## Usage
Run from Shell: `./scripts/initiate-ai-pr.sh <base-branch> <feature-name> "<pr-title>"`

## Recent Changes
- 2026-02-19: Initial Replit environment setup
