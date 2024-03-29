Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26B28CD11DD
	for <webhook@archiver.kernel.org>; Fri, 29 Mar 2024 15:01:39 +0000 (UTC)
Subject: Re: [PATCH 1/3] nativesdk-packagegroup-sdk-host: add gprofng package to RDEPENDS
To: openembedded-core@lists.openembedded.org
From: "Sadineni, Harish" <Harish.Sadineni@windriver.com>
X-Originating-Location: Bengaluru, Karnataka, IN (180.151.116.250)
X-Originating-Platform: Windows Chrome 123
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Fri, 29 Mar 2024 08:01:33 -0700
References: <2a5cff55eee4bf916b2867192841ab44567d694a.camel@linuxfoundation.org>
In-Reply-To: <2a5cff55eee4bf916b2867192841ab44567d694a.camel@linuxfoundation.org>
Message-ID: <20232.1711724493854818120@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="LPb8ltzKJlblhxQCJlIh"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 29 Mar 2024 15:01:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197635

--LPb8ltzKJlblhxQCJlIh
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

gprofng belongs to binutils module, i tried a build by adding it in binutil=
s-cross-canadian.inc and the build is sucessfully generating gprofng.rc in =
sysconf directory as expected.
we have sent a v2 patch by adding it in binutils (https://lists.openembedde=
d.org/g/openembedded-core/message/197632).

Thanks,
Harish sadineni

--LPb8ltzKJlblhxQCJlIh
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>gprofng belongs to binutils module, i tried a build by adding it in bi=
nutils-cross-canadian.inc and the build is sucessfully generating gprofng.r=
c in sysconf directory as expected.</div>
<div>we have sent a v2 patch by adding it in binutils (https://lists.openem=
bedded.org/g/openembedded-core/message/197632).</div>
<div>&nbsp;</div>
<div>Thanks,<br />Harish sadineni</div>

--LPb8ltzKJlblhxQCJlIh--

