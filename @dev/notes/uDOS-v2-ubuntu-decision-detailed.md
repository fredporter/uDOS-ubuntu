uDOS-ubuntu

uDOS v2 — Base OS Distribution & Boot System

⸻

Purpose

uDOS-ubuntu defines the canonical base operating system layer for uDOS v2 deployments.

It provides:
	•	a minimal, reproducible Ubuntu 22 LTS base image
	•	preconfigured uDOS runtime compatibility
	•	integrated Proton software suite
	•	optional secure networking (Proton VPN)
	•	custom uDOS visual identity (boot + GUI skin)
	•	full compatibility with sonic-screwdriver deployment workflows

This repo is not a fork of Ubuntu.

It is:

a curated, reproducible system image definition for uDOS environments

⸻

Core Principles

1. Minimal, Stable, Reproducible
	•	Based on Ubuntu 22.04 LTS (minimal)
	•	No unnecessary packages
	•	Deterministic build process (scriptable image generation)

⸻

2. uDOS is Layered, Not Embedded
	•	uDOS is not baked into the OS
	•	uDOS-core, shell, and extensions install on top
	•	OS remains replaceable

⸻

3. Sonic-Screwdriver First-Class Target
	•	Primary install path is via sonic-stick (USB boot device)
	•	Must support:
	•	Live boot (run from USB)
	•	Full install to disk
	•	Recovery/reinstall workflows

⸻

4. Privacy + Sovereignty by Default
	•	Proton suite included for:
	•	mail
	•	docs
	•	identity
	•	Optional:
	•	Proton VPN
	•	encrypted storage layers

⸻

5. Visual Identity Matters
	•	uDOS should feel distinct at OS level
	•	Blend:
	•	classic Mac (System 7 style)
	•	modern macOS polish (ThemeKit)

⸻

Repo Responsibilities

Owns:
	•	Ubuntu base image definition
	•	Package selection + system config
	•	Proton integration layer
	•	Bootloader branding (uDOS bootstrap)
	•	Desktop environment + theming
	•	Compatibility layer for uDOS-core install
	•	Sonic-screwdriver install hooks

⸻

High-Level Architecture

uDOS-ubuntu
├── build/
│   ├── iso/
│   ├── rootfs/
│   └── scripts/
│
├── config/
│   ├── packages.list
│   ├── system/
│   ├── users/
│   └── services/
│
├── proton/
│   ├── install.sh
│   ├── config/
│   └── optional/
│       └── vpn/
│
├── theming/
│   ├── themekit/
│   ├── system7/
│   ├── gtk/
│   ├── icons/
│   └── fonts/
│
├── boot/
│   ├── grub/
│   ├── plymouth/
│   └── sonic-menu/
│
├── sonic-hooks/
│   ├── preinstall.sh
│   ├── postinstall.sh
│   └── live-env.sh
│
└── docs/


⸻

Base System Specification

OS
	•	Ubuntu 22.04 LTS (minimal)
	•	Kernel: LTS generic (with optional hardware enablement)

⸻

Desktop Environment

Recommended:
	•	XFCE or LXDE (lightweight, themeable)

Reason:
	•	Fast on low-end machines
	•	Fully themeable for Mac/System7 hybrid UI
	•	Stable

⸻

Drivers

Include:
	•	Common GPU drivers (mesa, optional NVIDIA installer)
	•	WiFi + Bluetooth essentials
	•	Input device support (gamepad-ready for uHOME crossover)

⸻

Proton Integration

Core Suite

Preinstall or first-boot install:
	•	Proton Mail (web app or bridge)
	•	Proton Drive
	•	Proton Docs (via web/PWA model)
	•	Proton Pass (optional)

⸻

Optional (Wizard-enabled or user opt-in)
	•	Proton VPN
	•	Proton Mail Bridge (for desktop clients)

⸻

Integration Approach
	•	Use PWA-style wrappers OR native bridge where required
	•	Store credentials in:
	•	user vault (uDOS layer)
	•	or OS keychain fallback

⸻

Sonic-Screwdriver Integration

Role

sonic-screwdriver must be able to:
	1.	Download latest uDOS-ubuntu build
	2.	Prepare USB (sonic-stick)
	3.	Install boot system
	4.	Inject config (user/device specific)
	5.	Enable live + install modes

⸻

Sonic-Stick Capabilities
	•	Boot menu (like Ventoy, but uDOS styled)
	•	Multiple modes:
	•	Live OS
	•	Install OS
	•	Recovery tools

⸻

Boot Menu UI

TUI-based, styled as:
	•	uDOS terminal aesthetic
	•	selectable entries
	•	keyboard/gamepad navigation

⸻

USB Formatting + Partitioning (Important)

You’re correct — this is the constraint.

Required Layout for Universal Boot

Best practice:

USB (GPT partition table)
├── Partition 1: FAT32 (EFI boot)
├── Partition 2: exFAT or ext4 (ISO / persistence)


⸻

Why FAT32?
	•	Required for UEFI boot compatibility
	•	Works across:
	•	Linux
	•	Windows
	•	macOS (read/write)

⸻

Why Not Only FAT32?
	•	FAT32 file size limit = 4GB
	•	Ubuntu ISOs can approach/exceed this

⸻

Recommended Strategy

Use Ventoy-style approach:
	•	Small FAT32 EFI partition
	•	Larger exFAT partition for ISOs

⸻

macOS Limitation (You’re Right)

macOS:
	•	Cannot easily create multi-partition bootable USBs in the same flexible way
	•	Disk Utility is restrictive

⸻

Solutions

Option A — Linux Only (Current)
	•	Keep sonic-screwdriver Linux-native

Option B — Preformatted Stick (Recommended)
	•	Provide:
	•	downloadable image OR
	•	one-time Linux prep script

Then macOS users can:
	•	reuse the stick
	•	update ISOs only

⸻

Option C — macOS Support (Advanced)
Use:
	•	diskutil + gpt CLI
	•	Still limited, but possible with scripting

