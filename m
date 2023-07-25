Return-Path: <rehn.andreas86@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40D07C0015E
	for <webhook@archiver.kernel.org>; Tue, 25 Jul 2023 09:28:13 +0000 (UTC)
Subject: dunfell: poky 3.1.27 - full linux-firmware always in image
To: openembedded-core@lists.openembedded.org
From: "Andreas" <rehn.andreas86@gmail.com>
X-Originating-Location: Kruen, Bavaria, DE (62.153.201.145)
X-Originating-Platform: Linux Chrome 115
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Tue, 25 Jul 2023 02:28:10 -0700
Message-ID: <7JrI.1690277290613913360.PhKO@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="lUyV8qy92HcEXky3febe"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Jul 2023 09:28:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184825

--lUyV8qy92HcEXky3febe
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

hey,

i encountered issues with the new poky release on dunfell.
explicitly linux-firmware: commit hash=C2=A0a04b507d39d668a02b7ebd990c94194=
cde16bf2f

i building dunfell images since 1,5 years and my images are normaly 1,9 GB =
big.
however since Sunday 23.07, the image size increases by 1GB due to the full=
 firmware installation.

i double checked it with the previous commit=C2=A00bf993da8b6e6511a4123ed15=
421bdd76a4c1f38 and the image size is as expected.

i hope someone is able to help, because this is an unexpected behavior.

PS: this my first post so please have mercy on me. :)

--lUyV8qy92HcEXky3febe
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

hey,<br /><br />i encountered issues with the new poky release on dunfell.<=
br />explicitly linux-firmware: commit hash&nbsp;a04b507d39d668a02b7ebd990c=
94194cde16bf2f<br /><br />i building dunfell images since 1,5 years and my =
images are normaly 1,9 GB big.<br />however since Sunday 23.07, the image s=
ize increases by 1GB due to the full firmware installation.<br /><br />i do=
uble checked it with the previous commit&nbsp;0bf993da8b6e6511a4123ed15421b=
dd76a4c1f38 and the image size is as expected.<br /><br />i hope someone is=
 able to help, because this is an unexpected behavior.<br /><br />PS: this =
my first post so please have mercy on me. :)

--lUyV8qy92HcEXky3febe--

