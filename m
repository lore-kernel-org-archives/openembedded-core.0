Return-Path: <ross.burton@intel.com>
Received: from mail-oi0-f41.google.com (mail-oi0-f41.google.com
	[209.85.218.41])
	by mail.openembedded.org (Postfix) with ESMTP id C910A75868
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jul 2015 22:25:27 +0000 (UTC)
Received: by oibn4 with SMTP id n4so6328977oib.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jul 2015 15:25:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=Coi097T60AeWnO1Vld3fmP7an87OzIPqTxRn3Npykns=;
	b=jW0tzNXUsklkT+BcyuYvgvZYYnIzBvx7o0Xr9GxGfvnpaoDJ+fBb9JbihyM0Lsflc9
	qitPhKh0HX7Zi57AB7HyxuTOyWyUwAWaTWDpf+cG530OEuaolPi85TMKBCH/6jkJS2xa
	Po/8lQsECwG+ridQx3ukupzdCMBjtBWH3xS424QEgiBI0Q+YH23cRTVVrf+Gp69dY71e
	U1pE/x6jV7WCFH+PCCoOw/jtBJd06lParz9oMS/cOd3R/xVUAZukLmie/QC9HCS/Y+LL
	YRUNbXDTdtDlU4w5AfioN8Ke9FfP4Us4ImKBPgA9plvrFfWT5VWYPlSJENji1skhiHb/
	1Ohg==
X-Gm-Message-State: ALoCoQnzAksFksJjrvWsU8DTpMomqJtaoiQBvVR4KLQtDyb5J+YDtaSaqTRL1jLcJmg7gueP+bRV
X-Received: by 10.60.60.2 with SMTP id d2mr12192807oer.0.1437690327501; Thu,
	23 Jul 2015 15:25:27 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.202.108.4 with HTTP; Thu, 23 Jul 2015 15:25:08 -0700 (PDT)
In-Reply-To: <ff03be1a9cf8ba24abe3d0de85b59788e37e3834.1437617250.git.Qi.Chen@windriver.com>
References: <cover.1437617250.git.Qi.Chen@windriver.com>
	<ff03be1a9cf8ba24abe3d0de85b59788e37e3834.1437617250.git.Qi.Chen@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 23 Jul 2015 23:25:08 +0100
Message-ID: <CAJTo0LYoXS2jSu9LUC2S8wJBHs7WFnqZVedOPA77pS1DiAHfOg@mail.gmail.com>
To: Chen Qi <Qi.Chen@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/3] byacc: upgrade to 20150711
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
X-List-Received-Date: Thu, 23 Jul 2015 22:25:27 -0000
Content-Type: multipart/alternative; boundary=089e013c5dec44ca85051b925d5a

--089e013c5dec44ca85051b925d5a
Content-Type: text/plain; charset=UTF-8

On 23 July 2015 at 03:10, Chen Qi <Qi.Chen@windriver.com> wrote:

> -LIC_FILES_CHKSUM =
> "file://package/debian/copyright;md5=f186cf0d59bac042b75830396ec389a3"
> +LIC_FILES_CHKSUM =
> "file://package/debian/copyright;md5=c52fb2d1b3f75b3b7534927807a1b714"
>

Please explain in the commit log why the license checksums have changed.

Ross

--089e013c5dec44ca85051b925d5a
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 23 July 2015 at 03:10, Chen Qi <span dir=3D"ltr">&lt;<a href=3D"mailto:Q=
i.Chen@windriver.com" target=3D"_blank">Qi.Chen@windriver.com</a>&gt;</span=
> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bo=
rder-left:1px #ccc solid;padding-left:1ex"><div id=3D":1p7" class=3D"a3s" s=
tyle=3D"overflow:hidden">-LIC_FILES_CHKSUM =3D &quot;file://package/debian/=
copyright;md5=3Df186cf0d59bac042b75830396ec389a3&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://package/debian/copyright;md5=3Dc52fb2d1b=
3f75b3b7534927807a1b714&quot;</div></blockquote></div><br>Please explain in=
 the commit log why the license checksums have changed.</div><div class=3D"=
gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--089e013c5dec44ca85051b925d5a--
