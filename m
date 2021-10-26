Return-Path: <martyn.welch@collabora.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72125C433F5
	for <webhook@archiver.kernel.org>; Tue, 26 Oct 2021 11:24:13 +0000 (UTC)
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by mx.groups.io with SMTP id smtpd.web08.10797.1635247451773010541
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Oct 2021 04:24:12 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: collabora.com, ip: 46.235.227.227, mailfrom: martyn.welch@collabora.com)
Received: from [IPv6:2a00:23c6:c31a:b300:6338:938c:ab16:fa48] (unknown
 [IPv6:2a00:23c6:c31a:b300:6338:938c:ab16:fa48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: martyn)
	by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 359C61F435FA;
	Tue, 26 Oct 2021 12:24:10 +0100 (BST)
Message-ID: <be44141b1296af11d9e702d2fd99da20fea7fe98.camel@collabora.com>
Subject: Re: [OE-core] [PATCH v6 2/2] core-image.bbclass: add default
 IMAGE_QA_PROHIBIT_PATHS variable
From: Martyn Welch <martyn.welch@collabora.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>, Konrad Weihmann
	 <kweihmann@outlook.com>
Date: Tue, 26 Oct 2021 12:24:07 +0100
In-Reply-To: 
 <CANNYZj9JH5B8BTxWQDV=bx3aE1qH52aPROpG0phydEwEDOaJzQ@mail.gmail.com>
References: 
	<06387e0dd040237457de963fd13ff3db3e02be61.1635240032.git.martyn.welch@collabora.com>
	 <e1285a97073645957532749c71d2de3a02310198.1635240032.git.martyn.welch@collabora.com>
	 <AM9PR09MB46423424A75EE5AF6AE482C5A8849@AM9PR09MB4642.eurprd09.prod.outlook.com>
	 <CANNYZj9JH5B8BTxWQDV=bx3aE1qH52aPROpG0phydEwEDOaJzQ@mail.gmail.com>
Organization: Collabora Ltd.
Content-Type: multipart/alternative; boundary="=-sGLeq+PkG+mPRCm0HPyV"
User-Agent: Evolution 3.42.0-2 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Oct 2021 11:24:13 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157388


--=-sGLeq+PkG+mPRCm0HPyV
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2021-10-26 at 13:01 +0200, Alexander Kanavin wrote:
> On Tue, 26 Oct 2021 at 12:56, Konrad Weihmann <kweihmann@outlook.com>
> wrote:
> > > Suggested-by: Alexander Kanavin
> > <alexander.kanavin@linux.intel.com>
> > 
> > That can't be true - or the initial idea is very very old :-) pls
> > use 
> > Alex's gmail instead
> 
> I don't remember anything whatsoever about this, and a search in my
> gmail for IMAGE_QA_PROHIBIT_PATHS yields nothing, so unless you can
> point to where this was suggested, it's best to drop this :)


I don't blame you - it has been sitting needing some attention long
enough that it didn't surprise me the email address is now not valid...

https://patchwork.openembedded.org/patch/146237/

> 
> Alex


--=-sGLeq+PkG+mPRCm0HPyV
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<html><head></head><body><div>On Tue, 2021-10-26 at 13:01 +0200, Alexander =
Kanavin wrote:</div><blockquote type=3D"cite" style=3D"margin:0 0 0 .8ex; b=
order-left:2px #729fcf solid;padding-left:1ex"><div dir=3D"ltr"><div class=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, 26 Oct 2021 =
at 12:56, Konrad Weihmann &lt;<a href=3D"mailto:kweihmann@outlook.com" targ=
et=3D"_blank">kweihmann@outlook.com</a>&gt; wrote:<br></div><blockquote typ=
e=3D"cite" style=3D"margin:0 0 0 .8ex; border-left:2px #729fcf solid;paddin=
g-left:1ex"><div>&gt; Suggested-by: Alexander Kanavin &lt;<a href=3D"mailto=
:alexander.kanavin@linux.intel.com" target=3D"_blank">alexander.kanavin@lin=
ux.intel.com</a>&gt;<br></div><div><br>That can't be true - or the initial =
idea is very very old :-) pls use <br>Alex's gmail instead<br></div></block=
quote></div><div class=3D"gmail_quote"><br></div><div class=3D"gmail_quote"=
>I don't remember anything whatsoever about this, and a search in my gmail =
for IMAGE_QA_PROHIBIT_PATHS yields nothing, so unless you can point to wher=
e this was suggested, it's best to drop this :)</div></div></blockquote><di=
v><br></div><div><br></div><div>I don't blame you - it has been sitting nee=
ding some attention long enough that it didn't surprise me the email addres=
s is now not valid...</div><div><br></div><div><a href=3D"https://patchwork=
.openembedded.org/patch/146237/">https://patchwork.openembedded.org/patch/1=
46237/</a></div><div><br></div><blockquote type=3D"cite" style=3D"margin:0 =
0 0 .8ex; border-left:2px #729fcf solid;padding-left:1ex"><div dir=3D"ltr">=
<div class=3D"gmail_quote"><br></div><div class=3D"gmail_quote">Alex<br></d=
iv></div></blockquote><div><br></div><div><span></span></div></body></html>

--=-sGLeq+PkG+mPRCm0HPyV--