👉 Recommendation:

Support macOS only for updating, not initial formatting

⸻

Boot Experience (uDOS Identity Layer)

1. GRUB Theme
	•	Custom uDOS theme
	•	Minimal + retro hybrid aesthetic

⸻

2. Plymouth Boot Screen

Custom splash:
	•	uDOS logo
	•	subtle animation
	•	“booting binder layer…” style messaging

⸻

3. Sonic Boot Menu

Before OS loads:
	•	uDOS-styled TUI selector
	•	resembles:
	•	terminal OS
	•	retro system menu

⸻

GUI Theming System

Design Direction

Blend:

Modern Mac Style
	•	via ThemeKit
	•	soft gradients, spacing, typography

System 7 Retro Layer
	•	sharp edges
	•	pixel icons
	•	grayscale UI option

⸻

Implementation
	•	GTK theme overrides
	•	icon packs
	•	font system (uDOS font layer compatible)
	•	window manager styling

⸻

Theme Modes
	•	udos-modern
	•	udos-retro
	•	udos-minimal

Switchable via:
	•	CLI
	•	settings panel (future)

⸻

uDOS Bootstrap Layer

On first boot:
	1.	Show uDOS welcome screen
	2.	Run:
	•	user setup
	•	network detection
	•	optional Proton login
	3.	Offer:
	•	install uDOS-core
	•	connect to Wizard
	•	configure Vault

⸻

Relationship to Other Repos

uDOS-core
	•	installs on top of this OS
	•	uses OS only for execution layer

⸻

uDOS-shell
	•	primary interface after bootstrap

⸻

uHOME
	•	can run as:
	•	server on this OS
	•	or client connecting to external server

⸻

sonic-screwdriver
	•	primary installer + distributor

⸻

Non-Goals
	•	Not a general-purpose Linux distro
	•	Not a fork of Ubuntu ecosystem
	•	Not a GUI-first OS
	•	Not tied permanently to Ubuntu (future replaceable)

⸻

Future Extensions
	•	ARM builds (Raspberry Pi / edge devices)
	•	Immutable OS mode (read-only system)
	•	Encrypted-by-default installs
	•	Multi-user uDOS environments
	•	Offline-first bundle mode

⸻

Summary

uDOS-ubuntu is the foundation layer.

It provides:
	•	a clean, reproducible OS
	•	a privacy-respecting software base
	•	a branded uDOS experience from boot to desktop
	•	seamless deployment via sonic-screwdriver

Without:
	•	locking uDOS into a specific OS long-term

uDOS-ubuntu Decision Doc

Browser-Based Binder Workstation for Ubuntu + Proton

Status

Decision proposal for uDOS v2

⸻

Decision

uDOS-ubuntu will provide the same functional role as omd-mac-osx-app, but on Ubuntu as a browser-based local GUI environment rather than a packaged native app.

It will:
	•	run on uDOS-ubuntu as a local-first browser UI and service stack
	•	use Proton as the primary personal sync and convenience ecosystem
	•	keep the vault-first, markdown-first, binder-native model unchanged
	•	rely on uHOME-empire for any Google, HubSpot, CRM, or other external always-on provider syncing
	•	preserve the same canonical normalization, workflow, compile, publishing, scheduling, and projection principles defined for the Mac app

This is not a Linux clone of the Mac app UI shell.

It is:

the Ubuntu/browser implementation of the same binder operating engine

⸻

Product Position

uDOS-ubuntu is:
	•	a local binder-native workflow engine
	•	a browser-based GUI environment running on Ubuntu
	•	a local ingestion, normalization, and compile station
	•	a projection/control-plane environment for Proton-facing convenience surfaces
	•	a local scheduling and bounded automation station
	•	a canonical vault operator that can also receive structured updates from uHOME-empire

It is not:
	•	a packaged desktop app in the macOS sense
	•	a full email client
	•	a full office suite
	•	a replacement for Proton services
	•	a replacement for uHOME-empire
	•	a second hidden runtime diverging from core uDOS workflow semantics

⸻

Why This Decision

The Mac app specification already defines the right functional contract for a local binder operating engine.

For Ubuntu, the major change is not the workflow model.

The change is the host surface:
	•	macOS version → packaged local app with Apple-native integrations
	•	Ubuntu version → browser-based local GUI environment with Proton-facing integrations and Linux-native file/runtime services

This keeps the product consistent across platforms while respecting what each environment is actually good at.

⸻

Core Decision Statement

Keep

Keep the Mac app’s core decisions:
	•	vault-first truth
	•	markdown-first records
	•	file-backed workflow truth
	•	normalize once
	•	compile before publish
	•	bounded automation
	•	canonical local contact and binder databases
	•	outward projection as convenience, not truth

Replace

Replace Apple-specific integrations with:
	•	Proton-facing import/projection surfaces where appropriate
	•	browser/PWA-style service integration where native Linux equivalents are weak or unnecessary
	•	local Linux services for files, watchers, scheduling, indexing, and runtime

Delegate

Delegate all always-on external provider sync such as:
	•	Google
	•	HubSpot
	•	CRM
	•	external contact sync at scale
	•	external background retries and webhook handling

to:
	•	uHOME-empire

⸻

Final Position

uDOS-ubuntu is the Ubuntu implementation of the OMD local binder workstation, delivered as a browser-based GUI environment on top of a local service/runtime stack, with Proton as the primary personal sync surface and uHOME-empire as the always-on external sync layer.

⸻

Functional Equivalence to omd-mac-osx-app

uDOS-ubuntu should provide the same functional capability set as the Mac app across these areas:
	•	capture and ingestion
	•	canonical normalization
	•	vault storage + runtime index
	•	binder/task/contact/event/message workflows
	•	compile and publishing
	•	scheduling and bounded automation
	•	contact and communication intelligence
	•	control-plane visibility
	•	MCP-safe operator surfaces

The platform-specific difference is integration surface and delivery model, not semantics.

⸻

Delivery Model

