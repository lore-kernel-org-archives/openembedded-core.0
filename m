Return-Path: <deepesh.varatharajan@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D767D25B4E
	for <webhook@archiver.kernel.org>; Wed, 28 Jan 2026 12:43:12 +0000 (UTC)
Subject: Re: [PATCH] glibc: mark CVE-2025-15281, CVE-2026-0861 and CVE-2026-0915 as patched
To: openembedded-core@lists.openembedded.org
From: "Varatharajan, Deepesh" <deepesh.varatharajan@windriver.com>
X-Originating-Location: Bengaluru, Karnataka, IN (49.204.85.206)
X-Originating-Platform: Windows Chrome 144
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Wed, 28 Jan 2026 04:43:11 -0800
References: <20260125162241.730332-1-peter.marko@siemens.com>
In-Reply-To: <20260125162241.730332-1-peter.marko@siemens.com>
Message-ID: <995143.1769604191932117173@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="F6UVA5kURcv7KamKtWZP"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 Jan 2026 12:43:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230091

--F6UVA5kURcv7KamKtWZP
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jan 25, 2026 at 09:59 PM, Peter Marko wrote:

>=20
> -CVE_STATUS_STABLE_BACKPORTS =3D ""
> +CVE_STATUS_STABLE_BACKPORTS =3D "CVE-2025-15281 CVE-2026-0861
> CVE-2026-0915"

Hi Peter,

The current commit hash does not include the fix for *CVE-2025-15281*. The =
hash needs to be updated to incorporate this fix.

Regards,
Deepesh

--F6UVA5kURcv7KamKtWZP
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>On Sun, Jan 25, 2026 at 09:59 PM, Peter Marko wrote:</div>
<div>
<blockquote>-CVE_STATUS_STABLE_BACKPORTS =3D ""<br />+CVE_STATUS_STABLE_BAC=
KPORTS =3D "CVE-2025-15281 CVE-2026-0861 CVE-2026-0915"</blockquote>
Hi Peter,<br /><br />The current commit hash does not include the fix for <=
strong>CVE-2025-15281</strong>. The hash needs to be updated to incorporate=
 this fix.<br /><br />Regards,<br />Deepesh</div>

--F6UVA5kURcv7KamKtWZP--

