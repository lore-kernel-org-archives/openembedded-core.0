Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD985C46CD3
	for <webhook@archiver.kernel.org>; Thu, 28 Dec 2023 06:07:36 +0000 (UTC)
Subject: Re: [patch] packagegroups: Add perl modules to rdeps
To: openembedded-core@lists.openembedded.org
From: Harish.Sadineni@windriver.com
X-Originating-Location: Bengaluru, Karnataka, IN (49.204.85.206)
X-Originating-Platform: Windows Chrome 120
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Wed, 27 Dec 2023 22:07:34 -0800
References: <942a69f9-07ae-43c3-90dd-ce687bad22ab@windriver.com>
In-Reply-To: <942a69f9-07ae-43c3-90dd-ce687bad22ab@windriver.com>
Message-ID: <26170.1703743654208077214@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="zanHIvdd1XoXEDTPX11Y"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 28 Dec 2023 06:07:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192973

--zanHIvdd1XoXEDTPX11Y
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi Randy,

There were a few such failure instances (similar to current issue) we've se=
en in the past and those were fixed by adding the respective modules. So, t=
o avoid such failure in future 'nativesdk-perl-modules' is added. If that c=
ausing memory overhead, this issue will be fixed with only adding the modul=
e 'perl-module-feature'. We will send a V2 by adding only that.

Thanks & Regards

Harish Sadineni

--zanHIvdd1XoXEDTPX11Y
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<p class=3D"DefangedMsoNormal" style=3D"margin:0px;"><span style=3D"mso-asc=
ii-font-family: Calibri; mso-hansi-font-family: Calibri; mso-bidi-font-fami=
ly: Calibri;">Hi Randy,</span></p>
<p class=3D"DefangedMsoNormal" style=3D"margin:0px;"><span class=3D"ui-prov=
ider"><span style=3D"mso-ascii-font-family: Calibri; mso-hansi-font-family:=
 Calibri; mso-bidi-font-family: Calibri;">=C2=A0</span></span></p>
<p class=3D"DefangedMsoNormal" style=3D"margin:0px;"><span class=3D"ui-prov=
ider"><span style=3D"mso-ascii-font-family: Calibri; mso-hansi-font-family:=
 Calibri; mso-bidi-font-family: Calibri;">There were a few such failure ins=
tances (similar to current issue) we&#39;ve seen in the past and those were=
 fixed by adding the respective modules. So, to avoid such failure in futur=
e &#39;nativesdk-perl-modules&#39; is added. If that causing memory overhea=
d, this issue will be fixed with only adding the module &#39;perl-module-fe=
ature&#39;. We will send a V2 by adding only that.</span></span><span style=
=3D"mso-ascii-font-family: Calibri; mso-hansi-font-family: Calibri; mso-bid=
i-font-family: Calibri;"></span></p>
<p class=3D"DefangedMsoNormal" style=3D"margin:0px;"><span style=3D"mso-asc=
ii-font-family: Calibri; mso-hansi-font-family: Calibri; mso-bidi-font-fami=
ly: Calibri;">=C2=A0</span></p>
<p class=3D"DefangedMsoNormal" style=3D"margin:0px;"><span style=3D"mso-asc=
ii-font-family: Calibri; mso-hansi-font-family: Calibri; mso-bidi-font-fami=
ly: Calibri;">Thanks &amp; Regards</span></p>
<p class=3D"DefangedMsoNormal" style=3D"margin:0px;"><span style=3D"mso-asc=
ii-font-family: Calibri; mso-hansi-font-family: Calibri; mso-bidi-font-fami=
ly: Calibri;">Harish Sadineni</span></p>

--zanHIvdd1XoXEDTPX11Y--

