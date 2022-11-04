Return-Path: <vince@underview.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A70EC4332F
	for <webhook@archiver.kernel.org>; Fri,  4 Nov 2022 15:31:41 +0000 (UTC)
Subject: Re: [PATCH v3] mesa: enable glvnd support
To: openembedded-core@lists.openembedded.org
From: "Vincent Davis Jr" <vince@underview.tech>
X-Originating-Location: New York, New York, US (172.254.251.35)
X-Originating-Platform: Linux Firefox 106
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Fri, 04 Nov 2022 08:31:39 -0700
References: <20221026152231.11110-1-vince@underview.tech>
In-Reply-To: <20221026152231.11110-1-vince@underview.tech>
Message-ID: <4722.1667575899545995318@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="fUBOgeXUmB3S6zJECWFJ"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Nov 2022 15:31:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172719

--fUBOgeXUmB3S6zJECWFJ
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Are there any autobuilder updates on this?
Know last patch I didn't realize I wasn't packaging the EGL .so in developm=
ent package.

FILES:libegl-mesa-dev =3D "${libdir}/libEGL*.so.*..."

Patch updates to

FILES:libegl-mesa-dev =3D "${libdir}/libEGL*.* ..."

--fUBOgeXUmB3S6zJECWFJ
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi,<br /><br />Are there any autobuilder updates on this?<br />Know last pa=
tch I didn't realize I wasn't packaging the EGL .so in development package.=
<br /><br />FILES:libegl-mesa-dev =3D "${libdir}/libEGL*.so.*..."<br /><br =
/>Patch updates to<br /><br />FILES:libegl-mesa-dev =3D "${libdir}/libEGL*.=
* ..."

--fUBOgeXUmB3S6zJECWFJ--

