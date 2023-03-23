Return-Path: <fawzi.khaber@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 678A7C6FD1C
	for <webhook@archiver.kernel.org>; Thu, 23 Mar 2023 09:45:39 +0000 (UTC)
Subject: Re: [PATCH 1/2] package.bbclass: check packages name conflict in do_package
To: openembedded-core@lists.openembedded.org
From: "Fawzi KHABER" <fawzi.khaber@smile.fr>
X-Originating-Location: Argenteuil, Île-de-France, FR (86.242.224.110)
X-Originating-Platform: Linux Chrome 111
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Thu, 23 Mar 2023 02:45:30 -0700
References: <2023032308250714890ab1@mail.local>
In-Reply-To: <2023032308250714890ab1@mail.local>
Message-ID: <4110.1679564730790414263@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="JiVzylZdbEUgr1tcVZyg"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Mar 2023 09:45:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178972

--JiVzylZdbEUgr1tcVZyg
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

yes, my bad the recipe is lacking EXCLUDE_FROM_WORLD =3D "1", i'm sending p=
atch v2
Thanks you Alexandre.

--JiVzylZdbEUgr1tcVZyg
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

yes, my bad the recipe is lacking EXCLUDE_FROM_WORLD =3D "1", i'm sending p=
atch v2<br />Thanks you Alexandre.

--JiVzylZdbEUgr1tcVZyg--

