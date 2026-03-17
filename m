Return-Path: <michalwsieron@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07991FEDA10
	for <webhook@archiver.kernel.org>; Tue, 17 Mar 2026 19:09:23 +0000 (UTC)
Subject: Re: [PATCH v2 00/12] Confusing and invalid conditional appends
To: openembedded-core@lists.openembedded.org
From: "Michal Sieron" <michalwsieron@gmail.com>
X-Originating-Location: Wroclaw, Lower Silesia, PL (185.164.141.154)
X-Originating-Platform: Linux Firefox 149
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Tue, 17 Mar 2026 12:09:21 -0700
References: <20260317-fix-invalid-appends-v2-0-5c65ae5787d9@gmail.com> <CAMKF1sqOx2zrXYmpakK5tYW-87s0RtbxHET2JNWe445sLc4L=w@mail.gmail.com>
In-Reply-To: <CAMKF1sqOx2zrXYmpakK5tYW-87s0RtbxHET2JNWe445sLc4L=w@mail.gmail.com>
Message-ID: <411950.1773774561318861104@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="1k6pVQiftSrgJw5X9Onu"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Mar 2026 19:09:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233333

--1k6pVQiftSrgJw5X9Onu
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

I actually extended existing check in oelint-adv [1] and did run it on meta=
-openembedded already [2].
I first wanted to see what is the response from upstream and how those chan=
ges should look like.
Once oe-core changes are merged and I find time, I will split and cleanup t=
hat commit for meta-oe.

[1]: https://github.com/priv-kweihmann/oelint-adv/pull/857
[2]: https://github.com/michalsieron/meta-openembedded/commit/cc5d9c473c337=
b9830d102c2e235e53f4a8a4b6a

--1k6pVQiftSrgJw5X9Onu
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>I actually extended existing check in oelint-adv [1] and did run it on=
 meta-openembedded already [2].</div>
<div>I first wanted to see what is the response from upstream and how those=
 changes should look like.</div>
<div>Once oe-core changes are merged and I find time, I will split and clea=
nup that commit for meta-oe.</div>
<div>&nbsp;</div>
<div>[1]: <a href=3D"https://github.com/priv-kweihmann/oelint-adv/pull/857"=
 target=3D"_blank" rel=3D"noopener">https://github.com/priv-kweihmann/oelin=
t-adv/pull/857</a></div>
<div>[2]: <a href=3D"https://github.com/michalsieron/meta-openembedded/comm=
it/cc5d9c473c337b9830d102c2e235e53f4a8a4b6a" target=3D"_blank" rel=3D"noope=
ner">https://github.com/michalsieron/meta-openembedded/commit/cc5d9c473c337=
b9830d102c2e235e53f4a8a4b6a</a></div>

--1k6pVQiftSrgJw5X9Onu--