macOS
	•	packaged application
	•	native Apple integrations
	•	app lifecycle controlled by the OS app model

Ubuntu
	•	browser-based GUI
	•	local web app served from the machine
	•	local daemon/service stack for watchers, jobs, imports, compile, and runtime index
	•	can be opened in:
	•	local browser
	•	kiosk-style window
	•	thin GUI shell if desired later

⸻

Ubuntu Product Shape

uDOS-ubuntu should be delivered as three cooperating layers:

1. Base OS layer

Provided by uDOS-ubuntu install image:
	•	Ubuntu 22 minimal base
	•	drivers
	•	browser runtime
	•	system services
	•	Proton-facing setup surfaces
	•	uDOS theming/bootstrap

2. Local service/runtime layer

Runs as local services:
	•	vault manager
	•	runtime index
	•	import/normalize pipeline
	•	workflow/scheduler engine
	•	compile/render pipeline
	•	local APIs
	•	job queues
	•	logs and control state

3. Browser GUI layer

Runs in browser:
	•	workspace shell
	•	control plane
	•	processing centre
	•	review centre
	•	logs
	•	binder/task/contact/event/message views
	•	publishing and compile UI

⸻

Proton-Centred Ecosystem Focus

uDOS-ubuntu intentionally focuses on:
	•	Proton Mail
	•	Proton Calendar
	•	Proton Drive
	•	Proton Docs
	•	Proton VPN
	•	local files
	•	browser-based knowledge and publishing tools
	•	Obsidian as a companion editor if desired
	•	GitHub/GitHub Pages for publishing

It intentionally does not try to recreate:
	•	a full native desktop office suite
	•	a full mail client
	•	a full cloud drive UI
	•	a CRM platform

⸻

Relationship With Proton

Proton is the Ubuntu-side convenience and ecosystem surface in the same way Apple was for the Mac app.

Proton role

Proton is used for:
	•	personal email surface
	•	calendar surface
	•	drive/docs convenience
	•	optional security surface via Proton VPN
	•	personal identity/account layer

Canonical rule

Proton is not the canonical record store.

Preferred pattern:
	•	acquire from Proton-facing surfaces where possible
	•	normalize into canonical vault records
	•	assign binder metadata and routing
	•	optionally project outward to Proton-facing surfaces when useful

This mirrors the Apple model, but with Proton instead of Apple.

⸻

Relationship With uHOME-empire

This remains unchanged in principle.

uHOME-empire responsibilities
	•	Google sync
	•	HubSpot sync
	•	CRM sync
	•	retries
	•	webhooks
	•	batch association maintenance
	•	cross-provider always-on sync
	•	external contact/company/deal sync
	•	provider-side background processing

uDOS-ubuntu responsibilities
	•	local workflow capture
	•	local canonical binder truth
	•	operator review and routing
	•	personal/local Proton-facing convenience
	•	local compile/publish/workflow/scheduling
	•	display of empire-fed structured updates
	•	handoff and visibility, not external provider ownership

⸻

Core Principles

1. Vault-first truth

Human-readable records live in the vault.

2. Markdown-first records

Tasks, docs, notes, contacts, events, messages, and artifacts remain markdown-first where practical.

3. File-backed workflow truth

Workflow state stays readable and compatible with the wider uDOS workflow manager contract.

4. Normalize once

All imports pass through one canonical normalization pipeline before becoming active state.

5. Project outward selectively

Proton and browser-facing surfaces are convenience layers, not truth owners.

6. Compile before publish

Binders compile into canonical artifacts first, then render into downstream outputs.

7. Do not rebuild what already exists

Use Proton, GitHub Pages, Obsidian, browser tools, and uHOME-empire where they are already the better surface.

⸻

Canonical Storage Model

This remains the same as the Mac app model.

Layer A: Vault records

Store durable human-readable records in the vault:
	•	markdown files
	•	frontmatter metadata
	•	attachments/assets
	•	binder folders
	•	compile artifacts
	•	workspace folders

Layer B: Runtime index

Store runtime optimization data locally:
	•	SQLite database
	•	sync mappings
	•	job queue state
	•	dedupe fingerprints
	•	search indexes
	•	schedule metadata
	•	projection state
	•	processing logs

Rule

Vault files are durable truth. SQLite is runtime acceleration. They must not contradict each other.

⸻

Proposed Vault Shape

memory/vault/
├── @binders/
│   ├── tasks/
│   ├── contacts/
│   ├── events/
│   ├── messages/
│   ├── notes/
│   ├── outputs/
│   └── <binder-id>/
├── @capture/
│   ├── inbox/
│   ├── proton/
│   ├── notes/
│   ├── mail/
│   ├── files/
│   └── imports/
├── @public/
├── @private/
├── @shared/
├── @sandbox/
├── @assets/
├── @logs/
├── @system/
└── .compost/

@capture/proton/ becomes the Ubuntu/Proton equivalent convenience intake lane.

⸻

Canonical Record Types

Unchanged:
	•	binder_task
	•	binder_doc
	•	binder_note
	•	binder_contact
	•	binder_event
	•	binder_message
	•	binder_artifact
	•	binder_asset
	•	binder_workflow_run

Each record should retain:
	•	udos_id
	•	record_type
	•	title
	•	status where relevant
	•	binder assignment
	•	tags
	•	created_at
	•	updated_at
	•	source_system
	•	external_ids
	•	sync_state
	•	related_records
	•	asset references

⸻

Source System Changes

On Ubuntu, source systems change from Apple to Proton/browser/Linux equivalents.

Recommended source_system set:
	•	manual
	•	proton_mail
	•	proton_calendar
	•	proton_drive
	•	proton_docs
	•	empire_feed
	•	file_import
	•	browser_capture
	•	workflow
	•	local_watcher

⸻

Import and Normalization Pipeline

The pipeline remains the same:
	1.	Acquire
	2.	Classify
	3.	Extract
	4.	Normalize
	5.	Store
	6.	Route
	7.	Project

Ubuntu acquisition sources

