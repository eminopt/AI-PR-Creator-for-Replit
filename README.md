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

### Step 1: Ask Replit Agent to Build Something

Talk to Replit Agent and ask it to create code.

### Step 2: Create the Branch

Run the script with your feature details:

```bash
./scripts/initiate-ai-pr.sh <feature-name> "<pr-title>"
```

**Parameters:**
- `feature-name`: Short identifier (no spaces), used for branch name
- `pr-title`: Title for the pull request (in quotes)

**Example:**

```bash
# Basic usage
./scripts/initiate-ai-pr.sh email-validator "Add email validation utility"
```

### Step 3: Publish the Branch from the Gui

After running the script, go to the Git tab in Replit and publish your branch.

### Step 4: Automatic Pull Request Creation

Once the branch is published, the GitHub Actions workflow will automatically create a PR on GitHub for the branch.

## Troubleshooting

#### Permission denied
Run: `chmod +x scripts/initiate-ai-pr.sh`

#### GitHub Actions Fails to Create PR
If the workflow does not successfully create a PR, check your repository’s GitHub Actions permissions:

Go to Settings > Actions and ensure “Allow GitHub Actions to create and approve pull requests” is enabled.

#### Common Issues

Make sure your branch name uses no spaces.

Ensure your GitHub Actions workflow file is correctly placed in .github/workflows/.

#### Monitor Workflow Execution

You can see the process and check if everything ran correctly in the Actions tab on GitHub.
Each AI branch creation triggers a workflow run that shows logs and success/failure status.

## Quick Reference for Developers

| Step | Action |
|------|--------|
| 1 | Ask Agent to build something |
| 2 | Run `./scripts/initiate-ai-pr.sh feature-name "PR Title"` |
| 3 | Publish the branch from the Gui in Git tab (push as origin/<branch_name>)|
| 4 | Go to your repository and the PR should be there once the action completes successfully |

