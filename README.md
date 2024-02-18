<br/>
<p align="center">
  <a href="https://github.com/swiftly-solution/swiftly_skins">
    <img src="https://media.discordapp.net/attachments/979452783466000466/1168236894652469248/Swiftly_Logo.png?ex=6575f264&is=65637d64&hm=dd2834983bebeab98d7febd44bb3bd20e9aded13ecefac63cc990b222a9d9e9e&=&format=webp&quality=lossless&width=468&height=468" alt="Logo" width="80" height="80">
  </a>

  <h3 align="center">[Swiftly] Skins (PoC)</h3>

  <p align="center">
    A simple plugin for Swiftly that changed the skins and player models.
    <br/>
    <br/>
    <a href="https://github.com/swiftly-solution/swiftly_skins/issues">Report Bug</a>
    .
    <a href="https://github.com/swiftly-solution/swiftly_skins/issues">Request Feature</a>
  </p>
</p>

![Downloads](https://img.shields.io/github/downloads/swiftly-solution/swiftly_skins/total) ![Contributors](https://img.shields.io/github/contributors/swiftly-solution/swiftly_skins?color=dark-green) ![Issues](https://img.shields.io/github/issues/swiftly-solution/swiftly_skins) ![License](https://img.shields.io/github/license/swiftly-solution/swiftly_skins) 

### Installation 👀

1. Download the newest [release](https://github.com/swiftly-solution/swiftly_skins/releases).
2. Everything is drag & drop, so i think you can do it!
3. Setup database connection in `addons/swiftly/configs/databases.json` with the key `skin_changer` like in the following example:
```json
{
    "skin_changer": {
        "hostname": "...",
        "username": "...",
        "password": "...",
        "database": "...",
        "port": 3306
    }
}
```
(!) Don't forget to replace the `...` with the actual values !!

### Configuring the plugin 🧐

* After installing the plugin, you need to change the prefix from `addons/swiftly/configs/plugins` (optional) and if you want, you can change the messages from `addons/swiftly/translations`.

### Adding Admins ⚙️

* To add admins on server, you need to add a new row in admin tables set in `addons/swiftly/configs/plugin/admins.json` respecting the following conditions:

```
steamid => SteamID 64 of the player
flags => The flags provided below (example: abcd)
immunity => A number greater or equal than 0
```

* Or, you can use `sw_addadmin` in server console, respecting the following conditions:

```
steamid => SteamID 64 of the player
flags => The flags provided below (example: abcd)
immunity => A number greater or equal than 0
```

### Commands 💬

* Base commands provided by this plugin:

|      Command     |        Flag       |               Description              |
|:----------------:|:-----------------:|:--------------------------------------:|
|   !reloadadmins  |    ADMFLAG_ROOT   |        Reload admins on server.        |
|     !addadmin    |       CONSOLE     |        Adds an admin on server.        |
|   !removeadmin   |       CONSOLE     |    Removes an admin from the server.   |
|       !rcon      |    ADMFLAG_RCON   |      Executes a command on server.     |
|       !slay      |    ADMFLAG_SLAY   |             Kills a player.            |
|       !slap      |    ADMFLAG_SLAY   |             Slaps a player.            |
| !map / !changemap | ADMFLAG_CHANGEMAP |       Changes the map on server.       |
|       !chat      |    ADMFLAG_CHAT   |     Sends a message on admin chat.     |
|       !csay      |    ADMFLAG_CHAT   |   Sends a centered message on server.  |
|       !say       |    ADMFLAG_CHAT   |       Sends a message on server.       |
|       !psay      |    ADMFLAG_CHAT   |         Sends a private message        |
|       !mute      |    ADMFLAG_CHAT   |        Mutes a player on voice.        |
|      !unmute     |    ADMFLAG_CHAT   |       Unmutes a player on voice.       |
|       !gag       |    ADMFLAG_CHAT   |         Mutes a player on chat.        |
|      !ungag      |    ADMFLAG_CHAT   |        Unmutes a player on chat.       |
|     !silence     |    ADMFLAG_CHAT   |    Mutes a player on voice and chat.   |
|    !unsilence    |    ADMFLAG_CHAT   |   Unmutes a player on voice and chat.  |
|       !ban       |    ADMFLAG_BAN    | Bans a player from joining the server. |
|      !unban      |   ADMFLAG_UNBAN   |            Unbans a player.            |
|       !kick      |    ADMFLAG_KICK   |     Kicks a player from the server.    |

### Creating A Pull Request 😃

1. Fork the Project
2. Create your Feature Branch
3. Commit your Changes
4. Push to the Branch
5. Open a Pull Request

### Have ideas? 💡
Join [Swiftly Discord Server](https://swiftlycs2.net/discord)!
