Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f54.google.com (mail-qg0-f54.google.com
	[209.85.192.54])
	by mail.openembedded.org (Postfix) with ESMTP id 410EE72608
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Jan 2015 16:00:32 +0000 (UTC)
Received: by mail-qg0-f54.google.com with SMTP id q108so17210704qgd.13
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Jan 2015 08:00:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=gnAQupfgs82OwuNfIFwbqzII0wjUE26MQyOmSl4wkrc=;
	b=dcS7I6EGI70DG1YrQr4WlxBMpRoq2LZXaUFx6ZHZxEm0TknnKX8lkdjk14pGnV1lrN
	8/hapAqK/hj2/CJ1ExNS8hQEz0e0wozrKADC1s+cIIYC9xR8L2+tPRSgiklaBoZQGd6o
	Ix5Ul1HSA2taDOPXilCqe19E3NrUee6nCYpVIdDTuaUGXhyAQerFNmnl1+0nRVhCAF3v
	SIm0Q2ImM1oeP7BPSziNP7xcVvXe5o8RpzNkKH4/u0+F77WDW4Wx+iMIwVJL6MAC70Pp
	UPtMFVsubBanZGjQ5yAfjzyRvZHtin8yp0Tx7xTWpvvjwrAU3qNIkPOh3Dliy79+OVIc
	htgg==
X-Gm-Message-State: ALoCoQnRh/l9gENqqM5x+pkhHftZDMgi4/2KgD1Ht/nMNZKJKQWQbyN1XZAu3G4rmHER3dhtSUpU
X-Received: by 10.224.7.197 with SMTP id e5mr14800412qae.64.1422460832886;
	Wed, 28 Jan 2015 08:00:32 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.96.166 with HTTP; Wed, 28 Jan 2015 08:00:12 -0800 (PST)
In-Reply-To: <20150128134756.1cce32c4@bottazzini-ThinkPad-T430>
References: <bruno.bottazzini@intel.com>
	<1421870458-9958-1-git-send-email-bruno.bottazzini@intel.com>
	<20150128134756.1cce32c4@bottazzini-ThinkPad-T430>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 28 Jan 2015 16:00:12 +0000
Message-ID: <CAJTo0LZhj=0AMXXbeXdiUuRBty9qTMX_ba6Z=u=dbhR+v3d+MQ@mail.gmail.com>
To: "Bottazzini, Bruno" <bruno.bottazzini@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/2] kmod new packageconfig and dbus split package
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
X-List-Received-Date: Wed, 28 Jan 2015 16:00:37 -0000
Content-Type: multipart/alternative; boundary=001a11c223f4a6c882050db8787a

--001a11c223f4a6c882050db8787a
Content-Type: text/plain; charset=UTF-8

On 28 January 2015 at 15:47, Bottazzini, Bruno <bruno.bottazzini@intel.com>
wrote:

> Guys, were you able to look at this patch ?
>

Yep, it's queued.

Ross

--001a11c223f4a6c882050db8787a
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 28 January 2015 at 15:47, Bottazzini, Bruno <span dir=3D"ltr">&lt;<a hre=
f=3D"mailto:bruno.bottazzini@intel.com" target=3D"_blank">bruno.bottazzini@=
intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=
=3D":3l8" class=3D"a3s" style=3D"overflow:hidden">Guys, were you able to lo=
ok at this patch ?</div></blockquote><div><br></div><div>Yep, it&#39;s queu=
ed.</div><div><br></div><div>Ross=C2=A0</div></div></div></div>

--001a11c223f4a6c882050db8787a--
