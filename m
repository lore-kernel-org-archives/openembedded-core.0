Subject: Re: [wrynose][PATCH v2] libarchive: fix CVE-2026-15028
To: openembedded-core@lists.openembedded.org
From: "Jakub Szczudlo" <jakub.szczudlo@nokia.com>
X-Originating-Location: Warsaw, Mazovia, PL (147.161.248.245)
X-Originating-Platform: Windows Firefox 153
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Mon, 19 Oct 2026 23:25:41 -0700
References: <20261012110033.11294-1-jakub.szczudlo@nokia.com> <DM91OKWLPVM3.FEZC67AJPXQB@smile.fr>
In-Reply-To: <DM91OKWLPVM3.FEZC67AJPXQB@smile.fr>
Message-ID: <2200835.1792477541899712457@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="nMNvU99LV2GAetMHTmVL"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 20 Oct 2026 06:25:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248221

--nMNvU99LV2GAetMHTmVL
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi,
we talked about it in version 1 but I forgot to mention it in commit.
Anyway this CVE was fixed in 3.8.9 by cherry-pick:
https://github.com/libarchive/libarchive/commit/22ffe8e8e459970f3bc86b02674=
93fc4aa8249b8
that is both on master and blacksail.
I can mark them fixed there if you would like to.

Best regards,
Jakub Szczudlo

--nMNvU99LV2GAetMHTmVL
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>Hi,<br />we talked about it in version 1 but I forgot to mention it in=
 commit.<br />Anyway this CVE was fixed in 3.8.9 by cherry-pick:<br /><a hr=
ef=3D"https://github.com/libarchive/libarchive/commit/22ffe8e8e459970f3bc86=
b0267493fc4aa8249b8" target=3D"_blank" rel=3D"noopener">https://github.com/=
libarchive/libarchive/commit/22ffe8e8e459970f3bc86b0267493fc4aa8249b8</a><b=
r />that is both on master and blacksail.<br />I can mark them fixed there =
if you would like to.<br /><br />Best regards,<br />Jakub Szczudlo</div>

--nMNvU99LV2GAetMHTmVL--
