Return-Path: <osama.abdelkader@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E20C2C87FDA
	for <webhook@archiver.kernel.org>; Fri,  8 Aug 2025 20:55:19 +0000 (UTC)
Subject: Re: [PATCH] go-cross-canadian: fix binaries install and GOARCH
To: openembedded-core@lists.openembedded.org
From: "Osama Abdelkader" <osama.abdelkader@gmail.com>
X-Originating-Location: Essen, North Rhine-Westphalia, DE (92.210.202.8)
X-Originating-Platform: Linux Chrome 138
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Fri, 08 Aug 2025 13:55:11 -0700
References: <CANNYZj8_EA6U=o8fR98TA6upx9AzmSh+bf11bKfAuXJhY2G9xQ@mail.gmail.com>
In-Reply-To: <CANNYZj8_EA6U=o8fR98TA6upx9AzmSh+bf11bKfAuXJhY2G9xQ@mail.gmail.com>
Message-ID: <14837.1754686511622096879@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="N8H7tl4FozWWCEPvOvWu"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 Aug 2025 20:55:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221668

--N8H7tl4FozWWCEPvOvWu
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

setting SDKMACHINE and MACHINE didn't work for me.
If it did work for you, can you type the exact command(s) to try?

Osama

--N8H7tl4FozWWCEPvOvWu
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>setting <span style=3D"color: #dbdde1; font-family: system-ui, 'Segoe =
UI', Roboto, 'Helvetica Neue', 'Noto Sans', 'Liberation Sans', Arial, sans-=
serif, 'Apple Color Emoji', 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Colo=
r Emoji'; font-size: 16px; font-style: normal; font-variant-ligatures: norm=
al; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; or=
phans: 2; text-align: start; text-indent: 0px; text-transform: none; widows=
: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: pre-wr=
ap; background-color: #252728; text-decoration-thickness: initial; text-dec=
oration-style: initial; text-decoration-color: initial; display: inline !im=
portant; float: none;">SDKMACHINE and <span style=3D"color: #dbdde1; font-f=
amily: system-ui, 'Segoe UI', Roboto, 'Helvetica Neue', 'Noto Sans', 'Liber=
ation Sans', Arial, sans-serif, 'Apple Color Emoji', 'Segoe UI Emoji', 'Seg=
oe UI Symbol', 'Noto Color Emoji'; font-size: 16px; font-style: normal; fon=
t-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; l=
etter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; tex=
t-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width:=
 0px; white-space: pre-wrap; background-color: #252728; text-decoration-thi=
ckness: initial; text-decoration-style: initial; text-decoration-color: ini=
tial; display: inline !important; float: none;">MACHINE didn't work for me.=
</span></span></div>
<div><span style=3D"color: #dbdde1; font-family: system-ui, 'Segoe UI', Rob=
oto, 'Helvetica Neue', 'Noto Sans', 'Liberation Sans', Arial, sans-serif, '=
Apple Color Emoji', 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Color Emoji'=
; font-size: 16px; font-style: normal; font-variant-ligatures: normal; font=
-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2=
; text-align: start; text-indent: 0px; text-transform: none; widows: 2; wor=
d-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: pre-wrap; back=
ground-color: #252728; text-decoration-thickness: initial; text-decoration-=
style: initial; text-decoration-color: initial; display: inline !important;=
 float: none;"><span style=3D"color: #dbdde1; font-family: system-ui, 'Sego=
e UI', Roboto, 'Helvetica Neue', 'Noto Sans', 'Liberation Sans', Arial, san=
s-serif, 'Apple Color Emoji', 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Co=
lor Emoji'; font-size: 16px; font-style: normal; font-variant-ligatures: no=
rmal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; =
orphans: 2; text-align: start; text-indent: 0px; text-transform: none; wido=
ws: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: pre-=
wrap; background-color: #252728; text-decoration-thickness: initial; text-d=
ecoration-style: initial; text-decoration-color: initial; display: inline !=
important; float: none;">If it did work for you, can you type the exact com=
mand(s) to try?</span></span></div>
<div>&nbsp;</div>
<div><span style=3D"color: #dbdde1; font-family: system-ui, 'Segoe UI', Rob=
oto, 'Helvetica Neue', 'Noto Sans', 'Liberation Sans', Arial, sans-serif, '=
Apple Color Emoji', 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Color Emoji'=
; font-size: 16px; font-style: normal; font-variant-ligatures: normal; font=
-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2=
; text-align: start; text-indent: 0px; text-transform: none; widows: 2; wor=
d-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: pre-wrap; back=
ground-color: #252728; text-decoration-thickness: initial; text-decoration-=
style: initial; text-decoration-color: initial; display: inline !important;=
 float: none;"><span style=3D"color: #dbdde1; font-family: system-ui, 'Sego=
e UI', Roboto, 'Helvetica Neue', 'Noto Sans', 'Liberation Sans', Arial, san=
s-serif, 'Apple Color Emoji', 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Co=
lor Emoji'; font-size: 16px; font-style: normal; font-variant-ligatures: no=
rmal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; =
orphans: 2; text-align: start; text-indent: 0px; text-transform: none; wido=
ws: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: pre-=
wrap; background-color: #252728; text-decoration-thickness: initial; text-d=
ecoration-style: initial; text-decoration-color: initial; display: inline !=
important; float: none;">Osama</span></span></div>

--N8H7tl4FozWWCEPvOvWu--

