# OpenCode Agents

A collection of specialized AI agents designed for **Claude Code** and **Google Antigravity**. Each agent is optimized for specific tasks using Claude's or Gemini's advanced reasoning capabilities.

<p align="center">
  <img src="https://raw.githubusercontent.com/veschin/opencode-agents/refs/heads/main/logo.svg" width="512" alt="OpenCode Agents Logo">
</p>

<p align="center">
  <em>"A repository with .md files... but each file is a neurodivergent."</em>
</p>

---

## Choose Your Platform

This repository supports two AI-powered IDEs:

### 🔵 **Claude Code**
Anthropic's official CLI for Claude, optimized for Claude Sonnet/Opus models.
- Best for: Claude-first workflows, terminal-based development
- Models: Claude Sonnet 4.5, Claude Opus 4.5

### 🟢 **Google Antigravity**
Google's new agentic development platform (announced Nov 2025).
- Best for: Multi-model workflows, VS Code users, Gemini integration
- Models: Gemini 3 Pro/Flash/Deep Think, Claude Sonnet 4.5, Claude Opus 4.5

**Both platforms are fully supported!** Choose the installation method below based on your IDE.

---

## Installation

### Option A: Google Antigravity (Recommended for Windows)

**✨ Easiest Method** - Antigravity auto-loads configuration from this repository structure.

**Step 1:** Download Google Antigravity
- Visit: https://antigravity.google/download
- Install for Windows, macOS, or Linux
- Launch Antigravity

**Step 2:** Clone this repository to your project
```bash
git clone https://github.com/SteffenVetrhus/opencode-agents.git
cd opencode-agents
```

**Step 3:** Open in Antigravity
- File → Open Folder → Select `opencode-agents` directory
- Antigravity will automatically detect:
  - `.cursorrules` (base configuration)
  - `.antigravity/rules.md` (agent definitions)
  - `.gemini/GEMINI.md` (Gemini-specific optimizations)

**Step 4:** Verify installation
- Type `/agents` in the Antigravity chat
- You should see: `/arch`, `/beagle`, `/coder`, `/writer`

**Step 5:** Start using agents
```
/arch Help me design this system
/beagle Research best practices for authentication
/coder Implement user login feature
/writer Create API documentation
```

---

### Option B: Claude Code

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

- **Dual-Platform Support**: Works with both Claude Code and Google Antigravity
- **Multi-Model Compatible**: Supports Claude Sonnet 4.5, Claude Opus 4.5, Gemini 3 Pro/Flash/Deep Think
- **Extended Reasoning**: Enabled thinking mode for deep analysis and problem-solving
- **Flexible Permissions**: Each agent has customized permissions appropriate for its role
- **English-First**: All documentation and examples in English for clarity and consistency
- **Platform Agnostic**: Works identically on Windows, macOS, and Linux
- **Auto-Configuration**: Antigravity auto-loads settings; Claude Code uses direct installation

## Usage

### Google Antigravity

**View available agents:**
```
/agents
```

**Use workflow commands:**
```
/arch Help me design this microservices architecture
/beagle Research React vs Vue performance benchmarks
/coder Refactor this authentication module
/writer Create user-facing documentation for this API
```

**Or mention agents explicitly:**
- "Use the arch agent to assess complexity"
- "Have beagle research best practices"
- "Let coder implement this feature"
- "Ask writer to document this"

### Claude Code

**View available agents:**
```
/agents
```

**Switch agents or mention explicitly:**
- "Use the arch agent to design this system"
- "Have the beagle agent research this topic"
- "Use coder to implement this feature"
- "Let writer create documentation for this"

### Agent Selection Guide

- **`arch`** - Architectural planning, complexity assessment (WBS, UCP, T-shirt sizing), phased delivery with JIRA tasks, deployment strategies
- **`beagle`** - Research, information gathering, source verification, connection mapping, confidence assessment
- **`coder`** - Autonomous coding, debugging, refactoring, testing, ReAct pattern, SOLID principles, TDD
- **`writer`** - Creative writing, narrative documentation, 6-phase thinking system, content creation

### Model Recommendations

| Agent | Claude Code | Google Antigravity |
|-------|-------------|-------------------|
| arch | Claude Sonnet 4.5 | Gemini 3 Deep Think or Claude Opus 4.5 |
| beagle | Claude Sonnet 4.5 | Gemini 3 Pro (best for web search) |
| coder | Claude Sonnet 4.5 | Gemini 3 Pro or Claude Sonnet 4.5 |
| writer | Claude Sonnet 4.5 | Claude Sonnet 4.5 or Gemini 3 Pro |

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

### Google Antigravity Issues

**Agents not showing up:**
1. Ensure you opened the folder containing `.cursorrules`
2. Check that `.antigravity/rules.md` exists in the project root
3. Restart Antigravity (File → Reload Window or Cmd/Ctrl + R)
4. Check Antigravity console: View → Output → Select "Antigravity" from dropdown

**Workflow commands not working:**
- Make sure you're using `/arch`, `/beagle`, `/coder`, or `/writer` with a forward slash
- Try explicit mention: "Use the arch agent to help with this"
- Check Customizations: Click "..." → Customizations → Workflows

**Model selection issues:**
- To use Gemini: Settings → Agent → Model Selection → "Gemini 3 Pro"
- To use Claude: Settings → Agent → Model Selection → "Claude Sonnet 4.5"
- Set API keys: Settings → Agent → API Keys

**Permission errors:**
- Review-driven mode: AI asks before making changes (recommended)
- Agent-driven mode: AI makes changes automatically (use with caution)
- Settings → Agent → Development Mode

### Claude Code Issues - Windows-Specific

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

## Repository Structure

```
opencode-agents/
├── .cursorrules              # Antigravity base configuration
├── .antigravity/
│   └── rules.md             # All 4 agents as Antigravity workflows
├── .gemini/
│   └── GEMINI.md            # Gemini 3 model optimizations
├── _arch.md                 # Claude Code agent: Architecture
├── _beagle.md               # Claude Code agent: Research
├── _coder.md                # Claude Code agent: Coding
├── _writer.md               # Claude Code agent: Writing
├── README.md                # This file
├── Makefile                 # Sync utility
└── logo.svg                 # Project logo
```

### File Usage by Platform

| File | Claude Code | Google Antigravity |
|------|-------------|-------------------|
| `.cursorrules` | ❌ Not used | ✅ Auto-loaded |
| `.antigravity/rules.md` | ❌ Not used | ✅ Auto-loaded |
| `.gemini/GEMINI.md` | ❌ Not used | ✅ Optional (Gemini optimizations) |
| `_arch.md` | ✅ Copy to `~/.claude/agents/` | ℹ️ Reference only |
| `_beagle.md` | ✅ Copy to `~/.claude/agents/` | ℹ️ Reference only |
| `_coder.md` | ✅ Copy to `~/.claude/agents/` | ℹ️ Reference only |
| `_writer.md` | ✅ Copy to `~/.claude/agents/` | ℹ️ Reference only |

**Summary:**
- **Antigravity users**: Just clone and open the folder - everything auto-loads!
- **Claude Code users**: Copy the `_*.md` files to your agents directory

---

## Contributing

Contributions are welcome! Feel free to submit issues or pull requests to improve these agents.

## License

These agent definitions are provided as-is for use with Claude Code.
