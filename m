Received: from mail-ia0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1TfyiF-0004fY-Uo
	for openembedded-core@lists.openembedded.org;
	Tue, 04 Dec 2012 21:03:29 +0100
Received: by mail-ia0-f175.google.com with SMTP id z3so3342485iad.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 04 Dec 2012 11:49:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=AqkYQ/XQPmZQRbiZXHOIRWrf4FtGggGyO62JSaqioy8=;
	b=UOj31b+WssHbHhXgYds24oLn8OIby1jEadhOkB3tQZUxAmCNmiqzwv38JtdtMG09F6
	M30oBwxHJ/wGydxmCBlI0+0fDHJ3oqzl56+OvirXYU/JBKUuEbtY4jHUziv4gmfUXnK+
	hFJNY44QzhgOtfiI6vFkgA05cqkRtCPfAPmHrscD2Su69NqIL28bKp5LwVm4fW+XZ4s+
	AclCRRWBdhCM36pVwOEOG5Uj7pYYTXQ5RlZ5H/hZSQKCv2HkjL//Hp62qDTmeptUGioy
	roT+ejxGmZzPVsDDmuDBzpf+Rqh7dnieCFkxWfSS9iwZMpXcPhiVRbH4Em3weX4xxIOo
	KF3A==
Received: by 10.50.173.34 with SMTP id bh2mr3831887igc.70.1354650544560; Tue,
	04 Dec 2012 11:49:04 -0800 (PST)
MIME-Version: 1.0
Received: by 10.64.19.8 with HTTP; Tue, 4 Dec 2012 11:48:34 -0800 (PST)
In-Reply-To: <50BDC045.1030804@linaro.org>
References: <cover.1354116375.git.raj.khem@gmail.com>
	<50B6301B.3010106@linaro.org>
	<CAMKF1sr3h8gHmhPbjXa-VfoSfsNsmmWANyNi_Eshp+xcwv5oCw@mail.gmail.com>
	<50BDC045.1030804@linaro.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 4 Dec 2012 11:48:34 -0800
Message-ID: <CAMKF1sr2xvJDTP4+r+5F_GpE0E=peREQ2OKacfuWDTgpMAn-2A@mail.gmail.com>
To: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/3] Upgrade binutils to 2.23.1
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 04 Dec 2012 20:03:29 -0000
Content-Type: multipart/alternative; boundary=e89a8f647b3b80db9a04d00c2813

--e89a8f647b3b80db9a04d00c2813
Content-Type: text/plain; charset=UTF-8

can you point out ?
is it branch issue or some patch that I dropped


On Tue, Dec 4, 2012 at 1:20 AM, Marcin Juszkiewicz <
marcin.juszkiewicz@linaro.org> wrote:

> W dniu 28.11.2012 18:43, Khem Raj pisze:
> > On Wed, Nov 28, 2012 at 7:39 AM, Marcin Juszkiewicz
>
> >     I did builds for AArch64 with 2.23 and they were working fine. Will
> do
> >     2.23.1 build as well.
> >
> > thanks. let me know of any fallouts.
>
> Due to some updates I had to move to trunk again.
>

--e89a8f647b3b80db9a04d00c2813
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<font><font face=3D"courier new,monospace">can you point out ?</font></font=
><div><font><font face=3D"courier new,monospace">is it branch issue or some=
 patch that I dropped</font></font></div><div class=3D"gmail_extra"><br><br=
><div class=3D"gmail_quote">

On Tue, Dec 4, 2012 at 1:20 AM, Marcin Juszkiewicz <span dir=3D"ltr">&lt;<a=
 href=3D"mailto:marcin.juszkiewicz@linaro.org" target=3D"_blank">marcin.jus=
zkiewicz@linaro.org</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quo=
te" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"=
>

W dniu 28.11.2012 18:43, Khem Raj pisze:<br>
<div class=3D"im">&gt; On Wed, Nov 28, 2012 at 7:39 AM, Marcin Juszkiewicz<=
br>
<br>
</div><div class=3D"im">&gt; =C2=A0 =C2=A0 I did builds for AArch64 with 2.=
23 and they were working fine. Will do<br>
&gt; =C2=A0 =C2=A0 2.23.1 build as well.<br>
&gt;<br>
&gt; thanks. let me know of any fallouts.<br>
<br>
</div>Due to some updates I had to move to trunk again.<br>
</blockquote></div><br></div>

--e89a8f647b3b80db9a04d00c2813--
