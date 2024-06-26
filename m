Return-Path: <gudnimar@noxmedical.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D2D5C27C4F
	for <webhook@archiver.kernel.org>; Wed, 26 Jun 2024 18:22:13 +0000 (UTC)
Subject: Re: [scarthgap][PATCH] python3: Fix CVE-2024-4032
To: openembedded-core@lists.openembedded.org
From: =?UTF-8?B?R3XDsG5pIE3DoXIgR2lsYmVydA==?= <gudnimar@noxmedical.com>
X-Originating-Location: Kopavogur, Capital Region, IS (81.15.100.92)
X-Originating-Platform: Windows Chrome 126
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Wed, 26 Jun 2024 11:22:03 -0700
References: <20240626151743.21115-1-asharma@mvista.com>
In-Reply-To: <20240626151743.21115-1-asharma@mvista.com>
Message-ID: <22089.1719426123332569606@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="lO5mqib08NHcFDKRtX8g"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Jun 2024 18:22:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201177

--lO5mqib08NHcFDKRtX8g
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Isn't this fixed in Python 3.12.4? gh-113171 is referenced in the release n=
otes: https://docs.python.org/3.12/whatsnew/changelog.html#python-3-12-4-fi=
nal

( https://docs.python.org/3.12/whatsnew/changelog.html#python-3-12-4-final =
)
Python 3.12.4 has been merged into master, perhaps it can be backported to =
Scarthgap as well. It contains some more security fixes.

--lO5mqib08NHcFDKRtX8g
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Isn't this fixed in Python 3.12.4? gh-113171 is referenced in the release n=
otes: <a href=3D"https://docs.python.org/3.12/whatsnew/changelog.html#pytho=
n-3-12-4-final" target=3D"_blank" rel=3D"noopener">https://docs.python.org/=
3.12/whatsnew/changelog.html#python-3-12-4-final<br /><br /></a><br />Pytho=
n 3.12.4 has been merged into master, perhaps it can be backported to Scart=
hgap as well. It contains some more security fixes.

--lO5mqib08NHcFDKRtX8g--

