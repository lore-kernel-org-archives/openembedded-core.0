Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f47.google.com (mail-qg0-f47.google.com
	[209.85.192.47])
	by mail.openembedded.org (Postfix) with ESMTP id 3A2ED73D13
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Sep 2015 09:17:44 +0000 (UTC)
Received: by qgx61 with SMTP id 61so115146531qgx.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Sep 2015 02:17:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=tjQqXr3GEGM3207J+XxdJ/tHgY74KCwxRg9FmEkvTQY=;
	b=RrDGcwVIjm1Z591UmZfevDwac8EqnKGF3l5svr+jt/6DffnpJkjH+Oh6tCY3df90Wf
	Oi16dPMjQaxqKmMOwypfCVOpcGPq7YNJLehXqB9ZslU4dru+35b/Za44H22bQgMsyvVT
	hWcU96j6Gc0I3GjqTfAvagTyNWGqEQCR4dFnYDwqxwrVv5xHkBbaci+Q71UFmsFaHlcC
	DD6aARzEoWXSWwK1eRNqlxcSomUIWr11Ct1sJkTy0+gDZsWOoZZ4YIOHxFUlNeRX+Rrk
	HMZ2URcCdLpuidmTgSBkx4o5qgCAmmGJGkxFTsdpwj39EfYg9Lx5nS940QGOXkLWPGC+
	mpHw==
X-Gm-Message-State: ALoCoQntNlqbvfoohlGsYZKakftAJ8t29TiPqWKQEf5DOMNUt5hHvLYCLKYo/KnSjSda+Vy+BsGt
X-Received: by 10.140.109.74 with SMTP id k68mr21536383qgf.77.1443431864248;
	Mon, 28 Sep 2015 02:17:44 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.94.86 with HTTP; Mon, 28 Sep 2015 02:17:24 -0700 (PDT)
In-Reply-To: <1443390491-23728-1-git-send-email-dv@pseudoterminal.org>
References: <1443390491-23728-1-git-send-email-dv@pseudoterminal.org>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 28 Sep 2015 10:17:24 +0100
Message-ID: <CAJTo0LYdbMFYWieAPp4ePm3wrJb4Pn4e5xnxf4vpJZ7aUOYNAg@mail.gmail.com>
To: Carlos Rafael Giani <dv@pseudoterminal.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/7] gstreamer1.0: upgrade to version 1.6.0
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
X-List-Received-Date: Mon, 28 Sep 2015 09:17:45 -0000
Content-Type: multipart/alternative; boundary=001a1139af2486c5dc0520cb2bab

--001a1139af2486c5dc0520cb2bab
Content-Type: text/plain; charset=UTF-8

On 27 September 2015 at 22:48, Carlos Rafael Giani <dv@pseudoterminal.org>
wrote:

> Removed patches which either were backports or accepted and integrated
>
> Signed-off-by: Carlos Rafael Giani <dv@pseudoterminal.org>
>

We're feature frozen so I'll add these to my "for after the freeze" folder
but rebasing and resending when 2.0 is released would be appreciated.

Ross

--001a1139af2486c5dc0520cb2bab
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 27 September 2015 at 22:48, Carlos Rafael Giani <span dir=3D"ltr">&lt;<a=
 href=3D"mailto:dv@pseudoterminal.org" target=3D"_blank">dv@pseudoterminal.=
org</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":6ty=
" class=3D"a3s" style=3D"overflow:hidden">Removed patches which either were=
 backports or accepted and integrated<br>
<br>
Signed-off-by: Carlos Rafael Giani &lt;<a href=3D"mailto:dv@pseudoterminal.=
org">dv@pseudoterminal.org</a>&gt;<br></div></blockquote></div><br>We&#39;r=
e feature frozen so I&#39;ll add these to my &quot;for after the freeze&quo=
t; folder but rebasing and resending when 2.0 is released would be apprecia=
ted.=C2=A0</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_ex=
tra">Ross</div></div>

--001a1139af2486c5dc0520cb2bab--
