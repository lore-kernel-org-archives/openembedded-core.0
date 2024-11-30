Return-Path: <gudni.m.g@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3191AD73604
	for <webhook@archiver.kernel.org>; Sat, 30 Nov 2024 12:41:42 +0000 (UTC)
Subject: Re: [PATCH] dnf: drop python3-iniparse from DEPENDS and RDEPENDS
To: openembedded-core@lists.openembedded.org
From: =?UTF-8?B?R3XDsG5pIE3DoXIgR2lsYmVydA==?= <gudni.m.g@gmail.com>
X-Originating-Location: Kopavogur, Capital Region, IS (81.15.100.92)
X-Originating-Platform: Windows Firefox 133
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Sat, 30 Nov 2024 04:41:36 -0800
References: <20241130123911.5111-1-gudni.m.g@gmail.com>
In-Reply-To: <20241130123911.5111-1-gudni.m.g@gmail.com>
Message-ID: <14717.1732970496070607151@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="sUPEmB2FUXxPoNYOCdHC"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 30 Nov 2024 12:41:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208045

--sUPEmB2FUXxPoNYOCdHC
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Note: after this patch, there are no consumers of python3-iniparse in opene=
mbedded-core or meta-openembedded.

To move forward, I'm not sure if I should simply delete the recipe or move =
it to meta-openembedded.

Is anyone against deleting this recipe?

--sUPEmB2FUXxPoNYOCdHC
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>Note: after this patch, there are no consumers of python3-iniparse in =
openembedded-core or meta-openembedded.</div>
<div>&nbsp;</div>
<div>To move forward, I'm not sure if I should simply delete the recipe or =
move it to meta-openembedded.</div>
<div>&nbsp;</div>
<div>Is anyone against deleting this recipe?</div>

--sUPEmB2FUXxPoNYOCdHC--

