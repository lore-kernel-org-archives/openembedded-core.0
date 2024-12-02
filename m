Return-Path: <nicolas.gillen@agregio-solutions.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA575D78313
	for <webhook@archiver.kernel.org>; Mon,  2 Dec 2024 12:33:58 +0000 (UTC)
Subject: [scarthgap][backport] rootfs: Ensure run-postinsts is not uninstalled for read-only-rootfs-delayed-postinsts
To: openembedded-core@lists.openembedded.org
From: "Nicolas Gillen" <nicolas.gillen@agregio-solutions.com>
X-Originating-Location: Lyon, Auvergne-Rhone-Alpes, FR (92.154.54.160)
X-Originating-Platform: Linux Chrome 131
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Mon, 02 Dec 2024 04:33:57 -0800
Message-ID: <1syp.1733142837542194751.ngWL@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="yEAA0GweBbEIUZhfLtlP"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 02 Dec 2024 12:33:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208142

--yEAA0GweBbEIUZhfLtlP
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hello,

I need to have postinstall scripts working on a read-only file system on sc=
arthcap.
That's why I would like to have the commit 60f587475dda99eaa07848880058b692=
86b8900e ( https://git.openembedded.org/openembedded-core/commit/?id=3D60f5=
87475dda99eaa07848880058b69286b8900e ) from master backported to scarthgap.

Please let me know if there is a better format to request this.

Thank you!
--
Nicolas Gillen

--yEAA0GweBbEIUZhfLtlP
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>
<div>Hello,</div>
<div>&nbsp;</div>
<div>I need to have postinstall scripts working on a read-only file system =
on scarthcap.<br />That's why I would like to have the commit <a href=3D"ht=
tps://git.openembedded.org/openembedded-core/commit/?id=3D60f587475dda99eaa=
07848880058b69286b8900e" target=3D"_blank" rel=3D"noopener">60f587475dda99e=
aa07848880058b69286b8900e</a> from master backported to scarthgap.</div>
<div>&nbsp;</div>
<div>Please let me know if there is a better format to request this.</div>
<div>&nbsp;</div>
<div>Thank you!</div>
</div>
<div>--</div>
<div>Nicolas Gillen</div>

--yEAA0GweBbEIUZhfLtlP--

