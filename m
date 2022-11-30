Return-Path: <vince@underview.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61F02C4332F
	for <webhook@archiver.kernel.org>; Wed, 30 Nov 2022 14:33:44 +0000 (UTC)
Subject: Re: [PATCH v4] mesa: enable glvnd support
To: openembedded-core@lists.openembedded.org
From: "Vincent Davis Jr" <vince@underview.tech>
X-Originating-Location: Richmond, Texas, US (99.113.4.128)
X-Originating-Platform: Linux Firefox 107
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Wed, 30 Nov 2022 06:33:38 -0800
References: <20221125231952.56129-1-vince@underview.tech>
In-Reply-To: <20221125231952.56129-1-vince@underview.tech>
Message-ID: <8531.1669818818045454239@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="IwBClFjHjkRDHJUBaqOn"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Nov 2022 14:33:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174012

--IwBClFjHjkRDHJUBaqOn
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hello,

Is the consensuses that we still don't want

PREFERRED_PROVIDER_virtual/libglx ?=3D "mesa" or ${@bb.utils.contains('PACK=
AGECONFIG', 'egl', 'true', 'false', d)}

--IwBClFjHjkRDHJUBaqOn
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hello,<br /><br />Is the consensuses that we still don't want<br /><br />PR=
EFERRED_PROVIDER_virtual/libglx ?=3D "mesa" or ${@bb.utils.contains('PACKAG=
ECONFIG', 'egl', 'true', 'false', d)}

--IwBClFjHjkRDHJUBaqOn--

