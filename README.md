# MTA:SA VIP System

A lightweight and expandable VIP system for Multi Theft Auto: San Andreas (MTA:SA) servers. This resource uses SQLite (`registry.db`) to store VIP player data based on their serial. It is built as a solid foundation that can be easily extended with additional perks, GUI panels, or shop integration.

---

## 🎯 Features

- Uses local SQLite database (no external setup required)
- Stores VIP data by player serial
- Assigns VIP for a specific number of days
- Automatically checks VIP status on player login
- Admin command to grant VIP
- Simple and clean codebase for easy modifications

---

## 📁 Resource Structure

---

## 🚀 Installation Guide

1. Download or clone this repository.
2. Place the `vip_system` folder into your MTA:SA server's `resources/` directory.
3. Add the resource to your `mtaserver.conf` **or** start it manually:

4. Use `/addvip` command in-game to grant VIP status to players.

---

## 📜 Usage

### 🔹 Grant VIP to Player
Use the following command as an admin:
📌 Example: /addvip JohnDoe 30

This will grant **30 days** of VIP access to the player named `JohnDoe`.

---

## 🧠 How It Works

- When the resource starts, it creates a table called `vip_players` in `registry.db` if it doesn't exist.
- Each player’s **serial** is used as a unique identifier.
- VIP expiration is stored as a **UNIX timestamp**.
- On player login, the server checks if the player is still VIP and notifies them accordingly.

---

## 🛠️ SQLite Database Schema

```sql
CREATE TABLE vip_players (
    serial TEXT PRIMARY KEY,
    vip_until INTEGER
);
```
