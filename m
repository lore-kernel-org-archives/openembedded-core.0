Return-Path: <mhalstead@linuxfoundation.org>
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com
	[209.85.210.43])
	by mail.openembedded.org (Postfix) with ESMTP id C57A061CC6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Mar 2020 23:58:40 +0000 (UTC)
Received: by mail-ot1-f43.google.com with SMTP id 66so11982478otd.9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Mar 2020 16:58:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=mime-version:from:date:message-id:subject:to;
	bh=Rq0sYyqzUa6ve58wf9QFme0R8HeZmQUxKqKZghBzCBs=;
	b=U5cx0/pNEnncr4fatQwFkIfgicrNZl0tjvC6z9kyzPJYmEHvLUJPpzn4cGvvZ2K/Vp
	ZSDRTomXJ9UpszClcCrE/N1kXodDQhvR2HIrGd10nTkIZ6CQR/iyX/Jt5xvMLDRbnptQ
	ktphpA+hPHyYm/VzIPZQOFTKIoswseSskpER4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=Rq0sYyqzUa6ve58wf9QFme0R8HeZmQUxKqKZghBzCBs=;
	b=KB8hhGoar8fgVTxNCcp05WeMJWvr9Vt+adbDnpx5Kas3TE60XTBi5TJDoM1K+CYb9Q
	NbVY9VKuL2NPcHfyfyYsHbLB+GjTPLSIQTVH6V3cEoqj6d2YtAsnCiSDTUpQNy9BBmHq
	PbRQciQmBq6cvcWwMLiFoVAXAEusup/E7ml3HpaP/TBd12M1Tc6sQYodK0DLyGpUwkOE
	BsmyS5DGjvKhtjQOXQR991mfBPFsLlPUhJa3LXozekHGKIKQTpD5ufz2UXCcQr1Q0jBR
	Qubifm423nowwEq/hriXQbTlBZ4i4J68Qc3Pglk2BtKwr5CZTcWdd0tHgbrKPrt1Idc+
	IOOg==
X-Gm-Message-State: ANhLgQ3k2LZ/g7jVmLck1xdQ6P2LwPpGVNZEozc943cPbT0+SDaeizgK
	Oq2pa+hJMG0x5d1KHm2OUUeazq6ePcmJ2XSNZ0XeTA==
X-Google-Smtp-Source: ADFU+vuaWgTdGvwte3xYfKMHJQKAmg3AtmkhbSQgebszsBl7foyE7MTvX4gl+CdkhnwRtTLO9bnXGwslBIwcBSjzXlk=
X-Received: by 2002:a05:6830:1e25:: with SMTP id
	t5mr1367081otr.70.1584143921519; 
	Fri, 13 Mar 2020 16:58:41 -0700 (PDT)
MIME-Version: 1.0
From: Michael Halstead <mhalstead@linuxfoundation.org>
Date: Fri, 13 Mar 2020 16:58:30 -0700
Message-ID: <CADfgfobNNXr9HSOiwyamzbZ4q1uc8wgD5PzobDF56cDyYui-HQ@mail.gmail.com>
To: bitbake-devel@lists.openembedded.org, 
	openembedded-core <openembedded-core@lists.openembedded.org>, 
	openembedded-architecture@lists.openembedded.org, 
	openembeded-devel <Openembedded-devel@lists.openembedded.org>
Subject: Mailing list platform change March 20th
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 13 Mar 2020 23:58:42 -0000
Content-Type: multipart/alternative; boundary="000000000000b7349905a0c53f33"

--000000000000b7349905a0c53f33
Content-Type: text/plain; charset="UTF-8"

We are moving our lists from Mailman to Groups.io. E-mail to lists will be
delayed during the move window. We are aiming to complete the migration
during business hours in the Pacific time zone.

A new account will be created for you on the Groups.io platform if you
don't already have one.

You can read more about the change on the wiki:
https://www.openembedded.org/wiki/GroupsMigration

If there are serious issues we will rollback the changes. We will e-mail
all lists when work is complete.

--
Michael Halstead
Linux Foundation / Yocto Project
Systems Operations Engineer

--000000000000b7349905a0c53f33
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>We are moving our lists from Mailman to=C2=A0<span cl=
ass=3D"gmail-il">Groups</span>.<span class=3D"gmail-il">io</span>. E-mail t=
o lists will be delayed during the move window. We are aiming to complete t=
he migration during business hours in the Pacific time zone.<br></div><div>=
<br></div><div>A new account will be created for you on the=C2=A0<span clas=
s=3D"gmail-il">Groups</span>.<span class=3D"gmail-il">io</span>=C2=A0platfo=
rm if you don&#39;t already have one.<br></div><div><br></div><div>You can =
read more about the change on the wiki:<br></div><a href=3D"https://www.ope=
nembedded.org/wiki/GroupsMigration">https://www.openembedded.org/wiki/Group=
sMigration</a><br><div><br></div><div>If there are serious issues we will r=
ollback the changes. We will e-mail<br>all lists when work is complete.<br>=
</div><div><br></div><div><span style=3D"color:rgb(136,136,136)">--</span><=
br style=3D"color:rgb(136,136,136)"><span style=3D"color:rgb(136,136,136)">=
Michael Halstead</span><br style=3D"color:rgb(136,136,136)"><span style=3D"=
color:rgb(136,136,136)">Linux Foundation / Yocto Project</span><br style=3D=
"color:rgb(136,136,136)"><span style=3D"color:rgb(136,136,136)">Systems Ope=
rations Engineer</span><br></div><div><br></div></div>

--000000000000b7349905a0c53f33--
