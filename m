Return-Path: <Deepthi.Hemraj@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4507EC8300C
	for <webhook@archiver.kernel.org>; Mon, 12 Jun 2023 09:58:42 +0000 (UTC)
Subject: Re: [kirkstone][PATCH] glibc: stable 2.35 branch updates.
To: openembedded-core@lists.openembedded.org
From: Deepthi.Hemraj@eng.windriver.com
X-Originating-Location: Bengaluru, Karnataka, IN (49.204.85.206)
X-Originating-Platform: Windows Chrome 114
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Mon, 12 Jun 2023 02:58:32 -0700
References: <20230612094415.2338958-1-deepadeepthi98@gmail.com>
In-Reply-To: <20230612094415.2338958-1-deepadeepthi98@gmail.com>
Message-ID: <14338.1686563912593685566@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="Dgy7EA76D5im0PxVqKGm"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 Jun 2023 09:58:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182661

--Dgy7EA76D5im0PxVqKGm
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Regression tests are performed and below is test summary.
Test summary after glibc updates:

153 FAIL

4408 PASS

41 UNSUPPORTED

12 XFAIL

6 XPASS

Test summary after glibc updates:

154 FAIL

4405 PASS

41 UNSUPPORTED

12 XFAIL

6 XPASS

Diff:
1 FAIL
3 PASS

0 UNSUPPORTED
0 XFAIL
0 XPASS

--Dgy7EA76D5im0PxVqKGm
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Regression tests are performed and below is test summary.<br/>Test summary =
after glibc updates:<br/>
<p class=3D"DefangedMsoNormal" style=3D"margin:0px;"><span style=3D"mso-asc=
ii-font-family: Calibri; mso-hansi-font-family: Calibri; mso-bidi-font-fami=
ly: Calibri;">=C2=A0=C2=A0=C2=A0 153 FAIL</span></p>
<p class=3D"DefangedMsoNormal" style=3D"margin:0px;"><span style=3D"mso-asc=
ii-font-family: Calibri; mso-hansi-font-family: Calibri; mso-bidi-font-fami=
ly: Calibri;">=C2=A0=C2=A0 4408 PASS</span></p>
<p class=3D"DefangedMsoNormal" style=3D"margin:0px;"><span style=3D"mso-asc=
ii-font-family: Calibri; mso-hansi-font-family: Calibri; mso-bidi-font-fami=
ly: Calibri;">=C2=A0=C2=A0=C2=A0=C2=A0 41 UNSUPPORTED</span></p>
<p class=3D"DefangedMsoNormal" style=3D"margin:0px;"><span style=3D"mso-asc=
ii-font-family: Calibri; mso-hansi-font-family: Calibri; mso-bidi-font-fami=
ly: Calibri;">=C2=A0=C2=A0=C2=A0=C2=A0 12 XFAIL</span></p>
<p class=3D"DefangedMsoNormal" style=3D"margin:0px;"><span style=3D"mso-asc=
ii-font-family: Calibri; mso-hansi-font-family: Calibri; mso-bidi-font-fami=
ly: Calibri;">=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 6 XPASS<br/><br/></span></p>
Test summary after glibc updates:<br/>
<p class=3D"DefangedMsoNormal" style=3D"margin:0px;"><span style=3D"mso-asc=
ii-font-family: Calibri; mso-hansi-font-family: Calibri; mso-bidi-font-fami=
ly: Calibri;">=C2=A0=C2=A0=C2=A0 154 FAIL</span></p>
<p class=3D"DefangedMsoNormal" style=3D"margin:0px;"><span style=3D"mso-asc=
ii-font-family: Calibri; mso-hansi-font-family: Calibri; mso-bidi-font-fami=
ly: Calibri;">=C2=A0=C2=A0 4405 PASS</span></p>
<p class=3D"DefangedMsoNormal" style=3D"margin:0px;"><span style=3D"mso-asc=
ii-font-family: Calibri; mso-hansi-font-family: Calibri; mso-bidi-font-fami=
ly: Calibri;">=C2=A0=C2=A0=C2=A0=C2=A0 41 UNSUPPORTED</span></p>
<p class=3D"DefangedMsoNormal" style=3D"margin:0px;"><span style=3D"mso-asc=
ii-font-family: Calibri; mso-hansi-font-family: Calibri; mso-bidi-font-fami=
ly: Calibri;">=C2=A0=C2=A0=C2=A0=C2=A0 12 XFAIL</span></p>
<p class=3D"DefangedMsoNormal" style=3D"margin:0px;"><span style=3D"mso-asc=
ii-font-family: Calibri; mso-hansi-font-family: Calibri; mso-bidi-font-fami=
ly: Calibri;">=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 6 XPASS<br/><br/>Diff:<br/>=C2=
=A0 =C2=A0 1 FAIL<br/>=C2=A0 =C2=A0 3 PASS</span></p>
<p class=3D"DefangedMsoNormal" style=3D"margin:0px;"><span style=3D"mso-asc=
ii-font-family: Calibri; mso-hansi-font-family: Calibri; mso-bidi-font-fami=
ly: Calibri;">=C2=A0 =C2=A0 0=C2=A0</span>UNSUPPORTED<br/>=C2=A0 =C2=A0 0 X=
FAIL<br/>=C2=A0 =C2=A0 0 XPASS</p>

--Dgy7EA76D5im0PxVqKGm--

