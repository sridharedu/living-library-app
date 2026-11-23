# Ultimate Technology Living Library — Architecture & Visual Reference

An interactive, high-performance visual reference knowledge base of **1,992 technology topics** across Java, Spring, Microservices, Cloud, Kafka, Kubernetes, Databases, Distributed Systems, and System Design.

Each topic renders both:
1. **Reference Diagram (.png) Preview Stage**: A dedicated 16:9 chalkboard architecture diagram with full-screen Lightbox zoom, 1-click filename copy, and instant drag-and-drop image replacement.
2. **Notepad / Notion-Style Markdown Document (.md) Preview Stage**: A structured Markdown document rendered with rich typography (headings, code blocks, bullet points, blockquotes, tables), with 1-click `📥 Export .md` and inline `✎ Edit Markdown`.

---

## 📁 Project Directory Structure

```text
living-library/
├── index.html                   # Interactive Living Library web application (V.004+)
├── images/                      # All 1,992 mapped reference diagrams & placeholders
│   ├── placeholder.svg          # Vector blueprint placeholder template
│   ├── placeholder.png          # High-resolution raster chalkboard template
│   └── <section>__<group>__<topic>.png  # Fully qualified mapped diagram files
├── docs/                        # All 1,992 individual Markdown files (.md)
│   └── <section>__<group>__<topic>.md   # Notion-compatible Markdown source files
├── data/
│   ├── image_manifest.json      # Structured manifest of all topics and mapped images
│   └── image_manifest.csv       # Spreadsheet format (Excel / Google Sheets compatible)
├── scripts/
│   ├── build.ps1                # Compiles docs/*.md into index.html
│   ├── verify_images.ps1        # Progress audit: counts placeholders vs. custom diagrams
│   └── generate_placeholders.ps1# Regenerates any missing placeholder files
└── README.md                    # Project documentation & workflows
```

---

## 🚀 Unified Window Preview

When you select any topic, both preview stages are rendered together in the same window:

```text
┌─────────────────────────────────────────────────────────────┐
│ 📐 REFERENCE DIAGRAM (.PNG)       [📁 Replace] [📋 Copy]    │
│ ┌─────────────────────────────────────────────────────────┐ │
│ │                                                         │ │
│ │             Chalkboard Architecture Diagram             │ │
│ │              (Click to Zoom / Lightbox)                 │ │
│ │                                                         │ │
│ └─────────────────────────────────────────────────────────┘ │
│ File: apache_kafka__kafka_fundamentals__topic.png           │
├─────────────────────────────────────────────────────────────┤
│ 📝 MARKDOWN DOCUMENT (.MD)     [📥 Export .md] [✎ Edit]     │
│ ┌─────────────────────────────────────────────────────────┐ │
│ │ ## 1. Architectural Overview & Mental Model             │ │
│ │ Details core purpose, distributed system trade-offs...   │ │
│ │                                                         │ │
│ │ ## 2. Execution Mechanics & Runtime Flow                │ │
│ │ - Threading model & concurrency                         │ │
│ │ - Lifecycle transitions & state machines                │ │
│ │                                                         │ │
│ │ ## 3. Production Best Practices & Failure Modes         │ │
│ │ - Throughput & p99 latency optimization                 │ │
│ └─────────────────────────────────────────────────────────┘ │
└─────────────────────────────────────────────────────────────┘
```

---

## 🖼️ Instant Image Replacement ("Delete Old, Replace with New")

To replace any diagram with your own custom image (with whatever filename you choose):
- **Method 1: Drag and Drop**
  Drag any image file (`.png`, `.jpg`, `.svg`, `.webp`) from your computer and drop it directly onto the diagram frame.
- **Method 2: File Picker**
  Click the `📁 Replace Image` button in the diagram header to select a file from your computer.

**What happens automatically**:
- Whatever was there before is removed and replaced by your new image.
- The diagram card updates immediately to show your new image and displays its actual file name (e.g., `✅ Custom Image (cluster_diagram.png)`).
- The image data is embedded and persists permanently across browser sessions and downloaded HTML files.
- To revert to the default placeholder at any time, simply click `✕ Remove`.

---

## 📝 Markdown Document Workflows

### In-App Editing (Notion-like Experience)
1. Click `✎ Edit Markdown` (or `✎ Edit` in the top toolbar).
2. Edit the raw Markdown directly (`## Heading`, `- list`, `` `code` ``).
3. Click `💾 Save`. The Markdown parser instantly converts it to rich HTML and re-renders both the diagram and the Markdown preview together.
4. Click `📥 Export .md` to download the topic as an individual `.md` file anytime.

### External Editing with Build Script (Path 2)
1. Edit any `.md` file inside `docs/*.md` using your favorite Markdown editor (VS Code, Obsidian, Typora, Notion export).
2. Run the build script:
   ```powershell
   powershell -ExecutionPolicy Bypass -File scripts\build.ps1
   ```
3. The build script scans all modified `.md` files, compiles them into `index.html`, bumps the version tag, and recalculates snapshot hashes for instant loading.

---

## 💾 Download & Persistence Guarantee

- When you edit text, add/rename topics, or replace images, click **Download (⇩)** in the menu.
- The app exports a standalone HTML file containing all your latest Markdown text and embedded custom images.
- Replace `index.html` with the downloaded file. Opening it loads your updated content immediately without any stale cache interference.
