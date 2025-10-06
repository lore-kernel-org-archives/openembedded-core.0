Return-Path: <emailaddress.ashish@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F1B1CCA471
	for <webhook@archiver.kernel.org>; Mon,  6 Oct 2025 05:35:16 +0000 (UTC)
Subject: Re: [scarthgap][PATCH 1/2] p11-kit: backport fix for handle USE_NLS from master
To: openembedded-core@lists.openembedded.org
From: "Ashish Mishra" <emailaddress.ashish@gmail.com>
X-Originating-Location: IN (1.7.20.122)
X-Originating-Platform: Windows Chrome 141
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Sun, 05 Oct 2025 22:35:15 -0700
References: <15571.1758515205136559773@lists.openembedded.org>
In-Reply-To: <15571.1758515205136559773@lists.openembedded.org>
Message-ID: <3495.1759728915988666028@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="mFz0DJyYcFSxoaqtRsMP"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Oct 2025 05:35:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224461

--mFz0DJyYcFSxoaqtRsMP
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi Anuj,

Good morning.
These are backported patches from master.
Would request to please consider this patch for merge.
If you have any feedback / suggestion, please feel free to share.
I will work accordingly.

Thanks,
Ashish

--mFz0DJyYcFSxoaqtRsMP
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>
<div style=3D"box-sizing: border-box; overflow-wrap: break-word !important;=
 color: #333333; font-family: system-ui, 'Segoe UI', Roboto, 'Helvetica Neu=
e', 'Noto Sans', 'Liberation Sans', Arial, sans-serif, 'Apple Color Emoji',=
 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Color Emoji'; font-size: 16px; =
font-style: normal; font-variant-ligatures: normal; font-variant-caps: norm=
al; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start=
; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -we=
bkit-text-stroke-width: 0px; white-space: normal; background-color: #ffffff=
; text-decoration-thickness: initial; text-decoration-style: initial; text-=
decoration-color: initial;">Hi Anuj,&nbsp;</div>
<div style=3D"box-sizing: border-box; overflow-wrap: break-word !important;=
 color: #333333; font-family: system-ui, 'Segoe UI', Roboto, 'Helvetica Neu=
e', 'Noto Sans', 'Liberation Sans', Arial, sans-serif, 'Apple Color Emoji',=
 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Color Emoji'; font-size: 16px; =
font-style: normal; font-variant-ligatures: normal; font-variant-caps: norm=
al; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start=
; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -we=
bkit-text-stroke-width: 0px; white-space: normal; background-color: #ffffff=
; text-decoration-thickness: initial; text-decoration-style: initial; text-=
decoration-color: initial;">&nbsp;</div>
<div style=3D"box-sizing: border-box; overflow-wrap: break-word !important;=
 color: #333333; font-family: system-ui, 'Segoe UI', Roboto, 'Helvetica Neu=
e', 'Noto Sans', 'Liberation Sans', Arial, sans-serif, 'Apple Color Emoji',=
 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Color Emoji'; font-size: 16px; =
font-style: normal; font-variant-ligatures: normal; font-variant-caps: norm=
al; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start=
; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -we=
bkit-text-stroke-width: 0px; white-space: normal; background-color: #ffffff=
; text-decoration-thickness: initial; text-decoration-style: initial; text-=
decoration-color: initial;">Good morning.</div>
<div style=3D"box-sizing: border-box; overflow-wrap: break-word !important;=
 color: #333333; font-family: system-ui, 'Segoe UI', Roboto, 'Helvetica Neu=
e', 'Noto Sans', 'Liberation Sans', Arial, sans-serif, 'Apple Color Emoji',=
 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Color Emoji'; font-size: 16px; =
font-style: normal; font-variant-ligatures: normal; font-variant-caps: norm=
al; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start=
; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -we=
bkit-text-stroke-width: 0px; white-space: normal; background-color: #ffffff=
; text-decoration-thickness: initial; text-decoration-style: initial; text-=
decoration-color: initial;">These are backported patches from master.<br st=
yle=3D"box-sizing: border-box; overflow-wrap: break-word !important;" />Wou=
ld request to please consider this patch for merge.<br style=3D"box-sizing:=
 border-box; overflow-wrap: break-word !important;" />If you have any feedb=
ack / suggestion, please feel free to share.<br style=3D"box-sizing: border=
-box; overflow-wrap: break-word !important;" />I will work accordingly.</di=
v>
<div style=3D"box-sizing: border-box; overflow-wrap: break-word !important;=
 color: #333333; font-family: system-ui, 'Segoe UI', Roboto, 'Helvetica Neu=
e', 'Noto Sans', 'Liberation Sans', Arial, sans-serif, 'Apple Color Emoji',=
 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Color Emoji'; font-size: 16px; =
font-style: normal; font-variant-ligatures: normal; font-variant-caps: norm=
al; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start=
; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -we=
bkit-text-stroke-width: 0px; white-space: normal; background-color: #ffffff=
; text-decoration-thickness: initial; text-decoration-style: initial; text-=
decoration-color: initial;">&nbsp;</div>
<div style=3D"box-sizing: border-box; overflow-wrap: break-word !important;=
 color: #333333; font-family: system-ui, 'Segoe UI', Roboto, 'Helvetica Neu=
e', 'Noto Sans', 'Liberation Sans', Arial, sans-serif, 'Apple Color Emoji',=
 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Color Emoji'; font-size: 16px; =
font-style: normal; font-variant-ligatures: normal; font-variant-caps: norm=
al; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start=
; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -we=
bkit-text-stroke-width: 0px; white-space: normal; background-color: #ffffff=
; text-decoration-thickness: initial; text-decoration-style: initial; text-=
decoration-color: initial;">Thanks,<br style=3D"box-sizing: border-box; ove=
rflow-wrap: break-word !important;" />Ashish&nbsp;</div>
</div>

--mFz0DJyYcFSxoaqtRsMP--

