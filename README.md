# 🛡️ stay-safe

![Platforms](https://img.shields.io/badge/platforms-Windows%20%7C%20macOS%20%7C%20Linux%20%7C%20Android-informational)
![Focus](https://img.shields.io/badge/focus-prevention%20%2B%20detection%20%2B%20removal-critical)
![Cost](https://img.shields.io/badge/tools-100%25%20free-brightgreen)

> A practical, community-maintained guide to protecting yourself from malware: prevention, detection, removal, and recovery — across **Windows, macOS, Linux, and Android**, with dedicated deep dives into **ransomware** and **info-stealers**.

Everything in this guide is free to use and free to share. Corrections and new tools are welcome — see [Contributing](#-17-disclaimer-and-contributing).

**Quick navigation**

| Situation | Go to |
| --- | --- |
| Not infected, want to stay that way | [1. The Golden Rules](#-1-the-golden-rules) |
| Want to vet a file before opening it | [2.1 Online Scanners and Sandboxes](#21-online-scanners-and-sandboxes) |
| Infected right now | [4. Infected Right Now: Incident Response](#-4-infected-right-now-incident-response) |
| Ransom note on screen | [5. Ransomware](#-5-ransomware) |
| Passwords or sessions stolen | [6. Info-Stealers](#-6-info-stealers) |
| Cleaning a specific device | [8. Windows](#-8-windows) · [9. macOS](#-9-macos) · [10. Linux](#-10-linux) · [11. Android](#-11-android) |

**⚡ The 60-second audit**

Run through this now — every "no" is your to-do list:

- [ ] An offline backup exists and was tested this quarter ([7. Backups](#-7-backups-and-the-3-2-1-rule))
- [ ] An ad blocker is installed ([2.4 Ad Blockers](#24-ad-blockers))
- [ ] A filtering DNS resolver is configured ([2.5 DNS Filtering](#25-dns-filtering))
- [ ] 2FA is on email, banking, and crypto accounts ([14. Passwords and 2FA](#-14-passwords-2fa-and-account-hygiene))
- [ ] Every password is unique and stored in a manager ([14](#-14-passwords-2fa-and-account-hygiene))
- [ ] OS and browser are fully updated
- [ ] File extensions are visible on Windows ([8.8](#88-windows-hardening-checklist))
- [ ] You know how to find persistence with Autoruns if you ever have to ([8.6 Manual Hunting](#86-manual-hunting))

## 📑 Table of Contents

- [🧭 1. The Golden Rules](#-1-the-golden-rules)
- [🧪 2. Prevention Toolkit](#-2-prevention-toolkit)
    - [2.1 Online Scanners and Sandboxes](#21-online-scanners-and-sandboxes)
    - [2.2 How to Read Scanner Results](#22-how-to-read-scanner-results)
    - [2.3 Browsers](#23-browsers)
    - [2.4 Ad Blockers](#24-ad-blockers)
    - [2.5 DNS Filtering](#25-dns-filtering)
    - [2.6 Safe Downloading Habits](#26-safe-downloading-habits)
- [🎣 3. Scam and Trap Awareness](#-3-scam-and-trap-awareness)
- [🚨 4. Infected Right Now: Incident Response](#-4-infected-right-now-incident-response)
- [🔒 5. Ransomware](#-5-ransomware)
    - [5.1 What Ransomware Is](#51-what-ransomware-is)
    - [5.2 Signs of Infection](#52-signs-of-infection)
    - [5.3 First Response: Do's and Don'ts](#53-first-response-dos-and-donts)
    - [5.4 Identify and Try to Decrypt](#54-identify-and-try-to-decrypt)
    - [5.5 Reporting](#55-reporting)
    - [5.6 Recovery](#56-recovery)
    - [5.7 Prevention](#57-prevention)
    - [5.8 If This Is a Business Machine](#58-if-this-is-a-business-machine)
- [🕵️ 6. Info-Stealers](#-6-info-stealers)
    - [6.1 What Info-Stealers Steal](#61-what-info-stealers-steal)
    - [6.2 Families to Know](#62-families-to-know)
    - [6.3 Aftermath: The Reset Checklist](#63-aftermath-the-reset-checklist)
    - [6.4 Further Reading](#64-further-reading)
- [💾 7. Backups and the 3-2-1 Rule](#-7-backups-and-the-3-2-1-rule)
- [🪟 8. Windows](#-8-windows)
    - [8.1 Built-in Defenses](#81-built-in-defenses)
    - [8.2 The Cleaning Kit](#82-the-cleaning-kit)
    - [8.3 Recommended Scanner Settings](#83-recommended-scanner-settings)
    - [8.4 Built-in Triage Commands](#84-built-in-triage-commands)
    - [8.5 The Full Cleaning Recipe](#85-the-full-cleaning-recipe)
    - [8.6 Manual Hunting](#86-manual-hunting)
    - [8.7 Last Resort: Reset and Reinstall](#87-last-resort-reset-and-reinstall)
    - [8.8 Windows Hardening Checklist](#88-windows-hardening-checklist)
- [🍎 9. macOS](#-9-macos)
    - [9.1 Built-in Defenses](#91-built-in-defenses)
    - [9.2 Cleaning Tools](#92-cleaning-tools)
    - [9.3 Manual Checks](#93-manual-checks)
    - [9.4 macOS Hardening Checklist](#94-macos-hardening-checklist)
- [🐧 10. Linux](#-10-linux)
    - [10.1 Scanners](#101-scanners)
    - [10.2 Manual Checks](#102-manual-checks)
    - [10.3 Compromised Servers: Rebuild, Don't Clean](#103-compromised-servers-rebuild-dont-clean)
    - [10.4 Linux Hardening Checklist](#104-linux-hardening-checklist)
- [🤖 11. Android](#-11-android)
    - [11.1 Play Protect](#111-play-protect)
    - [11.2 Sideloading Risks](#112-sideloading-risks)
    - [11.3 Signs of Android Malware](#113-signs-of-android-malware)
    - [11.4 If Your Phone Is Infected](#114-if-your-phone-is-infected)
    - [11.5 Android Hardening Checklist](#115-android-hardening-checklist)
- [🧬 12. Advanced Analysis: VMs and Reverse Engineering](#-12-advanced-analysis-vms-and-reverse-engineering)
    - [12.1 Rules of the Lab](#121-rules-of-the-lab)
    - [12.2 VM Stealth](#122-vm-stealth)
    - [12.3 Static Analysis Tools](#123-static-analysis-tools)
    - [12.4 Dynamic Analysis and RE](#124-dynamic-analysis-and-re)
    - [12.5 Red-Flag Indicators](#125-red-flag-indicators)
    - [12.6 Worked Example: Triaging a Suspicious File](#126-worked-example-triaging-a-suspicious-file)
- [📚 13. Malware Glossary](#-13-malware-glossary)
- [🔑 14. Passwords, 2FA, and Account Hygiene](#-14-passwords-2fa-and-account-hygiene)
- [❓ 15. Frequently Asked Questions](#-15-frequently-asked-questions)
- [🆘 16. Getting Help](#-16-getting-help)
- [⚖️ 17. Disclaimer and Contributing](#-17-disclaimer-and-contributing)


---

## 🧭 1. The Golden Rules

No single product makes you safe. Layers and habits do. If you remember ten things from this guide, make it these:

| # | Rule | Why |
| --- | --- | --- |
| 1 | **Verify before you run.** Check what you are downloading and where it came from. | Common sense is the antivirus no vendor can sell you. Most infections start with a file the victim ran on purpose. |
| 2 | **Scan before executing.** | [VirusTotal](https://www.virustotal.com/gui/home/upload) plus one sandbox run (see [2. Prevention Toolkit](#-2-prevention-toolkit)). A clean scan is a data point, not a green light. |
| 3 | **Keep offline backups.** | Ransomware is an inconvenience if you can restore, and a disaster if you can't. See [7. Backups](#-7-backups-and-the-3-2-1-rule). |
| 4 | **Update everything.** | OS, browser, phone, antivirus. Most attacks exploit bugs that were patched months ago. |
| 5 | **Unique passwords + 2FA everywhere.** | One reused password turns one breach into every breach. See [14. Passwords, 2FA, and Account Hygiene](#-14-passwords-2fa-and-account-hygiene). |
| 6 | **Run with least privilege.** | Malware inherits the rights of the account that launched it. A standard user account blunts a large share of payload behavior. |
| 7 | **If it is normally paid and you got it free, ask why.** | Cracks, keygens, and "free" game cheats are the single biggest malware channel. The STOP (Djvu) ransomware family spread almost exclusively through cracks and keygen downloads ([Emsisoft](https://www.emsisoft.com/en/blog/34375/emsisoft-releases-new-decryptor-for-stop-djvu-ransomware)). |
| 8 | **Never paste commands from web pages.** | A growing scam ("ClickFix") shows a fake CAPTCHA and asks you to press `Win + R`, paste, and hit Enter. The pasted text *is* the malware. |
| 9 | **An ad blocker is not optional.** | Malvertising is a top infection vector — one malicious ad on a normal site is enough. See [2.4 Ad Blockers](#24-ad-blockers). |
| 10 | **When in doubt, contain it.** | Run it in a disposable VM ([12. Advanced Analysis](#-12-advanced-analysis-vms-and-reverse-engineering)) — or don't run it at all. |

---

## 🧪 2. Prevention Toolkit

### 2.1 Online Scanners and Sandboxes

Scan files **before** you run them. These services are free, need no installation, and detonate the file on their servers instead of yours.

| Service | Type | Best for |
| --- | --- | --- |
| [VirusTotal](https://www.virustotal.com/gui/home/upload) | Dozens of AV engines | The mandatory first check for any file, URL, or hash; read the community comments too |
| [Triage](https://tri.age) | Automated sandbox | Detonate a suspicious file and read a full behavioral report |
| [ANY.RUN](https://any.run) | Interactive sandbox | Watch malware execute step by step in real time and interact with the desktop |
| [Cuckoo](https://cuckoo.cert.ee/) · [mirror](https://sandbox.pikker.ee/) | Automated sandbox | Classic sandbox detonation reports |
| [Manalyzer](https://manalyzer.org/) | Static analysis | Deep look inside a Windows executable without running it |
| [Hybrid Analysis](https://hybrid-analysis.com/) | Sandbox (Falcon) | Detailed behavioral and static reports |
| [Jotti](https://virusscan.jotti.org/en) | Multi-engine scan | Quick second opinion |
| [OpenTip](https://opentip.kaspersky.com/) | Cloud scanner (Kaspersky) | Second opinion from Kaspersky's engine |
| [Malprob](https://malprob.io/) | AI sandbox | Fast automated triage |
| [Filescan](https://www.filescan.io/scan) | Sandbox | Behavioral and static analysis |
| [MetaDefender](https://metadefender.com/) | Multi-engine (OPSWAT) | Multi-engine scanning plus content disarm and reconstruction |
| [Dangerzone](https://dangerzone.rocks/) | Document sanitizer | Converts scary PDFs and Office documents into safe, flat copies before you open them |

**Notes**

- Uploading a file to a public scanner shares it with the security community. Fine for malware — do not upload documents containing personal secrets.
- Sandboxes run the file on their servers, not on your machine. Use them for anything that did not come from an official source.

### 2.2 How to Read Scanner Results

A clean scan does not mean safe. Read the evidence instead of trusting one number:

- **A 0-detection result is not a green light.** Brand-new samples, custom-built malware, and freshly repacked crypters pass every engine. Scanners can only catch what they have already seen.
- **Detection names matter.** `Trojan:Win32/Lumma.Stealer` tells you exactly what you have. Several engines flagging `Generic/Heuristic/Suspicious` at once should also be taken seriously.
- **Look at the file details.** An unsigned executable pretending to be a PDF invoice, a `setup.exe` compiled yesterday with a random name, and extreme entropy (heavy packing) all strengthen the case.
- **In sandboxes, watch behavior.** Persistence (registry run keys, scheduled tasks, startup folders), processes spawned, files dropped, connections to odd domains. [capa](#123-static-analysis-tools) gives you the same insight offline.
- **Two independent suspicious indicators = treat as malicious.** Do not rationalize a file you already want to trust.

### 2.3 Browsers

The browser is the door most malware walks through. Recommended:

- [LibreWolf](https://librewolf.net/) — Firefox with privacy hardening built in
- [Mullvad Browser](https://mullvad.net/en/browser) — the Tor Browser's anti-fingerprinting technology, without the Tor network
- [Brave](https://brave.com/) — Chromium with a built-in blocker

Any of these three beats a stock browser setup. If you must use Chrome or Edge, at least keep an ad blocker installed and updated.

### 2.4 Ad Blockers

Always use an ad blocker while browsing. Malvertising is one of the most common infection vectors — a single malicious ad on an otherwise normal site can deliver fake update banners, scam popups, and drive-by downloads.

- [uBlock Origin](https://github.com/gorhill/ublock) — if you install one thing from this guide, install this. Efficient, open source, actively maintained.
- [AdNauseam](https://github.com/dhowe/adnauseam/) — an experimental fork of uBlock Origin that also clicks ads in the background; still an effective blocker.

Note: Manifest V3 limits content blockers on Chrome. uBlock Origin works best on Firefox-based browsers (LibreWolf, Firefox, Waterfox) and on Brave.

### 2.5 DNS Filtering

Your DNS resolver decides where domain names point. A filtering resolver blocks known-malicious domains before a connection is ever made — configure it once on your router and every device in your home benefits.

- [Quad9](https://quad9.net/) — free, non-profit resolver that blocks malware and phishing domains. Set `9.9.9.9` (secondary: `149.112.112.112`) on your router or device. Mullvad shut down its own public DNS service and now sponsors Quad9 ([announcement](https://mullvad.net/en/blog/shutting-down-our-public-encrypted-dns-servers-and-sponsoring-quad9-instead)).
- [NextDNS](https://nextdns.io/) — free tier for personal use, with customizable blocklists and query logs.

### 2.6 Safe Downloading Habits

- **Official sources first.** Vendor site, app store, your distro's repositories, the developer's GitHub. If a download reached you through an ad, a Discord DM, or a "free download" aggregator, treat it as hostile until scanned.
- **Watch file extensions.** `invoice.pdf.exe`, `photo.scr`, `document.lnk`, `setup.vbs` — the real extension is what matters. Turn on file extensions in Explorer ([8.8](#88-windows-hardening-checklist)).
- **Password-protected archives are a red flag.** If a site hands you a ZIP plus a password, that password exists to defeat email and antivirus scanning.
- **Verify checksums when available.** A SHA-256 you compare yourself beats trusting the mirror.
- **Trust uploaders, not sites.** On torrent and community sites, reputation follows the uploader. The same site serves both gold and garbage.
- **Use community safety lists.** [FMHY (Free Media Heck Yeah)](https://fmhy.net/) maintains a large, actively curated wiki of free content — including an [Unsafe Sites list](https://fmhy.net/unsafe) naming the game repack sites, software sites, and file hosts that have been caught distributing malware (GetIntoPC, FileCR, OceanOfGames, and many more), plus lists of fake Windows activators, fake Z-Library mirrors, and fake Anna's Archive clones. FMHY also publishes the SafeGuard browser extension and an adblocker filterlist (both linked from the Tools menu on their site). If you download free media or software, bookmark that page and check it. And remember: scene groups do not have websites — anything claiming to be an official repacker site is fake by definition.

---

## 🎣 3. Scam and Trap Awareness

Most infections do not "hack" you — they talk you into running them. Know the patterns:

- **Fake infection alerts and tech-support scams.** A full-screen "YOUR PC IS INFECTED — call +1-..." popup with a siren sound is a scam page, not Windows. Close the tab. If the dialog keeps re-appearing, kill the entire browser process with Task Manager (`Ctrl + Shift + Esc`). Never call the number, and never grant remote access (AnyDesk, TeamViewer, ScreenConnect) to anyone who contacts you first.
- **Fake updates.** Flash Player reached end-of-life in December 2020 — every "Flash update" prompt since then is malware. Same for fake Chrome, Java, and driver-update popups on random sites. Update only through the browser's or application's own update function.
- **Fake CAPTCHA pages ("ClickFix").** A page claims you must "verify you are human" and shows instructions like press `Win + R`, `Ctrl + V`, `Enter`. The clipboard holds a command that downloads and runs malware. Never paste anything into a Run dialog or terminal at a web page's request.
- **Cracks, keygens, cheats, "free Nitro".** The top infection channel, period. Game cheats are predominantly stealer droppers; Discord "free Nitro" links are token grabbers; YouTube videos and comments promising free premium software are, in FMHY's words, "nearly always scams." See rule 7 in [1. The Golden Rules](#-1-the-golden-rules).
- **Crypto drainers.** "Connect your wallet to claim the airdrop" pages ask you to sign a malicious transaction. Never sign transactions reached from links — navigate to the protocol yourself.
- **Phishing and lookalike domains.** `steamcomunity.com`, `discordgift.site`, `micros0ft-login.com`. Read the domain character by character before entering credentials. Urgency ("your account will be deleted in 24 hours") is the tell.
- **Sponsored search results.** Attackers buy ads that sit above the real site. Check the URL before clicking an ad — or better, use a bookmark.

---

## 🚨 4. Infected Right Now: Incident Response

Work through this in order. Do it from your phone if you have to — don't freestyle.

1. **Disconnect from the internet.** Unplug the cable or turn off Wi-Fi. This stops command-and-control traffic, data exfiltration, and ransomware spreading to other devices on your network.
2. **Power off only if files are being encrypted right now.** If you can watch files being renamed or a ransom note just appeared, power off immediately to halt the encryption. Otherwise leave the machine on — memory may hold encryption keys or evidence you will want ([5. Ransomware](#-5-ransomware)).
3. **Unplug external drives and pause sync now.** Ransomware encrypts connected USB drives and network shares. Disconnect every backup target. Pause or unlink cloud sync so encrypted files don't overwrite good versions in the cloud.
4. **Identify what you actually have:**

| What you're seeing | Most likely | Go to |
| --- | --- | --- |
| Files renamed with new extensions, ransom notes, wallpaper changed | Ransomware | [5. Ransomware](#-5-ransomware) |
| Signed out everywhere, unknown logins, missing crypto, friends get strange DMs from you | Info-stealer | [6. Info-Stealers](#-6-info-stealers) |
| CPU/GPU pinned at 100% while idle, PC slow and hot | Cryptominer | [8. Windows](#-8-windows) / [10. Linux](#-10-linux) |
| Popups, homepage hijack, new toolbar, fake search engine | Adware / PUP | [8.2 The Cleaning Kit](#82-the-cleaning-kit) |
| Cursor moves on its own, windows open themselves, webcam light on | RAT | [8.6 Manual Hunting](#86-manual-hunting) — and assume data theft too |
| Antivirus disabled, admin rights gone, tools report "access denied" | Rootkit / bootkit | [8.7 Last Resort](#87-last-resort-reset-and-reinstall) |

Symptoms overlap and modern malware bundles payloads — a RAT usually also steals. Assume the worst column that matches your symptoms.

5. **Do not log into anything on the infected machine.** No banking, no email, no Discord, no wallet. Assume every keystroke and cookie is being recorded.
6. **Clean the machine.** Follow the section for your platform: [Windows](#-8-windows) · [macOS](#-9-macos) · [Linux](#-10-linux) · [Android](#-11-android). A full reset or clean reinstall is the gold standard whenever you are not confident the cleaning worked.
7. **Reset credentials — from a clean device.** Never change passwords from the infected machine; a keylogger will simply capture the new one. Follow the order in [6.3 Aftermath: The Reset Checklist](#63-aftermath-the-reset-checklist). Email comes first.
8. **Close the entry point.** Uninstall the crack or loader that brought it in, revoke permissions you granted blindly, patch what needed patching. If you can't find the entry point, expect to be reinfected.
9. **Aftercare.** Watch account activity for a couple of weeks, review OAuth app grants and email forwarding rules, and run another full scan after a few days.

**A note on System Restore:** rolling back to a restore point can help if one exists from *before* the infection — but many modern threats delete or infect restore points, and System Restore was never designed as malware removal. Treat it as one tool among several, not a cure. Restoring does not touch your personal files either way.

---

## 🔒 5. Ransomware

### 5.1 What Ransomware Is

Ransomware encrypts your files and demands payment for the key. Modern families practice **double extortion**: they steal your data *before* encrypting, so the demand becomes "pay to decrypt, and pay so your files aren't leaked." It runs as a criminal industry — ransomware-as-a-service, with affiliates, support desks, and leak sites.

### 5.2 Signs of Infection

- Files across the system suddenly renamed with unfamiliar extensions (`.lockbit`, `.rmallox`, `.stop`, or random strings)
- A ransom note dropped into every folder (`HOW_TO_RECOVER.txt`, `readme!!!.txt`) or the wallpaper replaced with a ransom message
- Files that opened fine minutes ago now won't open at all
- Shadow copies deleted (`vssadmin list shadows` comes back empty)
- A sudden burst of disk activity, then silence

### 5.3 First Response: Do's and Don'ts

| Do | Don't |
| --- | --- |
| Disconnect from the network immediately | Don't pay. There is no guarantee of a working decryptor, payment funds the next attack, and paying some sanctioned operators carries legal risk |
| Power off if encryption is happening right now | Don't keep browsing on the same machine to "research the note" — use your phone |
| Photograph the ransom note and a few encrypted file names | Don't delete the note or the encrypted files — identification tools need them |
| Disconnect all external and network drives | Don't reinstall Windows yet — you may destroy data a decryptor could have recovered |
| Verify you have clean, offline backups | Don't download "decryptors" from random sites — fake decryptors are malware themselves |

### 5.4 Identify and Try to Decrypt

1. **[ID Ransomware](https://id-ransomware.malwarehunterteam.com/)** — upload the ransom note and one encrypted file; it identifies the family and tells you whether a free decryptor exists.
2. **[No More Ransom](https://www.nomoreransom.org/en/decryption-tools.html)** — the largest collection of free decryption tools, run by a coalition of law-enforcement agencies and security companies.
3. **[Emsisoft's free decryptor collection](https://www.emsisoft.com/en/ransomware-decryption)** — regularly updated; the STOP (Djvu) decryptor alone covers a large share of consumer victims.

Reality check: for competent modern ransomware there is usually no decryptor. Older, amateur, or badly implemented families are often breakable — which is why identifying the family first matters. Archive the encrypted files even if no decryptor exists today; some appear years later.

### 5.5 Reporting

Report it, even if it feels pointless — reports drive decryptor releases and law-enforcement takedowns:

- United States: [FBI IC3](https://www.ic3.gov/)
- Businesses: [CISA's StopRansomware guidance](https://www.cisa.gov/stopransomware); also notify your cyber insurer and legal counsel *before* responding
- Elsewhere: your national CERT or cybercrime unit

### 5.6 Recovery

- Rebuild the machine cleanly (full reset or verified clean install) before restoring anything to it.
- Restore files from your offline backup ([7. Backups](#-7-backups-and-the-3-2-1-rule)) only after the machine is clean.
- On Windows, check shadow copies with `vssadmin list shadows` (admin Command Prompt) — usually wiped by the attacker, but worth 30 seconds.
- Last resort: file-carving tools like [TestDisk / PhotoRec](https://www.cgsecurity.org/) can sometimes recover deleted originals or partial copies. Low odds, but not zero.

### 5.7 Prevention

With ransomware, preparation decides everything:

- **Offline backups** are the only guaranteed cure — see [7. Backups and the 3-2-1 Rule](#-7-backups-and-the-3-2-1-rule).
- **Never expose RDP (port 3389) directly to the internet.** Use a VPN if you need remote access.
- **Email attachments:** verify the sender out-of-band before opening documents, especially invoices you weren't expecting.
- **Controlled folder access** (Windows) blocks untrusted apps from encrypting your documents — enable it in [8.8](#88-windows-hardening-checklist).
- **[Cyberscarecrow](https://www.cyberscarecrow.com)** — a free tool that deters human-operated ransomware by making your system look like a hardened, monitored target worth skipping.
- **Patch.** Most business intrusions begin with a known, unpatched vulnerability.

### 5.8 If This Is a Business Machine

Consumer advice stops applying the moment other people's data is involved:

- Isolate the machine from the network, but **do not power it off or wipe it** — evidence and legal duties now matter more than convenience.
- Call your cyber insurer and legal counsel *before* responding — some policies are voided by the wrong first move.
- Assume data theft (double extortion is the default) and prepare your disclosure obligations accordingly.
- Report to [CISA](https://www.cisa.gov/stopransomware) and [IC3](https://www.ic3.gov/), plus any sector-specific regulator.
- If the blast radius is more than one desk, engage a professional incident-response firm — this guide is for endpoints, not enterprises.

---

## 🕵️ 6. Info-Stealers

The most common consumer malware today. A stealer runs for a few seconds, empties your browser, and leaves — often with no visible sign at all.

### 6.1 What Info-Stealers Steal

- Saved **passwords** and browser **autofill** (including credit cards and addresses)
- **Session cookies** — this is the killer: cookies log the thief into your accounts *as you*, bypassing both your password and your 2FA
- **Crypto wallets** — browser extension wallets (MetaMask, Phantom) and desktop wallets (Exodus, Electrum)
- **Discord tokens** — full account access, including bypassing 2FA
- Telegram desktop sessions, SSH keys, screenshots, and system info

Assume that everything your browser has ever saved is gone the moment a stealer executes.

**Signs you were hit:**

- Browser sessions logged out everywhere, or "new sign-in" alerts you don't recognize
- A recovery email or phone changed on an account, or mail-forwarding rules you didn't create
- Crypto moved from a wallet you didn't touch
- Contacts receiving DMs you never sent

### 6.2 Families to Know

Well-known families include RedLine, Lumma (LummaC2), StealC, Vidar, Raccoon, Csteal, Creal, Lunar Stealer, Comet, and Blank Grabber (stealers), plus RATs that also steal: Remcos, Quasar, and AsyncRAT. When any of these names appears in a detection string or a sandbox report, treat it as a full-compromise event — not an adware-style nuisance.

### 6.3 Aftermath: The Reset Checklist

Do all of this **from a clean device** (your phone or a disinfected machine), in this order:

1. **Email account first.** It is the master key to everything else. Change the password, log out all sessions and devices, and check the recovery email, recovery phone, forwarding rules, and filters.
2. **Log out all sessions everywhere.** Most services have a "log out of all devices" button — use it.
3. **Change passwords** for banking, shopping, social media, gaming, and cloud accounts. Unique, generated, stored in a manager ([14. Passwords, 2FA, and Account Hygiene](#-14-passwords-2fa-and-account-hygiene)).
4. **Re-enroll 2FA.** Stealers grab TOTP seeds too. Set it up fresh, from the clean device.
5. **Rotate API keys and OAuth grants:** GitHub (Settings → Developer settings and Settings → Applications), Discord (deauthorize connected apps), Steam (revoke the API key and deauthorize all devices), and any cloud or exchange keys you hold.
6. **Crypto:** move funds to a brand-new wallet generated on a clean device. Assume every seed phrase and wallet file on the infected machine is burned.
7. **Warn your contacts.** Stolen accounts get used to send malware to your friends.
8. **Check past exposure:** [Have I Been Pwned](https://haveibeenpwned.com/).
9. Only return to the machine after [4. Incident Response](#-4-infected-right-now-incident-response) is complete — a reinfection re-steals your new credentials.

### 6.4 Further Reading

[The Ultimate Guide to Info-Stealers (rifteyy)](https://rifteyy.org/report/the-ultimate-guide-to-infostealers) — the definitive community write-up on stealer families, stolen "logs," and aftermath procedure. Strongly recommended reading.

---

## 💾 7. Backups and the 3-2-1 Rule

Prevention fails eventually. Backups are what turn a catastrophe into an inconvenience.

**The 3-2-1 rule:**

- **3** copies of your data — one primary, two backups
- **2** different types of media (internal + external, local + cloud)
- **1** copy offsite — another building, or the cloud

Plus the addition modern ransomware forces on you:

- **1 copy offline** — a USB drive or NAS snapshot that is *disconnected*. Ransomware encrypts plugged-in drives and network shares using your own credentials. Cloud sync is not a backup either: sync faithfully propagates the encrypted files over your good copies. You need point-in-time versioning (OneDrive/Dropbox previous versions, snapshot-based NAS shares) or a genuinely offline copy.

**Practical setups by platform**

| Platform | Good | Better |
| --- | --- | --- |
| Windows | File History to an external drive | Plus cloud with versioning and an offline drive rotated weekly |
| macOS | Time Machine to an external disk | Plus a second Time Machine destination |
| Linux | [Timeshift](https://github.com/linuxmint/timeshift) (system) | Plus [restic](https://restic.net/) or [Borg](https://www.borgbackup.org/) (files) pushed to remote storage |
| Android | Google's built-in backup | Plus local export of critical data |

**What actually needs backing up:** documents, photos, projects, browser bookmarks, 2FA backup codes, wallet seed phrases (stored encrypted and offline), and a list of your accounts with their recovery emails. Programs don't need backups — they can be reinstalled; your files can't.

**Test your restores.** Once a quarter, actually restore a folder and open the files. An untested backup is a hope, not a backup.

---

## 🪟 8. Windows

### 8.1 Built-in Defenses

Microsoft Defender (Windows Security) is a competent real-time engine that ships with the OS. Before reaching for third-party tools:

- Keep **real-time protection**, **cloud-delivered protection**, and **Tamper Protection** enabled.
- For stubborn infections, use the **Microsoft Defender Offline scan** (Windows Security → Virus & threat protection → Scan options → Microsoft Defender Offline scan). It reboots the PC and scans before Windows loads, where rootkits cannot defend themselves.
- Keep Windows Update current, including Defender definition updates.

### 8.2 The Cleaning Kit

Second-opinion scanners — no single engine catches everything. Run a full scan with Defender first, then one or two of these:

| Tool | Type | Notes |
| --- | --- | --- |
| [AdwCleaner](https://www.malwarebytes.com/adwcleaner) | PUP/adware remover | First step for browser hijacks, toolbars, and bundled junk |
| [Malwarebytes](https://www.malwarebytes.com) | On-demand scanner | Free on-demand cleanup; strong against PUPs |
| [HitmanPro](https://www.hitmanpro.com/en-us/downloads) | Second opinion (Sophos) | Behavioral and multi-cloud verdicts, 30-day free trial |
| [Norton Power Eraser](https://support.norton.com/sp/en/us/home/current/solutions/kb20100824120155EN) | Aggressive remover | Deep-set rogues; over-flags legitimate software too — review before deleting |
| [Kaspersky Total Security](<https://thepiratebay.party/torrent/75670819/Kaspersky_Total_Security_21.3.10.391___3_Months_License_(Limited_Time)_[AppDoze]>) · [mirror](https://1337x.to/torrent/6136427/Kaspersky-Total-Security-v21-3-10-391-3-months-License-Limited-Time-AppDoze/) | Full suite (torrent) | Free official alternative: [KVRT](https://www.kaspersky.com/downloads/free-virus-removal-tool) |
| [Bitdefender Total Security](https://1337x.to/torrent/4848020/Bitdefender-Total-Security-2021-v25-0-14-58-32-64-Bit-MultiLang-Method-to-always-get-180-or-90-days/) · [mirror](https://thepiratebay.party/torrent/34988238/Bitdefender_Total_Security_22.0.21.297___Instructions_for_Activa) | Full suite (torrent) | Official free trials are available at bitdefender.com |
| [The Second Opinion](https://jijirae.github.io/thesecondopinion/index.html) | Multi-engine helper | Runs several engines for a combined verdict |
| [Emsisoft Emergency Kit](https://www.emsisoft.com/en/emergency-kit) | Portable dual-engine kit | Fully portable, no installation |
| [KVRT](https://www.kaspersky.com/downloads/free-virus-removal-tool) | Free removal tool | Official Kaspersky on-demand cleaner, no install |
| [Rkill](https://www.bleepingcomputer.com/download/rkill/) | Process terminator | Run FIRST — it stops malicious processes so scanners can actually run; removes nothing itself |
| [Kaspersky recovery utilities](https://support.kaspersky.com/utility) | Rescue toolkit | Free system-recovery and file-decryption utilities |

**Torrent links:** the torrent links above (plus the HTTP Debugger link in [12.4](#124-dynamic-analysis-and-re)) require a BitTorrent client — [qBittorrent](https://www.qbittorrent.org/download) is a clean, open-source choice. All links here are user-submitted; scan whatever you download, every time.

### 8.3 Recommended Scanner Settings

- **One real-time engine at a time.** Running two full antivirus suites simultaneously causes conflicts, crashes, and *worse* detection. Uninstall the old one before installing a new one.
- In every scanner, enable: **PUP/PUA detection**, **rootkit detection**, **scan inside archives**, and cloud/behavioral detection.
- **Quarantine, don't delete, on the first pass.** Aggressive tools catch false positives — review the list before removing anything.
- Update definitions immediately before every scan.
- After cleaning, re-scan with a different engine until two consecutive full scans come back clean.

### 8.4 Built-in Triage Commands

Run these from an **elevated Command Prompt** (Start → type `cmd` → Run as administrator):

| Command | What it does |
| --- | --- |
| `mrt` (in a Win + R box) | Windows Malicious Software Removal Tool — Microsoft's scanner for widespread malware families |
| `sfc /scannow` | System File Checker — verifies and repairs corrupted or tampered Windows system files |
| `DISM /Online /Cleanup-Image /RestoreHealth` | Repairs the component store when SFC can't fix files |
| `ipconfig /flushdns` | Flushes a poisoned DNS cache (symptom: browsers going to wrong sites) |
| `vssadmin list shadows` | Lists restore points and shadow copies — ransomware usually wipes these |
| `netstat -bno` | Shows which executable owns each network connection — catch a RAT or miner phoning home (cross-check in [Process Explorer](https://learn.microsoft.com/en-us/sysinternals/downloads/process-explorer)) |
| `resmon` | Resource Monitor — find the process hammering disk or network (active ransomware, miners) |

### 8.5 The Full Cleaning Recipe

When a machine needs a proper cleaning, order matters. One pass through this sequence handles the overwhelming majority of consumer infections:

1. **Back up your documents first** — to a drive you then disconnect. Cleaning tools occasionally eat legitimate files.
2. **Disconnect from the internet.**
3. **Boot into Safe Mode** — Settings → System → Recovery → Advanced startup → Restart now → Troubleshoot → Advanced options → Startup Settings → Restart → press `4`. Most malware doesn't start in Safe Mode, so it can't fight back while you clean.
4. **Run [Rkill](https://www.bleepingcomputer.com/download/rkill/)** — stops active malicious processes and un-hijacks proxy and hosts-file settings so the next steps can run.
5. **[AdwCleaner](https://www.malwarebytes.com/adwcleaner): Scan → Clean**, then reboot when asked. Clears adware and PUPs.
6. **[Malwarebytes](https://www.malwarebytes.com): run a full scan**, remove everything it finds, reboot if asked.
7. **[HitmanPro](https://www.hitmanpro.com/en-us/downloads)** — a second engine's opinion on whatever survived.
8. Still suspicious? Back in normal Windows, trigger the **Microsoft Defender Offline scan** ([8.1](#81-built-in-defenses)) and let the machine reboot into it.
9. **Verify persistence is gone** with [Autoruns](https://learn.microsoft.com/en-us/sysinternals/downloads/autoruns) — anything the scanners left behind shows up there ([8.6](#86-manual-hunting)).
10. **Reboot normally, reconnect, update everything,** and run one final full scan with a different engine ([8.3](#83-recommended-scanner-settings)).
11. Then change passwords — from a clean device if this machine was online while infected ([6.3](#63-aftermath-the-reset-checklist)).

### 8.6 Manual Hunting

Automated scanners miss persistence. Malware that survives scans almost always lives in one of these places — check them in order:

1. **Task Manager → Startup apps** — anything unknown; right-click → *Open file location* to see where it actually lives.
2. **Task Scheduler** (`taskschd.msc`) — look for tasks launching from `%APPDATA%`, `%TEMP%`, or your Downloads folder. Legitimate software almost never does.
3. **Startup folders** — `Win + R` → `shell:startup` (your user) and `Win + R` → `shell:common startup` (all users). Anything you didn't put there?
4. **Registry autostart keys** (`regedit`):

<details>
<summary>Classic malware autostart locations in the registry</summary>

```
HKCU\Software\Microsoft\Windows\CurrentVersion\Run
HKLM\Software\Microsoft\Windows\CurrentVersion\Run
HKCU\Software\Microsoft\Windows\CurrentVersion\RunOnce
HKLM\Software\Microsoft\Windows\CurrentVersion\RunOnce
HKLM\Software\WOW6432Node\Microsoft\Windows\CurrentVersion\Run
HKLM\Software\Microsoft\Windows NT\CurrentVersion\Winlogon   (Shell and Userinit values)
HKLM\Software\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders
```

Look up any value you don't recognize, and cross-check names in [BleepingComputer's Startup Database](https://www.bleepingcomputer.com/startups/).
</details>

5. **The professional way — Sysinternals:**
   - [Autoruns](https://learn.microsoft.com/en-us/sysinternals/downloads/autoruns) — shows *every* autostart location in one list. Enable *Options → Hide Microsoft and Windows Entries*, then scrutinize what remains. Turn on the built-in VirusTotal check in *Options → Scan Options*.
   - [Process Explorer](https://learn.microsoft.com/en-us/sysinternals/downloads/process-explorer) — Task Manager with teeth. Purple entries are packed (suspicious), and you can submit any process to VirusTotal from the right-click menu.
6. **Red flags anywhere in the above:** a `svchost.exe` that is not in `C:\Windows\System32`, anything running from AppData/Temp/Downloads, scripts (`.vbs`, `.ps1`, `.bat`) at startup, scheduled tasks that re-download files, entries with no publisher or description.

**Video walkthroughs genuinely help.** Searching YouTube for "how to find a RAT with Process Explorer" or "Autoruns malware analysis" and following along in real time is far easier than working from text alone.

### 8.7 Last Resort: Reset and Reinstall

If anything still feels wrong after a full cleanup — or you found a RAT, rootkit, or bootkit — stop cleaning and reset:

- Settings → System → Recovery → **Reset this PC**, and choose **Remove everything** ("Keep my files" too often keeps the infection too).
- Better still: a clean install from USB made with Microsoft's [Media Creation Tool](https://www.microsoft.com/software-download/windows11).
- Beforehand, back up personal files (documents, photos, projects) — **not** programs. After reinstalling, scan those files before opening them, and change your passwords from a clean device ([6.3](#63-aftermath-the-reset-checklist)).

### 8.8 Windows Hardening Checklist

- [ ] Microsoft Defender on, with Tamper Protection and cloud-delivered protection
- [ ] **Show file name extensions** (Explorer → View → Show → File name extensions) — kills `invoice.pdf.exe`
- [ ] SmartScreen on, and its warnings taken seriously
- [ ] **Controlled folder access** (Windows Security → Ransomware protection) — blocks untrusted apps from encrypting your documents
- [ ] Core isolation → Memory integrity on
- [ ] BitLocker device encryption on laptops
- [ ] UAC at the default level or higher; use a standard account day-to-day
- [ ] Windows Update and Defender definitions current
- [ ] RDP never exposed directly to the internet
- [ ] A filtering DNS resolver configured ([2.5 DNS Filtering](#25-dns-filtering))

---

## 🍎 9. macOS

"Macs don't get viruses" stopped being true years ago. macOS malware is a real and growing category — recent examples include **Atomic macOS Stealer (AMOS)**, spread through fake Homebrew pages reached from search-engine ads. macOS is a smaller target, not an immune one.

### 9.1 Built-in Defenses

- **XProtect** — Apple's signature- and behavior-based scanner, updated silently in the background. Keep *System Settings → General → Software Update → Automatic* enabled so these updates arrive.
- **Gatekeeper** — blocks apps from unidentified, unnotarized developers (System Settings → Privacy & Security). Don't disable it system-wide; right-click → *Open* is the intended override for software you actually trust.
- **Malware Removal Tool (MRT)** — Apple's cleaner that removes known malware after detection. (Unrelated to the identically named `mrt.exe` on Windows.)
- **System Integrity Protection (SIP)** — protects system files from tampering. Check with `csrutil status` in Terminal; it should report *enabled*.
- **Notarization** — Gatekeeper requires apps to pass Apple's automated malware scans. Treat it as a filter, not a guarantee.

### 9.2 Cleaning Tools

| Tool | What it does |
| --- | --- |
| [Malwarebytes for Mac](https://www.malwarebytes.com/mac) | Full on-demand scan and cleanup, free tier |
| [KnockKnock](https://objective-see.org/tools.html) | Shows everything persistently installed — launch agents, daemons, login items, browser plugins, and more |
| [TaskExplorer](https://objective-see.org/tools.html) | Inspect running processes: what they're doing, who signed them, VirusTotal lookups |
| [BlockBlock](https://objective-see.org/tools.html) | Real-time alerts when anything tries to establish persistence |
| [LuLu](https://objective-see.org/tools.html) | Open-source firewall — catches malware phoning home and apps exfiltrating data |
| [ReiKey](https://objective-see.org/tools.html) | Detects keystroke monitoring (event-tap keyloggers) |
| [OverSight](https://objective-see.org/tools.html) | Alerts when apps access the microphone or camera |
| [RansomWhere?](https://objective-see.org/tools.html) | Ransomware tripwire — alerts on mass file-encryption behavior |
| [What's Your Sign](https://objective-see.org/tools.html) | Adds code-signature details to Finder's right-click menu |

All the Objective-See tools are free and open source — [objective-see.org/tools.html](https://objective-see.org/tools.html).

### 9.3 Manual Checks

```bash
# Persistence — anything you don't recognize?
ls -la ~/Library/LaunchAgents /Library/LaunchAgents /Library/LaunchDaemons

# What's loaded right now?
launchctl list | sort

# Suspicious processes and network connections
ps aux
lsof -i

# SIP should report "enabled"
csrutil status
```

`/System/Library/Launch*` is Apple's own — leave it alone.

Also check:

- **System Settings → General → Login Items** — the GUI view of persistence
- **Browser extensions** (Safari → Settings → Extensions, plus the Chrome/Firefox equivalents) — a favorite adware hiding spot
- **System Settings → General → VPN & Device Management** — configuration profiles you didn't install are a classic macOS attack technique; remove them

<details>
<summary>Advanced: Gatekeeper and quarantine attributes from the command line</summary>

```bash
spctl --status                            # Gatekeeper status: should say "assessments enabled"
xattr -l ~/Downloads/some-app.dmg         # look for the com.apple.quarantine flag
xattr -d com.apple.quarantine ~/Downloads/some-app.dmg   # remove it (what right-click → Open does under the hood)
```

Don't strip quarantine flags in bulk as a habit — the flag is what makes Gatekeeper prompt you at all.
</details>

### 9.4 macOS Hardening Checklist

- [ ] Automatic updates enabled (keeps XProtect definitions current)
- [ ] Firewall ON — it ships OFF (System Settings → Network → Firewall)
- [ ] FileVault encryption on
- [ ] Gatekeeper left at "App Store and identified developers"; avoid `spctl --master-disable`
- [ ] No unknown configuration profiles installed
- [ ] Browser ad blocker installed ([2.4 Ad Blockers](#24-ad-blockers))
- [ ] Time Machine backups running, with one destination kept offline ([7. Backups](#-7-backups-and-the-3-2-1-rule))

---

## 🐧 10. Linux

Linux desktop infections are rare, but Linux servers are among the most attacked machines on the internet — SSH brute force, cryptominers, botnets, web shells, and dependency supply-chain attacks (the 2024 XZ Utils backdoor shows how close that gets to home). The desktop checks below apply to servers too.

### 10.1 Scanners

| Tool | Type | Usage |
| --- | --- | --- |
| [ClamAV](https://www.clamav.net/downloads) | Antivirus engine | `sudo freshclam` then `clamscan -r --bell -i ~` |
| [rkhunter](https://rkhunter.sourceforge.net/) | Rootkit hunter | `sudo rkhunter --update && sudo rkhunter --check` |
| [chkrootkit](https://www.chkrootkit.org/download/) | Rootkit scanner | `sudo chkrootkit` |
| [Lynis](https://cisofy.com/lynis/) | Security auditor | `sudo lynis audit system` — detailed hardening report |

Notes:

- ClamAV is an on-demand scanner — it will check files for you, but it is not a real-time desktop shield.
- Run `rkhunter --propupd` only on a machine you already trust, or you will baseline an infected file list as "clean."
- ClamTk, a GUI front-end for ClamAV, is available in most distro repositories.

### 10.2 Manual Checks

Work through these on any suspicious machine:

```bash
# Cron — user and root
crontab -l
sudo crontab -l
ls -la /etc/cron.d /etc/cron.daily /etc/cron.hourly

# systemd — unknown services and timers
systemctl list-units --type=service --state=running
systemctl list-timers --all
find /etc/systemd/system ~/.config/systemd/user -type f -mtime -30

# Network — listening sockets you can't explain (miners, bots, reverse shells)
ss -tulpn
lsof -i

# SSH — keys you didn't add mean someone is coming back
cat ~/.ssh/authorized_keys
sudo ls -la /root/.ssh/ 2>/dev/null

# Accounts — only 'root' should have UID 0
awk -F: '$3 == 0 {print}' /etc/passwd

# DNS hijacks and hosts-file redirects
cat /etc/hosts
cat /etc/resolv.conf

# Immutable-bit abuse (blocks you from deleting malware files)
lsattr /etc/passwd /etc/shadow

# Recently modified system files
find /etc /var /home -type f -mtime -3 2>/dev/null | less

# Package integrity
debsums -s 2>/dev/null        # Debian/Ubuntu
rpm -Va 2>/dev/null           # Fedora/RHEL

# Login history
last -n 20
sudo lastb | head             # failed login attempts
```

A high load average with nothing visible in `top`/`htop` usually means a miner disguised under a kernel-thread name (fake `kworker`, names with trailing spaces), a rootkit, or a hidden process — treat that as rootkit territory.

Quick triage one-liner — executables modified in the last week, one filesystem, no pseudo-terminals:

```bash
find / -xdev -type f -executable -mtime -7 2>/dev/null
```

### 10.3 Compromised Servers: Rebuild, Don't Clean

If a server with network exposure is compromised, **do not clean it — rebuild it.** The attacker had root and time, and you cannot enumerate everything they changed. Standard procedure:

1. Snapshot or preserve the disks if forensics or legal action might matter.
2. Rotate every credential the machine ever touched: passwords, SSH keys, API tokens, database credentials. Assume your keys were read.
3. Rebuild from clean images, restore data (not binaries), and audit webroots for webshells before going back online.
4. Close the entry point: leaked credentials, an unpatched service, a vulnerable web app, or SSH exposed to the world.

### 10.4 Linux Hardening Checklist

- [ ] Updates applied now: `sudo apt update && sudo apt full-upgrade` (or your distro's equivalent)
- [ ] Automatic security updates enabled (`unattended-upgrades`)
- [ ] Firewall on, incoming denied by default: `sudo ufw default deny incoming && sudo ufw enable`
- [ ] SSH: key-only login, root login disabled, fail2ban installed
- [ ] Daily account is unprivileged; `sudo` only when needed
- [ ] AppArmor/SELinux not disabled
- [ ] Never run `curl ... | sudo bash` from random pages — download, read, then run
- [ ] Software from your distro's repos, Flathub, or the project's own release page — never "Linux download" aggregator sites
- [ ] Backups with [Timeshift](https://github.com/linuxmint/timeshift) (system) and restic/Borg (files) — one copy offline

---

## 🤖 11. Android

### 11.1 Play Protect

Google Play Protect scans every app from the Play Store and — critically — checks sideloaded APKs at install time. Turn it on:

- Play Store → profile icon → **Play Protect** → Settings (gear icon)
- Enable **Scan apps with Play Protect** and **Improve harmful app detection**
- Run a manual scan after installing anything new

### 11.2 Sideloading Risks

- Every APK installed from outside the Play Store bypasses Google's pre-publication review, and "free premium app" APK sites mostly serve repackaged apps with malware stitched in.
- If you must sideload, prefer [F-Droid](https://f-droid.org/) (open-source apps, reproducible builds) and scan every APK on [VirusTotal](https://www.virustotal.com/gui/home/upload) before installing.
- Never sideload banking, wallet, or 2FA apps. Ever.

### 11.3 Signs of Android Malware

- **Device admin apps:** Settings → Security → Device admin apps — an unknown app with admin rights cannot be uninstalled normally. Revoke first, then uninstall.
- **Accessibility abuse:** Settings → Accessibility — any non-accessibility app holding accessibility access is a keylogger, screen reader, and 2FA interceptor in one. Banking trojans (Anatsa, Hydra, and friends) live here.
- **Overlay permission** ("Display over other apps") granted to unknown apps — used to draw fake login screens over real banking apps.
- Unknown VPN profiles, a random app holding notification access, or Play Protect mysteriously disabled.
- Stalkerware indicators: odd battery drain, generic "system" apps you can't identify, and behavior that changed after someone physically had the device.

### 11.4 If Your Phone Is Infected

1. Revoke device admin from unknown apps, and revoke accessibility from anything that isn't an accessibility tool.
2. Uninstall the suspect app. If it refuses, boot into **safe mode** (hold power → long-press *Power off* → confirm, on most devices) and uninstall from there.
3. Run a full Play Protect scan.
4. Still misbehaving? **Factory reset.** It's the honest answer — mobile malware hides too well for manual cleaning.
5. Afterwards, from another device: run Google's [Security Checkup](https://myaccount.google.com/security-checkup), change your Google password, and re-secure your accounts ([6.3](#63-aftermath-the-reset-checklist)).

### 11.5 Android Hardening Checklist

- [ ] Play Store only; sideloading off (or F-Droid only)
- [ ] Play Protect on with both settings enabled
- [ ] Auto-update apps enabled
- [ ] Google account protected with app-based 2FA
- [ ] Find My Device enabled
- [ ] App permissions reviewed periodically — especially Accessibility, Display over other apps, Notification access, and Device admin
- [ ] Screen lock set and device encryption on (default on modern Android)

---

## 🧬 12. Advanced Analysis: VMs and Reverse Engineering

For when you want to know *what a file actually does* instead of just whether scanners dislike it. This is the deep end — work carefully.

### 12.1 Rules of the Lab

1. **Never analyze on your real machine.** One VM, one sample, disposable.
2. **Snapshot the clean VM state before detonation.** Revert afterwards. Every single time.
3. **Isolate the network.** NAT is acceptable when you need internet; host-only networking is safer when you don't.
4. **No real credentials in the lab.** Fake browser profiles, throwaway accounts, empty wallets.
5. Malware commonly checks for VM artifacts and refuses to run — that is exactly what the stealth tools below are for.

### 12.2 VM Stealth

- [VmwareHardenedLoader](https://github.com/hzqst/VmwareHardenedLoader) — patches VMware's VM artifacts so evasive samples actually execute
- [vbox_stealth](https://github.com/bRootForceSec/vbox_stealth) — hides VirtualBox indicators
- [smolvm](https://github.com/smol-machines/smolvm) — small, stealthy VM setups
- QEMU/KVM with customized CPU and SMBIOS values is a strong stealth base if you already run Linux

### 12.3 Static Analysis Tools

What a binary is, without running it:

| Tool | What it does |
| --- | --- |
| [capa](https://github.com/mandiant/capa) (Mandiant) | Detects capabilities — persistence, keylogging, credential theft, command-and-control — and reports them in plain English |
| [Detect It Easy](https://github.com/horsicq/Detect-It-Easy) | Identifies packers, compilers, and entropy — high entropy means packed, which means suspicious |
| [pestudio](https://www.winitor.com/download) | Malware initial assessment: indicators, imports, strings, VirusTotal scores |
| [PE-bear](https://github.com/hasherezade/pe-bear) | PE file structure inspector |
| [CyberChef](https://gchq.github.io/CyberChef/) | Decode base64, hex, and obfuscated strings and configs in the browser |
| `strings` (Linux) · [Sysinternals Strings](https://learn.microsoft.com/en-us/sysinternals/downloads/strings) (Windows) | Raw strings — hunt for URLs, mutexes, wallet paths, API endpoints |
| [YARA](https://virustotal.github.io/yara/) | Write and test detection rules against families |

### 12.4 Dynamic Analysis and RE

| Tool | Purpose |
| --- | --- |
| [x64dbg](https://x64dbg.com) | Free Windows debugger — step through unpacking and injection live |
| [IDA](https://hexrays.su) (unofficial mirror) · official free options: [IDA Free](https://hex-rays.com/ida-free) and [Ghidra](https://ghidra-sre.org/) | Disassembly and decompilation. Ghidra is the NSA's open-source suite; IDA Free is the official no-cost IDA |
| [Wireshark](https://www.wireshark.org) | Full packet capture — find the command-and-control traffic |
| [HTTP Debugger Pro](https://1337x.to/torrent/6703963/HTTP-Debugger-Pro-10-9-Incl-Keygen-KhanPC/) · [mirror](https://thepiratebay.bond/torrent/83100525/HTTP_Debugger_Pro_10.1___keygen) (torrent) | HTTP(S) traffic inspection. Free alternatives: [Fiddler Classic](https://www.telerik.com/fiddler/fiddler-classic), [mitmproxy](https://mitmproxy.org/), [Burp Suite Community](https://portswigger.net/burp/communitydownload) |

The torrent links need [qBittorrent](https://www.qbittorrent.org/download) — see the note in [8.2 The Cleaning Kit](#82-the-cleaning-kit).

### 12.5 Red-Flag Indicators

Strings and behaviors that mean credential theft, full stop:

- Family names in detections or configs: **Csteal, Creal, generic Stealer detections, Remcos, Quasar, Lunar Stealer, Comet, Blank Grabber** — and the list grows monthly
- Reading browser profile data (Chrome/Firefox `Login Data` and `Cookies` SQLite files, the `Local State` encryption key file)
- Enumerating wallet paths (MetaMask, Exodus, Electrum) and Discord's `Local Storage`/`leveldb` files
- Keylogging and screenshot APIs (`SetWindowsHookEx`, `GetAsyncKeyState`)
- Long sleeps and VM-check routines (anti-analysis behavior)
- Heavily obfuscated strings and high-entropy blobs wrapped around a tiny code footprint

**Do your research.** When you hit an indicator you don't recognize, look it up before deciding it's harmless — that habit is the entire skill.

Quick string hunt (Sysinternals `strings`, elevated prompt — see [12.3](#123-static-analysis-tools)):

```text
strings64.exe -nobanner sample.exe | findstr /i "http wallet discord telegram login config"
```

---

### 12.6 Worked Example: Triaging a Suspicious File

You downloaded `setup_premium_crack.exe` from a forum. Here is the full triage, without ever running it on your machine:

1. **Hash it first.** `certutil -hashfile setup_premium_crack.exe SHA256` (Windows) or `sha256sum` (Linux/WSL). Paste the hash into VirusTotal's search bar — identical files share hashes, and someone may have already uploaded it.
2. **VirusTotal verdict: 45/70 detections**, names like `Trojan:Win32/Lumma.Stealer`. Stop here. That's a stealer. Delete it, run a scan if you already executed it once ([4. Incident Response](#-4-infected-right-now-incident-response)).
3. **If detections were 0–2**, keep digging: [Detect It Easy](https://github.com/horsicq/Detect-It-Easy) reports entropy 7.9 and "UPX (modified)" — a repacked binary. Suspicious.
4. **[capa](https://github.com/mandiant/capa)** on the file lists capabilities: *capture keystrokes*, *persist via registry run key*, *connect to URL*. That's not an installer — it's a RAT with stealer behavior. Verdict: malicious.
5. **Optional sandbox confirmation** ([Triage](https://tri.age) or [ANY.RUN](https://any.run)): the sample spawns `cmd.exe`, drops a file into the Startup folder, and beaconed to a day-old domain. Confirmed.

The point of the workflow: you reached a verdict using evidence, without ever giving the file a chance to execute on a real machine. That's the habit that keeps you safe.

---

## 📚 13. Malware Glossary

| Term | What it is | Typical signs |
| --- | --- | --- |
| Adware / PUP | Pushes ads, hijacks homepage and search | Popups, new tabs, toolbars |
| Backdoor | Opens permanent re-entry access | Unexpected remote access |
| Bootkit | Rootkit infecting the boot process | Security tools disabled at boot, MBR tampering |
| Botnet | Your device enlisted in someone else's army | Strange traffic, slow internet |
| Clipper | Swaps clipboard content — mostly crypto addresses | Pasted wallet address differs from the copied one |
| Crypter / Packer | Obfuscates malware to defeat scanners | High entropy, generic AV verdicts |
| Dropper / Loader | Delivers and runs the real payload | Small signed executable downloading more |
| Fileless malware | Runs in memory only, nothing on disk | Scans come back clean, symptoms remain |
| Info-stealer | Steals passwords, cookies, wallets, tokens | Sessions stolen, drained accounts |
| Keylogger | Records keystrokes | Credentials leak while "safe" |
| Ransomware | Encrypts files for ransom | Renamed files, ransom notes |
| RAT | Remote access trojan — full remote control | Cursor moves alone, webcam light on |
| Rootkit | Hides deep in the OS (kernel or firmware) | Security tools disabled, files invisible |
| Scareware | Fake "infection" warnings to sell you junk | Aggressive popups, fake scans |
| Spyware / Stalkerware | Silent monitoring of your activity | Battery drain, unknown admin apps |
| Worm | Self-spreads across networks without your help | Multiple devices infected at once |
| Wiper | Destroys data with no ransom demanded | Files gone, systems unbootable |

**Jargon you'll meet in scanner reports and write-ups:**

| Term | Meaning |
| --- | --- |
| C2 (command and control) | The attacker's server that malware receives orders from and sends stolen data to |
| IOC (indicator of compromise) | A concrete artifact of an attack — a hash, domain, IP, or mutex you can search for |
| TTP | Tactics, techniques, and procedures — how a family operates |
| Hash | A file's fingerprint (MD5/SHA-1/SHA-256); identical files share hashes |
| Mutex | A named flag malware creates to avoid double-running — usable as a detection sign |
| Zero-day | A vulnerability exploited before any patch exists |
| FUD | "Fully undetected" — crypter marketing speak for evading scanners |
| RaaS | Ransomware-as-a-service — rented ransomware platforms with affiliates |
| EDR | Endpoint detection and response — business-grade behavioral security tooling |
| LOLBin | "Living off the land" — malware abusing legitimate system tools (PowerShell, certutil, and friends) |

---

## 🔑 14. Passwords, 2FA, and Account Hygiene

- **Use a password manager.** [Bitwarden](https://bitwarden.com/) (open source, cloud-synced) or [KeePassXC](https://keepassxc.org/) (local vault). A unique generated password for every account — reusing one password means one breach unlocks everything.
- **Prefer passkeys where offered.** Phishing-resistant, and they can't be stolen the way passwords and cookies are.
- **Turn on 2FA for everything important**, in this order of strength:
  1. Hardware key ([YubiKey](https://www.yubico.com/))
  2. Authenticator app (Aegis on Android, or your platform's built-in)
  3. SMS codes — last resort, vulnerable to SIM swaps
- **Remember that 2FA is not stealer-proof.** Session cookies and TOTP seeds get stolen along with everything else — re-enroll after any infection ([6.3](#63-aftermath-the-reset-checklist)).
- **Keep backup codes offline** — printed, in a drawer — not in a note on the desktop.
- **Check your exposure:** [Have I Been Pwned](https://haveibeenpwned.com/) tells you which known breaches included your email address.

---

## ❓ 15. Frequently Asked Questions

**Is Microsoft Defender enough?**
For everyday use combined with the habits in this guide: yes, it's a solid, integrated baseline. Add a second-opinion scan ([8.2](#82-the-cleaning-kit)) after anything sketchy. If you prefer a paid suite, pick exactly one — never run two real-time engines at once ([8.3](#83-recommended-scanner-settings)).

**Do I need antivirus on macOS or Linux?**
On macOS, the built-in defenses ([9.1](#91-built-in-defenses)) plus the Objective-See tools are plenty for most people. On Linux desktops, ClamAV for on-demand checks is usually enough — servers need hardening and monitoring far more than scanning ([10.4](#104-linux-hardening-checklist)).

**Is a VPN an antivirus?**
No. A VPN changes where your traffic exits the internet. It does not inspect, block, or remove anything. Marketing that implies otherwise is marketing.

**Does a factory reset or reinstall remove everything?**
Almost always, yes. The exceptions — firmware and bootkit-level implants — are rare and overwhelmingly targeted rather than commodity criminal malware. If you did find a bootkit, re-image the disk from a known-clean machine.

**Should I pay the ransom?**
No. See [5.3](#53-first-response-dos-and-donts) for why, and [5.4](#54-identify-and-try-to-decrypt) for what to try instead.

**Are password managers safe? What if they get breached?**
Far safer than reuse. Manager breaches leak encrypted vaults, while password reuse leaks plaintext credentials on every forum that ever gets popped. Use a strong master password plus 2FA on the vault.

"Someone offered to fix my PC remotely / my screen shows a support phone number." — Scam. See [3. Scam and Trap Awareness](#-3-scam-and-trap-awareness). Kill the browser, hang up, revoke the remote-access tool, run the [cleaning recipe](#85-the-full-cleaning-recipe), and change passwords from a clean device if you let them in.

**Is torrenting itself dangerous?**
The protocol isn't; the ecosystem can be. Verify uploaders ([2.6](#26-safe-downloading-habits)), scan everything before running it ([2.1](#21-online-scanners-and-sandboxes)), and prefer [qBittorrent](https://www.qbittorrent.org/download) plus reputable uploaders over random mirrors.

---

## 🆘 16. Getting Help

- **Free, guided malware removal:** [BleepingComputer Forums](https://www.bleepingcomputer.com/forums/) — trained helpers walk you through log analysis and cleanup at no charge.
- **Guides and tools:** [MalwareTips](https://malwaretips.com/) removal guides; BleepingComputer's [downloads](https://www.bleepingcomputer.com/download/) and virus removal guides.
- **Communities:** [r/Malware](https://www.reddit.com/r/Malware/) and [r/techsupport](https://www.reddit.com/r/techsupport/) on Reddit.
- **Ransomware:** [ID Ransomware](https://id-ransomware.malwarehunterteam.com/), [No More Ransom](https://www.nomoreransom.org/en/decryption-tools.html), and [Emsisoft's decryptors](https://www.emsisoft.com/en/ransomware-decryption) ([5.4](#54-identify-and-try-to-decrypt)).
- **Info-stealer deep-dive:** [The Ultimate Guide to Info-Stealers](https://rifteyy.org/report/the-ultimate-guide-to-infostealers).
- **Safe downloading references:** [FMHY](https://fmhy.net/) and its [Unsafe Sites list](https://fmhy.net/unsafe) ([2.6](#26-safe-downloading-habits)).
- **Second opinion on a sample:** send it to the repo owner, **jazminethecooles2001** (Discord user ID `1234018959167324220`, handle `@jazminethecooles2001`), for an informal read on whether the file is hostile.
- **Repo owner's resource pack:** [gofile.io/d/u3iNtZ](https://gofile.io/d/u3iNtZ).

**How to ask for help well** (applies to every forum above):

- List your OS and version, and what happened, in order.
- Say which tools you have already run and what they found.
- Helpers will usually ask for logs — on Windows, the Farbar Recovery Scan Tool (FRST) is the standard — attach the log files themselves, not screenshots.
- Don't keep running random fixes from comment threads while you wait; it muddies the evidence a helper needs.

---

## ⚖️ 17. Disclaimer and Contributing

**Disclaimer.** This guide is educational. Tools and links are provided as-is and are user-submitted; several are torrents or community mirrors — verify everything you download before running it (that's rule 1). No single tool catches everything, and no guide replaces professional incident response. Use your judgment, and when a situation exceeds it, get help ([16. Getting Help](#-16-getting-help)).

**Contributing.** Found a dead link, a better tool, or a new scam pattern? Pull requests are welcome — this document stays accurate through the same community it was written for.

If this guide saved your PC, a ⭐ on the repo helps the next person find it before their files do the finding.
