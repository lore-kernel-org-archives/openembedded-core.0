Return-Path: <gudnimar@noxmedical.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9611C27C4F
	for <webhook@archiver.kernel.org>; Sun, 30 Jun 2024 11:38:26 +0000 (UTC)
Subject: Re: [AUH] bluez5: upgrading to 5.76 FAILED
To: openembedded-core@lists.openembedded.org
From: =?UTF-8?B?R3XDsG5pIE3DoXIgR2lsYmVydA==?= <gudnimar@noxmedical.com>
X-Originating-Location: Kopavogur, Capital Region, IS (81.15.100.92)
X-Originating-Platform: iPhone Safari 17.5
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Sun, 30 Jun 2024 04:38:20 -0700
References: <32067.1719679370283451699@lists.openembedded.org>
In-Reply-To: <32067.1719679370283451699@lists.openembedded.org>
Message-ID: <16360.1719747500371511009@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="J6x6XwtqMjm1u4iBgJuF"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 30 Jun 2024 11:38:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201234

--J6x6XwtqMjm1u4iBgJuF
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

I found a Github issue which is related to the problematic obexd patch: htt=
ps://github.com/bluez/bluez/issues/806
( https://github.com/bluez/bluez/issues/806 )
I think the only relevant part of that patch today is to enable the D-bus s=
ervice when systemd is not in DISTRO_FEATURES.

--J6x6XwtqMjm1u4iBgJuF
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<p>I found a Github issue which is related to the problematic obexd patch: =
<a href=3D"https://github.com/bluez/bluez/issues/806" target=3D"_blank" rel=
=3D"noopener">https://github.com/bluez/bluez/issues/806<br /></a><br />I th=
ink the only relevant part of that patch today is to enable the D-bus servi=
ce when systemd is not in DISTRO_FEATURES.&nbsp;</p>

--J6x6XwtqMjm1u4iBgJuF--

