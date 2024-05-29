Return-Path: <Deepthi.Hemraj@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1CBEC25B75
	for <webhook@archiver.kernel.org>; Wed, 29 May 2024 15:40:40 +0000 (UTC)
Subject: Re: [scarthgap][PATCH] gcc : upgrade to v13.3
To: openembedded-core@lists.openembedded.org
From: "Hemraj, Deepthi" <Deepthi.Hemraj@windriver.com>
X-Originating-Location: Bengaluru, Karnataka, IN (49.205.150.7)
X-Originating-Platform: Windows Chrome 125
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Wed, 29 May 2024 08:40:34 -0700
References: <20240529151343.3983689-1-Deepthi.Hemraj@windriver.com>
In-Reply-To: <20240529151343.3983689-1-Deepthi.Hemraj@windriver.com>
Message-ID: <26273.1716996143752603493@lists.openembedded.org>
X-Old-Date: Wed, 29 May 2024 08:22:23 -0700
Content-Type: multipart/alternative; boundary="p4lEiuMYA6oMZcLJoWLP"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 May 2024 15:40:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200008
Message-ID: <20240529154034.sZhNOixnHysgSjeJECurTV2ny7LjU8JSQRHqOFwBn1I@z>

--p4lEiuMYA6oMZcLJoWLP
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Regression testing is done and below are the testresults:
after update

=3D=3D=3D gcc Summary =3D=3D=3D

# of expected passes =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0148873
# of unexpected failures =C2=A0 =C2=A0 =C2=A0 =C2=A014
# of expected failures =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A01415
# of unresolved testcases =C2=A0 =C2=A0 =C2=A0 25371
# of unsupported tests =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A02695

before update

=3D=3D=3D gcc Summary =3D=3D=3D

# of expected passes =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0148304
# of unexpected failures =C2=A0 =C2=A0 =C2=A0 =C2=A015
# of expected failures =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A01420
# of unresolved testcases =C2=A0 =C2=A0 =C2=A0 25136
# of unsupported tests =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A02688

There are 569 new test cases added with this update.

--p4lEiuMYA6oMZcLJoWLP
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Regression testing is done and below are the testresults:<br />after update=
<br /><br />&nbsp;=3D=3D=3D gcc Summary =3D=3D=3D<br /><br /># of expected =
passes &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;148873<br /># of unexpected=
 failures &nbsp; &nbsp; &nbsp; &nbsp;14<br /># of expected failures &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp;1415<br /># of unresolved testcases &nbsp; &nbsp=
; &nbsp; 25371<br /># of unsupported tests &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p;2695<br /><br /><br />before update<br /><br />=3D=3D=3D gcc Summary =3D=
=3D=3D<br /><br /># of expected passes &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp;148304<br /># of unexpected failures &nbsp; &nbsp; &nbsp; &nbsp;15<br =
/># of expected failures &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;1420<br /># of u=
nresolved testcases &nbsp; &nbsp; &nbsp; 25136<br /># of unsupported tests =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;2688<br /><br />There are 569 new test ca=
ses added with this update.

--p4lEiuMYA6oMZcLJoWLP--

