# audio-angel

A service to keep audio channels alive on Linux

## Install

#### Dependencies

- FFmpeg - The installer will install FFmpeg if it is not already installed

- systemd/systemctl - Must be installed on the target system before running the installer

#### Arch, Fedora, Debian, Brew

```shell
curl -LsSf https://thxrn13.8d6.org/audio-angel | sh
```

#### Manual Installation

cURL the service file to systemd user directory

```shell
curl -LsSf https://github.com/thxrn13/audio-angel/blob/main/audio-angel.service --output ~/.config/systemd/user/audio-angel.service
```

Start and enable the service using systemctl

```shell
systemctl --user enable --now audio-angel.service
```
