Return-Path: <kergoth@gmail.com>
Received: from mail-la0-f44.google.com (mail-la0-f44.google.com
	[209.85.215.44])
	by mail.openembedded.org (Postfix) with ESMTP id 58C7E6D445
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Nov 2013 15:08:44 +0000 (UTC)
Received: by mail-la0-f44.google.com with SMTP id ep20so2875299lab.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Nov 2013 07:08:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=wemCG57xc04uo+8sUqNFNRFo4lfDVNhQFHcYaI4ppYA=;
	b=JhHz6PSXtMSkNxdenR6v/z0wYuuEZqWhrOlMCXqBy7ypmCf0036uvyuE9X2AElfVCf
	t7Wm7Oh+4+8MLCLd86Kl5qnZo4QAnGmlratIFQ5qo125umoCZ6qijhMkMLkvpPu/hnGP
	B1C+gnRQXJAQWIurV3DGlLP0NQExtaYu3sZ3/Mg310MLa27AqWz7rUrGBFW3yJppA75+
	E/0VeH1GAEPU4ITE2lz/nloiQgB+P6Z4RybPcJwsc6G/SC40+/PVGgcASUClIdG6rADZ
	gXq9fo7dIWu3qwyrjXWlBX/1L2fvyoEDwl9Ejh2Y1vEzZAPQtOQLEp6Yd3pAWOooDIwq
	O4Fw==
X-Received: by 10.152.216.167 with SMTP id or7mr4630505lac.10.1384528124771;
	Fri, 15 Nov 2013 07:08:44 -0800 (PST)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.112.53.197 with HTTP; Fri, 15 Nov 2013 07:08:24 -0800 (PST)
In-Reply-To: <1384498379-30017-2-git-send-email-hongbo.zhong@windriver.com>
References: <1384498379-30017-1-git-send-email-hongbo.zhong@windriver.com>
	<1384498379-30017-2-git-send-email-hongbo.zhong@windriver.com>
From: Chris Larson <clarson@kergoth.com>
Date: Fri, 15 Nov 2013 08:08:24 -0700
X-Google-Sender-Auth: CXxLD1J8WcOsFAEfO4nZKblr7HA
Message-ID: <CABcZANmi3_6+oPVN_kfp8Nr3DSG2+xWPxPKXyeFOHLGBRzEPJg@mail.gmail.com>
To: Zhong Hongbo <hongbo.zhong@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [V2 2/2] bluez4: use legacy pygobject instead of gobject-introspection
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
X-List-Received-Date: Fri, 15 Nov 2013 15:08:46 -0000
Content-Type: multipart/alternative; boundary=001a1135e3180f02bd04eb3893e7

--001a1135e3180f02bd04eb3893e7
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 14, 2013 at 11:52 PM, Zhong Hongbo
<hongbo.zhong@windriver.com>wrote:

> From: Zhong Hongbo <hongbo.zhong@windriver.com>
>

This seems like a good example of a commit message missing the =E2=80=9Cwhy=
=E2=80=9D.
--=20
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--001a1135e3180f02bd04eb3893e7
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Thu, Nov 14, 2013 at 11:52 PM, Zhong Hongbo <span dir=3D"ltr">&lt;<a hre=
f=3D"mailto:hongbo.zhong@windriver.com" target=3D"_blank">hongbo.zhong@wind=
river.com</a>&gt;</span> wrote:<br>

<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div id=3D":nw" style=3D"overflow:hidden">Fr=
om: Zhong Hongbo &lt;<a href=3D"mailto:hongbo.zhong@windriver.com">hongbo.z=
hong@windriver.com</a>&gt;<br>

</div></blockquote></div><br>This seems like a good example of a commit mes=
sage missing the =E2=80=9Cwhy=E2=80=9D.<br>-- <br>Christopher Larson<br>cla=
rson at kergoth dot com<br>Founder - BitBake, OpenEmbedded, OpenZaurus<br>M=
aintainer - Tslib<br>

Senior Software Engineer, Mentor Graphics
</div></div>

--001a1135e3180f02bd04eb3893e7--
