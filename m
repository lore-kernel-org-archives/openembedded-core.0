Return-Path: <sundeep.kokkonda@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36478C32793
	for <webhook@archiver.kernel.org>; Wed, 18 Jan 2023 17:39:55 +0000 (UTC)
Subject: Re: [PATCH] rust: Upgrade 1.66.0 -> 1.66.1
To: openembedded-core@lists.openembedded.org
From: "Kokkonda, Sundeep" <sundeep.kokkonda@windriver.com>
X-Originating-Location: Hyderabad, Telangana, IN (183.83.146.125)
X-Originating-Platform: Windows Chrome 109
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Wed, 18 Jan 2023 09:39:48 -0800
References: <765d5133-42eb-2ef6-7ba0-b5556a7a1d1b@windriver.com>
In-Reply-To: <765d5133-42eb-2ef6-7ba0-b5556a7a1d1b@windriver.com>
Message-ID: <17348.1674063588089824843@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="e5rM5QoLNWONjhOO0MlT"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Jan 2023 17:39:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176111

--e5rM5QoLNWONjhOO0MlT
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

@Randy,

To summarize the discussion, I should try -
1. Upgrade Kirkstone/Lagdale rust to 1.66.1 and
2. backporting the fixes of Cargo/Rust for kirkstone (patches given in http=
s://github.com/rust-lang/wg-security-response/tree/main/patches/CVE-2022-46=
176 )

Is this correct?

--
Sundeep K.

--e5rM5QoLNWONjhOO0MlT
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

@Randy,<br /><br />To summarize the discussion, I should try -&nbsp;<br />1=
. Upgrade Kirkstone/Lagdale rust to 1.66.1 and<br />2. backporting the fixe=
s of Cargo/Rust for kirkstone (patches given in&nbsp;<a style=3D"background=
-color: #ffffff; white-space: pre-wrap;" href=3D"https://github.com/rust-la=
ng/wg-security-response/tree/main/patches/CVE-2022-46176" target=3D"_blank"=
 rel=3D"noopener">https://github.com/rust-lang/wg-security-response/tree/ma=
in/patches/CVE-2022-46176</a>)<br /><br />Is this correct?<br /><br /><br /=
>--<br />Sundeep K.

--e5rM5QoLNWONjhOO0MlT--

