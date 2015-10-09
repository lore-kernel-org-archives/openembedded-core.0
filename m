Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f179.google.com (mail-qk0-f179.google.com
	[209.85.220.179])
	by mail.openembedded.org (Postfix) with ESMTP id 85365734B8
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Oct 2015 10:30:22 +0000 (UTC)
Received: by qkdo1 with SMTP id o1so21448599qkd.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 09 Oct 2015 03:30:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=dVi97xNStVh9/HT7E9NV8h5rns+zDSb+YZmoj6Gjklo=;
	b=fJcYc/FU+X948YqXMy3ryla5SDXoHM3gxmy6SXWIpCLE5m+IrxbqRtB0NI1Lm27tHM
	/QVs/Id6fvizgMIycsYWYHZoC/6TCcbC6dWprQI83FA4fF+0a2vUvXSF1mRPabK0fbQW
	TvmR76qiRYwlnrXXMg9RvvsSOxIVEWhuXnMZOHEHRSJNfcZTxyZJhjvReErVHr+n8iBU
	BCdUfrU0wSSlEMLtRsoqL4ZMhELL9LWSUZQrp+z2dEGFpNRiKvn9m3t7u2zKA8R30TKk
	dcAYYPIXRoVHaA9ORt81QAyqP9mMFVdedR2NcfOocS65RV9ZVEnQvuOBjuJqPh1zXdmU
	CgfA==
X-Gm-Message-State: ALoCoQlQQbWbZurqBAmAC2EXrDAr0a76LwoFPom4CLhYYWrsUgnP3aI11pgJwTOKV9cfTHaFtPrG
X-Received: by 10.55.192.13 with SMTP id o13mr13914385qki.83.1444386622476;
	Fri, 09 Oct 2015 03:30:22 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.94.86 with HTTP; Fri, 9 Oct 2015 03:30:03 -0700 (PDT)
In-Reply-To: <5617955E.2090206@balister.org>
References: <CAP71WjwYnv8WjH=s4gLVwwZV5KDdR=N5uxp9m46L_PesCBoZWA@mail.gmail.com>
	<56178EDE.5040508@windriver.com> <5617955E.2090206@balister.org>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 9 Oct 2015 11:30:03 +0100
Message-ID: <CAJTo0LZ+ccauSvLJogf=jjAs3sAFwnp4g2N32LVq55kcoFGr=A@mail.gmail.com>
To: Philip Balister <philip@balister.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Too late for mesa upgrade before jethro?
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
X-List-Received-Date: Fri, 09 Oct 2015 10:30:24 -0000
Content-Type: multipart/alternative; boundary=001a11479cfc8d4c8d0521a977ed

--001a11479cfc8d4c8d0521a977ed
Content-Type: text/plain; charset=UTF-8

On 9 October 2015 at 11:22, Philip Balister <philip@balister.org> wrote:

> But I think Nicolas is proposing this as a bug fix. If it doesn't go
> into the release, I suspect he'll propose it for inclusion i the stable
> branch soon after the release.
>

If there's a particular bug that you'd like to see fixed, then backport the
patch.

Ross

--001a11479cfc8d4c8d0521a977ed
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 9 October 2015 at 11:22, Philip Balister <span dir=3D"ltr">&lt;<a href=
=3D"mailto:philip@balister.org" target=3D"_blank">philip@balister.org</a>&g=
t;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0=
 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":5gh" class=
=3D"a3s" style=3D"overflow:hidden">But I think Nicolas is proposing this as=
 a bug fix. If it doesn&#39;t go<br>
into the release, I suspect he&#39;ll propose it for inclusion i the stable=
<br>
branch soon after the release.</div></blockquote><div><br></div><div>If the=
re&#39;s a particular bug that you&#39;d like to see fixed, then backport t=
he patch.</div><div><br></div><div>Ross</div></div></div></div>

--001a11479cfc8d4c8d0521a977ed--
