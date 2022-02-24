[![Contributors][contributors-shield]][contributors-url]
[![Forks][forks-shield]][forks-url]
[![Stargazers][stars-shield]][stars-url]
[![Issues][issues-shield]][issues-url]

<!-- PROJECT LOGO -->
<br />
<p align="center">
  <img src="https://factorio.com/static/img/factorio-logo.png" alt="Logo" height="60">

  <h3 align="center">factorio-server</h3>

  <p align="center">
    Docker setup for a factorio-server
    <br />
    <br />
    ·
    <a href="https://github.com/beuluis/factorio-server/issues">Report Bug</a>
    ·
    <a href="https://github.com/beuluis/factorio-server/issues">Request Feature</a>
  </p>
</p>

<!-- ABOUT THE PROJECT -->

## About The Project

Small docker setup for a factorio-server.

<!-- GETTING STARTED -->

## Getting Started

To get a copy up and running follow these simple steps.

### Prerequisites

- [Docker](https://docs.docker.com/get-docker/)
- [Docker Compose](https://docs.docker.com/compose/install/)

### Installation

1. Clone the repo

```sh
git clone https://github.com/beuluis/factorio-server.git
```

2. Start docker-compose

```sh
docker-compose up --build
```

### Customization

1. Create a `.env` file

```sh
touch .env
```

2. Overwrite variables as you like (format: `{variable name}={variable value}`)

Reference: [Config Example](https://github.com/GameServerManagers/Game-Server-Configs/blob/master/Factorio/server-settings.json)

| Variable                             | Description                                                                                                                                                                                                                                                                                                                                                                                                                            | Default value                                             | Required |
| ------------------------------------ | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------- | -------- |
| `ADMINLIST`                          | List of admins separated by `,`                                                                                                                                                                                                                                                                                                                                                                                                        | `none`                                                    | false    |
| `WHITELIST`                          | List of whitelisted players separated by `,`                                                                                                                                                                                                                                                                                                                                                                                           | `none`                                                    | false    |
| `SERVER_NAME`                        | Name of the game as it will appear in the game listing                                                                                                                                                                                                                                                                                                                                                                                 | `Name`  | false    |
| `SERVER_DESC`                        | Description of the game that will appear in the listing                                                                                                                                                                                                                                                                                                                                                                                | `Description` | false    |
| `MAX_PLAYER`                         | Maximum number of players allowed, admins can join even a full server. 0 means unlimited.                                                                                                                                                                                                                                                                                                                                              | `0`                                                       | false    |
| `VISIBILITY_PUBLIC`                  | Game will be published on the official Factorio matching server                                                                                                                                                                                                                                                                                                                                                                        | `false`                                                   | false    |
| `VISIBILITY_LAN`                     | Game will be broadcast on LAN                                                                                                                                                                                                                                                                                                                                                                                                          | `true`                                                    | false    |
| `FACTORIO_USERNAME`                  | Your factorio.com username. Required for games with visibility public                                                                                                                                                                                                                                                                                                                                                                  | `none`                                                    | true     |
| `FACTORIO_TOKEN`                     | Your factorio.com token.                                                                                                                                                                                                                                                                                                                                                                                                               | `none`                                                    | true     |
| `REQUIRE_USER_VERIFICATION`          | When set to true, the server will only allow clients that have a valid Factorio.com account                                                                                                                                                                                                                                                                                                                                            | `true`                                                    | false    |
| `MAX_UPLOAD_KBPS`                    | optional, default value is 0. 0 means unlimited.                                                                                                                                                                                                                                                                                                                                                                                       | `0`                                                       | false    |
| `MAX_UPLOAD_SLOT`                    | optional, default value is 5. 0 means unlimited.                                                                                                                                                                                                                                                                                                                                                                                       | `5`                                                       | false    |
| `MINIMUM_LATENCY`                    | optional one tick is 16ms in default speed, default value is 0. 0 means no minimum.                                                                                                                                                                                                                                                                                                                                                    | `0`                                                       | false    |
| `IGNORE_LIMIT_FOR_RETURNING_PLAYERS` | Players that played on this map already can join even when the max player limit was reached.                                                                                                                                                                                                                                                                                                                                           | `false`                                                   | false    |
| `ALLOW_COMMANDS`                     | possible values are, true, false and admins-only                                                                                                                                                                                                                                                                                                                                                                                       | `admins-only`                                             | false    |
| `AUTOSAVE_INTERVAL`                  | Autosave interval in minutes                                                                                                                                                                                                                                                                                                                                                                                                           | `10`                                                      | false    |
| `AUTOSAVE_SLOTS`                     | server autosave slots, it is cycled through when the server autosaves.                                                                                                                                                                                                                                                                                                                                                                 | `5`                                                       | false    |
| `AFK_KICK_INTERVAL`                  | ow many minutes until someone is kicked when doing nothing, 0 for never.                                                                                                                                                                                                                                                                                                                                                               | `0`                                                       | false    |
| `AUTO_PAUSE`                         | Whether should the server be paused when no players are present.                                                                                                                                                                                                                                                                                                                                                                       | `true`                                                    | false    |
| `ONLY_ADMINS_CAN_PAUSE`              | Only admins can pause the game                                                                                                                                                                                                                                                                                                                                                                                                         | `true`                                                    | false    |
| `AUTOSAVE_ONLY_SERVER`               | Whether autosaves should be saved only on server or also on all connected clients. Default is true.                                                                                                                                                                                                                                                                                                                                    | `true`                                                    | false    |
| `NON_BLOCKING_SAVE`                  | Highly experimental feature, enable only at your own risk of losing your saves. On UNIX systems, server will fork itself to create an autosave. Autosaving on connected Windows clients will be disabled regardless of autosave_only_on_server option.                                                                                                                                                                                 | `false`                                                   | false    |
| `MIN_SEGMENT_SIZE`                   | Long network messages are split into segments that are sent over multiple ticks. Their size depends on the number of peers currently connected. Increasing the segment size will increase upload bandwidth requirement for the server and download bandwidth requirement for clients. This setting only affects server outbound messages. Changing these settings can have a negative impact on connection stability for some clients. | `25`                                                      | false    |
| `MIN_SEGMENT_SIZE_PEER_COUNT`        | Long network messages are split into segments that are sent over multiple ticks. Their size depends on the number of peers currently connected. Increasing the segment size will increase upload bandwidth requirement for the server and download bandwidth requirement for clients. This setting only affects server outbound messages. Changing these settings can have a negative impact on connection stability for some clients. | `20`                                                      | false    |
| `MAX_SEGMENT_SIZE`                   | Long network messages are split into segments that are sent over multiple ticks. Their size depends on the number of peers currently connected. Increasing the segment size will increase upload bandwidth requirement for the server and download bandwidth requirement for clients. This setting only affects server outbound messages. Changing these settings can have a negative impact on connection stability for some clients. | `10`                                                      | false    |
| `MAX_SEGMENT_SIZE_PEER_COUNT`        | Long network messages are split into segments that are sent over multiple ticks. Their size depends on the number of peers currently connected. Increasing the segment size will increase upload bandwidth requirement for the server and download bandwidth requirement for clients. This setting only affects server outbound messages. Changing these settings can have a negative impact on connection stability for some clients. | `20`                                                      | false    |

<!-- CONTRIBUTING -->

## Contributing

Contributions are what make the open source community such an amazing place to learn, inspire, and create. Any contributions you make are **greatly appreciated**.

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3. Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the Branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

<!-- CONTACT -->

## Contact

Luis Beu - me@luisbeu.de

<!-- MARKDOWN LINKS & IMAGES -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->

[contributors-shield]: https://img.shields.io/github/contributors/beuluis/factorio-server.svg?style=flat-square
[contributors-url]: https://github.com/beuluis/factorio-server/graphs/contributors
[forks-shield]: https://img.shields.io/github/forks/beuluis/factorio-server.svg?style=flat-square
[forks-url]: https://github.com/beuluis/factorio-server/network/members
[stars-shield]: https://img.shields.io/github/stars/beuluis/factorio-server.svg?style=flat-square
[stars-url]: https://github.com/beuluis/factorio-server/stargazers
[issues-shield]: https://img.shields.io/github/issues/beuluis/factorio-server.svg?style=flat-square
[issues-url]: https://github.com/beuluis/factorio-server/issues
[license-shield]: https://img.shields.io/github/license/beuluis/factorio-server.svg?style=flat-square
