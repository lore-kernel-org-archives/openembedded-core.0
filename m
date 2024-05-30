Return-Path: <Deepthi.Hemraj@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EDE8C25B74
	for <webhook@archiver.kernel.org>; Thu, 30 May 2024 15:57:37 +0000 (UTC)
Subject: Re: [kirkstone][PATCH] glibc: stable 2.35 branch updates
To: openembedded-core@lists.openembedded.org
From: "Hemraj, Deepthi" <Deepthi.Hemraj@windriver.com>
X-Originating-Location: Bengaluru, Karnataka, IN (49.205.150.7)
X-Originating-Platform: Windows Chrome 125
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Thu, 30 May 2024 08:57:29 -0700
References: <20240530051758.2990123-1-Deepthi.Hemraj@windriver.com>
In-Reply-To: <20240530051758.2990123-1-Deepthi.Hemraj@windriver.com>
Message-ID: <26400.1717084649474764175@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="fLV1KT5KsVv7yQghYcxS"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 May 2024 15:57:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200027

--fLV1KT5KsVv7yQghYcxS
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Regression testing is done and below are the results:
*after update:*
fail =C2=A0 -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0427
pass =C2=A0 -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 14368
xpass =C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A018
xfail =C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 48
unsupported - 670

*before update*
fail =C2=A0 -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0428
pass =C2=A0 -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A014367
xpass =C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 18
xfail =C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A048
unsupported - 670

--fLV1KT5KsVv7yQghYcxS
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<p class=3D"DefangedMsoNormal" style=3D"margin:0px;"><span style=3D"mso-far=
east-font-family: &#39;Times New Roman&#39;;">Regression testing is done an=
d below are the results:<br/><strong><span style=3D"font-family: &#39;Calib=
ri&#39;,sans-serif; mso-ascii-theme-font: minor-latin; mso-hansi-theme-font=
: minor-latin; mso-bidi-font-family: &#39;Times New Roman&#39;; mso-bidi-th=
eme-font: minor-bidi;">after update:=C2=A0</span></strong><br/>fail =C2=A0 =
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0427 =C2=A0 =C2=A0 =
=C2=A0<br/>pass =C2=A0 -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 14368<br/=
>xpass =C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A018<br/>xfail =C2=A0-=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 48<br/>unsupported - 670<b=
r/><br/><strong><span style=3D"font-family: &#39;Calibri&#39;,sans-serif; m=
so-ascii-theme-font: minor-latin; mso-hansi-theme-font: minor-latin; mso-bi=
di-font-family: &#39;Times New Roman&#39;; mso-bidi-theme-font: minor-bidi;=
">before update</span></strong><br/>fail =C2=A0 -=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0428<br/>pass =C2=A0 -=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A014367<br/>xpass =C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 18<br/>xfail =C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A048<br/>unsupported - 670</span></p>

--fLV1KT5KsVv7yQghYcxS--

