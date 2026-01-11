---
title: A personal media server
subtitle: How to choose, set up and use a personal media server
categories:
  - Technology
  - Tools
tags:
  - software
  - open-source
  - multimedia
header:
  image: assets/alpha/Headphones.jpg
  image_description: Dance to the music!
description: Setting up a media server, step by step.
excerpt_separator: <!--more-->
---

In the last few weeks, I set up my own media server to replace a particular service I did not want to pay anymore. It felt like a huge chore with lots of options but it's not so difficult once you get into it.

Here's my journey and hopefully it's useful to you too.

<!--more-->

## What's a media server?

A media server is pretty much what you'd expect from its name: a server (software or hardware), dedicated to hosting and serving media (music, video, books, etc.) to other clients. You could say, in a way, that the major multimedia companies like streaming services are media servers of their own.

## Why make one yourself?

Simply put: I got tired of paying for a sub-optimal service. Without giving any names (but you know here's one more reason I will never name my dog "Spot"), most of these:

- Will remove media arbitrarily
- Will still serve you ads and tracking even if you pay for their service
- Have multiple upselling options and they're constantly pushing you towards them (or downgrading your existing service)
- Will increase prices arbitrarily

So, having my own music collection from over 10 years, along with some videos and movies I had never watched, I decided to set one up myself.

## Requirements

This might be different for each person, but in my case, I wanted:

- Not to set up any special or dedicated hardware
- Needs to be compatible with local networks
- Needs to have mobile clients
	- These need to support offline play

My options became very limited at this point:

- **Plex**: Was a very nice option but they did have a very strong push towards their paid service, which is exactly one of the things I was trying to avoid.
- **Emby Media Server**: Very good option too, but again, had moved into a subscription-based service.
- **Kodi**: I almost stayed with this one, but the clients for it were very limited.
- **MediaPortal Media Center**: I didn't work from the time I set it up. Furthermore, it was mostly oriented to be a media client for TVs rather than a server.
- **ZimaBoard Media Server**: Requires dedicated hardware.
- **Jellyfin Media Server**: I landed in this one, which is actually a fork of Emby, but with a focus on it being Open Source as much as possible.

[Jellyfin happens to have multiple clients](https://jellyfin.org/downloads) and most of them are thin wrappers around their web client, which to be honest, is not perfect, but works. I also happen to be familiar with the involved technologies (or some of them) so I think in the future I might even help fix some of the issues involved.

As for clients, I landed on [finamp](https://github.com/jmshrv/finamp), which is an iOS, good-looking client, with a working offline-sync feature. (It's buggy, but works. Which is more than I can say about alternatives.)

After testing it out and verifying it all worked out for me, it was time for the real setup!

## Organizing music

Most of my content is music. I had imports and downloads from multiple sources. It also happens that Jellyfin will not correctly recognize the contents of artists/albums/songs unless they are properly organized and tagged.

Enter [beets](https://beets.io/), a tool for importing, cataloging, manipulating, and operating your music files. It has a powerful autotagger which will try to identify the albums and songs you have, but will ask you to confirm if it's not entirely sure.

It happens to be a very tedious and long process. What's more, the tool might sometimes crash and you might need to start again, ending with duplicates.

Here's my suggestion to avoid this:

1. Read the full documentation (think of it as an investment instead of a waste of time)
2. Setup your configuration parameters
3. Use the incremental approach
4. Lower auto-tagging requirements (but don't fully turn them off)
5. Activate logs

After all, I ended up with the following configuration file:

```yaml
plugins: fetchart fromfilename ftintitle lastgenre lyrics replaygain spotify

discogs:
    append_style_genre: True

lastgenre:
    count: 3
    source: track

lyrics:
    bing_lang_from: []
    synced: True

replaygain:
    backend: ffmpeg

spotify:
    source_weight: 0.3

import:
    duplicate_action: skip
    duplicate_verbose_prompt: yes
    write: yes
    copy: no
    move: yes
    resume: yes
    log: import.log

match:
    max_rec:
        missing_tracks: strong
        source: strong
```

As a final piece of advice, put all of your music together into a "Staging" location, which should **not** be your default Music folder, and start the import in a comfy chair.

## Exposing it to the internet? Don't.

I was thinking of exposing it to the internet so that I could listen to my music everywhere but in the end -- I didn't. This is what I wanted the offline feature for. I'll sync it at home, which is where I consume it the most, and when I'm outside, I'll listen to the synced music.

Finamp is perfect for this, and it happens to sync quite fast. There are few known bugs with that logic but there's nothing a quick wipe and re-download wouldn't fix. After that, there's no need to re-download it.

## A few (positive) surprises

When I initially set this up, I didn't know Jellyfin also supported both videos for movies and series, so that was a nice surprise, which I used for a series of video blogs I wanted to catch up on.

It also has support for TV Channels, which I set up with [IPTV](https://github.com/iptv-org/iptv). I unfortunately was not able to set up the programming sync, not because it's not possible, but rather because it requires constant resynchronization.

## Conclusion

Is this a recommendation post for Jellyfin? Not really -- it's just what worked for me, with a bunch of links to alternatives that might be useful for you.

I'm open to suggestions and other stories as well! It was a fun project after all. If there's something that achieves the same (or more) with less effort, I'm definitely interested!