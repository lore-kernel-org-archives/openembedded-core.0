Subject: Re: [PATCH 0/5] devtool: Support multiconfig workflows and fix kernel extraction
To: openembedded-core@lists.openembedded.org
From: "Anusmita Dutta Mazumder" <anusmita.duttamazumder@arm.com>
X-Originating-Location: GB (217.140.106.53)
X-Originating-Platform: Windows Chrome 156
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Wed, 28 Oct 2026 08:10:06 -0700
References: <20261023102215.4043005-1-anusmita.duttamazumder@arm.com> <fe9ebfd9a22724c0387504cee4b5e857482a17e9.camel@gmail.com>
In-Reply-To: <fe9ebfd9a22724c0387504cee4b5e857482a17e9.camel@gmail.com>
Message-ID: <2990982.1793200206089623219@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="8EgqFuAvN2DZeluNP6i9"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 28 Oct 2026 15:10:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248818

--8EgqFuAvN2DZeluNP6i9
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi Adrian,

Thank you for the review. I agree that a common workspace mechanism for mul=
ticonfig and BBCLASSEXTEND variants makes sense. The shared-bbappend approa=
ch looks sensible to me, with settings scoped by both recipe variant and mu=
lticonfig.

I=E2=80=99d be happy to work on the multiconfig extension, building on the =
relevant shared-workspace changes already in your series and keeping the ch=
anges separately reviewable.

Would that be a suitable way forward? If so, which patches or version of yo=
ur series would you recommend using as the base?

Regards,
Anusmita

--8EgqFuAvN2DZeluNP6i9
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>Hi Adrian,<br /><br />Thank you for the review. I agree that a common =
workspace mechanism for multiconfig and BBCLASSEXTEND variants makes sense.=
 The shared-bbappend approach looks sensible to me, with settings scoped by=
 both recipe variant and multiconfig.<br /><br />I&rsquo;d be happy to work=
 on the multiconfig extension, building on the relevant shared-workspace ch=
anges already in your series and keeping the changes separately reviewable.=
<br /><br />Would that be a suitable way forward? If so, which patches or v=
ersion of your series would you recommend using as the base?<br /><br />Reg=
ards,<br />Anusmita</div>

--8EgqFuAvN2DZeluNP6i9--
