# App Behavior (Current State)

This document describes what the app does today, based on the current code and existing docs. It is intentionally candid so you can make a major update without missing hidden behavior.

## What the app is for

The app is a full‑stack web UI for modeling “systems” composed of **devices (nodes)** and **connections (edges)**. A system can have multiple versions. You can upload SysML/CSV data, visualize it as a graph, and export back to SysML.

## Core concepts in practice

- **System**: a named model owned by a user, with a version number.
- **Device**: a node in the graph with many asset-related fields (manufacturer, model, etc.) plus `Xposition`/`Yposition`.
- **Connection**: an edge between two devices with optional metadata.
- **Versioning**: devices and connections are tied to both a system and a specific version.

## What users can do (current UI)

- **Sign up / sign in** with JWT auth.
- **Upload** a SysML (and sometimes CSV/Excel) file to create a system + version.
- **View graph** of a system/version in a React Flow UI.
- **Edit graph** positions and relationships, then **save**.
- **Download** a SysML export of a system version.
- **Run Ethernet simulation** from YAML/JSON configs (flow-level).

## What the backend actually does

- **Upload endpoint** creates a system and parses uploaded files.
  - SysML parsing extracts devices and connections.
  - Many device fields are stored but not necessarily used in the UI.
  - Uploaded files are stored on disk (Docker volume in our setup).
- **Graph endpoints** return devices and connections for a system/version.
  - Nodes are rendered based on stored positions.
  - If positions are missing, the frontend lays them out arbitrarily.
- **Save graph endpoint** updates device positions and connection details.
- **Export endpoint** writes a simple SysML file from devices.

## Current behavior that may feel “arbitrary”

- **Rendering** is primarily a visualization of stored device/connection data, not a simulation.
- **Layout** can appear arbitrary because:
  - positions are often missing from uploaded data
  - the frontend uses a layout fallback when positions are absent
- **Animations** are UI-level (React + Framer Motion), not tied to system logic.

## Important nuances (easy to miss)

- **Data model is asset‑heavy**: many fields are stored but not surfaced in the UI.
- **Connections are explicit**: edges only appear if parsed or created, not inferred.
- **Versioning is first‑class**: every device/connection is tied to a system version.
- **Export is lossy**: the SysML writer uses a subset of fields and a simple format.

## Where to look for behavior

- Backend API + parsing: `Services/rest/views.py`, `Services/rest/sysml_writer.py`
- Models: `Services/rest/models.py`
- Graph UI: `Views/src/graph_page/GraphPage.jsx`
- Upload UI: `Views/src/UploadPage.jsx`

## Short summary

Today the app is a **data‑driven graph viewer/editor** for system models. It does not simulate behavior; it stores asset metadata, visualizes nodes/edges, and provides import/export. If you plan a major functional update, the most impactful area is how systems are created, interpreted, and rendered, rather than how they are animated.

The new Ethernet simulation path introduces flow‑level modeling and is documented in `docs/ETHERNET_SIMULATION.md`.
