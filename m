Return-Path: <sundeep.kokkonda@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CC2EC02183
	for <webhook@archiver.kernel.org>; Thu, 16 Jan 2025 15:53:01 +0000 (UTC)
Subject: Re: [PATCH V2 1/2] rust: fix for rust multilib sdk configuration
To: openembedded-core@lists.openembedded.org
From: "Sundeep KOKKONDA" <sundeep.kokkonda@windriver.com>
X-Originating-Location: Hyderabad, Telangana, IN (49.205.254.149)
X-Originating-Platform: Windows Firefox 134
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Thu, 16 Jan 2025 07:52:53 -0800
References: <29c89cf909ccda3949e0bd1b50a5dbbc0a18094d.camel@linuxfoundation.org>
In-Reply-To: <29c89cf909ccda3949e0bd1b50a5dbbc0a18094d.camel@linuxfoundation.org>
Message-ID: <1047.1737042773418542532@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="208YuSupBDfD0qtJNaRr"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Jan 2025 15:53:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209967

--208YuSupBDfD0qtJNaRr
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The config file has options to set the linker for the target, which is anyw=
ay getting set with the sdk environment. So, the config file is redundant a=
nd removed.

--208YuSupBDfD0qtJNaRr
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>The config file has options to set the linker for the target, which is=
 anyway getting set with the sdk environment. So, the config file is redund=
ant and removed.</div>

--208YuSupBDfD0qtJNaRr--

