Return-Path: <Deepthi.Hemraj@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECAECC25B76
	for <webhook@archiver.kernel.org>; Wed,  5 Jun 2024 14:56:47 +0000 (UTC)
Subject: Re: [scarthgap][PATCH V2] gcc : upgrade to v13.3
To: openembedded-core@lists.openembedded.org
From: "Hemraj, Deepthi" <Deepthi.Hemraj@windriver.com>
X-Originating-Location: IN (152.58.232.231)
X-Originating-Platform: Windows Chrome 125
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Wed, 05 Jun 2024 07:56:42 -0700
References: <20240605143945.405558-1-Deepthi.Hemraj@windriver.com>
In-Reply-To: <20240605143945.405558-1-Deepthi.Hemraj@windriver.com>
Message-ID: <18618.1717599402117239778@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="DTZqrr3D3yJnlVV8SzY3"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Jun 2024 14:56:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200370

--DTZqrr3D3yJnlVV8SzY3
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Regression testing was done and below are the test results:
*After update (v13.3)*

=3D=3D=3D gcc Summary =3D=3D=3D

# of expected passes =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0248620
# of unexpected failures =C2=A0 =C2=A0 =C2=A0 =C2=A09
# of expected failures =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A02484
# of unresolved testcases=C2=A0 =C2=A0 25028
# of unsupported tests=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A04145

*Before update (v13.2)*

=3D=3D=3D gcc Summary =3D=3D=3D

# of expected passes =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0148304
# of unexpected failures =C2=A0 =C2=A0 =C2=A0 =C2=A015
# of expected failures =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A01420
# of unresolved testcases=C2=A0 =C2=A0 =C2=A025136
# of unsupported tests =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A02688

--DTZqrr3D3yJnlVV8SzY3
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Regression testing was done and below are the test results:<br /><strong>Af=
ter update (v13.3)</strong><br /><br />=3D=3D=3D gcc Summary =3D=3D=3D<br /=
><br /># of expected passes &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;248620=
<br /># of unexpected failures &nbsp; &nbsp; &nbsp; &nbsp;9<br /># of expec=
ted failures &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;2484<br /># of unresolved te=
stcases&nbsp; &nbsp; 25028<br /># of unsupported tests&nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp;4145<br /><br /><strong>Before update (v13.2)</strong><br /><b=
r />=3D=3D=3D gcc Summary =3D=3D=3D<br /><br /># of expected passes &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;148304 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp;&nbsp;<br /># of unexpected failures &nbsp; &nbsp; &nb=
sp; &nbsp;15<br /># of expected failures &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
1420<br /># of unresolved testcases&nbsp; &nbsp; &nbsp;25136<br /># of unsu=
pported tests &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;2688

--DTZqrr3D3yJnlVV8SzY3--

