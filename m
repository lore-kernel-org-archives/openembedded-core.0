Return-Path: <vpuar@qti.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 681B0CDB470
	for <webhook@archiver.kernel.org>; Wed, 24 Jun 2026 05:10:00 +0000 (UTC)
Subject: Re: [PATCH] linux-firmware: upgrade 20260519 -> 20260622
To: openembedded-core@lists.openembedded.org
From: "Vivek Puar" <vpuar@qti.qualcomm.com>
X-Originating-Location: Chennai, Tamil Nadu, IN (163.116.214.126)
X-Originating-Platform: Windows Chrome 149
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Tue, 23 Jun 2026 22:09:52 -0700
References: <20260623171339.1489308-1-vpuar@qti.qualcomm.com> <lf3gxnthrsftrp3mtqjywqnc5barhfz77uw4l2xshld7gcyzuc@7hzndercqhvl>
In-Reply-To: <lf3gxnthrsftrp3mtqjywqnc5barhfz77uw4l2xshld7gcyzuc@7hzndercqhvl>
Message-ID: <67857.1782277792927297878@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="hdos66xnWCWeudZUzOnn"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Jun 2026 05:10:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239466

--hdos66xnWCWeudZUzOnn
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 23, 2026 at 11:19 PM, Dmitry Baryshkov wrote:

>=20
> You can also delete REMOVE_UNLICENSED and all special handling for it.

Some LICENSES are still present in linux-firmware.git, once cleanup is done=
, we can delete REMOVE_UNLICENSED from recipe.

>=20
> s/lpaicp/audio/

Updated in PATCH v2.

Regards,
Vivek

--hdos66xnWCWeudZUzOnn
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>On Tue, Jun 23, 2026 at 11:19 PM, Dmitry Baryshkov wrote:</div>
<div>
<blockquote>You can also delete REMOVE_UNLICENSED and all special handling =
for it.</blockquote>
Some LICENSES are still present in linux-firmware.git, once cleanup is done=
, we can delete REMOVE_UNLICENSED from recipe.<br />
<blockquote>s/lpaicp/audio/</blockquote>
Updated in PATCH v2.</div>
<div>&nbsp;</div>
<div>Regards,</div>
<div>Vivek</div>

--hdos66xnWCWeudZUzOnn--

