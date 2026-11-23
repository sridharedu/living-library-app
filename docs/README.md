# 📝 Technology Living Library — Markdown Documentation Batch Guidelines

This directory (`docs/`) contains all **1,992 technical reference documents** for the **Ultimate Technology Living Library**.

Use this guide as the strict specification for any batch processing script, LLM agent, or human editor updating these `.md` files.

---

## 🚨 RULE 1: PRESERVE THE ORIGINAL 2-LINE CORE DEFINITION

> [!IMPORTANT]
> ### 🔒 MANDATORY RETENTION OF ORIGINAL DEFINITION
> Every topic has an **original 1–2 sentence core definition** (the true essence and meaning of the topic).
> - **YOU MUST RETAIN THIS EXACT TEXT VERBATIM.**
> - **DO NOT delete, overwrite, or rephrase it.**
> - Format it prominently at the top of the file inside a dedicated callout blockquote or bold quotation:
>
> ```markdown
> > **Core Mental Model:**  
> > *"<Insert the exact original 1–2 sentence pre-loaded definition here without alteration>"*
> ```
>
> **Where to find all 1,992 original definitions:**  
> `C:\Users\sridh\AppData\Local\Programs\antigravity\living-library\src\app.js.extracted`  
> *(Extracted JSON dataset containing every topic's original definition).*

---

## 🚨 RULE 2: NEVER CHANGE ANY FILE NAME

> [!CAUTION]
> ### STRICT INVARIANT: DO NOT RENAME FILES
> - Every file name strictly matches its counterpart diagram and application mapping:  
>   `docs/<section>__<group>__<topic>.md` ➔ `images/<section>__<group>__<topic>.png`
> - **DO NOT rename, move, or change extensions.**
> - **ONLY perform in-place content updates.**

---

## 🎨 Design & Aesthetic Standard: "Visually Great, Crisp, No Clutter"

The goal is a **visually wonderful, Notion-grade Markdown document** that is **concise, high-impact, and free of generic filler text**.

### Visual Style Rules:
1. **No Wall-of-Text / No Generic Fluff:**
   - Eliminate repetitive boilerplates.
   - Keep prose tight, punchy, and direct to the point.
2. **Rich Typography & Structural Rhythm:**
   - Use GitHub-style alerts (`> [!NOTE]`, `> [!TIP]`, `> [!WARNING]`).
   - Use bold lead-in tags on bullet points for effortless skimming.
   - Use backticks for code identifiers, configuration keys, commands, and types (`@Transactional`, `p99`, `poll()`, `O(1)`).
3. **Concise Syntax-Highlighted Code & Flow Blocks:**
   - Include brief, realistic Java/YAML/Bash snippets (max 8–15 lines).
   - Use clean ASCII/Unicode flowcharts or Mermaid diagrams to visualize mechanics where applicable.
4. **Structured Key Trade-offs & Comparisons:**
   - Use lightweight Markdown tables to compare behaviors, configurations, or failure modes.

---

## 📐 Standard Golden Template for Every Topic

Every updated `.md` file should adhere to this 4-part structure:

```markdown
# [Topic Title]

> **Core Mental Model:**  
> *[INSERT EXACT ORIGINAL PRE-LOADED 1-2 SENTENCE DEFINITION HERE]*

---

## 1. Architectural Overview & Mental Model
A concise, high-signal paragraph (3-5 sentences) detailing the architecture purpose, system boundaries, and design trade-offs.

```text
[Optional lightweight visual flow or ASCII diagram]
Producer ➔ [ Partition Log (Offsets 0, 1, 2...) ] ➔ Consumer Group
```

## 2. Execution Mechanics & Runtime Flow
- **Initialization & Configuration:** How the component boots, binds state, or pre-allocates resources.
- **Runtime Execution:** Step-by-step thread execution, concurrency boundaries, and data transformations.
- **State & Lifecycle:** Lifecycle states, cleanup, and graceful degradation.

```java
// Crisp, realistic production-ready code snippet (8-12 lines max)
ProducerRecord<String, OrderEvent> record = 
    new ProducerRecord<>("orders", orderId, event);
producer.send(record, (metadata, exception) -> {
    if (exception == null) {
        log.info("Committed offset: {}", metadata.offset());
    }
});
```

## 3. Production Best Practices & Failure Modes
| Scenario / Metric | Impact | Production Mitigation |
| :--- | :--- | :--- |
| **High Throughput / p99 Spike** | Buffer saturation | Tune `batch.size` and `linger.ms` |
| **Poison Pill Record** | Consumer loop crash | Dead Letter Queue (DLQ) + Error Handler |
| **Network Partition** | Stale read / split brain | Configure `acks=all` and `min.insync.replicas=2` |

> [!TIP]
> **Key Rule of Thumb:** 1 actionable, memorable production recommendation.

---

## 4. Chalkboard Reference Diagram
Visual architecture and component interaction flow is mapped in the local chalkboard diagram:

`images/<section>__<group>__<topic>.png`
```

---

## 🛠️ Automated Extraction Helper (Node.js Script)

To pull the exact original 2-line explanation for any topic, run:

```javascript
const fs = require('fs');
const content = fs.readFileSync('C:/Users/sridh/AppData/Local/Programs/antigravity/living-library/src/app.js.extracted', 'utf8');
const start = content.indexOf('const INITIAL_LIBRARY=') + 'const INITIAL_LIBRARY='.length;
const raw = content.slice(start, content.indexOf(';\nconst EMBEDDED_LIBRARY_ID', start)).trim();
const library = JSON.parse(raw.slice(0, raw.lastIndexOf(']') + 1));

// Look up topic by title
function getOriginalDefinition(topicTitle) {
  for (const section of library) {
    for (const group of section.groups) {
      for (const topic of group.topics) {
        if (topic.title.toLowerCase() === topicTitle.toLowerCase()) {
          return topic.explanation;
        }
      }
    }
  }
  return null;
}
```
