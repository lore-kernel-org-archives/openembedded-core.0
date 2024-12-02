Return-Path: <nicolas.gillen@agregio-solutions.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFDC4D78316
	for <webhook@archiver.kernel.org>; Mon,  2 Dec 2024 12:40:38 +0000 (UTC)
Subject: [scarthgap][backport] rootfs: Ensure run-postinsts is not uninstalled for read-only-rootfs-delayed-postinsts
To: openembedded-core@lists.openembedded.org
From: "Nicolas Gillen" <nicolas.gillen@agregio-solutions.com>
X-Originating-Location: Lyon, Auvergne-Rhone-Alpes, FR (92.154.54.160)
X-Originating-Platform: Linux Chrome 131
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Mon, 02 Dec 2024 04:40:37 -0800
Message-ID: <dA0U.1733143237002092564.h5iC@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="FwVk7b8arguaBDpkXGXb"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 02 Dec 2024 12:40:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208143

--FwVk7b8arguaBDpkXGXb
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hello,

I need to have postinstall scripts working on a read-only file system on sc=
arthcap.That's why I would like to have the commit 60f587475dda99eaa0784888=
0058b69286b8900e ( https://git.openembedded.org/openembedded-core/commit/?i=
d=3D60f587475dda99eaa07848880058b69286b8900e ) from master backported to sc=
arthgap.

Please let me know if there is a better format to request this.
Thank you!
--
Nicolas Gillen

--FwVk7b8arguaBDpkXGXb
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div><span style=3D"background-color: var(--light-mode-body-color);">Hello,=
</span></div>
<div>
<div>&nbsp;</div>
<div>I need to have postinstall scripts working on a read-only file system =
on scarthcap.That's why I would like to have the commit <a href=3D"https://=
git.openembedded.org/openembedded-core/commit/?id=3D60f587475dda99eaa078488=
80058b69286b8900e" target=3D"_blank" rel=3D"noopener">60f587475dda99eaa0784=
8880058b69286b8900e</a> from master backported to scarthgap.</div>
<div>&nbsp;</div>
<div>Please let me know if there is a better format to request this.</div>
<div>Thank you!</div>
</div>
<div>--</div>
<div>Nicolas Gillen</div>

--FwVk7b8arguaBDpkXGXb--

