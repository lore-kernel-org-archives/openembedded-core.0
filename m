Return-Path: <gudni.m.g@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DB66D68B03
	for <webhook@archiver.kernel.org>; Thu, 14 Nov 2024 12:57:59 +0000 (UTC)
Subject: Re: [PATCH 2/2] python3: add bluez5-native to DEPENDS conditionally
To: openembedded-core@lists.openembedded.org
From: =?UTF-8?B?R3XDsG5pIE3DoXIgR2lsYmVydA==?= <gudni.m.g@gmail.com>
X-Originating-Location: Kopavogur, Capital Region, IS (81.15.100.92)
X-Originating-Platform: Windows Firefox 132
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Thu, 14 Nov 2024 04:57:55 -0800
References: <7504602b93a0b57df5c9aafd536efa2d581ae024.camel@linuxfoundation.org>
In-Reply-To: <7504602b93a0b57df5c9aafd536efa2d581ae024.camel@linuxfoundation.org>
Message-ID: <18918.1731589075220106911@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="oVyrIV6T8DYxBy0Ken5W"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 Nov 2024 12:57:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207158

--oVyrIV6T8DYxBy0Ken5W
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi Richard, I do agree with you, this feels like its not the "proper" solut=
ion. I am pretty sure you don't need python3 to build BlueZ, I suspect it h=
as something to do with systemd. Perhaps we can optimise the DEPENDS in Blu=
eZ recipe.

--oVyrIV6T8DYxBy0Ken5W
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>Hi Richard, I do agree with you, this feels like its not the "proper" =
solution. I am pretty sure you don't need python3 to build BlueZ, I suspect=
 it has something to do with systemd. Perhaps we can optimise the DEPENDS i=
n BlueZ recipe.</div>

--oVyrIV6T8DYxBy0Ken5W--

