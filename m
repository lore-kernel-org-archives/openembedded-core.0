Return-Path: <davidegarde2000@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE234C433F5
	for <webhook@archiver.kernel.org>; Tue, 31 May 2022 07:23:55 +0000 (UTC)
Subject: Re: [kirkstone][PATCH] libpcre2: upgrade 10.39 -> 10.40
To: openembedded-core@lists.openembedded.org
From: "Davide Gardenal" <davidegarde2000@gmail.com>
X-Originating-Location: Mesero, Lombardy, IT (87.12.122.122)
X-Originating-Platform: Linux Firefox 100
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Tue, 31 May 2022 00:23:48 -0700
References: 
 <CAOSpxdbhaQueM4fm0+_m_7K7+TB5M84GkjAOkUeabkNX3LmP7Q@mail.gmail.com>
In-Reply-To: 
 <CAOSpxdbhaQueM4fm0+_m_7K7+TB5M84GkjAOkUeabkNX3LmP7Q@mail.gmail.com>
Message-ID: <953.1653981828904681299@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="XxZnwGX9kexHeiyxSo6Z"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 31 May 2022 07:23:55 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166304

--XxZnwGX9kexHeiyxSo6Z
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 30, 2022 at 09:08 AM, Steve Sakoman wrote:

>=20
> Yes, could you fix the CVE namning issue in kirkstone with a separate
> patch, and then resubmit the version bump patch based on this change?

I was checking the patch and realize that the CVE number is not wrong (I se=
arched for the wrong CVE online),
I'm going to backport a patch for CVE-2022-1587 and then I will send the re=
vision bump.

--XxZnwGX9kexHeiyxSo6Z
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 30, 2022 at 09:08 AM, Steve Sakoman wrote:<br />
<blockquote>Yes, could you fix the CVE namning issue in kirkstone with a se=
parate<br />patch, and then resubmit the version bump patch based on this c=
hange?</blockquote>
I was checking the patch and realize that the CVE number is not wrong (I se=
arched for the wrong CVE online),<br />I'm going to backport a patch for CV=
E-2022-1587 and then I will send the revision bump.

--XxZnwGX9kexHeiyxSo6Z--