Accept input from:
	•	Proton Mail surfaces or exported/imported message data
	•	Proton Calendar surfaces or ICS sources
	•	Proton Drive / Docs file sources
	•	local files
	•	drag/drop
	•	watch folders
	•	browser paste/import panel
	•	manual user input
	•	uHOME-empire-fed external structured updates

Rule

Even when Proton-originated, all imported content must become canonical vault records before entering workflow truth.

⸻

Capture Strategy

Quick capture sources

Support lightweight capture from:
	•	browser quick-capture panel
	•	drag-and-drop files
	•	paste/import panel
	•	watch folders
	•	local share/open-with style integrations where practical
	•	Proton-originating user workflows where supported
	•	uHOME-empire-fed updates

Notes capture role

There is no Apple Notes equivalent dependency here.

Preferred pattern:
	•	quick note in browser capture UI or external markdown editor
	•	ingest into canonical note/doc
	•	assign binder and metadata
	•	optionally link out to Proton-facing or external surfaces when useful

⸻

File Format Handling

Same rule as Mac app:

uDOS-ubuntu does not need to edit every format natively. It must ingest, normalize, preserve, and re-project reliably.

Supported input families
	•	markdown/text
	•	HTML/email
	•	PDF
	•	DOCX
	•	XLSX/CSV
	•	PPTX
	•	images
	•	audio/transcript
	•	ICS
	•	VCF
	•	archives/folders

Standard handling
	•	preserve original where fidelity matters
	•	produce canonical markdown derivative where possible
	•	index structured metadata in SQLite
	•	create asset bundles and backlinks

⸻

Workflow Manager Alignment

uDOS-ubuntu must not create a second workflow model.

It must use the standard workflow manager contract for:
	•	workflow lifecycle
	•	approvals
	•	escalation
	•	queue/schedule metadata
	•	artifact tracking
	•	task linkage
	•	run state

The browser UI exposes workflows; core workflow semantics remain shared with wider uDOS.

⸻

Task and Binder Model

Unchanged.

Tasks

Tasks are markdown-first and binder-native.

They may originate from:
	•	manual creation
	•	email capture
	•	calendar conversion
	•	imported files
	•	workflow actions
	•	automation rules
	•	empire-fed updates

Binders

Binders remain the durable grouped unit of work and output.

A binder may contain:
	•	tasks
	•	docs
	•	notes
	•	events
	•	contacts
	•	research material
	•	compile artifacts

⸻

Projection Model

All outward sync should follow explicit modes:
	•	import only
	•	export only
	•	bidirectional
	•	link only
	•	disabled

Ubuntu/Proton-facing targets
	•	Proton Mail-facing artifacts where appropriate
	•	Proton Calendar-facing exports where appropriate
	•	Proton Drive/Docs convenience outputs
	•	browser/web surfaces
	•	GitHub Pages/web publishing

Empire-managed targets
	•	Google
	•	HubSpot
	•	CRM
	•	other providers

These are handled by uHOME-empire, not by local uDOS-ubuntu ownership.

Projection rule

Outward systems are convenience surfaces for:
	•	notifications
	•	interoperability
	•	personal reach
	•	browser/mobile continuity
	•	provider visibility via empire

They must not silently redefine canonical binder state.

⸻

Contact Model

This should mirror the Mac app’s decision to keep canonical local contact ownership.

Local canonical contact database

uDOS-ubuntu owns:
	•	canonical user contact records
	•	canonical binder contact records
	•	local relationship notes
	•	local linking to messages, events, and binders

External sync

Proton-facing convenience may exist where useful, but:
	•	large-scale provider sync
	•	CRM sync
	•	Google/HubSpot sync

remain uHOME-empire responsibilities.

⸻

Email Intelligence Layer

On Ubuntu, the email intelligence layer should be workflow-centric and Proton-aware without trying to become a full mail client.

Purpose

Provide visibility, capture, and workflow conversion of communications while keeping Proton or other external mail surfaces as the reading/sending environment.

Contact email timeline

When viewing a binder_contact, the UI should show:
	•	recent email conversations
	•	linked threads
	•	tasks derived from emails
	•	notes/docs derived from those conversations

This should be powered by:
	•	imported mail metadata
	•	sender/recipient address matching
	•	message-id/thread grouping
	•	empire-fed mappings where available

Email capture actions

Supported actions:
	•	import selected message
	•	import thread
	•	convert to task
	•	convert to binder doc
	•	attach to existing binder
	•	attach to contact record

Captured messages become binder_message markdown records.

Workflow email tools

The browser UI should provide:
	•	quick archive markers for processed mail records
	•	bulk cleanup and routing rules
	•	domain-based processing
	•	binder routing rules
	•	local message classification

Rule

uDOS-ubuntu provides workflow intelligence over mail, not a replacement mail client.

⸻

Calendar and Event Model

Equivalent to the Mac app, but with Proton/browser/Linux surfaces.

Event sources
	•	Proton Calendar-related inputs where available
	•	ICS imports
	•	manual events
	•	empire-fed structured event updates
	•	workflow-generated events

Event role

Events normalize into binder_event records and can be linked to:
	•	contacts
	•	tasks
	•	docs
	•	binders
	•	workflow runs

⸻

Background Enrichment Engine

uDOS-ubuntu should behave as an always-on local processing station.

Responsibilities

When idle or scheduled, it may:
	•	enrich contact records
	•	link conversations to binders
	•	deduplicate contacts
	•	update relationships
	•	detect tasks in imported communications
	•	extract entities from documents
	•	collate related records

Safety boundaries

Background operations must:
	•	log all changes
	•	avoid destructive modifications
	•	respect approval states
	•	maintain audit trails

⸻

Control Plane

The Ubuntu browser GUI should expose the same core control-plane areas as the Mac app.

Vault
	•	vault path
	•	health
	•	index status
	•	storage warnings
	•	backup/compost status

Integrations

