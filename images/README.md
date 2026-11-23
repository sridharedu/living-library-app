# 🎨 Technology Living Library — Architecture & Visual Diagram Repository

This repository (`edu_images`) hosts all **1,992 technical architecture diagrams, flowcharts, and visual mental models** for the **Ultimate Technology Living Library**.

---

## 🚨 CRITICAL RULE: NEVER CHANGE ANY FILE NAME

> [!CAUTION]
> ### STRICT INVARIANT: DO NOT RENAME FILES
> - **Every single image in this repository is directly mapped** by exact filename in `index.html` and `data/image_manifest.json` following the pattern:  
>   `images/<section>__<group>__<topic>.png`
> - **DO NOT change, rename, or prefix any file name.**
> - **DO NOT create new file names.**
> - **ONLY replace the existing file in-place** while preserving its exact original filename and `.png` extension.

---

## 🎯 Primary Goal & Objective

Every placeholder image (`placeholder.png` / identical 27KB template) must be converted into an **actual, high-impact, minimalist architecture visual or flowchart**.

### Core Visual Principles:
1. **Minimalist Presentation Visuals**: Designed like clean keynote conference slides. Generous negative space, uncluttered, and easy to grasp at a glance.
2. **Minimal Text (No Dense Paragraphs)**:
   - **STRICTLY NO wall-of-text, long explanations, or code snippets.**
   - Include only **3 to 6 concise component labels** (e.g., `Producer`, `Topic`, `Partition 0`, `Consumer Group`, `CLOSED`, `OPEN`).
   - Let the visual diagram, flowchart arrows, and topology explain the concept.
3. **Sketchnote Aesthetic**:
   - Hand-drawn graphic recording feel with organic chalk strokes and visual metaphors (queues, nodes, memory segments, cylinders, buckets, pipelines).
4. **Seamless Edge-to-Edge Canvas (NO FRAMES / NO BORDERS)**:
   - Deep slate chalkboard canvas texture (`#0F172A` / `#1E293B`) extending seamlessly edge-to-edge.
   - **STRICTLY ZERO outer frames, zero wooden board edges, zero perimeter borders, and zero bounding boxes.**
5. **Color Palette & Accents**:
   - Dark charcoal/slate background with chalk-white outlines.
   - 2–3 vibrant chalk accent colors: **Soft Cyan (`#38BDF8`)**, **Warm Ochre (`#F59E0B`)**, and **Soft Coral / Mint**.
6. **Aspect Ratio**:
   - **16:9 widescreen layout** (1920×1080 or 1280×720) perfectly framing the Living Library preview stage.

---

## 🏆 Benchmark Standards (Already Completed Examples)

Use these 10 completed diagrams as the exact visual reference benchmark:

| # | Topic | File Name (Exact) | Visual Structure |
| :--- | :--- | :--- | :--- |
| 1 | **Kafka Topic & Partitions** | `apache_kafka__kafka_fundamentals__topic.png` | Producer ➔ Topic split into Partition 0, 1, 2 ➔ Consumer Group |
| 2 | **Kafka Architecture** | `apache_kafka__kafka_fundamentals__kafka_architecture.png` | Producers ➔ Cluster with Brokers 1, 2, 3 & Partitions ➔ Consumer Groups |
| 3 | **Kafka Broker Internals** | `apache_kafka__kafka_fundamentals__broker.png` | Network Threads ➔ I/O Queue ➔ Partition Commit Log on Disk ➔ Consumer Fetch |
| 4 | **Kafka Partition (Log)** | `apache_kafka__kafka_fundamentals__partition.png` | Horizontal append-only cells [0..5], Append New Event arrow, Consumer read head |
| 5 | **Kafka Offset Tracking** | `apache_kafka__kafka_fundamentals__offset.png` | Committed Offset (5) vs Current Position (7) vs LEO (10), bracketed Consumer Lag |
| 6 | **Kafka Producer Client** | `apache_kafka__kafka_fundamentals__producer.png` | Event ➔ Serializer ➔ Partitioner ➔ Record Accumulator (Batching) ➔ Sender |
| 7 | **Circuit Breaker Pattern** | `microservices__resilience__circuit_breaker.png` | 3 state nodes: CLOSED (Mint), OPEN (Coral), HALF-OPEN (Ochre) with transition arrows |
| 8 | **Token Bucket Rate Limiting**| `api_design__api_reliability__token_bucket.png` | Refill rate drops tokens into bucket; requests take tokens ➔ Allowed (200) vs Dropped (429) |
| 9 | **Kubernetes Pod Lifecycle** | `containers_and_orchestration__original_outline__pod_lifecycle.png` | Pending ➔ Running ➔ Succeeded (Exit 0) / Failed (CrashLoopBackOff retry loop) |
| 10 | **JVM Heap Architecture** | `jvm__runtime_architecture__heap.png` | Horizontal split: Young Gen (Eden, S0, S1 with Minor GC) ➔ Old Gen (Tenured with Full GC) |

---

## 🤖 Standard AI Prompt Formula (For Batch Generation)

When generating replacement visuals with an AI image model or design tool, use this standard prompt formula:

```text
Full-bleed widescreen 16:9 presentation slide sketchnote architecture diagram of [TOPIC_NAME], drawn with soft colored chalk on a dark slate chalkboard background that extends completely seamlessly to all four edges.
- Framing: STRICTLY BORDERLESS, FRAMELESS, NO WOODEN BOARD EDGE, NO MARGIN, NO PERIMETER LINE, NO BOUNDING BORDER.
- Aesthetic: Minimalist visual thinking infographic / tech conference slide aesthetic. Hand-drawn organic chalk lines with subtle chalk dust texture.
- Visual Composition: [DESCRIBE MINIMALIST FLOWCHART / COMPONENT DIAGRAM, e.g. Left-to-right flow: Component A connects via organic arrows to Component B].
- Text Constraints: Minimal text labels only (strictly 3 to 6 words maximum across the entire diagram, e.g. "Label 1", "Label 2"). NO PARAGRAPHS, NO DENSE CODE, NO WALL OF TEXT.
- Palette: Dark charcoal slate background (#0F172A), chalk white outlines, soft cyan (#38BDF8) primary accents, warm ochre (#F59E0B) highlights.
- Quality: Clean, uncluttered, highly legible presentation graphic.
```

---

## 🔍 Verification & Audit

To verify which images have been replaced versus remaining default placeholders, check the file size:
* **Default Placeholder:** Exactly `27,284 bytes` (size of original `placeholder.png`).
* **Replaced Custom Visual:** Any file with size different from `27,284 bytes` (typically 300KB–800KB).

```powershell
# Quick count of replaced vs remaining placeholders:
$placeholderSize = 27284
$files = Get-ChildItem -Filter "*.png"
$replaced = ($files | Where-Object { $_.Length -ne $placeholderSize }).Count
$remaining = ($files | Where-Object { $_.Length -eq $placeholderSize }).Count
Write-Host "Replaced Custom Visuals: $replaced"
Write-Host "Remaining Placeholders:  $remaining"
```
