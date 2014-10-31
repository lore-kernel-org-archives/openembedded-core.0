Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f43.google.com (mail-qg0-f43.google.com
	[209.85.192.43])
	by mail.openembedded.org (Postfix) with ESMTP id 654AC60169
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Oct 2014 10:19:18 +0000 (UTC)
Received: by mail-qg0-f43.google.com with SMTP id f51so5339520qge.16
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Oct 2014 03:19:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=zXIVsFQYA1izikgSPiHfKIcz0u9xaaXKYXYcrLAJjlA=;
	b=Rtpid6HH+hPt1k9gFTpLDwl8joDFumDhdQPlVDID/leEpdgqC7ClgCYB5d0H7DlGgV
	Iq7UIcZy2Dr63X+nevNlbLBXC9CNkPcZDY2lVOaH22LQGjkfN9LW1yKWo5E9ERcE/FyP
	UZZLFJPGNNnvR+ZRu8lIZqFtwr8NgmYGBQBc8XJeyB7iEMfFM8/M3HiLIqPd1ShcfJzw
	dKZVoJCE9NLOMqOFfl8wteUG6AnaKyWusk3UpymyFE9XBmquVlY7HcvAMPgLM/L/6Byy
	0NnO/GFiB5s4pff9QfST96NhbNymOQ6onhllA0lM64CxvYQgN00du5ffuimO8sEcb6Y3
	WuIg==
X-Gm-Message-State: ALoCoQllrYtyJ/IqAMxVJrtjG7+Ijlb13phQ/4CFoRbKQJdvp/K1nu6Y+ZI+jwuzTxR6evWQXSzB
X-Received: by 10.224.28.193 with SMTP id n1mr5655424qac.93.1414750755997;
	Fri, 31 Oct 2014 03:19:15 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.98.213 with HTTP; Fri, 31 Oct 2014 03:18:55 -0700 (PDT)
In-Reply-To: <2081396.TZUWxDdga2@peggleto-mobl5.ger.corp.intel.com>
References: <54535EF1.20202@pabigot.com>
	<2081396.TZUWxDdga2@peggleto-mobl5.ger.corp.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 31 Oct 2014 10:18:55 +0000
Message-ID: <CAJTo0LZf5R3QK8=_+Qxme7=6bF0WC3NBEJkHoAFWYO8-kHMOpw@mail.gmail.com>
To: "Peter A. Bigot" <pab@pabigot.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: preferred remotes for git pulls?
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
X-List-Received-Date: Fri, 31 Oct 2014 10:19:20 -0000
Content-Type: multipart/alternative; boundary=001a11c2ca3041dde60506b5547d

--001a11c2ca3041dde60506b5547d
Content-Type: text/plain; charset=UTF-8

On 31 October 2014 10:11, Paul Eggleton <paul.eggleton@linux.intel.com>
wrote:

> > I have existing github resources that I could use as the source. Would
> > that be acceptable to the maintainers?
>
> I think for OE-Core at least the contrib repo is preferred but not
> necessarily
> mandatory.


poky-contrib or openembedded-core-contrib is preferred as they're already
in various people's remotes configuration, but any git repo is preferable
to no git repo!

Ross

--001a11c2ca3041dde60506b5547d
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">On 3=
1 October 2014 10:11, Paul Eggleton <span dir=3D"ltr">&lt;<a href=3D"mailto=
:paul.eggleton@linux.intel.com" target=3D"_blank">paul.eggleton@linux.intel=
.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><span class=3D=
"">&gt; I have existing github resources that I could use as the source. Wo=
uld<br>
&gt; that be acceptable to the maintainers?<br>
<br>
</span>I think for OE-Core at least the contrib repo is preferred but not n=
ecessarily<br>
mandatory.</blockquote></div><br>poky-contrib or openembedded-core-contrib =
is preferred as they&#39;re already in various people&#39;s remotes configu=
ration, but any git repo is preferable to no git repo!</div><div class=3D"g=
mail_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a11c2ca3041dde60506b5547d--
