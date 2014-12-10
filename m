Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f45.google.com (mail-qg0-f45.google.com
	[209.85.192.45])
	by mail.openembedded.org (Postfix) with ESMTP id 558377101A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Dec 2014 15:03:18 +0000 (UTC)
Received: by mail-qg0-f45.google.com with SMTP id f51so2169318qge.4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Dec 2014 07:03:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=03xwqIJlzFLQAd51quxinWWXK3Zl+CDSyil6Cd99hck=;
	b=e90nFBB5zdqJC4aLKCVluywnvaYzdYadtsDPoc4ieSUHI82r58sAb+RmGkEdiZNi+B
	MUKzmfqYQb0+15hpOHwCNtIYhfAifNXAQNMn2Ovwmr7/pJ0DIh36Yyt830HmB05vmjC4
	3e4wPm1Xd4P+ib7u2qYwCBrBH47gbSjqQECfqki+AYGXPUB6VrjSxJ96q3cUcflMV1rZ
	8XDdaEgKU0Sx/IsfVRvmsdzOngOHdsxtHAi9M+IPx30Pr/xNrR5U+6ka4k6DxRQBazVm
	fpWAqFLmwee4yAP89LXrB52h7BybamPPy/Wz8WZ7bEi59hTMGZ5V0OSjE0XraDRqEsFB
	miVw==
X-Gm-Message-State: ALoCoQke+FXvVxfGYZTtq6dgfDD01P+o60Lr0sDsfJc1vGcuLmLlIBPyzDNC+Qu8vLQIqLF4JULi
X-Received: by 10.140.102.144 with SMTP id w16mr8510177qge.59.1418223797812;
	Wed, 10 Dec 2014 07:03:17 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.48.231 with HTTP; Wed, 10 Dec 2014 07:02:57 -0800 (PST)
In-Reply-To: <cover.1418220684.git.bruce.ashfield@windriver.com>
References: <cover.1418220684.git.bruce.ashfield@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 10 Dec 2014 15:02:57 +0000
Message-ID: <CAJTo0LaGa3ACsL+vLjzUDgEQDDxJ2L2m1WQgj1LHdbzpsJPLUg@mail.gmail.com>
To: Bruce Ashfield <bruce.ashfield@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [v2 PATCH 0/9] kernel: version updates
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
X-List-Received-Date: Wed, 10 Dec 2014 15:03:21 -0000
Content-Type: multipart/alternative; boundary=001a11c16bc2aeadcd0509ddf5dd

--001a11c16bc2aeadcd0509ddf5dd
Content-Type: text/plain; charset=UTF-8

On 10 December 2014 at 14:16, Bruce Ashfield <bruce.ashfield@windriver.com>
wrote:

> The following changes since commit
> 88dfcbf149dda89277e58ae4ec3a87500624cfff:
>
>   kernel-yocto: make sure git tags get dereferenced properly in do_patch()
> (2014-12-10 08:12:56 -0500)
>
> are available in the git repository at:
>
>   git://git.pokylinux.org/poky-contrib HEAD
>

I wonder what happened here!


> for you to fetch changes up to 4be985be419f06f18c735d72ac4a4d00fea71dd8:
>
>   linux-yocto/3.14: update to 3.14.26, integrate ltsi and -rt updates
> (2014-12-10 08:38:49 -0500)
>

That's zedd/kernel-updates, right?

Ross

--001a11c16bc2aeadcd0509ddf5dd
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 10 December 2014 at 14:16, Bruce Ashfield <span dir=3D"ltr">&lt;<a href=
=3D"mailto:bruce.ashfield@windriver.com" target=3D"_blank">bruce.ashfield@w=
indriver.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div i=
d=3D":1sm" class=3D"a3s" style=3D"overflow:hidden">The following changes si=
nce commit 88dfcbf149dda89277e58ae4ec3a87500624cfff:<br>
<br>
=C2=A0 kernel-yocto: make sure git tags get dereferenced properly in do_pat=
ch() (2014-12-10 08:12:56 -0500)<br>
<br>
are available in the git repository at:<br>
<br>
=C2=A0 git://<a href=3D"http://git.pokylinux.org/poky-contrib" target=3D"_b=
lank">git.pokylinux.org/poky-contrib</a> HEAD<br></div></blockquote><div><b=
r></div><div>I wonder what happened here!</div><div>=C2=A0</div><blockquote=
 class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc soli=
d;padding-left:1ex"><div id=3D":1sm" class=3D"a3s" style=3D"overflow:hidden=
">
for you to fetch changes up to 4be985be419f06f18c735d72ac4a4d00fea71dd8:<br=
>
<br>
=C2=A0 linux-yocto/3.14: update to 3.14.26, integrate ltsi and -rt updates =
(2014-12-10 08:38:49 -0500)</div></blockquote><div><br></div><div>That&#39;=
s zedd/kernel-updates, right?</div><div><br></div><div>Ross=C2=A0</div></di=
v></div></div>

--001a11c16bc2aeadcd0509ddf5dd--