Per-source settings:
	•	Proton auth/config state where relevant
	•	enabled state
	•	sync mode
	•	target binder/workspace
	•	projection rules
	•	conflict policy
	•	last run
	•	test action

Empire

Dedicated visibility for:
	•	Google/HubSpot/CRM status as received from uHOME-empire
	•	last sync status
	•	mapped records
	•	handoff configuration
	•	failed jobs / review items

Routing

Rule editor for:
	•	source to binder routing
	•	domain-based routing
	•	project/client mapping
	•	publish routing
	•	CRM eligibility routing

Recipes

Saved workflow recipes such as:
	•	email to task
	•	document ingest
	•	meeting ingestion
	•	binder compile and publish
	•	contact enrichment review
	•	empire handoff review

Processing Centre

Queue visibility for:
	•	imports
	•	normalization jobs
	•	compile jobs
	•	publish jobs
	•	projection runs
	•	research/enrichment runs

Review Centre

Review of:
	•	conflicts
	•	duplicates
	•	schema mismatches
	•	failed jobs
	•	pending approvals
	•	unmapped fields

Logs

Readable logs for:
	•	import runs
	•	sync runs
	•	workflow runs
	•	compile runs
	•	projection actions
	•	automation runs

⸻

Automation and Always-On Operation

uDOS-ubuntu should be designed to stay running as a bounded local workstation.

It may run:
	•	scheduled imports
	•	workflow launches
	•	binder compiles
	•	projection jobs
	•	publishing jobs
	•	enrichment tasks
	•	cleanup/archival jobs

Boundaries

Automation must not:
	•	silently destroy data
	•	silently publish high-impact outputs
	•	silently push CRM/provider changes outside policy
	•	create opaque side effects without logs

Every automated action should leave:
	•	a log entry
	•	provenance/source references
	•	resulting record links
	•	approval state where relevant

⸻

Publishing and Externalization

This remains the same as the Mac app.

uDOS-ubuntu should run compile and downstream renderers.

Compile rule

Compile creates the canonical binder artifact.

Downstream outcomes
	•	publish
	•	submit
	•	persist
	•	execute

Renderer families
	•	web renderer
	•	email renderer
	•	PDF renderer
	•	EPUB renderer
	•	package/persistence renderer
	•	operational artifact renderer

Publishing scope

Support:
	•	web publishing workflows
	•	GitHub Pages deploys
	•	HTML email generation
	•	PDF print output
	•	EPUB generation
	•	future pod/personal publishing routes

⸻

Browser GUI Environment Decision

This is the largest Ubuntu-specific implementation decision.

Decision

The Ubuntu experience should be browser-first, not native desktop-first.

Why

Because it:
	•	matches the thin-GUI direction
	•	is easier to theme and iterate
	•	is more portable across Ubuntu deployments
	•	works well in desktop, kiosk, local network, and remote-controlled contexts
	•	keeps UI separate from core service/runtime logic

Implication

The browser UI is the primary operator surface, but the canonical runtime remains:
	•	file-backed
	•	local-service-backed
	•	vault-first

⸻

Relationship With Obsidian

Obsidian remains a first-class companion editor and knowledge surface.

Recommended split:
	•	Obsidian: rich markdown editing, graph, plugin ecosystem, manual writing
	•	browser GUI: operational workflow, capture, routing, review, control plane
	•	uDOS runtime: normalization, indexing, scheduling, compile/publish, workflow continuity

The Ubuntu implementation must never lock the user into opaque internal-only storage.

⸻

Technical Direction

Local runtime stack

Recommended local stack on Ubuntu:
	•	local service daemon(s)
	•	SQLite runtime DB
	•	filesystem watchers
	•	browser-served UI
	•	local API endpoints
	•	job/schedule workers
	•	asset storage
	•	compile/render pipeline

UI stack

Recommended:
	•	browser-based UI repo aligned with the uDOS thin-GUI/web direction
	•	same presentation-oriented TS/web strategy already emerging elsewhere in v2

Rule

The browser UI is presentation and control. Core workflow semantics remain in shared runtime contracts.

⸻

Ubuntu Module Direction

Equivalent grouping to the Mac app, but implementation language/runtime can differ.

Core
	•	VaultCore
	•	RecordSchema
	•	RuntimeIndex
	•	AssetStore
	•	MappingStore
	•	CompileManifest

Ingest
	•	FileImporter
	•	MailImporter
	•	ContactImporter
	•	CalendarImporter
	•	BrowserCaptureImporter
	•	PDFImporter
	•	SheetImporter
	•	DocImporter

Normalize
	•	ClassificationEngine
	•	MetadataExtractor
	•	MarkdownConverter
	•	TableConverter
	•	BinderRouter
	•	DuplicateResolver

Workflow
	•	WorkflowManagerBridge
	•	BinderService
	•	TaskService
	•	ContactService
	•	EventService
	•	RecipeRunner
	•	ScheduleEngine

Projectors
	•	ProtonProjectors
	•	PublishProjectors
	•	EmpireStatusSurfaces

UI
	•	WorkspaceShell
	•	ControlPlane
	•	ProcessingCenter
	•	ReviewCenter
	•	LogsView
	•	BrowserEditorHost

⸻

Recommended Target Tree

uDOS-ubuntu/
├── apps/
│   └── browser-gui/
├── services/
│   ├── vault/
│   ├── runtime-index/
│   ├── ingest/
│   ├── normalize/
│   ├── workflow/
│   ├── projectors/
│   ├── compile/
│   └── scheduler/
├── schemas/
├── renderers/
├── scripts/
├── configs/
├── docs/
└── resources/

This keeps Ubuntu aligned with the browser/service architecture rather than a monolithic packaged app.

⸻

Non-Goals

uDOS-ubuntu should not aim to:
	•	recreate a full office suite
	•	recreate a full Proton client stack
	•	act as a CRM platform
	•	own Google or HubSpot sync locally
	•	fork workflow semantics away from core uDOS
	•	hide everything in a proprietary database
	•	become a Linux-specific one-off divergence from the rest of v2

⸻

