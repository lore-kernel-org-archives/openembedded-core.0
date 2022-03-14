Return-Path: <sundeep.kokkonda@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93384C433F5
	for <webhook@archiver.kernel.org>; Mon, 14 Mar 2022 14:08:11 +0000 (UTC)
Subject: Re: [master][PATCH] PR sanitizer/101749 -
 sanitizer_common/sanitizer_posix_libcdep.cpp: Prevent generation of
 dependency on _cxa_guard for static initialization.
To: openembedded-core@lists.openembedded.org
From: "Sundeep KOKKONDA" <sundeep.kokkonda@gmail.com>
X-Originating-Location: Belgaum, Karnataka, IN (103.197.112.6)
X-Originating-Platform: Windows Chrome 99
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Mon, 14 Mar 2022 07:08:10 -0700
References: <20220311090534.1133919-1-sundeep.kokkonda@gmail.com>
In-Reply-To: <20220311090534.1133919-1-sundeep.kokkonda@gmail.com>
Message-ID: <12257.1647266890807354169@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="brWyq75L36FeDs9SwA2U"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Mar 2022 14:08:11 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163141

--brWyq75L36FeDs9SwA2U
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi Randy,

Commit log updated. Please let me know is it ok?

I'll backport the patch to honister, hardknott and dunfell after patch take=
n to master.

Thanks,
Sundeep K.

--brWyq75L36FeDs9SwA2U
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi Randy,<br /><br />Commit log updated. Please let me know is it ok?<br />=
<br />I'll backport the patch to honister, hardknott and dunfell after patc=
h taken to master.<br /><br /><br /><br />Thanks,<br />Sundeep K.

--brWyq75L36FeDs9SwA2U--

