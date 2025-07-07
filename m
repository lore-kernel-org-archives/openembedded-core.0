Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4354C83F0A
	for <webhook@archiver.kernel.org>; Mon,  7 Jul 2025 17:55:36 +0000 (UTC)
Subject: Re: [PATCH v5 0/7] cmake: Major version bump to 4.0.3
To: openembedded-core@lists.openembedded.org
From: "Alper Ak" <alperyasinak1@gmail.com>
X-Originating-Location: Istanbul, TR (176.33.70.141)
X-Originating-Platform: Linux Firefox 139
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Mon, 07 Jul 2025 10:55:33 -0700
References: <CAMKF1sr80kZEZunuw4mo32TbKXdrGUb853J8sA3EHuvc8suN3g@mail.gmail.com>
In-Reply-To: <CAMKF1sr80kZEZunuw4mo32TbKXdrGUb853J8sA3EHuvc8suN3g@mail.gmail.com>
Message-ID: <28216.1751910933329662196@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="773EewuD6Kiv6GMphPvk"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Jul 2025 17:55:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219993

--773EewuD6Kiv6GMphPvk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi everyone,

I have started fixing recipes in meta-openembedded, but I'm not sure how we=
 can prevent multiple people from working on the same recipe at the same ti=
me. Since it's likely that others will also start fixing recipes, maybe we =
need a way to coordinate or reserve recipes to avoid duplicate efforts. Oth=
erwise, there=E2=80=99s a chance that two people could start fixing the sam=
e recipe without knowing about each other=E2=80=99s work.

Is there any recommended way to coordinate, or maybe we could create a list=
 or use issues to "claim" a recipe before starting to work on it?

--773EewuD6Kiv6GMphPvk
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>
<div>Hi everyone,<br /><br />I have started fixing recipes in meta-openembe=
dded, but I'm not sure how we can prevent multiple people from working on t=
he same recipe at the same time. Since it's likely that others will also st=
art fixing recipes, maybe we need a way to coordinate or reserve recipes to=
 avoid duplicate efforts. Otherwise, there&rsquo;s a chance that two people=
 could start fixing the same recipe without knowing about each other&rsquo;=
s work.</div>
<div><br />Is there any recommended way to coordinate, or maybe we could cr=
eate a list or use issues to "claim" a recipe before starting to work on it=
?</div>
</div>

--773EewuD6Kiv6GMphPvk--

