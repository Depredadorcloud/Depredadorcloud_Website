// Initialize Icons
lucide.createIcons();

// Simulate Multi-Agent Orchestration Logs (Deer-Flow & Agency-Agents Context)
const logs = [
    "[SYSTEM] Nexus Core Orchestrator Online. Establishing connection with sub-cores...",
    "[SISA] Core Online. Fleet telemetry synced at 99.8%. Waiting for instructions.",
    "[OMEGA-1] Core Online. NLP Sub-Model 'Veritas' training initiated.",
    "[PAUL_KRUGER] Core Online. Accessing Bloomberg and Nikkei Asian Review APIs.",
    "[ORCHESTRATOR] Event Bus polling started. Frequency: 500ms.",
    "[PAUL_KRUGER] High-probability trading signal detected in rare-earth materials sector.",
    "[PAUL_KRUGER] Dispatching insight to OMEGA-1 for sentiment validation.",
    "[OMEGA-1] Sentiment validation complete. Consensus: Strongly Bullish (89%).",
    "[ORCHESTRATOR] Cross-agent workflow validated. Forwarding action parameters to SISA.",
    "[SISA] Adjusting logistics paths to prioritize rare-earth refinement machinery transport.",
    "[SYSTEM] Execution cycle completed. Latency: 42ms."
];

const logContainer = document.getElementById('eventLogs');
let currentLogIndex = 0;

function addLog() {
    if (currentLogIndex < logs.length) {
        const logEntry = document.createElement('div');
        logEntry.className = 'log-entry';
        
        const timestamp = new Date().toLocaleTimeString('es-ES', { hour12: false });
        
        logEntry.innerHTML = `<span class="timestamp">[${timestamp}]</span> ${logs[currentLogIndex]}`;
        logContainer.appendChild(logEntry);
        
        // Auto scroll
        logContainer.scrollTop = logContainer.scrollHeight;
        
        currentLogIndex++;
        
        // Randomize next log appearance between 1 - 3 seconds
        setTimeout(addLog, Math.random() * 2000 + 1000);
    }
}

// Start sequence after 1 second
setTimeout(addLog, 1000);
