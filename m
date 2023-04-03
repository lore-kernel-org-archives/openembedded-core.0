Return-Path: <badganchipv@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94ACCC76188
	for <webhook@archiver.kernel.org>; Mon,  3 Apr 2023 15:22:25 +0000 (UTC)
Subject: Re: [meta][kirkstone][PATCH 2/2] curl: Add fix for CVE-2023-23916
To: openembedded-core@lists.openembedded.org
From: "Pawan Badganchi" <badganchipv@gmail.com>
X-Originating-Location: Pune, Maharashtra, IN (106.212.112.46)
X-Originating-Platform: Linux Chrome 110
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Mon, 03 Apr 2023 08:22:25 -0700
References: <CAOSpxdadm+JeqPYUB8+iPH-e3t0qcRaJQqFmriq0MK=2AsMuEA@mail.gmail.com>
In-Reply-To: <CAOSpxdadm+JeqPYUB8+iPH-e3t0qcRaJQqFmriq0MK=2AsMuEA@mail.gmail.com>
Message-ID: <6415.1680535345411693829@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="EsC4kbTQm4k4inHGI2w8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Apr 2023 15:22:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179639

--EsC4kbTQm4k4inHGI2w8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi steve,
This patch is depends on below patch, if u build with this patch=C2=A0 it w=
ill not give fuzz error.
You no need to take this patch also now because in kirkstone it is already =
available.
Could you please build once again, i think fuz error will not get.

https://lists.openembedded.org/g/openembedded-core/message/179015

--EsC4kbTQm4k4inHGI2w8
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi steve,<br />This patch is depends on below patch, if u build with this p=
atch&nbsp; it will not give fuzz error.<br />You no need to take this patch=
 also now because in kirkstone it is already available.<br />Could you plea=
se build once again, i think fuz error will not get.<br /><br /><a class=3D=
"external-link" style=3D"color: #0052cc; cursor: pointer; font-family: -app=
le-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, 'Fira Sa=
ns', 'Droid Sans', 'Helvetica Neue', sans-serif; background-color: #ffffff;=
" href=3D"https://lists.openembedded.org/g/openembedded-core/message/179015=
" rel=3D"nofollow">https://lists.openembedded.org/g/openembedded-core/messa=
ge/179015</a>

--EsC4kbTQm4k4inHGI2w8--

