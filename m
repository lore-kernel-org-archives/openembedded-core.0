Return-Path: <mhm.dawod@gmail.com>
Received: from mail-qt0-f180.google.com (mail-qt0-f180.google.com
	[209.85.216.180])
	by mail.openembedded.org (Postfix) with ESMTP id 963E6791B4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Aug 2018 15:13:41 +0000 (UTC)
Received: by mail-qt0-f180.google.com with SMTP id d4-v6so1501203qtn.13
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Aug 2018 08:13:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=4KmZHHYiTPtvT+bgo+7ZP7MdCmVHgXk7xR8c1ReXsBk=;
	b=i9uronpJLjcQ5/70tZYiGdVxvmWAENviq3wgDX5gJuXtM9+r5t4sUikzITHVYjCyHu
	EUXhfMHnsO8M3w4IzKA20bFKXiqghOzUecqgjOGOtVi0qXFbw9ixhYozNQDU4w3w1vZ3
	59Xwjc3r72Npu3sfNGH42QFcgD3T56fp2RFfPp0Gl0ZPGGbXUmydqS20YEQ6Y03nido9
	gCkAYdGdlLf3Be7Kt3ESQ5aWsFVWj8gpeTRctWMYKRTGJJsJwceT9J1UT+5210lNOyl2
	NT1/ydUUsGYZKk4BIlKUUyz7n/cwELBYPjDll4VeV3C9HCW+XlHvktlRBqesCAttACHy
	McFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=4KmZHHYiTPtvT+bgo+7ZP7MdCmVHgXk7xR8c1ReXsBk=;
	b=c70z/MgjBU9qRAwRFL/9qekD9SblNr85nX2Rr8SLBkNNiFp7KoGQSCoqGLynkFflNd
	cTznMW9vcM2wWFvHIS/VWaR14YbUIyrFkkhzvIXGalKNUcbYBLq32ToCgkPmnUmb9D6a
	JMJEFmiDxjv0X9owFSdHucSre6lINjXgcp5w/IWgH6m6ViD+YrH/QVzb4bR8VQUaiL4j
	ED1wvSLEVrgxHEeoQD21EvmWGDunMtVtTzNaPEmc0qZGxFLgf1nWOCsVsxSJ4pRRJX3r
	FHpxrgOj1KaSYiOIV9oRlPyjhSixo0lDP+mw3zxgC5alkGuh6+lhMexzSQuHXmPwK7sw
	x4xw==
X-Gm-Message-State: AOUpUlE3yNMu4Hnfdk08wV6tVHKAR32yPSW1GM9jh6qPKXGnktPJGA8h
	ZTa1qPyKHBmrvCkeS6Sq+BFzcnyauQR/P+fY8nE=
X-Google-Smtp-Source: AA+uWPxmqO1lO/3+/sopXF2cAnZMlv8x7l/Op66qr+gtFmNn4swZtODA7MEvyJdGw92ZMzDH9/i9R7EOGY9i7+9JTIA=
X-Received: by 2002:aed:2aa1:: with SMTP id
	t30-v6mr26461719qtd.28.1534346022445; 
	Wed, 15 Aug 2018 08:13:42 -0700 (PDT)
MIME-Version: 1.0
References: <CAGCTLNSTZLXLKQRV7J1twF+a7Dm=WMNRC=0DRhrMWjYeiLO_Uw@mail.gmail.com>
	<CANNYZj9vjFvnbWVdP5yNaMb-caozvHGv1G-JAa9iSTzArKhJ5Q@mail.gmail.com>
In-Reply-To: <CANNYZj9vjFvnbWVdP5yNaMb-caozvHGv1G-JAa9iSTzArKhJ5Q@mail.gmail.com>
From: Mohamed Dawod <mhm.dawod@gmail.com>
Date: Wed, 15 Aug 2018 17:13:30 +0200
Message-ID: <CAGCTLNQaT+_EvkKmrSNmV82WddK=Zw7CtcjK6TxM+WMcwYNUkw@mail.gmail.com>
To: alex.kanavin@gmail.com
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [oe][meta-qt5] : QT5 Packages
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
X-List-Received-Date: Wed, 15 Aug 2018 15:13:42 -0000
Content-Type: multipart/alternative; boundary="000000000000a1693805737ac53f"

--000000000000a1693805737ac53f
Content-Type: text/plain; charset="UTF-8"

Thank you,
It works but there is problem because of i am using wayland instead of x11
in my custom image
I removed w11 from IMAGE_FEATURES
and I added wayland and weston instead.

I think that meta-qt5 has recipes or modules to handle this case, so why it
couldn't call them automatically ?

On Wed, Aug 15, 2018 at 2:45 PM Alexander Kanavin <alex.kanavin@gmail.com>
wrote:

> 2018-08-15 14:38 GMT+02:00 Mohamed Dawod <mhm.dawod@gmail.com>:
> > I am trying to add Qt5 to my custom image.
> > I edited bblayer.conf file and created.
> > Now I want to know what is th packages which i need to append to
> > IMAGE_INSTALL variable ?
> > I found many many packages and modules. I can not add them all, because
> this
> > will expand my image size.
> > I need to know how to select the most important modules for my image ?
>
> Presumably you need qt5 in order to run some application. Add that
> application to IMAGE_INSTALL, and it will pull in all necessary qt5
> dependencies automatically.
>
> Alex
>


-- 

Mohamed Dawod
Computer Engineering Department
Faculty of Engineering
Cairo University

--000000000000a1693805737ac53f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Thank you, <br></div><div>It works but there is probl=
em because of i am using wayland instead of x11 <br></div><div>in my custom=
 image<br></div><div>I removed w11 from IMAGE_FEATURES<br></div><div>and I =
added wayland and weston instead.</div><div><br></div><div>I think that met=
a-qt5 has recipes or modules to handle this case, so why it couldn&#39;t ca=
ll them automatically ?<br></div></div><br><div class=3D"gmail_quote"><div =
dir=3D"ltr">On Wed, Aug 15, 2018 at 2:45 PM Alexander Kanavin &lt;<a href=
=3D"mailto:alex.kanavin@gmail.com">alex.kanavin@gmail.com</a>&gt; wrote:<br=
></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-=
left:1px #ccc solid;padding-left:1ex">2018-08-15 14:38 GMT+02:00 Mohamed Da=
wod &lt;<a href=3D"mailto:mhm.dawod@gmail.com" target=3D"_blank">mhm.dawod@=
gmail.com</a>&gt;:<br>
&gt; I am trying to add Qt5 to my custom image.<br>
&gt; I edited bblayer.conf file and created.<br>
&gt; Now I want to know what is th packages which i need to append to<br>
&gt; IMAGE_INSTALL variable ?<br>
&gt; I found many many packages and modules. I can not add them all, becaus=
e this<br>
&gt; will expand my image size.<br>
&gt; I need to know how to select the most important modules for my image ?=
<br>
<br>
Presumably you need qt5 in order to run some application. Add that<br>
application to IMAGE_INSTALL, and it will pull in all necessary qt5<br>
dependencies automatically.<br>
<br>
Alex<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature" data-smartmail=3D"gmail_signature"><div dir=3D"ltr"><div>=
=C2=A0<br>Mohamed Dawod<br></div><div>
Computer Engineering Department=C2=A0<br>
Faculty of Engineering=C2=A0<br>
Cairo University</div></div></div>

--000000000000a1693805737ac53f--
