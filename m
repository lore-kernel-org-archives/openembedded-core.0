Return-Path: <hongxu.jia@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E44BC3600C
	for <webhook@archiver.kernel.org>; Tue,  8 Apr 2025 04:30:37 +0000 (UTC)
Subject: Re: [PATCH 2/2] image-live.bbclass: fix booting EFI ISO live failed
To: openembedded-core@lists.openembedded.org
From: "hongxu" <hongxu.jia@eng.windriver.com>
X-Originating-Location: US (147.11.105.171)
X-Originating-Platform: Linux Firefox 136
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Mon, 07 Apr 2025 21:30:31 -0700
References: <E19241D0-CCA5-44BA-8C7E-9CC8906981EC@arm.com>
In-Reply-To: <E19241D0-CCA5-44BA-8C7E-9CC8906981EC@arm.com>
Message-ID: <6565.1744086631735956766@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="ZoU14OgKPIdKotdFRToq"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Apr 2025 04:30:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214509

--ZoU14OgKPIdKotdFRToq
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi Ross,

Forcing FATSIZE=3D=E2=80=9C-F 32=E2=80=9D did not work, I also tried to use=
 GPT + FAT partition to instead of MBR + FAT, and still failed

//Hongxu

--ZoU14OgKPIdKotdFRToq
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>Hi Ross,</div>
<div>&nbsp;</div>
<div>Forcing FATSIZE=3D&ldquo;-F 32&rdquo; did not work, I also tried to us=
e GPT + FAT partition to instead of MBR + FAT, and still failed</div>
<div>
<div>&nbsp;</div>
<div>//Hongxu</div>
</div>

--ZoU14OgKPIdKotdFRToq--

