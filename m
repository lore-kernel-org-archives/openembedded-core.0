Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C227C77B7F
	for <webhook@archiver.kernel.org>; Wed, 26 Apr 2023 11:36:18 +0000 (UTC)
Subject: Re: [PATCH v2] wic/bootimg-efi: if fixed-size is set then use that for mkdosfs
To: openembedded-core@lists.openembedded.org
From: "Paresh Bhagat" <p-bhagat@ti.com>
X-Originating-Location: US (192.163.5.9)
X-Originating-Platform: Windows Chrome 112
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Wed, 26 Apr 2023 02:06:59 -0700
References: <51022390-b911-5b8c-36bf-3ddb13263826@ti.com>
In-Reply-To: <51022390-b911-5b8c-36bf-3ddb13263826@ti.com>
Message-ID: <17864.1682500019497210025@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="pUnsw8lUz1fJLWsZuRnD"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Apr 2023 11:36:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180435

--pUnsw8lUz1fJLWsZuRnD
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi Randolph

I tested your patch in my local kirkstone build for am62x. SD Card boot is =
working.
Boot logs here: http://serenity.dal.design.ti.com:7777/ewakutoqom.yaml

Regards,
Paresh

--pUnsw8lUz1fJLWsZuRnD
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi Randolph<br /><br />I tested your patch in my local kirkstone build for =
am62x. SD Card boot is working.<br />Boot logs here:&nbsp;<a href=3D"http:/=
/serenity.dal.design.ti.com:7777/ewakutoqom.yaml" target=3D"_blank" rel=3D"=
noopener">http://serenity.dal.design.ti.com:7777/ewakutoqom.yaml</a><br /><=
br />Regards,<br />Paresh&nbsp;

--pUnsw8lUz1fJLWsZuRnD--

