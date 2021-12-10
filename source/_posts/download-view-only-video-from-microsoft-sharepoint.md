---
title: Download View Only Video From Microsoft Sharepoint
date: 2021-12-10 14:06:45
tags:
    - Ffmpeg
    - Microsoft
    - Sharepoint
---
# Background
There are some many teams meeting records shared by other teams, but only be available for 21 days, view only but no download. Hate it. &#x1F643;&#x1F928;
# Talk is cheap, show me the code.
Chrome/Edge(F12) -> Inspector -> Network -> **videomanifest?privode**

1. Open the Sharepoint page with the video you want to download

2. Press F12 or Ctrl + Shift + C on your keyboard to open the browser inspector. (Cmd + Option + C on Mac OS X)

3. In the top part, click on the Network tab

4. In the top left part - right below the Network tab - you should see a field with the word "Filter" inside it. Click it to gain focus and type: `videomanifest`

5. Refresh the Sharepoint page

6. After a few seconds you should now see 1 result in the browser inspector's network part. That should be something looking like:
videomanifest?provider=spo... => that right there is the manifest URL you will need later on. Right-click on it and copy the link address.

7. Use ffmpeg to download the video.

![inspection](sharepoint_inspection.png)

```bash
ffmpeg -i "https://theURLtoTheManifestYouCopiedHere" -codec copy downloadedVideo.mp4
```
Enjoy it.
