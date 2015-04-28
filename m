Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f179.google.com (mail-qk0-f179.google.com
	[209.85.220.179])
	by mail.openembedded.org (Postfix) with ESMTP id A7FEE716CE
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Apr 2015 11:10:51 +0000 (UTC)
Received: by qkgx75 with SMTP id x75so77657004qkg.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Apr 2015 04:10:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=YfB1QHxsbYL9d98+YDvZ8Fp8Bv+m1bb+w6yywtUvr34=;
	b=lpdmUrvoXQwdLqYXVTgjSmt/vmcRvDnN1yttZ/9vSp9+GEekmVOrRkN8tJjpW7DSms
	axPrEgUst/tlOTuKKmBK/gd7WmYBbH0E2H+/hqUDZko6QM9uVccCsUUZVK7+UMhd50uX
	s1Dap0gXrXQCqmeKv1QdMyDn7Pc4aJPjgBoBvZDA+YBaZ6PV9vGNG6nR9/9xzLNk9yce
	e07pyTaW7ozdQ2iL2OCDzzpYtjAYXqFY+yLedAapyi08o4kNbFKJ3+rqQdXrk85S+cYh
	QCPqDJxfUv2iHvoyx4AVxvg4mRGcfP4sui3FVxE6kPxPpGDXfamVDR85iWDWoyFRpkcl
	2r5Q==
X-Gm-Message-State: ALoCoQnZeiy2O0p+J8hQIAaWV1Q2js3+S5zrLupaIkoxm2lvZPTJ4faJjb0J5djaQaHuLQ4tzckg
X-Received: by 10.140.235.77 with SMTP id g74mr11967429qhc.64.1430219452986;
	Tue, 28 Apr 2015 04:10:52 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.231 with HTTP; Tue, 28 Apr 2015 04:10:32 -0700 (PDT)
In-Reply-To: <1430117607-3627-1-git-send-email-leimaohui@cn.fujitsu.com>
References: <1430117607-3627-1-git-send-email-leimaohui@cn.fujitsu.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 28 Apr 2015 12:10:32 +0100
Message-ID: <CAJTo0LY2TzcNo8u9P8HtjgLetvWbVQVXfjxfQ99Sd64AmYV6YQ@mail.gmail.com>
To: Lei Maohui <leimaohui@cn.fujitsu.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] xkeyboard-config: modified the license
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
X-List-Received-Date: Tue, 28 Apr 2015 11:10:52 -0000
Content-Type: multipart/alternative; boundary=001a11354a00724da20514c6ea23

--001a11354a00724da20514c6ea23
Content-Type: text/plain; charset=UTF-8

On 27 April 2015 at 07:53, Lei Maohui <leimaohui@cn.fujitsu.com> wrote:

> Because usr/share/X11/xkb/symbols/eu and usr/share/X11/xkb/symbols/ph are
> GPLv3.
> So add GPLv3 in the license.
>

A friendly upstream maintainer I know was surprised at this and has
requested that the files are relicensed to MIT, so we may be able to take a
patch from upstream to change the licenses instead of adding GPLv3.

Ross

--001a11354a00724da20514c6ea23
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 27 April 2015 at 07:53, Lei Maohui <span dir=3D"ltr">&lt;<a href=3D"mail=
to:leimaohui@cn.fujitsu.com" target=3D"_blank">leimaohui@cn.fujitsu.com</a>=
&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0=
 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":hm" class=
=3D"a3s" style=3D"overflow:hidden">Because usr/share/X11/xkb/symbols/eu and=
 usr/share/X11/xkb/symbols/ph are GPLv3.<br>
So add GPLv3 in the license.<br></div></blockquote></div><br>A friendly ups=
tream maintainer I know was surprised at this and has requested that the fi=
les are relicensed to MIT, so we may be able to take a patch from upstream =
to change the licenses instead of adding GPLv3.</div><div class=3D"gmail_ex=
tra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a11354a00724da20514c6ea23--
