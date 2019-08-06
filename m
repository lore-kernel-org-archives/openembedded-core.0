Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com
	[209.85.222.50])
	by mail.openembedded.org (Postfix) with ESMTP id C6FFE7F309
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Aug 2019 15:07:02 +0000 (UTC)
Received: by mail-ua1-f50.google.com with SMTP id c4so6961942uad.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 06 Aug 2019 08:07:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=Izqyvv24oPJuVMdYnrIVksuFO0eQ5S1x9rR1IMGsdxw=;
	b=oGCluCJz7kEbSaeieYbaiq/frLOgH5b+BKsoPFiVYrnaTbXW/aNXGTWxUUmaeKyt7C
	3r6Ddn284xPKGAIaAtKylNcPq0TcU+v6+NetgSz/BCFJZzskteJgOJMf7Q1y9lYuUBzB
	sfviG92nxpFXtTrvngOiMJu366Dl7eKHjr0OhRWMWAjgJQNgBapwom1XhrjP16pwDQN1
	ii5PpERstiS6D57eLXEZODS/ZJtuFRFNd7P4gvPKkIF2D2wU7IzZOPJkkQrBmkjJx8Sy
	PfLPleR9rT4BEGrY5SwsAJoaUEOsMZWDRLkT02F7o0MmZeRwDDpOdnlvx/iT/+vJF5/P
	mmug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Izqyvv24oPJuVMdYnrIVksuFO0eQ5S1x9rR1IMGsdxw=;
	b=jgoLN08p3cJL8P5ZEHVkpcSYxbazNyq9zboGdHP/1nJg2tWlk77cFEltHIa+tXjz+d
	Xt2BvMkJTcJb5m5jdb5BgOHD4pPHho3ZW5vMv7UTlRuPoIXpRK2K+teG8NzCy67pTVxG
	ecJms6MG85+JhJFBWI/cYbKG5ghFnBqBdXtC+9H9PSYDTjpmUFU7nhVghlrfyMP5tlEt
	oolmtp0M75kutmtNdOucGvEjF15TXegsmUK4wB7IMazvH/4YHFxj/+MTZ4Ix4yDkKQoQ
	VoU2TOz0Lo7ZYvX3Vcs/EPl56IOCd11Yoh/mls0KjSI1lrpRLSGH1D2IacKPBt3eboD+
	kGJQ==
X-Gm-Message-State: APjAAAU4KTXLpDTrp6EOCYV81QXOTpcXHEa1aU9jcwYKm/mpj5UlWv61
	89AuOLDUiJbvgqJWU5BpF6iU8euSksTXsCVZGmY=
X-Google-Smtp-Source: APXvYqzdab18n0z7+zci4EEY/HiG7dm1OWvRvGaWVAkPGc7t/ZQd4vPq5D4ORGOORGUbTNkrAg587Xj/SopoS+5h5iw=
X-Received: by 2002:ab0:e19:: with SMTP id g25mr2404303uak.71.1565104023543;
	Tue, 06 Aug 2019 08:07:03 -0700 (PDT)
MIME-Version: 1.0
References: <051801d54bf9$ca5b7930$5f126b90$@gmail.com>
In-Reply-To: <051801d54bf9$ca5b7930$5f126b90$@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 6 Aug 2019 17:06:52 +0200
Message-ID: <CANNYZj_Eie=FzjMHYwkMJchi1OjbTBkkS9CFjc+B9ca2yoiuyA@mail.gmail.com>
To: sjolley.yp.pm@gmail.com
Cc: Yocto discussion list <yocto@yoctoproject.org>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: Reminder: Yocto Project Technical Team Meeting @ Monthly from 8am to 8:30am on the first Tuesday (PST)
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
X-List-Received-Date: Tue, 06 Aug 2019 15:07:03 -0000
Content-Type: multipart/alternative; boundary="0000000000005c2545058f742d2d"

--0000000000005c2545058f742d2d
Content-Type: text/plain; charset="UTF-8"

On Tue, 6 Aug 2019 at 03:53, <sjolley.yp.pm@gmail.com> wrote:

> Wiki: https://www.yoctoproject.org/public-virtual-meetings/
>

That page links a Google calendar, and the calendar is in many ways
mismatching what is listed on the page. Can you please re-create the
calendar?

Alex

--0000000000005c2545058f742d2d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Tue, 6 Aug 2019 at 03:53, &lt;<a href=
=3D"mailto:sjolley.yp.pm@gmail.com">sjolley.yp.pm@gmail.com</a>&gt; wrote:<=
br></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex"><div lang=3D"EN-US"><div class=3D"gmail-m_-6442179665982099747Wo=
rdSection1"><span style=3D"color:rgb(31,73,125)">Wiki: <a href=3D"https://w=
ww.yoctoproject.org/public-virtual-meetings/" target=3D"_blank">https://www=
.yoctoproject.org/public-virtual-meetings/</a></span><span style=3D"font-si=
ze:12pt;font-family:&quot;Times New Roman&quot;,serif"></span><br></div></d=
iv></blockquote><div><br></div><div>That page links a Google calendar, and =
the calendar is in many ways mismatching what is listed on the page. Can yo=
u please re-create the calendar?</div><div><br></div><div>Alex<br></div></d=
iv></div>

--0000000000005c2545058f742d2d--
