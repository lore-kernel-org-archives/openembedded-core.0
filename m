Return-Path: <sadlife1990@gmail.com>
Received: from mail-vc0-f177.google.com (mail-vc0-f177.google.com
	[209.85.220.177])
	by mail.openembedded.org (Postfix) with ESMTP id 5620C7029E
	for <openembedded-core@lists.openembedded.org>;
	Sat,  5 Jul 2014 16:50:28 +0000 (UTC)
Received: by mail-vc0-f177.google.com with SMTP id ij19so2459304vcb.8
	for <openembedded-core@lists.openembedded.org>;
	Sat, 05 Jul 2014 09:50:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=WatT7miVCvWuHR9T9G/onovAqamFHaECUXKjYfhzV2Q=;
	b=GQ8LKLOI6LVNxYMUB6ko6mS1Ajws+KQE0aB8wqUIw+4D5X2x6M0NOpaVnkT0B5q/DS
	a9S6JozoqH633W6tDq2hNcGi8Gst96XQnUc5nmCk4J86JbO9OzB7WTEAVxSlMTVrerqr
	mDZWZ/cFy1HMxPWc8+Bp/pJkUi2C6q75hzUqNGlhGl0qu3BcNZK27yqnV8vZFvetcvAP
	Pv6SR0YAHiF8K8xQ6VRhZtae2PKh950mTGDAXuYx10LAYmhuVItGDVLl4O6ucI5Hf436
	+Hx93Rmj6zqe9APOplh0WovmvbJkiTn3QDlahRMXQV1a1OnMmJVXo4bherP7PryJhYhf
	5QcA==
MIME-Version: 1.0
X-Received: by 10.58.245.194 with SMTP id xq2mr16194331vec.26.1404579028000;
	Sat, 05 Jul 2014 09:50:28 -0700 (PDT)
Received: by 10.58.152.200 with HTTP; Sat, 5 Jul 2014 09:50:27 -0700 (PDT)
In-Reply-To: <ED3E0BCACD909541BA94A34C4A164D4C5B43ABF6@post.tritech.se>
References: <CAAHuHfyssKi6tXjKFwBHXNPuCLPXwyx3CKR14=g=w5REakyjMA@mail.gmail.com>
	<ED3E0BCACD909541BA94A34C4A164D4C5B43AAF6@post.tritech.se>
	<ED3E0BCACD909541BA94A34C4A164D4C5B43AB08@post.tritech.se>
	<CAAHuHfwHQBgACwx1XUFzeAyjAp2PRZXz1X4RgAtFrGuh86TJGQ@mail.gmail.com>
	<ED3E0BCACD909541BA94A34C4A164D4C5B43AB23@post.tritech.se>
	<CAAHuHfzUxTVUVtNec_pSghazarNeiVRd-3dYWRGXJ8w1nQDTig@mail.gmail.com>
	<ED3E0BCACD909541BA94A34C4A164D4C5B43AB5B@post.tritech.se>
	<CAAHuHfxRyjJZnncMbjcE6MdgfttW5aap8ESDFTg8NecAKy57ng@mail.gmail.com>
	<ED3E0BCACD909541BA94A34C4A164D4C5B43AB70@post.tritech.se>
	<CAAHuHfyRhyZnf6qBHqgLSLsmzRYLTZqHPPfxfui8CFc4qZAUbQ@mail.gmail.com>
	<ED3E0BCACD909541BA94A34C4A164D4C5B43ABCB@post.tritech.se>
	<CAAHuHfzWrvjyok1xa+=mg0ws357VE_YC-fm42GaoZL6Nh3Q15Q@mail.gmail.com>
	<CAAHuHfyy2+djAVki5qLf=+u-VzP9ZctiDyOn8oA_7yy_mf-V+A@mail.gmail.com>
	<ED3E0BCACD909541BA94A34C4A164D4C5B43ABF6@post.tritech.se>
Date: Sat, 5 Jul 2014 19:50:27 +0300
Message-ID: <CAAHuHfz98SuWNGJV+YFTOPQ8uDZrytCoeQ7Bx8WtSK45K6JF9g@mail.gmail.com>
From: Life Life <sadlife1990@gmail.com>
To: =?UTF-8?Q?Mats_K=C3=A4rrman?= <Mats.Karrman@tritech.se>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Could not inherit file classes/rootfs_${IMAGE_PKGTYPE}.bbclass
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
X-List-Received-Date: Sat, 05 Jul 2014 16:50:29 -0000
Content-Type: multipart/alternative; boundary=047d7bd6b7bc05e50e04fd750a9b

--047d7bd6b7bc05e50e04fd750a9b
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Thank you for help.


2014-07-05 16:24 GMT+03:00 Mats K=C3=A4rrman <Mats.Karrman@tritech.se>:

> On Saturday, July 05, 2014 2:57 PM, Life Life wrote:
> > screenshot.png
>
> Well, the error message suggests that at the time image.bbclass is trying
> to inherit the rootfs class, IMAGE_PKGTYPE is not defined.
>
> Something is wrong with your setup. I'm not using Angstrom myself  so I
> suggest you
> try going through the setup instructions and FAQ at
> http://wp.angstrom-distribution.org/
> again and see if you missed something.
>
> Good Luck!
> // Mats
>

--047d7bd6b7bc05e50e04fd750a9b
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thank you for help.<br></div><div class=3D"gmail_extra"><b=
r><br><div class=3D"gmail_quote">2014-07-05 16:24 GMT+03:00 Mats K=C3=A4rrm=
an <span dir=3D"ltr">&lt;<a href=3D"mailto:Mats.Karrman@tritech.se" target=
=3D"_blank">Mats.Karrman@tritech.se</a>&gt;</span>:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div class=3D"">On Saturday, July 05, 2014 2=
:57 PM, Life Life wrote:<br>
&gt; screenshot.png<br>
<br>
</div>Well, the error message suggests that at the time image.bbclass is tr=
ying<br>
to inherit the rootfs class, IMAGE_PKGTYPE is not defined.<br>
<br>
Something is wrong with your setup. I&#39;m not using Angstrom myself =C2=
=A0so I suggest you<br>
try going through the setup instructions and FAQ at <a href=3D"http://wp.an=
gstrom-distribution.org/" target=3D"_blank">http://wp.angstrom-distribution=
.org/</a><br>
again and see if you missed something.<br>
<br>
Good Luck!<br>
<span class=3D"HOEnZb"><font color=3D"#888888">// Mats<br>
</font></span></blockquote></div><br></div>

--047d7bd6b7bc05e50e04fd750a9b--
