Return-Path: <ross.burton@intel.com>
Received: from mail-qa0-f45.google.com (mail-qa0-f45.google.com
	[209.85.216.45])
	by mail.openembedded.org (Postfix) with ESMTP id 88EE765CF5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Feb 2015 17:22:33 +0000 (UTC)
Received: by mail-qa0-f45.google.com with SMTP id j7so13401630qaq.4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Feb 2015 09:22:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=wYdRZng5eesIF1Q4M4fVlIlSbaGha48bRdX6wPLHE54=;
	b=BDOO7jiff3divk0baFbl0f3wkNVTNxm42dQyelipniexY88eRM44rIOPrtHLPi0gCp
	DiifSrwlshLsSuKjpcCdtYQFp+X92XVgxqJ+dbif25cSh2O9gvmqX1N30KYk8PNM+2S/
	BdEfaFXQ9M4PSPQerrEfUBiW42dNsjuqeezqoNSBbA6QSqEUWO6iG8JyXqwFJEN/f2jQ
	//0Ru7s8EAwMk8KkyObu37oa9RMa0Z5UjXm3YZjfiAsO/uXWId5kL2PLMx08PoU3vlhy
	u9j/h7dbGFw/13a/vDezmCx+xRx9g/Mh/SKp70KtqPPvx6yoGvANXNdH4nbwXx3+aXC4
	YSpQ==
X-Gm-Message-State: ALoCoQkdoG9c6NHpSfPJXB0g1lLUGc9442iRA4tteBXtjvsQnif9Ep9xc6q32CYHjOXyjx0bIIXF
X-Received: by 10.140.133.69 with SMTP id 66mr3675277qhf.17.1423848154232;
	Fri, 13 Feb 2015 09:22:34 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.96.166 with HTTP; Fri, 13 Feb 2015 09:22:13 -0800 (PST)
In-Reply-To: <1423807195-7087-6-git-send-email-schnitzeltony@googlemail.com>
References: <1423807195-7087-1-git-send-email-schnitzeltony@googlemail.com>
	<1423807195-7087-6-git-send-email-schnitzeltony@googlemail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 13 Feb 2015 17:22:13 +0000
Message-ID: <CAJTo0LYvo-TGVuVo1vu-b0FS+_i1UpnkZGYj1HXRyefFNZJkDg@mail.gmail.com>
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 5/6] liberation-fonts: update to 1.07.4
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
X-List-Received-Date: Fri, 13 Feb 2015 17:22:34 -0000
Content-Type: multipart/alternative; boundary=001a1136fdee729407050efb7bea

--001a1136fdee729407050efb7bea
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 13 February 2015 at 05:59, Andreas M=C3=BCller <schnitzeltony@googlemail=
.com>
wrote:

> * A bit of a test for fontforge-native
>

Instead of needing to build another native package just to compile the
fonts, why not just use the binary tarballs?

Ross

--001a1136fdee729407050efb7bea
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">On 1=
3 February 2015 at 05:59, Andreas M=C3=BCller <span dir=3D"ltr">&lt;<a href=
=3D"mailto:schnitzeltony@googlemail.com" target=3D"_blank">schnitzeltony@go=
oglemail.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div i=
d=3D":nx5" class=3D"a3s" style=3D"overflow:hidden">* A bit of a test for fo=
ntforge-native<br></div></blockquote></div><br>Instead of needing to build =
another native package just to compile the fonts, why not just use the bina=
ry tarballs?</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_=
extra">Ross</div></div>

--001a1136fdee729407050efb7bea--
