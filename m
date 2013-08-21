Return-Path: <ross.burton@intel.com>
Received: from mail-ve0-f177.google.com (mail-ve0-f177.google.com
	[209.85.128.177])
	by mail.openembedded.org (Postfix) with ESMTP id 93B846B25A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Aug 2013 10:31:33 +0000 (UTC)
Received: by mail-ve0-f177.google.com with SMTP id cz11so162119veb.22
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Aug 2013 03:31:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=d+XroXrdAW55XTEHK1sB9tAzyqPA3TEeVHvwfPtMm5A=;
	b=PrZ1WCmHN9efVSjY53o1pCdZciXr5ZJIQu0hIx7OG4fM0UeBBE96b/kaXUL2/MvVhY
	QpYq0AZYc/WQzW24u+xquAEIBF6HU+H6LImxVvMEee/VeDaV9PPDi++jJOHSWd3WZOkb
	3GoZhYtDaN0ttyZOV+VQK6vMEybcwS2RDYKcYh+Xt4PcF2oWPvYtvPvLSXsHKMGndipc
	hMj5MrnCaptr2l67Mg3gyMo+ZPXMjh/kSvX7oivBtKWGraVuzX6PdMOJmGk7rZWBieFb
	Z0GkvmfZXEt1TKGMRwLs/IsqgubGlrQPOku13mJeI0Ol6YuoofCmq/96OrkK1bJthZI9
	Hi+Q==
X-Gm-Message-State: ALoCoQm0Fgurjb8m/ABZ+S1XEfnICr+/Nl7k9rL/vdCLrMxM9m5vzWP7xpkY/6Bw/RgywthwRfXu
X-Received: by 10.58.201.69 with SMTP id jy5mr205398vec.29.1377081094119; Wed,
	21 Aug 2013 03:31:34 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.71.201 with HTTP; Wed, 21 Aug 2013 03:31:14 -0700 (PDT)
In-Reply-To: <e6f02bafd1899fa77f4184c091598098030203ef.1376988152.git.cazfi74@gmail.com>
References: <cover.1376988152.git.cazfi74@gmail.com>
	<e6f02bafd1899fa77f4184c091598098030203ef.1376988152.git.cazfi74@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 21 Aug 2013 11:31:14 +0100
Message-ID: <CAJTo0LYoVwcPehxHWUiETz3FODCiuKZ2p5qRE6Ch2-aW8hg98A@mail.gmail.com>
To: Marko Lindqvist <cazfi74@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] gtk-engines: fix build with automake-1.13
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
X-List-Received-Date: Wed, 21 Aug 2013 10:31:33 -0000
Content-Type: multipart/alternative; boundary=047d7bd6bb107132df04e472ad18

--047d7bd6bb107132df04e472ad18
Content-Type: text/plain; charset=UTF-8

On 20 August 2013 20:57, Marko Lindqvist <cazfi74@gmail.com> wrote:

> -PR = "r3"
> -


Don't remove this PR value.

Ross

--047d7bd6bb107132df04e472ad18
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra">On 20 August 2013 20:57, Marko =
Lindqvist <span dir=3D"ltr">&lt;<a href=3D"mailto:cazfi74@gmail.com" target=
=3D"_blank">cazfi74@gmail.com</a>&gt;</span> wrote:<div class=3D"gmail_quot=
e"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left=
:1px #ccc solid;padding-left:1ex">


-PR =3D &quot;r3&quot;<br>
-</blockquote></div><br>Don&#39;t remove this PR value.</div><div class=3D"=
gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--047d7bd6bb107132df04e472ad18--
