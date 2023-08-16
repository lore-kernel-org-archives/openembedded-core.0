Return-Path: <karn.jye.lau@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A904C001B0
	for <webhook@archiver.kernel.org>; Wed, 16 Aug 2023 02:35:26 +0000 (UTC)
Subject: Re: [kirkstone][PATCH 0/1] Fix kirkstone dmidedecode smbios3_decode
To: openembedded-core@lists.openembedded.org
From: "Lau, Karn Jye" <karn.jye.lau@intel.com>
X-Originating-Location: Bayan Lepas, Penang, MY (192.198.147.171)
X-Originating-Platform: Windows Chrome 115
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Tue, 15 Aug 2023 19:35:19 -0700
References: <20230815095122.188614-1-adrian.freihofer@siemens.com>
In-Reply-To: <20230815095122.188614-1-adrian.freihofer@siemens.com>
Message-ID: <19617.1692153319530703551@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="yJrfUfl6hMQfd498kVjg"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Aug 2023 02:35:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186106

--yJrfUfl6hMQfd498kVjg
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Tested the fix in intel hw platform, LGTM.
May i know what is the purpose=C2=A0 of meta/recipes-devtools/dmidecode/dmi=
decode/CVE-2023-30630_5.patch?
Do we need to include in dmidecode_3.3.bb?

Thx,
KJ

--yJrfUfl6hMQfd498kVjg
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Tested the fix in intel hw platform, LGTM.<br />May i know what is the purp=
ose&nbsp; of&nbsp;<span style=3D"white-space-collapse: preserve;">meta/reci=
pes-devtools/dmidecode/dmidecode/CVE-2023-30630_5.patch?<br />Do we need to=
 include in dmidecode_3.3.bb?<br /><br />Thx,<br />KJ</span>

--yJrfUfl6hMQfd498kVjg--

