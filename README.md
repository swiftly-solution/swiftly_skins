<p align="center">
  <a href="https://github.com/swiftly-solution/swiftly_skins">
    <img src="https://cdn.swiftlycs2.net/swiftly-logo.png" alt="SwiftlyLogo" width="80" height="80">
  </a>

  <h3 align="center">[Swiftly] Skins (PoC)</h3>

  <p align="center">
    A simple plugin for Swiftly that changed the skins and player models.
    <br/>
  </p>
</p>

<p align="center">
  <img src="https://img.shields.io/github/downloads/swiftly-solution/swiftly_skins/total" alt="Downloads"> 
  <img src="https://img.shields.io/github/contributors/swiftly-solution/swiftly_skins?color=dark-green" alt="Contributors">
  <img src="https://img.shields.io/github/issues/swiftly-solution/swiftly_skins" alt="Issues">
  <img src="https://img.shields.io/github/license/swiftly-solution/swiftly_skins" alt="License">
</p>

---


> [!CAUTION]
> This plugin is not following the CS2 Server Guidelines. Use it at your own risk.
>
> Usage of this plugin may result in a GSLT ban.
>
> CS2 Server Guidelines: [Click](https://blog.counter-strike.net/index.php/server_guidelines/)
>
> We **DO NOT SUPPORT** the usage of a plugin which is not following the Server Guidelines.

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

4. Install the [Latest release of the Website](https://github.com/swiftly-solution/swiftly_skins_web/releases/latest) so that you can change your skins.

### Configuring the plugin 🧐

* After installing the plugin, you need to change the prefix from `addons/swiftly/configs/plugins` (optional) and if you want, you can change the messages from `addons/swiftly/translations`.

### Creating A Pull Request 😃

1. Fork the Project
2. Create your Feature Branch
3. Commit your Changes
4. Push to the Branch
5. Open a Pull Request

### Have ideas/Found bugs? 💡
Join [Swiftly Discord Server](https://swiftlycs2.net/discord) and send a message in the topic from `📕╎plugins-sharing` of this plugin!
