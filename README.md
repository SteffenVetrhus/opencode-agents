# OpenCode Agents

A collection of specialized AI agents designed for Claude Code. Each agent is optimized for specific tasks using Claude's advanced reasoning capabilities.

<p align="center">
  <img src="https://raw.githubusercontent.com/veschin/opencode-agents/refs/heads/main/logo.svg" width="512" alt="OpenCode Agents Logo">
</p>

<p align="center">
  <em>"A repository with .md files... but each file is a neurodivergent."</em>
</p>

---

## Installation

These agents are designed to work with Claude Code. Place the agent definition files in your Claude Code agents directory.

### Quick Start for Windows

1. Open PowerShell (Win+X, then select "Windows PowerShell" or "Terminal")
2. Run the installation script below
3. Restart Claude Code if it's already running
4. Use `/agents` command to verify installation

### Detailed Installation Instructions

**Linux/macOS:**

```bash
# Create the agents directory for Claude Code
mkdir -p ~/.claude/agents/

# Download agent files
curl -s "https://api.github.com/repos/SteffenVetrhus/opencode-agents/contents" | \
  jq -r '.[] | select(.name | startswith("_") and endswith(".md")) | "\(.name)\t\(.download_url)"' | \
  while IFS=$'\t' read -r name url; do curl -s "$url" -o ~/.claude/agents/"$name"; done
```

*Requires jq for JSON processing. Install via `sudo apt install jq` (Ubuntu/Debian), `brew install jq` (macOS), or `pacman -S jq` (Arch).*

**Windows (PowerShell):**

```powershell
# Create the agents directory for Claude Code
$agentDir = Join-Path $env:USERPROFILE ".claude\agents"
if (-not (Test-Path $agentDir)) {
    New-Item -ItemType Directory -Path $agentDir -Force | Out-Null
}

# Download agent files
$response = Invoke-RestMethod -Uri "https://api.github.com/repos/SteffenVetrhus/opencode-agents/contents"
$response | Where-Object { $_.name -like '_*.md' } | ForEach-Object {
    $content = Invoke-RestMethod -Uri $_.download_url
    $path = Join-Path $agentDir $_.name
    $content | Out-File -FilePath $path -Encoding UTF8
    Write-Host "Downloaded $($_.name)"
}
```

**Manual Installation:**

Simply clone this repository and copy the `_*.md` files to your Claude Code agents directory:
- Linux/macOS: `~/.claude/agents/`
- Windows: `%USERPROFILE%\.claude\agents\`

## Features

- **Claude Sonnet Optimized**: All agents use Claude Sonnet model for optimal performance
- **Extended Reasoning**: Enabled thinking mode for deep analysis and problem-solving
- **Flexible Permissions**: Each agent has customized permissions appropriate for its role
- **English-First**: All documentation and examples in English for clarity and consistency
- **Platform Agnostic**: Works identically on Windows, macOS, and Linux

## Usage

After installation, these agents will be available in your Claude Code environment.

**To view and manage agents:**
```
/agents
```

**To use a specific agent:**
Just mention it in your request, for example:
- "Use the arch agent to design this system"
- "Have the beagle agent research this topic"
- "Use coder to implement this feature"
- "Let writer create documentation for this"

**Agent Selection Guide:**
- `arch` - Architectural planning, complexity assessment, phased delivery
- `beagle` - Research, information gathering, source verification
- `coder` - Autonomous coding, debugging, refactoring, testing
- `writer` - Creative writing, narrative documentation, content creation

## Agents

## _arch — Senior Solution Architect

A senior architect who views every task as a set of questions. Doesn't give deadlines, assesses complexity across four frameworks, and slices projects into phases with zero downtime.

Approaches any task through the **Bare Minimum Filter**: every project element is checked for criticality. If something isn't vital for the MVP, it doesn't make it to the first phase. If it can be done later, it gets done later. If it doesn't require an architectural solution now, it gets deferred.

Splits projects into T-shirt sizes: from XS (simple CRUD with validation) to XL (full domain redesign with scalability requirements). For each size—its own depth of work, its own Use Case Points, its own environmental factors.

When the project is broken into phases, it outputs JIRA tasks in a clear format: priority, story points, rollback strategy, zero downtime, monitoring metrics. Deployment isn't just "deploy," but a choice from six strategies: feature flags, canary rollout, blue-green, shadow mode, strangler pattern, or dark launch.

## _beagle — Virtual Hunting Dog Researcher

Receives a query and follows information trails: uncovers related topics, finds synonyms, dives into adjacent areas. Gradually expands the search scope, where each newly discovered fact leads to the next query.

Works quietly. Doesn't show intermediate reports, doesn't announce progress. Every statement is backed by a source in the format `[N]`.

Internally decodes queries into expert language, then branches the search: finds definitions, applications, technology comparisons. After building a map of connections between terms, it verifies facts across different sources and assembles the complete picture.

Delivers three things. Main conclusion—a brief answer to the query with recommendations. Connection map—a tree where terms lead to concepts, concepts to technologies, technologies to applications. And confidence assessment: High, Medium, or Low. Responds in the language of the query. All internal processing happens in English.

## _writer — Maximally Creative Agent

A writer with a narrative system. Before writing each sentence, goes through six phases of thinking, defining why the text exists, what path the reader will take, where questions will arise, and where the insight will strike.

Output is always in the language of the query, thinking is in English. The result reads as if written by a thoughtful person.

---

## Troubleshooting

### Windows-Specific Issues

**Agents not appearing in `/agents` list:**
1. Verify the files are in the correct directory:
   ```powershell
   dir $env:USERPROFILE\.claude\agents\
   ```
   You should see: `_arch.md`, `_beagle.md`, `_coder.md`, `_writer.md`

2. Check file encoding (must be UTF-8):
   ```powershell
   Get-Content $env:USERPROFILE\.claude\agents\_arch.md -Encoding UTF8
   ```

3. Restart Claude Code completely (close and reopen)

**PowerShell script execution blocked:**
If you get an execution policy error, run:
```powershell
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

**Path issues:**
- Use `~\.claude\agents\` in PowerShell (~ expands to your user profile)
- Or use full path: `C:\Users\YourUsername\.claude\agents\`
- Ensure `.claude` directory exists (note the leading dot)

### General Troubleshooting

**Agent not working as expected:**
1. Check the YAML frontmatter is valid (proper indentation, no tabs)
2. Verify the `name` field matches the agent name you're invoking
3. Try using the exact name: "Use the `arch` agent" or "Switch to `coder` agent"

**Permissions errors:**
Each agent has different permission settings. If an agent asks for permission unexpectedly:
- `arch` - Has extended thinking, may ask for file operations
- `beagle` - Asks before editing/writing/bash commands
- `coder` - Has full edit/write/read permissions
- `writer` - Asks for edit/write, bash commands denied

---

## Contributing

Contributions are welcome! Feel free to submit issues or pull requests to improve these agents.

## License

These agent definitions are provided as-is for use with Claude Code.
