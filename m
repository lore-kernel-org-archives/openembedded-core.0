Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f174.google.com (mail-qc0-f174.google.com
	[209.85.216.174])
	by mail.openembedded.org (Postfix) with ESMTP id DD15D7413A
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Jun 2015 15:25:27 +0000 (UTC)
Received: by qcwx2 with SMTP id x2so3781421qcw.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Jun 2015 08:25:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=YrnLLvV8WTbVv52qXmhXeItT3bn83HjQ6ExaPohcQGQ=;
	b=HqR+j42GBSBEGAkcPvy+Aoc3fUqenzi/jkROFdwLqSJCTWlNpvwh/75C21QZzAygnr
	0bs1s237Lo8o/gX5A7gFNdLZZRg5amQpVYyK7YAtWf9KEtwo6Avhnv+/4rPyvU+Wf1oR
	0ry2ZJ/9VkKFzWHxnJbiNA+0ivRpsxd7+rdaZa/GGaOLi02c7tybobFYY1gRks/nlHOg
	bWu8o+4CpZ9ZmJ6Jnktq5TzovI+DIFT5ER/eyIfHiklDjesZ8keSEAOwrO3qNu1vEiVO
	ik8iFpU3vKQutk3FnKTMabhx7DN05YUzR1MxtRrsWSjSxfR5rzZlHdbxgMkaUu5ygJqE
	cthw==
X-Gm-Message-State: ALoCoQm2HN8i48FEOZdgwEtenE/I7HNr+tzudrLDD0DyaqDQZj1K61gfRVdtgT1AVlWokwYMd49u
X-Received: by 10.55.25.150 with SMTP id 22mr60839706qkz.105.1434381928760;
	Mon, 15 Jun 2015 08:25:28 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.231 with HTTP; Mon, 15 Jun 2015 08:25:08 -0700 (PDT)
In-Reply-To: <A0A03D4442F2EC4DBF5A0F72D4A3DA01B344CF@SHSMSX103.ccr.corp.intel.com>
References: <A0A03D4442F2EC4DBF5A0F72D4A3DA01B344CF@SHSMSX103.ccr.corp.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 15 Jun 2015 16:25:08 +0100
Message-ID: <CAJTo0LbvAPsD3fSOF4sHg9Vkk=6ydSL=jbw1LnZbzf4dO7MrLw@mail.gmail.com>
To: "Liu, Sharron" <sharron.liu@intel.com>
Cc: "Yu, Ling L" <ling.l.yu@intel.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: FW: 7865 patch
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
X-List-Received-Date: Mon, 15 Jun 2015 15:25:30 -0000
Content-Type: multipart/alternative; boundary=001a1147b3b0561a8005189011aa

--001a1147b3b0561a8005189011aa
Content-Type: text/plain; charset=UTF-8

Hi Sharron,

On 15 June 2015 at 08:04, Liu, Sharron <sharron.liu@intel.com> wrote:

> Here attached the patch to 7865
> <https://bugzilla.yoctoproject.org/show_bug.cgi?id=7865> (component:
> automated build testing).
>
> Patch status: reviewed and agreed by Costin (in copy), issue owner.
>
>
Can you send this as a proper git patch with a commit log so we can see
what the patch does and you get attribution?

Ross

--001a1147b3b0561a8005189011aa
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra">Hi Sharron,</div><div class=3D"=
gmail_extra"><br><div class=3D"gmail_quote">On 15 June 2015 at 08:04, Liu, =
Sharron <span dir=3D"ltr">&lt;<a href=3D"mailto:sharron.liu@intel.com" targ=
et=3D"_blank">sharron.liu@intel.com</a>&gt;</span> wrote:<br><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;p=
adding-left:1ex"><p class=3D"MsoNormal"><span lang=3D"EN-US">Here attached =
the patch to <a href=3D"https://bugzilla.yoctoproject.org/show_bug.cgi?id=
=3D7865" target=3D"_blank">
7865</a> (component: automated build testing). <u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Patch status: reviewed and agre=
ed by Costin (in copy), issue owner.<u></u><u></u></span></p>
<p class=3D"MsoNormal"></p></blockquote></div><br>Can you send this as a pr=
oper git patch with a commit log so we can see what the patch does and you =
get attribution?</div><div class=3D"gmail_extra"><br></div><div class=3D"gm=
ail_extra">Ross</div></div>

--001a1147b3b0561a8005189011aa--
