Return-Path: <gudni.m.g@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B6D4C83F10
	for <webhook@archiver.kernel.org>; Sat, 12 Jul 2025 14:12:06 +0000 (UTC)
Subject: Re: [PATCH] sqlite3: upgrade 3.48.0 -> 3.50.2
To: openembedded-core@lists.openembedded.org
From: =?UTF-8?B?R3XDsG5pIE3DoXIgR2lsYmVydA==?= <gudni.m.g@gmail.com>
X-Originating-Location: Reykjavik, Capital Region, IS (81.15.100.92)
X-Originating-Platform: Windows Firefox 140
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Sat, 12 Jul 2025 07:12:03 -0700
References: <20250712140638.3099109-1-gudni.m.g@gmail.com>
In-Reply-To: <20250712140638.3099109-1-gudni.m.g@gmail.com>
Message-ID: <24850.1752329523627965940@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="NtObSASvP1YofQmlS7Xe"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 12 Jul 2025 14:12:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220191

--NtObSASvP1YofQmlS7Xe
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Previous discussion thread: https://lists.openembedded.org/g/openembedded-c=
ore/topic/113866512

I built today core-image-minimal on latest master (Git HEAD for reference: =
https://git.openembedded.org/openembedded-core/commit/?id=3Dcf89a121f93e404=
485983b92abc88a46a7f24890) and also upgraded SQLite from 3.50.1 to 3.50.2 f=
or bug fixes.

So far I haven't been able to reproduce the issue with pseudo I saw with SQ=
Lite 3.50.1, and I wonder if the autobuilder/test system will catch any iss=
ues?

--NtObSASvP1YofQmlS7Xe
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>Previous discussion thread: <a href=3D"https://lists.openembedded.org/=
g/openembedded-core/topic/113866512" target=3D"_blank" rel=3D"noopener">htt=
ps://lists.openembedded.org/g/openembedded-core/topic/113866512</a></div>
<div>&nbsp;</div>
<div>I built today <em>core-image-minimal</em> on latest master (Git HEAD f=
or reference: <a href=3D"https://git.openembedded.org/openembedded-core/com=
mit/?id=3Dcf89a121f93e404485983b92abc88a46a7f24890)" target=3D"_blank" rel=
=3D"noopener">https://git.openembedded.org/openembedded-core/commit/?id=3Dc=
f89a121f93e404485983b92abc88a46a7f24890)</a> and also upgraded SQLite from =
3.50.1 to 3.50.2 for bug fixes.</div>
<div>&nbsp;</div>
<div>So far I haven't been able to reproduce the issue with pseudo I saw wi=
th SQLite 3.50.1, and I wonder if the autobuilder/test system will catch an=
y issues?</div>

--NtObSASvP1YofQmlS7Xe--

