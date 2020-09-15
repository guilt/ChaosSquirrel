# Chaos Squirrel

Like Netflix's Chaos Monkey, packaged to run standalone.

## Installation from Source Code

When installing from Git/Source, use:

```bash
ln -sf $(pwd)/chaos /usr/local/bin/chaos
```

## Install RPMs for your Distribution

Download the RPM Packages from [this link](https://software.opensuse.org//download.html?project=home%3Aguilt&package=ChaosSquirrel).

## Install DEBs for your Distribution

Download the DEB Packages from [this link](https://software.opensuse.org//download.html?project=home%3Aguilt&package=chaossquirrel).

## How to Run

Once installed, you invoke it with this one command:

```bash
chaos
```

This will run every Monkey. Be prepared to turn off this VM/System once you invoke it.

## How to Run a Specific Monkey

For instance, to **burn the CPU**, and nothing else, you'd run:

```bash
chaos burncpu
```

## Feedback and Improvements

Send all feedback and comments to <karthikkumar@gmail.com>. Pull Requests 
and Improvements are welcome.
