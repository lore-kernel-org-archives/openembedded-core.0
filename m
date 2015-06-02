Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f49.google.com (mail-qg0-f49.google.com
	[209.85.192.49])
	by mail.openembedded.org (Postfix) with ESMTP id D475E73D88
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Jun 2015 12:23:25 +0000 (UTC)
Received: by qgg60 with SMTP id 60so57844272qgg.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 02 Jun 2015 05:23:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=DnJU4tJRPEtgi5tvQefU7JvyiU8TJseCMNBcTYXxS70=;
	b=FS69ThxFGaA2QYyd4MxONz76Bd0+1brsodGC0z9TmB+3b3URJbhYMYyA6YRVuS1qUF
	Vzl1y9mIH+pJ3mOgTdwWlom91VMJlXHXNiQt0lgEP7VRS6q+2GXwoKDcImyVeXQ41PZi
	RQlZpdkAcSsBmmlfEHkZNyukvjBplagPkFGeXBxUDbPUF1+Il+tuZ0bwmB00WhCSvNNR
	6e5YnRefMtXlL5eJK93VoSVtbsXE6xl/20OWz+8E2G/GL6xxtEy3/+QfpVM1JxW76Nj0
	Xm15+QybCmANUBHmy2mMxcFOHMJbkHyA1oHIA596ygDm4somkpBa77qtuc4mICALga1E
	RFBw==
X-Gm-Message-State: ALoCoQnBg9TBzEJv7zruXumsO3U8COYo/4DFNEToTvvI3JupkNjnzocdDx3S4TcBjGvOu2+EsZsM
X-Received: by 10.55.43.130 with SMTP id r2mr28448063qkr.14.1433247805751;
	Tue, 02 Jun 2015 05:23:25 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.231 with HTTP; Tue, 2 Jun 2015 05:23:05 -0700 (PDT)
In-Reply-To: <556D9883.5080803@windriver.com>
References: <cover.1433137188.git.liezhi.yang@windriver.com>
	<da6567b5a4f3e8de65f1c21dfc1ac9a8a52da84b.1433137188.git.liezhi.yang@windriver.com>
	<CAJTo0LZCmxQgwTkjCgfnhxioQwS_1_D0cDnEr7mJ9r3OMBmiZA@mail.gmail.com>
	<556D9883.5080803@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 2 Jun 2015 13:23:05 +0100
Message-ID: <CAJTo0LZg85pRGOZ-ehYuOp2PtHEd+dDW2qfM6cLiMSud78FWiw@mail.gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] btrfs-tools: 3.18.2 -> 4.0.1
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
X-List-Received-Date: Tue, 02 Jun 2015 12:23:28 -0000
Content-Type: multipart/alternative; boundary=001a1147afb0565add05178802ee

--001a1147afb0565add05178802ee
Content-Type: text/plain; charset=UTF-8

On 2 June 2015 at 12:50, Robert Yang <liezhi.yang@windriver.com> wrote:

> The patch I sent is a patch's patch, which means that this patch patches
> fix-parallel.patch, after the patch is applied, the fix-parallel.patch is:
>

Yes, of course, sorry :)

Ross

--001a1147afb0565add05178802ee
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 2 June 2015 at 12:50, Robert Yang <span dir=3D"ltr">&lt;<a href=3D"mailt=
o:liezhi.yang@windriver.com" target=3D"_blank">liezhi.yang@windriver.com</a=
>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 =
0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":17u" clas=
s=3D"a3s" style=3D"overflow:hidden">The patch I sent is a patch&#39;s patch=
, which means that this patch patches<br>
fix-parallel.patch, after the patch is applied, the fix-parallel.patch is:<=
br></div></blockquote></div><br>Yes, of course, sorry :)</div><div class=3D=
"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a1147afb0565add05178802ee--
