Return-Path: <sundeep.kokkonda@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65B8BC43334
	for <webhook@archiver.kernel.org>; Wed, 13 Jul 2022 16:06:07 +0000 (UTC)
Subject: Re: [PATCH v2 1/2] rust-common: Fix use of target definitions for SDK
 generation
To: openembedded-core@lists.openembedded.org
From: "Sundeep KOKKONDA" <sundeep.kokkonda@gmail.com>
X-Originating-Location: Hyderabad, Telangana, IN (49.205.114.162)
X-Originating-Platform: Windows Chrome 103
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Wed, 13 Jul 2022 09:05:57 -0700
References: <20220710164300.953098-1-otavio@ossystems.com.br>
In-Reply-To: <20220710164300.953098-1-otavio@ossystems.com.br>
Message-ID: <13068.1657728357681872556@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="DSF7VNopGLHSkefs6vM4"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Jul 2022 16:06:07 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167964

--DSF7VNopGLHSkefs6vM4
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hello Otavio,

Are there any build/test issues with previous implementation? Can you let m=
e know what are the regression caused by below commits. I want to understan=
d the reason for the changes in this patch.
Fixes: ef566af964 ("rust: fix issue building cross-canadian tools for aarch=
64 on x86_64")
Fixes: bd36593ba3 ("rust-common: Drop LLVM_TARGET and simplify")
Fixes: 8ed000debb ("rust-common: Fix for target definitions returning 'None=
Type' for arm")

Thanks,
Sundeep K.

--DSF7VNopGLHSkefs6vM4
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>Hello Otavio,</div>
<div>&nbsp;</div>
<div>Are there any build/test issues with previous implementation? Can you =
let me know what are the regression caused by below commits. I want to unde=
rstand the reason for the changes in this patch.</div>
<div>Fixes: ef566af964 ("rust: fix issue building cross-canadian tools for =
aarch64 on x86_64")</div>
<div>Fixes: bd36593ba3 ("rust-common: Drop LLVM_TARGET and simplify")</div>
<div>Fixes: 8ed000debb ("rust-common: Fix for target definitions returning =
'NoneType' for arm")</div>
<div>&nbsp;</div>
<div>&nbsp;</div>
<div>Thanks,</div>
<div>Sundeep K.</div>

--DSF7VNopGLHSkefs6vM4--