Acceptance Criteria

This decision is successful when uDOS-ubuntu can:
	•	create and verify a new vault automatically
	•	create/read canonical markdown + SQLite records consistently
	•	ingest file, message, note, contact, and event sources through one normalization pipeline
	•	show deterministic contact/message/binder linking
	•	compile a binder into a canonical artifact and render to at least HTML and PDF
	•	expose Proton-facing convenience flows without making Proton the source of truth
	•	show empire-fed Google/HubSpot/CRM state without owning those sync lanes
	•	rebuild runtime indexes from vault truth after deletion or corruption
	•	operate fully through a local browser GUI environment on Ubuntu

⸻

Final Product Statement

uDOS-ubuntu is the Ubuntu/browser implementation of the local uDOS binder workstation. It captures from Proton-facing surfaces, files, browser/manual inputs, and structured updates from uHOME-empire; normalizes everything into canonical binder records; stores durable truth in the vault with fast local indexes; runs scheduling, compile, publishing, and bounded automation locally; and projects selected records outward to Proton-facing and publishing surfaces without surrendering canonical workflow truth.

⸻

uDOS-ubuntu Addendum

Coordination, Non-Duplication, and Side-by-Side Runtime Behaviour

Status

Addendum for v2 decision layer

⸻

Purpose

This addendum defines how uDOS-ubuntu behaves when it exists alongside:
	•	omd-mac-osx-app on a user Mac
	•	uHOME on the same machine
	•	uHOME on another machine on the same local network
	•	optional Wizard networking and remote coordination

The goal is simple:

multiple uDOS-adjacent runtimes may coexist, but canonical work must not double-run, double-sync, or silently fork state

⸻

Core Rule

There is only ever:
	•	one canonical vault truth
	•	one canonical workflow/job truth per scope
	•	one active owner for any autonomous operation at a time

This means:
	•	two surfaces may read the same vault
	•	two surfaces may present the same tasks
	•	two runtimes may both be installed and available

But they must not both independently perform the same autonomous background work without coordination.

⸻

Decision Summary

1. uDOS-ubuntu and omd-mac-osx-app are peers, not mirrors

They are two operator surfaces over shared uDOS truth.

2. uDOS-ubuntu is the preferred always-on local automation host

If present and enabled, it should generally own:
	•	background jobs
	•	scheduled jobs
	•	vault scans
	•	enrichment passes
	•	compile watchers
	•	projection queues
	•	sync handoff queues

3. omd-mac-osx-app is the preferred on-demand user workstation

It should excel at:
	•	manual review
	•	local ingestion
	•	operator-driven workflows
	•	approvals
	•	editing
	•	compile/publish initiation
	•	ad hoc capture and projection

4. uHOME is a sibling service runtime, not a competing binder engine

uHOME may coexist on the same machine or network and provide:
	•	server functions
	•	local network services
	•	streaming and home services
	•	optional infrastructure, orchestration, and shared automation support

But it must not silently take ownership of binder truth unless explicitly configured to do so.

⸻

Part 1 — Preventing Double-Up Between uDOS-ubuntu and omd-mac-osx-app

Problem Statement

If the user has:
	•	uDOS-ubuntu always on
	•	omd-mac-osx-app opened on demand

and both can:
	•	scan the vault
	•	run schedules
	•	enrich records
	•	sync outward
	•	compile binders
	•	process imports

then the system risks:
	•	duplicate jobs
	•	duplicate imports
	•	duplicate compile outputs
	•	competing projections
	•	conflicting contact/message linking
	•	stale lock state
	•	user confusion over which machine “did the thing”

This must be prevented by design.

⸻

Decision: Role Separation by Mode

There are three valid coordination modes.

Mode A — Ubuntu-primary

Recommended default when uDOS-ubuntu is always on.

Ownership
uDOS-ubuntu owns:
	•	scheduler
	•	background enrichment
	•	autonomous vault sync ops
	•	periodic scans
	•	compile watchers
	•	projection queues
	•	empire handoff preparation
	•	MCP-safe autonomous routines

omd-mac-osx-app owns:
	•	manual capture
	•	manual edits
	•	operator review
	•	manual compile/publish triggers
	•	user-initiated local workflows

This is the preferred model.

⸻

Mode B — Mac-primary

Used when the user does not want Ubuntu to own automation.

Ownership
Mac app owns:
	•	scheduler
	•	local background jobs
	•	scans
	•	projection runs
	•	compile automation

uDOS-ubuntu becomes:
	•	browser/operator surface
	•	optional ingestion point
	•	passive vault reader
	•	local service environment with autonomy disabled

This is valid but not preferred for an always-on Ubuntu host.

⸻

Mode C — Split by lane

Used for advanced setups only.

Example:
	•	uDOS-ubuntu owns compile + enrichment
	•	Mac app owns Apple/desktop-origin capture workflows
	•	empire owns external provider sync
	•	uHOME owns home/server tasks

This is allowed only if ownership lanes are explicit and machine-readable.

⸻

Required Mechanism: Operation Ownership

Every autonomous operation class must declare an owner.

Recommended operation classes
	•	vault_scan
	•	capture_import
	•	normalize_queue
	•	contact_enrichment
	•	thread_linking
	•	binder_compile_watch
	•	publish_queue
	•	projection_queue
	•	schedule_dispatch
	•	empire_handoff_queue
	•	cleanup_archive
	•	research_enrichment

Each class must have one of:
	•	disabled
	•	ubuntu
	•	mac
	•	uhome
	•	empire
	•	manual_only

⸻

Required Mechanism: Lease-Based Job Ownership

Autonomous work must use leases, not assumptions.

Rule

Before any background worker runs a job type, it must acquire a lease.

A lease should include:
	•	job_class
	•	owner_runtime
	•	owner_host
	•	lease_started_at
	•	lease_expires_at
	•	heartbeat_at
	•	vault_id
	•	scope_ref if relevant

