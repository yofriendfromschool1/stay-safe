# 🤝 Contributing to stay-safe

Thank you for wanting to help. A security guide rots faster than almost any other kind of document — tools get discontinued, decryptor pages move, and scam patterns change monthly. This one stays accurate through the same community it was written for, and every correction is somebody's files not getting encrypted.

> **Infected right now?** The issue tracker is not the fastest route to a clean machine — start with [16. Getting Help](README.md#-16-getting-help) in the README (free guided removal at BleepingComputer, ransomware identification at ID Ransomware), then come back and improve the guide once you're safe.

## 🧭 How to Help

| You have... | Do this |
| --- | --- |
| A dead, redirected, or parked link | Open an issue with the [dead-link template](#-issue-templates) — or PR the fix directly |
| A typo, formatting glitch, or broken table | PR directly, no issue needed |
| A better tool to recommend | Issue or PR with the [tool-suggestion template](#-issue-templates) |
| An outdated or wrong claim | Issue with a source — see the [Accuracy Standard](#-accuracy-standard) |
| A new scam pattern or threat family worth covering | Open an issue **first** — scope it before writing |
| An idea for a new section or a restructure | Open an issue **first** |
| A translation | Open an issue first so it can be coordinated |
| Nothing to contribute, but the guide saved your PC | Star the repo and share it — that's how the next person finds it before their files do the finding |

Small fixes skip the discussion; anything structural starts as a conversation. That keeps PRs from going stale when an idea doesn't fit the guide.

## 🌟 Ground Rules

1. **Defense only.** This guide helps people prevent, detect, remove, and recover. Nothing that helps someone build, deploy, or operate malware. Offense is explained only where it teaches defense — e.g., how a stealer harvests session cookies is in the guide so victims understand why "log out all sessions" matters.
2. **No live samples, ever.** Never attach executables or malicious documents to an issue or PR. Link a [VirusTotal](https://www.virustotal.com/gui/home/upload) or [Hybrid Analysis](https://hybrid-analysis.com/) report, or post a hash. Details in [Malware Samples](#-malware-samples).
3. **Free by default.** The guide's promise is 100% free tools. Paid products appear only as context ("if you prefer a paid suite, pick exactly one"), never as the recommendation.
4. **No affiliate links, referral codes, or stealth promotion.** If you made the tool, work for the vendor, or earn from the link — say so in your PR.
5. **Source your claims.** New factual statements about threat families, campaigns, or tools need a citation: a vendor blog, CISA, a court record, or the vendor's own announcement page.
6. **Assume the reader is having their worst week.** No shaming people for how they got infected. The tone stays direct but never contemptuous — a large share of crack-and-cheat malware victims are kids, not criminals.
7. **Keep the torrent convention intact.** The guide links torrents and community mirrors the community itself submitted, and it always names the official free alternative next to them (see [Link Policy](#-link-policy)). That balance is deliberate — don't remove one side of it.

## 🔗 Link Policy

Order of preference for any tool link:

1. **Official vendor page** — the developer's own site or GitHub
2. **App store / distro repository**
3. **Reputable community mirror**
4. **Torrent** — accepted where the community added them, under the conventions below

If you add or replace a torrent or mirror link, three rules apply:

- **Name an official free alternative in the same row or paragraph.** This is the established convention — every torrent entry in [8.2 The Cleaning Kit](README.md#82-the-cleaning-kit) and [12.4 Dynamic Analysis and RE](README.md#124-dynamic-analysis-and-re) carries one.
- **Use the established format:** `[Tool](url) · [mirror](mirror-url)`, with the type column marked `(torrent)` — see the Kaspersky and Bitdefender rows in [8.2](README.md#82-the-cleaning-kit) for the pattern.
- **Check the host against [FMHY's Unsafe Sites list](https://fmhy.net/unsafe) first.** If the site is on that list (GetIntoPC, FileCR, OceanOfGames, and friends), it does not go in — no exceptions for "but this particular upload looks fine."

Formatting rules for every link:

- `https://` only — no `http://`, no URL shorteners, no tracking parameters
- Link meaningful text, never "click here"
- URLs containing parentheses must use angle brackets, or GitHub breaks the link: `[Kaspersky Total Security](<https://…_(Limited_Time)_…>)`
- No link-aggregator pages when a direct link exists
- Dead links get fixed or removed in the same PR that reports them — a strikethrough with "(dead)" helps nobody's security

## ✅ Accuracy Standard

Security content has a short shelf life. Before you submit, verify your claim against the present:

- **Is the tool still alive?** Products get discontinued — this guide already retired TDSSKiller in favor of [KVRT](https://www.kaspersky.com/downloads/free-virus-removal-tool) for exactly that reason. If the vendor page 404s or the project repo is archived, it comes out.
- **Is it still free?** Freemium drift is real. If a tool moved behind a paywall, say so in the guide or drop it.
- **Did the service shut down?** Resurrecting a dead service is worse than omitting it — this guide replaced Mullvad's public DNS with [Quad9](https://quad9.net/) after Mullvad shut theirs down and said so publicly.
- **Prefer primary sources.** The vendor's own announcement beats a news article beats a forum thread. If the vendor said it themselves, link that.
- **Absolute dates over relative ones.** "Flash Player reached end-of-life in December 2020" survives editing; "recently discontinued" is wrong within a year.
- **No tool is promised to catch everything.** The guide's framing is layers and habits, not silver bullets — keep it that way.

## 🖋️ Style Guide

Match the guide's existing voice: direct, plain English, second person. Explain *why*, not just *what* — every recommendation says what it is and why it earned its place. Dry humor is welcome; facts stay serious.

**Structure:**

- `##` for major sections — numbered, with an emoji at the front; `###` for `x.y` subsections
- New sections take the **next number** in sequence — never renumber existing sections, or every external link into the guide breaks
- Tool lists go in tables: `Tool | Type | Notes` or `Tool | Purpose`
- Comparisons use two-column tables like `Do | Don't`
- Commands, file names, extensions, and registry keys get `code spans` — never quotes
- **Bold** the key term at the start of a bullet
- Long reference lists go inside `<details>` collapsible blocks
- One paragraph per line, no hard wrapping — that's how the README is written, and it keeps diffs clean
- The whole guide is a single `README.md` (~900 lines) — edit it directly, there is no build step on your side

**Table of Contents:** if you add, rename, or reorder a section, update the TOC at the top of the README to match. GitHub lowercases the heading, drops punctuation, and turns spaces into hyphens; a leading emoji leaves a leading hyphen:

| Heading | Anchor |
| --- | --- |
| `## 🧭 1. The Golden Rules` | `#-1-the-golden-rules` |
| `### 2.1 Online Scanners and Sandboxes` | `#21-online-scanners-and-sandboxes` |
| `## 🧬 12. Advanced Analysis: VMs and Reverse Engineering` | `#-12-advanced-analysis-vms-and-reverse-engineering` |

## 🔄 Submitting Changes

```text
1. Fork the repo
2. Branch:  fix/dead-kaspersky-link · tools/add-mitmproxy · content/new-scam-pattern
3. Edit README.md (the whole guide is one file)
4. Update the TOC if you touched a heading
5. Open the PR with a short what-and-why, plus sources
```

**PR titles** carry a tag, e.g. `[fix] swap dead TDSSKiller link for KVRT`, `[tools] add mitmproxy to 12.4`, `[content] document the fake-CAPTCHA ClickFix pattern`.

**Before you hit Create pull request:**

- [ ] Every new or changed URL opens in a private window
- [ ] Torrent/mirror links name an official free alternative in the same row
- [ ] Factual claims carry sources
- [ ] No paid-only recommendation slipped in — free-first is the guide's promise
- [ ] New download hosts are not on [FMHY's Unsafe Sites list](https://fmhy.net/unsafe)
- [ ] The markdown renders correctly on GitHub — tables, anchors, `<details>` blocks
- [ ] The TOC matches the headings
- [ ] No live samples, no affiliate links

## 📬 Issue Templates

Copy whichever fits:

**Dead link**

```markdown
**Section:** 8.2 The Cleaning Kit
**Link text:** Kaspersky Total Security
**What's wrong:** 404 / redirects to … / parked domain
**Suggested replacement:** (URL)
```

**Tool suggestion**

```markdown
**Tool:** (name)
**Platform:** Windows / macOS / Linux / Android / web
**Cost:** free / free tier / paid
**Official link:** (URL)
**What it does:** (one or two lines)
**Where it belongs:** section, and what it should sit next to or replace
**Why it's better than what's listed:** (source if possible)
```

**Inaccuracy report**

```markdown
**Section:** (number and name)
**The guide says:** (quote it)
**That's wrong because:** (facts)
**Source:** (link)
```

## 🧪 Malware Samples

Never attach samples to issues or PRs — this repo gets read by people mid-incident, sometimes on machines that are already compromised. Instead:

- **Share analysis, not binaries** — link the [VirusTotal](https://www.virustotal.com/gui/home/upload) or [Hybrid Analysis](https://hybrid-analysis.com/) report
- **Hashes are fine** — SHA-256 in a code span
- **Want an informal read on a file?** Message the repo owner on Discord (see [Getting in Touch](#-getting-in-touch)), or use the free trained helpers listed in [16. Getting Help](README.md#-16-getting-help)

## ⚖️ Licensing

The repository does not currently carry a LICENSE file. By opening a pull request you confirm that:

- you have the right to submit your contribution, and
- your contribution (text, links, edits) can be licensed under whatever license this project adopts, including a permissive or public-domain one.

If that doesn't work for you, say so in the PR and it gets worked out before anything merges.

## 📫 Getting in Touch

Questions about a contribution, a second opinion on a suspicious file, or anything that doesn't fit an issue: reach the repo owner on Discord — **jazminethecooles2001** (user ID `1234018959167324220`, handle `@jazminethecooles2001`).

For malware emergencies, use [16. Getting Help](README.md#-16-getting-help) in the README — free guided removal, ransomware identification, and decryptor collections.

---

Thank you for reading this far. Every dead link reported and every "this tool is discontinued now" is somebody's files not getting encrypted. 🛡️
