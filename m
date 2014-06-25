Return-Path: <sadlife1990@gmail.com>
Received: from mail-ve0-f196.google.com (mail-ve0-f196.google.com
	[209.85.128.196])
	by mail.openembedded.org (Postfix) with ESMTP id 8396660D8B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Jun 2014 06:20:52 +0000 (UTC)
Received: by mail-ve0-f196.google.com with SMTP id oy12so354477veb.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Jun 2014 23:20:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=MdpG20TEbTK2FwT4MDu0XcAEW056DsaC7hO5RzsQSKs=;
	b=XQqcko4hRtgKqZGPjkobgLwCg7uPQ+zw5v6TMR8FY98O4GchQK/7TTWfPUI2XKgRPO
	iIbpMBD1uyRf/0WiG01wi0vSO+9cDC1WHQ9l7G1TbIYwxUPPkVXMHxs0e8d38dAM009n
	Fp46/4K1yb//cPrJ4I8CVrs0T67hVXwPLW+wkhVF3sjuAhl0BeioUfLMU5nvAbBomGKy
	b624pih7u6pUVT3hyPZMPWfbjN7x+feeXIU4jw2JmPyBsqjLIc+L6rwzV2aBNC5h9nUb
	zklhDP7LBv0b1/E5k4BUi2Ob4zKWbh5gLyqN3gFHzbnlhxMDByRMKTcQ0tToLaubkCbv
	K0XQ==
MIME-Version: 1.0
X-Received: by 10.58.8.12 with SMTP id n12mr5057214vea.28.1403677253112; Tue,
	24 Jun 2014 23:20:53 -0700 (PDT)
Received: by 10.58.152.200 with HTTP; Tue, 24 Jun 2014 23:20:53 -0700 (PDT)
In-Reply-To: <53AA2017.1030605@windriver.com>
References: <CAAHuHfwLfFtraRLwu=Pre4hobHHMVa4QxVwhbAgGuEGSNHWOOA@mail.gmail.com>
	<53AA2017.1030605@windriver.com>
Date: Wed, 25 Jun 2014 09:20:53 +0300
Message-ID: <CAAHuHfy8Uvhdeg-hs886i4k3uoNcL5CSHiseNOVQcmu1C=fnPg@mail.gmail.com>
From: Life Life <sadlife1990@gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [Yocto-builds] QT4 lib problem image file
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
X-List-Received-Date: Wed, 25 Jun 2014 06:20:58 -0000
Content-Type: multipart/alternative; boundary=089e013a043e0d1ad904fca31465

--089e013a043e0d1ad904fca31465
Content-Type: text/plain; charset=UTF-8

Thanks


2014-06-25 4:04 GMT+03:00 Robert Yang <liezhi.yang@windriver.com>:

>
> Hi Life,
>
> I think that this email should to into oe-core mailing list, fwd it.
>
> // Robert
>
>
> -------- Original Message --------
> Subject:        [Yocto-builds] QT4 lib problem image file
> Date:   Tue, 24 Jun 2014 15:53:31 +0300
> From:   Life Life <sadlife1990@gmail.com>
> To:     <yocto-builds@yoctoproject.org>
>
>
>
> Hello,
>
> I'm newbie, I'm testing beaglebone black. My setup and instruction
> following
>
> git clone git://github.com/Angstrom-distribution/setup-scripts.git
> <http://github.com/Angstrom-distribution/setup-scripts.git>
>
> cd setup-scripts
> MACHINE=beaglebone ./oebb.sh config beaglebone
> MACHINE=beaglebone ./oebb.sh update
> MACHINE=beaglebone ./oebb.sh
> after I run this command
>
> MACHINE=beaglebone ./oebb.sh bitbake -u hob and start hob GUI TOOL
> and select beaglebone and QT-embedded package and build image but I cant
> see my
> rootfs in qt lib. Please help.
>
>
>

--089e013a043e0d1ad904fca31465
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thanks</div><div class=3D"gmail_extra"><br><br><div class=
=3D"gmail_quote">2014-06-25 4:04 GMT+03:00 Robert Yang <span dir=3D"ltr">&l=
t;<a href=3D"mailto:liezhi.yang@windriver.com" target=3D"_blank">liezhi.yan=
g@windriver.com</a>&gt;</span>:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><br>
Hi Life,<br>
<br>
I think that this email should to into oe-core mailing list, fwd it.<br>
<br>
// Robert<div class=3D""><br>
<br>
-------- Original Message --------<br>
Subject: =C2=A0 =C2=A0 =C2=A0 =C2=A0[Yocto-builds] QT4 lib problem image fi=
le<br>
Date: =C2=A0 Tue, 24 Jun 2014 15:53:31 +0300<br>
From: =C2=A0 Life Life &lt;<a href=3D"mailto:sadlife1990@gmail.com" target=
=3D"_blank">sadlife1990@gmail.com</a>&gt;<br>
To: =C2=A0 =C2=A0 &lt;<a href=3D"mailto:yocto-builds@yoctoproject.org" targ=
et=3D"_blank">yocto-builds@yoctoproject.org</a><u></u>&gt;<br>
<br>
<br>
<br>
Hello,<br>
<br>
I&#39;m newbie, I&#39;m testing beaglebone black. My setup and instruction =
following<br>
<br>
git clone git://<a href=3D"http://github.com/Angstrom-distribution/setup-sc=
ripts.git" target=3D"_blank">github.com/Angstrom-<u></u>distribution/setup-=
scripts.git</a><br></div>
&lt;<a href=3D"http://github.com/Angstrom-distribution/setup-scripts.git" t=
arget=3D"_blank">http://github.com/Angstrom-<u></u>distribution/setup-scrip=
ts.git</a><u></u>&gt;<div class=3D"HOEnZb"><div class=3D"h5"><br>
cd setup-scripts<br>
MACHINE=3Dbeaglebone ./oebb.sh config beaglebone<br>
MACHINE=3Dbeaglebone ./oebb.sh update<br>
MACHINE=3Dbeaglebone ./oebb.sh<br>
after I run this command<br>
<br>
MACHINE=3Dbeaglebone ./oebb.sh bitbake -u hob and start hob GUI TOOL<br>
and select beaglebone and QT-embedded package and build image but I cant se=
e my<br>
rootfs in qt lib. Please help.<br>
<br>
<br>
</div></div></blockquote></div><br></div>

--089e013a043e0d1ad904fca31465--
