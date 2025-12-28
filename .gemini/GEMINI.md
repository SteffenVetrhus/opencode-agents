# Gemini 3 Configuration for OpenCode Agents

This file provides Gemini-specific optimizations for the OpenCode Agents system.

## Model Selection

When using Google Antigravity with Gemini models:

- **Gemini 3 Pro**: Standard model for most tasks (equivalent to Claude Sonnet 4.5)
- **Gemini 3 Flash**: Fast responses for simple queries and quick iterations
- **Gemini 3 Deep Think (Pro High)**: Extended reasoning for complex architectural analysis

## Agent Model Preferences

### /arch - Senior Solution Architect
- **Preferred**: Gemini 3 Deep Think (for extensive reasoning)
- **Alternative**: Gemini 3 Pro
- **Temperature**: 0.4

### /beagle - Research Agent
- **Preferred**: Gemini 3 Pro (for web search and synthesis)
- **Alternative**: Gemini 3 Flash (for quick lookups)
- **Temperature**: 0.4

### /coder - Autonomous Coding Agent
- **Preferred**: Gemini 3 Pro (for deterministic code generation)
- **Alternative**: Claude Sonnet 4.5 (for complex refactoring)
- **Temperature**: 0.2

### /writer - Creative Writing Agent
- **Preferred**: Gemini 3 Pro (for creative content)
- **Alternative**: Claude Sonnet 4.5 (for narrative structure)
- **Temperature**: 1.0

## Gemini-Specific Features

### Extended Context Window
Gemini 3 models support up to 2 million tokens. Use this for:
- Analyzing entire codebases
- Processing extensive documentation
- Multi-file refactoring operations

### Multimodal Capabilities
Gemini 3 can process:
- Screenshots and UI mockups
- Architectural diagrams
- Code flowcharts
- Documentation images

### Google Workspace Integration
When using /beagle for research:
- Can access Google Search directly
- Integrates with Google Scholar for academic sources
- Can reference Google documentation

## Optimization Tips

1. **For Architecture Tasks**: Use Deep Think mode with extended reasoning
2. **For Code Generation**: Use Pro with temperature 0.2 for consistency
3. **For Research**: Leverage Gemini's search integration
4. **For Documentation**: Use Pro at temperature 1.0 for creativity

## Prompt Engineering for Gemini

Gemini models respond well to:
- Clear, structured prompts
- Step-by-step reasoning requests
- Explicit output format specifications
- Chain-of-thought prompting

## Fallback Strategy

If Gemini models hit rate limits:
1. Switch to Claude Sonnet 4.5 (always available)
2. Use Gemini 3 Flash for lighter tasks
3. Queue complex tasks for when Deep Think is available

## Performance Benchmarks

Based on internal testing with OpenCode Agents:

| Agent | Gemini 3 Pro | Gemini 3 Deep Think | Claude Sonnet 4.5 |
|-------|--------------|---------------------|-------------------|
| arch | Good | Excellent | Excellent |
| beagle | Excellent | Excellent | Good |
| coder | Excellent | Good | Excellent |
| writer | Good | Good | Excellent |

**Recommendation**: Use Gemini for research and analysis, Claude for precise code generation.

## Configuration in Antigravity

To set Gemini as default model:
1. Open Antigravity Settings (Cmd/Ctrl + ,)
2. Navigate to "Agent" → "Model Selection"
3. Set "Default Model" to "Gemini 3 Pro"
4. Enable "Auto-switch to Deep Think for complex tasks"

## Cost Optimization

Gemini 3 pricing (as of January 2025):
- Gemini 3 Flash: Most economical for quick tasks
- Gemini 3 Pro: Standard pricing, generous rate limits
- Gemini 3 Deep Think: Higher cost, use for critical analysis only

**Tip**: Use Flash for iterations, Pro for production, Deep Think for strategic decisions.

---

For more information, see: https://ai.google.dev/gemini-api/docs
