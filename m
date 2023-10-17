Return-Path: <uvv.mail@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0E36CDB474
	for <webhook@archiver.kernel.org>; Tue, 17 Oct 2023 13:23:48 +0000 (UTC)
Subject: Dependency on packages
To: openembedded-core@lists.openembedded.org
From: "Vyacheslav Yurkov" <uvv.mail@gmail.com>
X-Originating-Location: Brussels, Brussels Capital, BE (89.249.73.142)
X-Originating-Platform: Mac Firefox 118
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Tue, 17 Oct 2023 06:23:44 -0700
Message-ID: <Ftmu.1697549024106153534.HnnV@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="G0fHIabdQTCYkEZa6HE3"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Oct 2023 13:23:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189324

--G0fHIabdQTCYkEZa6HE3
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hey everyone.

As you know, DEPENDS operates on a recipe name basis, and RDEPENDS on a pac=
kage name basis. I'm working on a dependency issue in meta-openembedded, wh=
ere I need to indicate a package dependency during a build stage. Any advic=
e how should I do it? (if any details necessary it's nativesdk-grpc/natives=
dk-protobuf recipes)

Regards,
Slava

--G0fHIabdQTCYkEZa6HE3
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hey everyone.<br /><br />As you know, DEPENDS operates on a recipe name bas=
is, and RDEPENDS on a package name basis. I'm working on a dependency issue=
 in meta-openembedded, where I need to indicate a package dependency during=
 a build stage. Any advice how should I do it? (if any details necessary it=
's nativesdk-grpc/nativesdk-protobuf recipes)<br /><br />Regards,<br />Slav=
a

--G0fHIabdQTCYkEZa6HE3--

