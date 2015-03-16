Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f46.google.com (mail-qg0-f46.google.com
	[209.85.192.46])
	by mail.openembedded.org (Postfix) with ESMTP id D9BB460169
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Mar 2015 11:47:52 +0000 (UTC)
Received: by qgg60 with SMTP id 60so36956829qgg.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Mar 2015 04:47:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=uJYCWTWlgeBRdeAkYMQlUlQa5jAn9tHmiEbzNmZEv0E=;
	b=OKiXelANHkRAitnB+6mYVrceCQ6tC5Ol/HXRdJviHli4XuZ8RjfHmYCEt5kID5SRjC
	l57uNzzne17EKWiW+WLMPsAdzEIXeImCOcSdyIFrra4CZ8bo5aTRYZJXyqmhxAhI2BP0
	IIMNkyIspO1bOZ0bpfkw9ct3KQd54SOlO4P0ddkTfJMRH3yMLzgB6UFZNONUaCT7vChw
	N0nff1mQw1Fwd/dTvKMV9+LH76jT4kgJZqeb2ZArUonXkGFZg6UXJvG06kGI6nqe7xjv
	sXpzLJDl0/IthVvKldHtomU+mqpivxPhrhdL1UzOGqUdaudkCPNR8PMj0oS8u0UDsCSp
	lDug==
X-Gm-Message-State: ALoCoQkEr60eVbtGXIZOVGJe/IN8A4hXAspkFlPmlGlL5TQQTkHl3STM4eq9znUeh7O7HZfN0E/V
X-Received: by 10.55.23.208 with SMTP id 77mr39758439qkx.21.1426506473839;
	Mon, 16 Mar 2015 04:47:53 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.203 with HTTP; Mon, 16 Mar 2015 04:47:33 -0700 (PDT)
In-Reply-To: <1426496025-26942-1-git-send-email-rep.dot.nop@gmail.com>
References: <1426496025-26942-1-git-send-email-rep.dot.nop@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 16 Mar 2015 13:47:33 +0200
Message-ID: <CAJTo0La-P0daO2k0UWFjcYgHwjMGHnqrsj6gid=6-0oFZEe9Vw@mail.gmail.com>
To: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/3] libtirpc: respin patches
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
X-List-Received-Date: Mon, 16 Mar 2015 11:47:53 -0000
Content-Type: multipart/alternative; boundary=001a11479e2ea4b55f0511666b55

--001a11479e2ea4b55f0511666b55
Content-Type: text/plain; charset=UTF-8

On 16 March 2015 at 10:53, Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
wrote:

> +PR = "r1"
>

No need to bump PR, remove this line please.

Ross

--001a11479e2ea4b55f0511666b55
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 16 March 2015 at 10:53, Bernhard Reutner-Fischer <span dir=3D"ltr">&lt;<=
a href=3D"mailto:rep.dot.nop@gmail.com" target=3D"_blank">rep.dot.nop@gmail=
.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":2b=
p" class=3D"a3s" style=3D"overflow:hidden">+PR =3D &quot;r1&quot;<br></div>=
</blockquote></div><br></div><div class=3D"gmail_extra">No need to bump PR,=
 remove this line please.</div><div class=3D"gmail_extra"><br></div><div cl=
ass=3D"gmail_extra">Ross</div></div>

--001a11479e2ea4b55f0511666b55--
