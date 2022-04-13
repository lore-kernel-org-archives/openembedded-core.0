Return-Path: <abongwabonalais@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B51DAC47095
	for <webhook@archiver.kernel.org>; Wed, 13 Apr 2022 15:48:07 +0000 (UTC)
Subject: Re: [PATCH] "bitbake-prserv-tool: Added quotes to variables to
 prevent splitting and gobbling"
To: openembedded-core@lists.openembedded.org
From: "Abongwa Amahnui Bonalais" <abongwabonalais@gmail.com>
X-Originating-Location: CM (154.72.153.130)
X-Originating-Platform: Linux Chrome 100
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Wed, 13 Apr 2022 03:50:00 -0700
References: 
 <8d17cc7d9f13ca534b3f56cb299a1e26da042e18.camel@linuxfoundation.org>
In-Reply-To: 
 <8d17cc7d9f13ca534b3f56cb299a1e26da042e18.camel@linuxfoundation.org>
Message-ID: <5735.1649847000305548289@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="OxWltJ7h5qlmaqPV2JRc"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Apr 2022 15:48:07 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164318

--OxWltJ7h5qlmaqPV2JRc
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Okay thank you what about=C2=A0Using $(...) notation instead of legacy back=
ticked `...`.
base=3D`basename $0`, changing it to=C2=A0base=3D$(basename $0)

Should I commence those changes?
I'm seeing that based om recommendations when I run shellcheck <name of fil=
e>

--OxWltJ7h5qlmaqPV2JRc
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Okay thank you what about&nbsp;Using $(...) notation instead of legacy back=
ticked `...`.<br />base=3D`basename $0`, changing it to&nbsp;base=3D$(basen=
ame $0)<br /><br />Should I commence those changes?<br />I'm seeing that ba=
sed om recommendations when I run shellcheck &lt;name of file&gt;

--OxWltJ7h5qlmaqPV2JRc--

