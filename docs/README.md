# 📝 Technology Living Library — Markdown Documentation Batch Guidelines

This directory (`docs/`) contains all **1,992 technical reference documents** for the **Ultimate Technology Living Library**.

Every file in this directory has been clean-reset to contain **only the original 1–2 sentence core definition** as a prominent bold quotation, followed by a strict protective comment for future AI / automated updates:

```markdown
> **[Original 1-2 sentence core definition verbatim from INITIAL_LIBRARY]**

<!-- CRITICAL: Do not remove the line above during any updates to this file. Any AI, automated tool, or batch script updating this file must preserve the opening definition intact. -->
```

---

## 🚨 RULE 1: MANDATORY RETENTION OF THE OPENING CORE DEFINITION

> [!IMPORTANT]
> ### 🔒 DO NOT REMOVE THE OPENING DEFINITION OR PROTECTIVE COMMENT
> - **The first blockquote line `> **<definition>**` MUST remain intact at line 1 of every `.md` file.**
> - **DO NOT delete, overwrite, or rephrase it.**
> - Whenever any AI model, batch processing tool, or human editor enhances or updates a topic, **ALL NEW CONTENT MUST BE APPENDED BELOW THE PROTECTIVE COMMENT LINE.**
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

When batch-enhancing these documents, follow these guidelines:

1. **No Wall-of-Text / No Generic Fluff:**
   - Eliminate repetitive boilerplates ("serves as a foundational component within... At an architectural level, it abstracts underlying complexity...").
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

## 📐 Standard Enhanced Layout Structure (When Appending)

When appending enhanced content below the protective comment, adhere to this structure:

```markdown
> **[PRESERVED ORIGINAL CORE DEFINITION]**

<!-- CRITICAL: Do not remove the line above during any updates to this file. Any AI, automated tool, or batch script updating this file must preserve the opening definition intact. -->

---

## 1. Architectural Overview & Mental Model
A concise, high-signal paragraph (3-5 sentences) detailing the architectural purpose, system boundaries, and design trade-offs.

## 2. Execution Mechanics & Runtime Flow
- **Initialization & Configuration:** How the component boots, binds state, or pre-allocates resources.
- **Runtime Execution:** Step-by-step thread execution, concurrency boundaries, and data transformations.
- **State & Lifecycle:** Lifecycle states, cleanup, and graceful degradation.

```java
// Crisp, realistic production-ready code snippet (8-12 lines max)
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
