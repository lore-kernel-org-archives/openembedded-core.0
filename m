Return-Path: <gudni.m.g@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 003EED5E374
	for <webhook@archiver.kernel.org>; Sat,  9 Nov 2024 14:49:56 +0000 (UTC)
Subject: Re: Question: Need advise with providing native Bluetooth sockets for Python
To: openembedded-core@lists.openembedded.org
From: =?UTF-8?B?R3XDsG5pIE3DoXIgR2lsYmVydA==?= <gudni.m.g@gmail.com>
X-Originating-Location: Kopavogur, Capital Region, IS (81.15.100.92)
X-Originating-Platform: Windows Firefox 132
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Sat, 09 Nov 2024 06:49:52 -0800
References: <1pUB.1731160089648756611.yX3t@lists.openembedded.org>
In-Reply-To: <1pUB.1731160089648756611.yX3t@lists.openembedded.org>
Message-ID: <20128.1731163792219546941@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="MzcklY5dQDHWHzVs80cu"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 09 Nov 2024 14:49:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206906

--MzcklY5dQDHWHzVs80cu
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hmm I found this in BlueZ README, it suggests creating a separate package. =
If no one is against that idea I will try to create it and submit a patch.

--enable-library
Enable installation of Bluetooth library
By default the Bluetooth library is no longer installed.
The user interfaces or command line utilities do not
require an installed Bluetooth library anymore. This
option is provided for legacy third party applications
that still depend on the library.
When the library installation is enabled, it is a good
idea to use a separate bluez-library or libbluetooth
package for it.

--MzcklY5dQDHWHzVs80cu
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>Hmm I found this in BlueZ README, it suggests creating a separate pack=
age. If no one is against that idea I will try to create it and submit a pa=
tch.</div>
<div>&nbsp;</div>
<div>
<div>--enable-library</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; Enable installation of Bluetooth library</=
div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; By default the Bluetooth library is no lon=
ger installed.</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; The user interfaces or command line utilit=
ies do not<br />&nbsp; &nbsp; &nbsp; &nbsp; require an installed Bluetooth =
library anymore. This<br />&nbsp; &nbsp; &nbsp; &nbsp; option is provided f=
or legacy third party applications<br />&nbsp; &nbsp; &nbsp; &nbsp; that st=
ill depend on the library.</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; When the library installation is enabled, =
it is a good<br />&nbsp; &nbsp; &nbsp; &nbsp; idea to use a separate bluez-=
library or libbluetooth<br />&nbsp; &nbsp; &nbsp; &nbsp; package for it.</d=
iv>
</div>

--MzcklY5dQDHWHzVs80cu--

