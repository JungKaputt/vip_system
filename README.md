# MTA:SA VIP System

A lightweight and extendable VIP system for Multi Theft Auto: San Andreas (MTA:SA) servers. This resource uses SQLite (`registry.db`) to store and manage VIP player data based on their serial. It provides a clean foundation that can be expanded with more advanced VIP features.

---

## 🎯 Features

- Local SQLite storage (no MySQL required)
- Assigns VIP status to players for a number of days
- Automatically checks VIP validity on player login
- Admin command to grant VIP status
- Easily extendable structure for adding more VIP perks

---

## 🛠️ Database Schema

The system creates a single table in `registry.db`:

```sql
CREATE TABLE vip_players (
    serial TEXT PRIMARY KEY,
    vip_until INTEGER
);
```

serial: Unique identifier for each player

vip_until: UNIX timestamp of VIP expiration

📦 Commands
Command	Description
/addvip [playerName] [days]	Assigns VIP status for [days] days to a player by name
Example: /addvip John_Doe 30 — Grants John_Doe 30 days of VIP access.

🚀 Installation
Download or clone this repository.

Place the folder into your resources directory.

Start the resource:

via mtaserver.conf, or

in-game using start vip_system

Use /addvip in-game to assign VIP status.

🧩 Suggested Future Features
VIP perks (vehicles, skins, money, access to special areas)

Daily VIP rewards

GUI panel to show VIP time remaining

Automatic expiration warnings

Donation-based auto-assignment

📜 License
This resource is open-source and free to use. Attribution is appreciated but not required.

🤝 Contributing
Pull requests and suggestions are welcome. Feel free to fork this repository and improve it with additional features or bug fixes.