Behaviour
	•	if lease is valid, other runtimes must not run that class
	•	if lease expires, another eligible owner may claim it
	•	if machine sleeps/crashes, lease eventually clears
	•	no permanent “stuck owner” state

This avoids duplication without requiring constant direct connectivity.

⸻

Required Mechanism: Idempotent Jobs

Even with leases, every autonomous operation must be designed as idempotent where possible.

Examples:
	•	importing the same email twice should collapse into one canonical record
	•	contact enrichment should update the same record, not create a duplicate
	•	compile jobs should use content hashes/manifests to avoid duplicate outputs
	•	projection runs should compare sync state before pushing

Rule

Leases reduce double-run risk.
Idempotency prevents damage if a double-run still happens.

⸻

Required Mechanism: Runtime Identity

Each running surface must have a stable runtime identity.

Example fields:
	•	runtime_id
	•	runtime_type (ubuntu, mac, uhome, empire)
	•	device_id
	•	host_name
	•	vault_id

All logs, jobs, projections, and ownership claims must record this.

That makes it obvious:
	•	who imported something
	•	who compiled something
	•	who held the lease
	•	who last touched a queue

⸻

Vault Sync Ops Rule

Decision

Vault sync ops must not be treated as a free-for-all file watcher on every machine.

Instead, the system distinguishes between:
	•	vault file visibility
	•	vault mutation
	•	vault automation ownership

Two runtimes may both see the same vault, but only the active owner should perform autonomous mutation for a given operation class.

⸻

Recommended Default for Shared Ubuntu + Mac

When both exist:

Ubuntu default
	•	autonomous ops: enabled
	•	scheduler: enabled
	•	compile watcher: enabled
	•	enrichment: enabled
	•	projection queue: enabled where configured
	•	passive read/write UI: yes

Mac default
	•	autonomous ops: mostly disabled
	•	local review/editing: enabled
	•	manual imports: enabled
	•	manual compile/publish: enabled
	•	local queue visibility: enabled
	•	opportunistic indexing: allowed
	•	ownership of background lanes: no, unless explicitly reassigned

This gives the user the best result with least duplication.

⸻

Manual Actions Exception

Manual, operator-triggered actions are allowed from either surface, but they must still be safe.

Example

The user clicks “Compile Binder” on the Mac app while Ubuntu is always on.

Allowed outcome:
	•	Mac app runs a manual compile request
	•	compile result is logged as manual
	•	compile watcher on Ubuntu does not instantly re-run the same compile if manifest hash has not changed

So:
	•	manual actions are always allowed
	•	automatic re-trigger loops are not

⸻

Part 2 — uDOS-ubuntu Working Alongside uHOME

Core Relationship

uDOS-ubuntu and uHOME are siblings.

uDOS-ubuntu

Owns:
	•	binder-native workflow
	•	canonical local operator surface
	•	vault-centric personal workflow engine
	•	compile/publish/workflow control plane
	•	local autonomous binder operations

uHOME

Owns:
	•	home/server environment
	•	local network services
	•	kiosk/server delivery
	•	media/system services
	•	household/device-oriented orchestration
	•	optional infrastructure support for broader uDOS environments

They may run:
	•	side-by-side on one machine
	•	on separate machines on the same LAN
	•	in mixed always-on configurations

But they must still respect operation ownership.

⸻

Clean Side-by-Side Behaviour on Same Machine

When both run on the same machine, the clean model is:

uDOS-ubuntu
	•	personal/workflow runtime
	•	local browser GUI
	•	binder operations
	•	compile and publish operations
	•	vault normalization
	•	personal automation lanes

uHOME
	•	local service host
	•	streaming/server stack
	•	home network features
	•	kiosk/device delivery
	•	optional local infra helpers
	•	optional shared storage/export surfaces

Rule

They may share:
	•	machine
	•	storage
	•	network
	•	optional vault
	•	optional service bus

But they should not duplicate:
	•	binder schedulers
	•	queue runners
	•	vault scans
	•	projection queues

unless explicitly split by lane.

⸻

Separate Machines on Same Network

When uDOS-ubuntu and uHOME are on different machines but same LAN:
	•	uDOS-ubuntu can remain the canonical personal workflow host
	•	uHOME can act as:
	•	network service host
	•	local distribution point
	•	shared storage helper
	•	optional home automation/networking layer
	•	optional always-on support layer

This is often cleaner than same-machine coexistence.

⸻

Example Coordination Patterns

Example 1 — Shared Vault

Scenario
	•	uDOS-ubuntu runs on a mini PC/server
	•	Mac app is used on demand by the user
	•	uHOME runs elsewhere on the LAN
	•	all point at the same canonical vault

Recommended behaviour
	•	vault is shared read/write
	•	Ubuntu owns autonomous binder ops
	•	Mac app performs manual edits/review/import
	•	uHOME has read access or limited service access only
	•	empire handles external provider sync
	•	lease/heartbeat prevents duplicate jobs

Result

One vault, many surfaces, one background owner.

⸻

Example 2 — Background Ops Delegation

Scenario
	•	uHOME is the always-on box
	•	Ubuntu browser GUI also exists on that machine or another
	•	user wants heavy background operations off their laptop/Mac

Recommended behaviour

Two valid options:

Option A
uDOS-ubuntu still owns binder automation, but is hosted on the always-on box.

Option B
Specific lanes are delegated to uHOME, such as:
	•	backup jobs
	•	asset transcoding
	•	nightly exports
	•	vault snapshotting
	•	local network delivery

But binder-native semantic jobs stay with uDOS-ubuntu unless explicitly moved.

Rule

uHOME can host infrastructure-heavy work.
uDOS-ubuntu should retain binder/workflow semantic ownership by default.

⸻

Example 3 — Optional Wizard Networking

Scenario

The user enables Wizard networking, remote coordination, or advanced multi-machine setup.

Wizard role

Wizard may provide:
	•	network policy
	•	service discovery
	•	host role assignment
	•	secure routing
	•	remote operation policy
	•	API/MCP budgeting and orchestration

In that case

