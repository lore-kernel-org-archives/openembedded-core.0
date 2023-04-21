Return-Path: <yang.xu@mediatek.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C6CDC7618E
	for <webhook@archiver.kernel.org>; Fri, 21 Apr 2023 03:03:29 +0000 (UTC)
Subject: Re: [PATCH] openssl: set package level PERL5LIB
To: openembedded-core@lists.openembedded.org
From: "Yang Xu" <yang.xu@mediatek.com>
X-Originating-Location: Shanghai, CN (36.7.144.143)
X-Originating-Platform: Windows Chrome 111
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Thu, 20 Apr 2023 20:03:19 -0700
References: <db555f3f6c09c4576358846cba9e64d055422e59.camel@linuxfoundation.org>
In-Reply-To: <db555f3f6c09c4576358846cba9e64d055422e59.camel@linuxfoundation.org>
Message-ID: <11412.1682046199301581131@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="IidHpZapkV7cjfV9uqSD"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Apr 2023 03:03:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180262

--IidHpZapkV7cjfV9uqSD
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Thank you, I will submit a new patch with more detailed information.

Because two below behavior, I think it is a definite result under certain c=
onditions.
1) @INC is set at build time with host hardcode path,
2) ABORT when searching module in @=E2=80=8BINC paths exists but can not re=
ad.

Thank you

--IidHpZapkV7cjfV9uqSD
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Thank you, I will submit a new patch with more detailed information.<br /><=
br />Because two below behavior, I think it is a definite result under cert=
ain conditions.<br />1) @INC is set at build time with host hardcode path,&=
nbsp;<br />2)&nbsp;<span style=3D"color: #1f2328; font-family: -apple-syste=
m, BlinkMacSystemFont, 'Segoe UI', 'Noto Sans', Helvetica, Arial, sans-seri=
f, 'Apple Color Emoji', 'Segoe UI Emoji';">ABORT when searching module in @=
=E2=80=8BINC paths exists but can not read.<br /><br />Thank you</span>

--IidHpZapkV7cjfV9uqSD--

