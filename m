Return-Path: <deepesh.varatharajan@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D3B0D2F002
	for <webhook@archiver.kernel.org>; Tue, 27 Jan 2026 11:40:59 +0000 (UTC)
Subject: Re: [PATCH] glibc: Upgrade to 2.43 release
To: openembedded-core@lists.openembedded.org
From: "Varatharajan, Deepesh" <deepesh.varatharajan@windriver.com>
X-Originating-Location: Bengaluru, Karnataka, IN (49.204.85.206)
X-Originating-Platform: Windows Chrome 143
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Tue, 27 Jan 2026 03:40:56 -0800
References: <20260127053941.792825-1-raj.khem@gmail.com>
In-Reply-To: <20260127053941.792825-1-raj.khem@gmail.com>
Message-ID: <982964.1769514056170035817@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="tiAZa8hMwwg0Sf6B0RWv"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 27 Jan 2026 11:40:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230039

--tiAZa8hMwwg0Sf6B0RWv
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 27, 2026 at 11:09 AM, Khem Raj wrote:

Hi Khem,

>=20
> -CPPFLAGS:append:class-nativesdk =3D " -Wno-error"
> +CPPFLAGS:append:class-nativesdk =3D " -Wno-error -Wno-error
> -Wno-error=3Dincompatible-pointer-types-discards-qualifiers"

I noticed a small typo *-Wno-error* is added again.

Regards,
Deepesh

--tiAZa8hMwwg0Sf6B0RWv
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>On Tue, Jan 27, 2026 at 11:09 AM, Khem Raj wrote:<br /><br />Hi Khem,<=
/div>
<div>
<blockquote>-CPPFLAGS:append:class-nativesdk =3D " -Wno-error"<br />+CPPFLA=
GS:append:class-nativesdk =3D " -Wno-error -Wno-error -Wno-error=3Dincompat=
ible-pointer-types-discards-qualifiers"</blockquote>
I noticed a small typo <strong><em>-Wno-error</em></strong> is added again.=
<br /><br />Regards,<br />Deepesh</div>

--tiAZa8hMwwg0Sf6B0RWv--

