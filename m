Return-Path: <setairidis@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FF66C71135
	for <webhook@archiver.kernel.org>; Fri, 13 Jun 2025 13:23:02 +0000 (UTC)
Subject: [scarthgap] Recipe systemd version was changed #scarthgap
To: openembedded-core@lists.openembedded.org
From: "Savvas Etairidis" <setairidis@gmail.com>
X-Originating-Location: Frankfurt am Main, Hesse, DE (147.161.234.96)
X-Originating-Platform: Windows Chrome 137
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Fri, 13 Jun 2025 06:22:56 -0700
Message-ID: <Ely1.1749820976286643166.pmUL@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="7z4sGkHoGaiT3x9HiQ5Z"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 Jun 2025 13:23:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218611

--7z4sGkHoGaiT3x9HiQ5Z
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi all,

we noticed that the systemd recipe in the scarthgap brach was renamed from =
systemd_255.18.bb to systemd_v255.21.bb was this indetional?
The reanme adds a v before the version number. This change has influence on=
 the CVE task we have running.
Should I create a commit to revert this name change?

Thanks in advance,
Savvas

--7z4sGkHoGaiT3x9HiQ5Z
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>Hi all,</div>
<div>&nbsp;</div>
<div>we noticed that the systemd recipe in the scarthgap brach was renamed =
from systemd_255.18.bb to systemd_v255.21.bb was this indetional?</div>
<div>The reanme adds a v before the version number. This change has influen=
ce on the CVE task we have running.</div>
<div>Should I create a commit to revert this name change?</div>
<div>&nbsp;</div>
<div>Thanks in advance,</div>
<div>Savvas</div>

--7z4sGkHoGaiT3x9HiQ5Z--