Wizard may help decide:
	•	which host owns schedule dispatch
	•	which host owns compile queue
	•	which host owns projection queue
	•	whether local-only or LAN-visible services are exposed
	•	whether vault is directly shared or mediated

Rule

Wizard may coordinate ownership, but it does not remove the need for:
	•	leases
	•	runtime identity
	•	idempotent jobs
	•	explicit lane ownership

⸻

Vault Sharing Models With uHOME

Model A — Direct shared filesystem

Examples:
	•	same machine
	•	mounted network share
	•	shared local storage

Use when
	•	trusted local environment
	•	simple setup
	•	one main vault

Requirements
	•	file locking must be advisory only
	•	leases govern autonomous ownership, not filesystem lock assumptions
	•	runtime index databases should remain local per runtime, not shared blindly

Important rule

Share the vault files, not the runtime SQLite database.

Each runtime should maintain its own local runtime index rebuildable from vault truth.

⸻

Model B — Snapshot/export support

uHOME may maintain:
	•	backups
	•	mirrored snapshots
	•	archive exports
	•	media-serving copies
	•	read-only publishing views

This is safe and useful, especially for server-oriented functions.

⸻

Model C — Wizard-mediated network routing

For advanced homes/networks:
	•	Wizard can define service discovery
	•	uHOME can host network surfaces
	•	uDOS-ubuntu can stay the semantic binder owner
	•	Mac app can remain on-demand operator UI

This is the most scalable model.

⸻

Runtime Index Rule Across Machines

This is critical.

Decision

The vault may be shared.
The runtime index must remain local to each runtime instance.

Do not attempt to share one live SQLite runtime DB among:
	•	Ubuntu
	•	Mac
	•	uHOME

Why

Because that creates:
	•	corruption risk
	•	locking pain
	•	platform inconsistency
	•	hidden coupling
	•	hard-to-debug stale states

Correct model
	•	vault = canonical shared truth
	•	local runtime DB = rebuildable accelerator/cache/projection state
	•	ownership leases = coordination layer

⸻

Background Ops Split With uHOME

uHOME may participate in background work, but only in clearly bounded classes.

Good candidates for uHOME-owned background ops
	•	backups
	•	snapshot rotation
	•	media processing
	•	local network publishing
	•	server delivery
	•	device sync to kiosks/TVs/tablets
	•	service health monitoring
	•	optional local AI/model hosting if configured elsewhere in v2

Good candidates for uDOS-ubuntu-owned background ops
	•	binder scans
	•	workflow schedule dispatch
	•	canonical normalization
	•	contact/message linking
	•	compile orchestration
	•	publish decisioning
	•	projection queue semantics
	•	operator-facing review queues

This keeps semantic ownership and infrastructure ownership distinct.

⸻

Recommended Defaults

When Ubuntu + Mac coexist

Default to:
	•	Ubuntu = autonomous owner
	•	Mac = manual/on-demand operator surface
	•	Empire = external provider sync owner
	•	uHOME = home/server/infrastructure owner

When Ubuntu + uHOME coexist on same machine

Default to:
	•	Ubuntu = binder/workflow owner
	•	uHOME = home/server/network owner
	•	shared vault optional
	•	shared runtime DB forbidden
	•	background lane split explicit

When Ubuntu + uHOME coexist on same LAN

Default to:
	•	Ubuntu = canonical personal workflow runtime
	•	uHOME = LAN services and support runtime
	•	Wizard optional for advanced routing
	•	shared vault or snapshot model selectable

⸻

Control Plane Requirements

The Ubuntu control plane should expose:

Runtime Ownership

Show:
	•	current autonomous owner by lane
	•	lease status
	•	heartbeat freshness
	•	conflicting claims
	•	manual override controls

Side-by-Side Mode

Show:
	•	detected Mac app presence if known
	•	detected uHOME presence if known
	•	detected Wizard/network coordination if enabled
	•	active coordination mode

Vault Mode

Show:
	•	local vault
	•	shared vault
	•	read/write state
	•	runtime index state
	•	rebuild status

Ops Safety

Show:
	•	duplicate prevention status
	•	recent skipped jobs due to active lease
	•	stale lease warnings
	•	lane assignment summary

⸻

Failure Behaviour

If Ubuntu goes offline
	•	leases expire
	•	Mac app may assume ownership only if allowed by policy
	•	uHOME may assume owned infrastructure lanes only if configured
	•	no permanent deadlock

If Mac app opens while Ubuntu is active
	•	Mac app detects active Ubuntu leases
	•	Mac remains in operator/manual mode for owned lanes
	•	Mac still allows manual actions
	•	Mac avoids taking over background queues

If shared vault is briefly unavailable
	•	local runtime indexes continue in read-only or deferred mode as appropriate
	•	queued mutations wait or fail visibly
	•	no silent forking into shadow vaults

⸻

Final Rule Set

Rule 1

Only one runtime owns each autonomous operation lane at a time.

Rule 2

Leases and heartbeats coordinate ownership.

Rule 3

Jobs must be idempotent even if duplicate execution occurs.

Rule 4

The vault may be shared; the runtime index must remain local.

Rule 5

uDOS-ubuntu is the default always-on binder automation host.

Rule 6

omd-mac-osx-app is the default on-demand operator surface unless explicitly assigned background lanes.

Rule 7

uHOME is a sibling server/home runtime and should own infrastructure lanes, not binder semantic lanes, by default.

Rule 8

Wizard may coordinate networking and host roles, but explicit ownership still applies.

⸻

Final Position

When run together, uDOS-ubuntu, omd-mac-osx-app, uHOME, and Wizard must behave like coordinated surfaces over shared truth, not competing runtimes.

That means:
	•	shared vault truth
	•	local rebuildable indexes
	•	explicit operation ownership
	•	lease-based autonomous coordination
	•	safe manual overrides
	•	clean separation between personal workflow semantics and server/home infrastructure roles

This preserves the flexibility of multi-device and side-by-side operation without letting automation double up or silently fork state.