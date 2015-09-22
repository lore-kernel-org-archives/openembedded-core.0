Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f47.google.com (mail-qg0-f47.google.com
	[209.85.192.47])
	by mail.openembedded.org (Postfix) with ESMTP id 89C7773243
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Sep 2015 14:09:13 +0000 (UTC)
Received: by qgez77 with SMTP id z77so117615019qge.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Sep 2015 07:09:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=4TjS+670Nc3jR6fgCIxfDqQ55xxmYXk9Yf2T5gDR6JU=;
	b=egK08n/gU3bOWONB6neUkNBjGpmX4rjAu80RTJW9ihVJiJc1KuZAzD0MklzkcnAAUD
	LMdAOwnXl4vPtF1NU7NOjEXU/Pj3Lysyjh4wStxOCIKEQF2aGIARZTruZte8/VK8cpH6
	vBCD7MB3Hw+muMbH2f/kwjcM0kWnENHLRWhAKyptQ0bYXPYasBxWQaBVjykOE1Dve4gw
	2k7U/x1iHrafPZxYaxQRGfKogApFd1wj+P04O4zDLTQcP/jdP4DU2TRelJrOUgs08HWv
	5sekRnFiw17kYFfWlVD1923DLFX8D08vCM7vEGZa/xltNUeTtTBM5WWssJ4sejZ5dckN
	drGA==
X-Gm-Message-State: ALoCoQnlaFx95M23TJfA1+wns8/dLqinmDcWKqJjTk21tJcwr/cRdbXAaieem2vGfxcWnWx3V4fZ
X-Received: by 10.140.132.71 with SMTP id 68mr31806716qhe.64.1442930953716;
	Tue, 22 Sep 2015 07:09:13 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.94.86 with HTTP; Tue, 22 Sep 2015 07:08:54 -0700 (PDT)
In-Reply-To: <1442924678-17427-1-git-send-email-joshc@ni.com>
References: <1442924678-17427-1-git-send-email-joshc@ni.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 22 Sep 2015 15:08:54 +0100
Message-ID: <CAJTo0LYWQ+9jL_ZDQ1UTrQu=OaO=iaO5_XnBmAei3va6Es0nug@mail.gmail.com>
To: Josh Cartwright <joshc@ni.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] rt-tests: bump to v0.94
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
X-List-Received-Date: Tue, 22 Sep 2015 14:09:14 -0000
Content-Type: multipart/alternative; boundary=001a113510d4ef05410520568aef

--001a113510d4ef05410520568aef
Content-Type: text/plain; charset=UTF-8

On 22 September 2015 at 13:24, Josh Cartwright <joshc@ni.com> wrote:

> All of the rt-tests patches that OE has been carrying have been
> upstreamed or superceded by changes in the v0.94 release.
>

Sorry but you just missed the M3 deadline so this will have to wait until
2.0 is released and master re-opens, unless you have an urgent need for
this to be merged in 2.0.

Ross

--001a113510d4ef05410520568aef
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 22 September 2015 at 13:24, Josh Cartwright <span dir=3D"ltr">&lt;<a hre=
f=3D"mailto:joshc@ni.com" target=3D"_blank">joshc@ni.com</a>&gt;</span> wro=
te:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-=
left:1px #ccc solid;padding-left:1ex"><div id=3D":1fw" class=3D"a3s" style=
=3D"overflow:hidden">All of the rt-tests patches that OE has been carrying =
have been<br>
upstreamed or superceded by changes in the v0.94 release.<br></div></blockq=
uote></div><br>Sorry but you just missed the M3 deadline so this will have =
to wait until 2.0 is released and master re-opens, unless you have an urgen=
t need for this to be merged in 2.0.</div><div class=3D"gmail_extra"><br></=
div><div class=3D"gmail_extra">Ross</div></div>

--001a113510d4ef05410520568aef--
