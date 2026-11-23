# 📝 Technology Living Library — Markdown Documentation Batch Guidelines

This directory contains all **1,992 technical reference documents** for the **Ultimate Technology Living Library**.

To ensure seamless performance on GitHub (preventing GitHub's 1,000-file directory truncation limit) and across operating systems, all documents are organized into **part subfolders of up to 500 files each**:

- 📂 `docs/part-01/` — Topics 0001–0500 (500 files)
- 📂 `docs/part-02/` — Topics 0501–1000 (500 files)
- 📂 `docs/part-03/` — Topics 1001–1500 (500 files)
- 📂 `docs/part-04/` — Topics 1501–1992 (492 files)

---

## 🚨 RULE 1: MANDATORY RETENTION OF THE OPENING CORE DEFINITION

> [!IMPORTANT]
> ### 🔒 DO NOT REMOVE THE OPENING DEFINITION
> - **The first blockquote line `> **<definition>**` MUST remain intact at line 1 of every `.md` file.**
> - **DO NOT delete, overwrite, or rephrase it.**
> - The faint `<sub>*Note: ...*</sub>` line indicates that this note can be replaced with full content during file updates.
> - Whenever any AI model, batch processing tool, or human editor enhances or updates a topic, **the definition must be preserved, and rich technical content should be provided.**
>
> **Where to find all 1,992 original definitions:**  
> `C:\Users\sridh\AppData\Local\Programs\antigravity\living-library\src\app.js.extracted`  
> *(Extracted JSON dataset containing every topic's original definition).*

---

## 🚨 RULE 2: NEVER CHANGE ANY BASE FILE NAME

> [!CAUTION]
> ### STRICT INVARIANT: DO NOT RENAME BASE FILES
> - Every file name strictly matches its counterpart diagram and application mapping:  
>   `docs/part-XX/<section>__<group>__<topic>.md` ➔ `images/part-XX/<section>__<group>__<topic>.png`
> - **DO NOT rename, move outside its part, or change extensions.**
> - **ONLY perform in-place content updates within each part folder.**

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

## 📐 Standard Enhanced Layout Structure (When Updating)

When replacing the placeholder note with enhanced content, adhere to this structure:

```markdown
> **[PRESERVED ORIGINAL CORE DEFINITION]**

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

`images/part-XX/<section>__<group>__<topic>.png`
```
