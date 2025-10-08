Return-Path: <kavinaya@qti.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 540F9CCA470
	for <webhook@archiver.kernel.org>; Wed,  8 Oct 2025 18:05:03 +0000 (UTC)
Subject: Re: [PATCH v4 1/1] fitimage: Add support for custom compatible string via optional parameter
To: openembedded-core@lists.openembedded.org
From: "Kavinaya S" <kavinaya@qti.qualcomm.com>
X-Originating-Location: Mumbai, Maharashtra, IN (163.116.213.159)
X-Originating-Platform: Windows Chrome 141
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Wed, 08 Oct 2025 11:05:01 -0700
References: <gahunfldkpx3p453csdcoxnosrvbcnnzoeamsmxvzxxesvyls4@v4eicwchoz3p>
In-Reply-To: <gahunfldkpx3p453csdcoxnosrvbcnnzoeamsmxvzxxesvyls4@v4eicwchoz3p>
Message-ID: <10142.1759946701511738883@lists.openembedded.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Oct 2025 18:05:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224587

On Mon, Oct  6, 2025 at 04:04 AM, Dmitry Baryshkov wrote:

>
> Of course you can.
>
Couldn't find any precedence in kernel device tree project for dtbos perfor=
ming platform overlays. All I could see are performing only driver overlays=
. Since these are already accepted in linux kernel, assuming updating compa=
tible string is not necessary always. =20

