# AI PR Creator for Replit

A simple utility to automatically create GitHub Pull Requests from Replit Agent-generated code.

This tool helps you:  

- Create feature branches for your AI-generated code.  
- Automatically open a PR on GitHub via workflow.  

## Setup

Add the following files to your repository exactly like this:

- .github/workflows/initiate-ai-pr.yml
- scripts/initiate-ai-pr.sh
   
## Usage

### Step 1: Enable GitHub Actions Permissions

Before using this tool, make sure your repository allows GitHub Actions to create pull requests:

Go to **Settings > Actions** and ensure **"Allow GitHub Actions to create and approve pull requests"** is enabled.

### Step 2: Ask Replit Agent to Build Something

Talk to Replit Agent and ask it to create code.

### Step 3: Create the Branch

Run the script with your feature details:

```bash
./scripts/initiate-ai-pr.sh <base-branch> <feature-name> "<pr-title>"
```

**Parameters:**
- `base-branch`: The branch the PR will be merged into (e.g., `main`)
- `feature-name`: Short identifier (no spaces), used for branch name
- `pr-title`: Title for the pull request (in quotes)

**Example:**

```bash
# Basic usage
./scripts/initiate-ai-pr.sh main email-validator "Add email validation utility"
```

The script creates a branch named `ai/<feature-name>/base--<base-branch>`. The workflow extracts the base branch from the `/base--` marker in the branch name, so it works reliably even if the base branch contains `ai` or slashes.

### Step 4: Publish the Branch from the Gui

After running the script, go to the Git tab in Replit and publish your branch.

### Step 5: Automatic Pull Request Creation

Once the branch is published, the GitHub Actions workflow will automatically create a PR on GitHub for the branch.

## Troubleshooting

#### Permission denied
Run: `chmod +x scripts/initiate-ai-pr.sh`

#### Common Issues

Make sure your branch name uses no spaces.

Ensure your GitHub Actions workflow file is correctly placed in .github/workflows/.

#### Monitor Workflow Execution

You can see the process and check if everything ran correctly in the Actions tab on GitHub.
Each AI branch creation triggers a workflow run that shows logs and success/failure status.

## Quick Reference for Developers

| Step | Action |
|------|--------|
| 1 | Enable GitHub Actions permissions in Settings > Actions |
| 2 | Ask Agent to build something |
| 3 | Run `./scripts/initiate-ai-pr.sh main feature-name "PR Title"` |
| 4 | Publish the branch from the Gui in Git tab (push as origin/<branch_name>)|
| 5 | Go to your repository and the PR should be there once the action completes successfully |
