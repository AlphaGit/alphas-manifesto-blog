---
title: Obsidian-iCloud sync
subtitle: Keep your notes in sync
categories:
  - Tools
tags:
  - Tools
  - Automation
header:
  image: assets/2024-03-24-obsidian-icloud-sync/Obsidian-iCloud-sync.webp
  image_description: Obsidian-iCloud sync header image
description: >-
  The approach to use iCloud to sync your Obsidian vaults across devices.
excerpt_separator: <!--more-->
---

For a few years now I've been using [Obsidian as my second brain]({{ site.baseUrl }}{% link _posts/2022/2022-04-11-obsidian.md %}). The magic of Obsidian is that it's only a bunch of markdown files and a clever editor on top of it. This means that any file-syncing solution should be good enough. But the truth is a little bit more complicated than that.

<!-- more -->

## The use case

I maintain three different vaults. One of them is for my personal things, notes, contacts, appointments, and chores. The second one is for work, where I keep meeting my activity journal, notes, project details, plans, and general troubleshooting procedures. Finally, the third one is the one that serves [my digital garden](https://techgarden.alphasmanifesto.com/) publicly.

I currently use iCloud for file syncing and some sort of backup. Yes, I know it is not strictly a backup mechanism: if you delete a file in iCloud it's removed from everywhere, but if your computer expires tomorrow, you'll be happy you've been saving your stuff under the iCloud drive.

Also, I need access to my information when on the go. Sometimes I'm using another computer and even if I'm not working, I need to check something. Sometimes I'm out and I only have access to my phone and I need to add something to my pool of knowledge.

However, a very common problem with it is that, as your vault grows, iCloud will keep de-prioritizing that folder to be kept on disk. It will only keep references to them and download them on demand, which sounds transparent enough but doesn't work quite well with Obsidian. It makes it slow, and it prevents search and some plugins from operating properly.

Deactivating "Optimize my Mac" (which drives this behaviour) might not be an option if you don't want your full iCloud to be stored locally.

iCloud for Windows has a [Pin Folder functionality](https://support.apple.com/en-ca/guide/icloud-windows/icw8531ad6b7/icloud) that will ensure a selected folder stays locally even though the rest of them might now. Why this is not available to MacOS, it's a mystery to most of the internet. ¯\\_(ツ)_/¯

## The solution

The `brctl` command (bird service control center) will allow us to download files and folders from iCloud, and it nudges it in the direction of keeping the folder downloaded for a bit.

```bash
#!/bin/bash
download_icloud_folder() {
    # Retrieve the first parameter as the folder to download
    local folder="$1"

    # Check that the parameter is not empty and that the folder exists
    if [ -z "$folder" ] || [ ! -d "$folder" ]; then
        echo "The folder \"$folder\" does not exist"
        return 1
    fi

    find "$folder" -type f -exec brctl download "{}" \;
}

# Check if the script was invoked directly
if [ "${BASH_SOURCE[0]}" == "${0}" ]; then
    download_icloud_folder "$@"
fi
```

(Source: [AlphaGit/dotfiles - download-icloud-folder.sh](https://github.com/AlphaGit/dotfiles/blob/main/functions/download-icloud-folder.sh))

What I've done is create a cronjob that every hour will just ask `brctl` to keep that folder downloaded, and it has worked wonders for me. 

To install this into my regular cronjob, I have added the following to my `install.sh` script:

```bash
if [ ! -d "$HOME" ]; then
    HOME=$(eval echo ~)
fi
ESCAPED_HOME=$(echo $HOME | sed 's/\//\\\//g')

# Install cron jobs
crontab -l | cat - $SCRIPT_DIR/.alpha_crontab | sed -e "s/\\\$HOME/$ESCAPED_HOME/g" | sort -r | uniq | crontab -
```

(Source: [AlphaGit/dotfiles - install.sh](https://github.com/AlphaGit/dotfiles/blob/main/install.sh))

This is very simple: it gets or detects the `$HOME` location to use, it escapes the slashes in it (replacing `/` with `\/`), and then it adds the existing contents of the `crontab file` to the `.alpha_crontab` file, replacing the `$HOME` text with the contents detected before and storing it in crontab again.

What's the content of the `.alpha_crontab` file, you ask? Very simple:

```
TZ=America/Toronto
2 * * * * $HOME/functions/download-icloud-folder.sh $HOME/Library/Mobile\ Documents/iCloud~md~obsidian
```

(Source: [AlphaGit/dotfiles - .alpha_crontab](https://github.com/AlphaGit/dotfiles/blob/main/.alpha_crontab))

### Design choices

There are a few choices that I had to make that are not quite intuitive.

#### It runs periodically

As I mentioned, iCloud does not comply with your decision to keep a folder downloaded, but it will comply with downloading it once you specify it. `brctl` works better for downloading than the UI features provided by iCloud and Finder.

The timeframe can be adjusted to your liking, I've found that doing this every hour has been a sweet spot for me. It depends on how frequently you return to Obsidian and how frequently you use the space on your disk (which would prompt iCloud to offload some of the folders out).

#### It needs to use absolute paths

As I have been working on my [dotfiles repository](https://github.com/AlphaGit/dotfiles) for a while, most of what I can make relative is better, as it will adapt to different setups and even different people. However, `cron` is not able to properly execute the commands on relative paths, or even use `~`, so I used 

#### It needs to iterate on files

While `brctl` claims to have support on folders, my practical tests showed that operating on files directly will trigger the download right away. I have no explanation for that one.

Also, I could not find a way to properly pass multiple files at once (not that it would be feasible anyway, unless it accepted glob parameters which I highly doubt). The `download` command is undocumented at the moment.

## Other solutions

There are other solutions which cover this particular problem. They might be the solution for you, but they weren't the right one for me.

### Obsidian Sync

This seems to be the best alternative so far. Some people in Reddit do complain about faulty sync and issues with merging files when they are changed in multiple places, but aside from that, it's the official solution from the Obsidian team, and even if it's not perfect, it's a way to support the efforts behind Obsidian.

(Link: [Obsidian Sync](https://obsidian.md/sync))

### Dropbox

Dropbox already has this problem solved, their synchronization between computers works wonderfully and you can specify some folders to be kept on your device.

However, I moved away from DropBox a bit ago because most of the Apple environment gives preferences to their photos which would be in iCloud anyway, and their prices are comparable.

Finally, note that if your vault is in an arbitrary location (which is usually the case with DropBox), then the Obsidian mobile apps won't be able to read the vaults from there. In using iCloud, Obsidian decides where the folder is located but I'm free to add as many vaults as I like in it. After all, it's files all the way down.

## Git

Some people use git to sync which not only keeps a copy of their files around, it also gives them version history. I did not explore this option because it would require me to go out of the app, add, commit, push, and remember to pull and merge every time I switch to another option. As I mentioned, I usually write notes "right away", so it's not the solution for me.