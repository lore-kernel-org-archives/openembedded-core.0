Return-Path: <anton.antonov@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2DE8C4332F
	for <webhook@archiver.kernel.org>; Tue, 20 Dec 2022 11:24:42 +0000 (UTC)
Subject: Re: [langdale][master][PATCH v2] rust: Do not use default compiler flags defined in CC crate
To: openembedded-core@lists.openembedded.org
From: "Anton Antonov" <anton.antonov@arm.com>
X-Originating-Location: Cambridge, England, GB (217.140.99.251)
X-Originating-Platform: Mac Firefox 107
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Tue, 20 Dec 2022 03:24:36 -0800
References: <Y59bu7W+hEtBpCAj@mail.local>
In-Reply-To: <Y59bu7W+hEtBpCAj@mail.local>
Message-ID: <13237.1671535476136428000@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="jg0J8qJEY2mj4JKmMIx7"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 Dec 2022 11:24:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174845

--jg0J8qJEY2mj4JKmMIx7
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi Alexandre,

CRATE_CC_NO_DEFAULTS should not be set for native-sdk recipes. The issue is=
 fixed in v3 of the patch.

Cheers,
Anton

--jg0J8qJEY2mj4JKmMIx7
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi Alexandre,<br /><br />&nbsp; CRATE_CC_NO_DEFAULTS should not be set for =
native-sdk recipes. The issue is fixed in v3 of the patch.<br /><br />Cheer=
s,<br />Anton

--jg0J8qJEY2mj4JKmMIx7--

