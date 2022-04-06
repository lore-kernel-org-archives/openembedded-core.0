Return-Path: <abongwabonalais@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 573DCC4707E
	for <webhook@archiver.kernel.org>; Wed,  6 Apr 2022 16:33:19 +0000 (UTC)
Subject: Re: [PATCH] Added quotes around variables to prevent word splitting
 in the oe-init-build-env/oe-setup-builddir shell scripts.
To: openembedded-core@lists.openembedded.org
From: "Abongwa Amahnui Bonalais" <abongwabonalais@gmail.com>
X-Originating-Location: CM (41.202.219.242)
X-Originating-Platform: Linux Chrome 100
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Tue, 05 Apr 2022 22:49:08 -0700
References: <61ac8fdf-f8d9-8004-2282-73d13ed875b3@windriver.com>
In-Reply-To: <61ac8fdf-f8d9-8004-2282-73d13ed875b3@windriver.com>
Message-ID: <12408.1649224148497643546@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="yqoowsnsTiFkCmvdWCZV"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Apr 2022 16:33:19 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164055

--yqoowsnsTiFkCmvdWCZV
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi Qi
Thanks for the clarity, Therefore there is no need to put whitespaces in qo=
utes if it will be checked for and an error message reported concerning it =
in future.
That means we just have to let oe-init-build-env=C2=A0 tell you at the earl=
y stages.
Thanks I understand.

--yqoowsnsTiFkCmvdWCZV
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi Qi<br />Thanks for the clarity, Therefore there is no need to put whites=
paces in qoutes if it will be checked for and an error message reported con=
cerning it in future.<br />That means we just have to let oe-init-build-env=
&nbsp; tell you at the early stages.<br />Thanks I understand.

--yqoowsnsTiFkCmvdWCZV--

