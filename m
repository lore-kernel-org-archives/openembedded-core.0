Return-Path: <mns@gomspace.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9EE56F55123
	for <webhook@archiver.kernel.org>; Sun,  5 Apr 2026 14:04:18 +0000 (UTC)
Subject: Re: [PATCH 2/2] systemd: add shell-profile-dropins PACKAGECONFIG
To: openembedded-core@lists.openembedded.org
From: "Martin Siegumfeldt" <mns@gomspace.com>
X-Originating-Location: Aalborg, North Denmark, DK (212.10.127.96)
X-Originating-Platform: Linux Chrome 146
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Sun, 05 Apr 2026 07:04:18 -0700
References: <20260115021918.1926514-1-Qi.Chen@windriver.com> <20260115021918.1926514-2-Qi.Chen@windriver.com> <12dbcfbdc5d0cc4831e08c35abc8f1fe1456557a.camel@pbarker.dev> <cd8d7975-9631-4cce-b3d4-b9644e968606@windriver.com>
In-Reply-To: <cd8d7975-9631-4cce-b3d4-b9644e968606@windriver.com>
Message-ID: <275547.1775397858027409536@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="LtWj9tiXGeGEWp71H7zF"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 05 Apr 2026 14:04:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234628

--LtWj9tiXGeGEWp71H7zF
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

I just tested current master which is on systemd 259.5. It includes the men=
tioned commits, however OSC injections still occur. Was there any particula=
r config in mind that would disable them?

Thanks,
Martin

--LtWj9tiXGeGEWp71H7zF
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>I just tested current master which is on systemd 259.5. It includes th=
e mentioned commits, however OSC injections still occur. Was there any part=
icular config in mind that would disable them?</div>
<div>&nbsp;</div>
<div>Thanks,</div>
<div>Martin</div>

--LtWj9tiXGeGEWp71H7zF--

