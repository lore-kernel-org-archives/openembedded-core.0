Return-Path: <badganchipv@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83369C6FD1D
	for <webhook@archiver.kernel.org>; Wed, 15 Mar 2023 09:59:49 +0000 (UTC)
Subject: Re: [meta][kirkstone][PATCH 2/2] curl: Add fix for CVE-2023-23916
To: openembedded-core@lists.openembedded.org
From: "Pawan Badganchi" <badganchipv@gmail.com>
X-Originating-Location: Pune, Maharashtra, IN (165.225.120.253)
X-Originating-Platform: Linux Chrome 110
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Wed, 15 Mar 2023 02:59:43 -0700
References: <CAOSpxdZoxui1TuXFUpZ6N_Kt_nRBYYm9GvK4DLJ6J4g_B1rDVA@mail.gmail.com>
In-Reply-To: <CAOSpxdZoxui1TuXFUpZ6N_Kt_nRBYYm9GvK4DLJ6J4g_B1rDVA@mail.gmail.com>
Message-ID: <19361.1678874383740050194@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0X4Wb1QnG6KstvMrYKs1"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Mar 2023 09:59:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178532

--0X4Wb1QnG6KstvMrYKs1
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hello steve,
We have not taken patch from actual upstream because we have curl version 7=
.82 and in the actual upstream curl version is 7.88. So in our source code =
one variable is absent. Hence i had taken from launchpad. Now i have taken =
backport patch curl(7.81) from ubuntu trusted upstream.

https://lists.openembedded.org/g/openembedded-core/message/178529

https://lists.openembedded.org/g/openembedded-core/message/178530

--0X4Wb1QnG6KstvMrYKs1
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hello steve,<br />We have not taken patch from actual upstream because we h=
ave curl version 7.82 and in the actual upstream curl version is 7.88. So i=
n our source code one variable is absent. Hence i had taken from launchpad.=
 Now i have taken backport patch curl(7.81) from ubuntu trusted upstream.<b=
r /><br />
<p style=3D"margin-top: 10px; margin-bottom: 0px; padding: 0px; color: #172=
b4d; font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Ox=
ygen, Ubuntu, 'Fira Sans', 'Droid Sans', 'Helvetica Neue', sans-serif; back=
ground-color: #f4f5f7;"><a class=3D"external-link" style=3D"color: #0052cc;=
 cursor: pointer;" href=3D"https://lists.openembedded.org/g/openembedded-co=
re/message/178529" rel=3D"nofollow">https://lists.openembedded.org/g/openem=
bedded-core/message/178529</a></p>
<p style=3D"margin-top: 10px; margin-bottom: 0px; padding: 0px; color: #172=
b4d; font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Ox=
ygen, Ubuntu, 'Fira Sans', 'Droid Sans', 'Helvetica Neue', sans-serif; back=
ground-color: #f4f5f7;"><a class=3D"external-link" style=3D"color: #0052cc;=
 cursor: pointer;" href=3D"https://lists.openembedded.org/g/openembedded-co=
re/message/178530" rel=3D"nofollow">https://lists.openembedded.org/g/openem=
bedded-core/message/178530</a></p>

--0X4Wb1QnG6KstvMrYKs1--

