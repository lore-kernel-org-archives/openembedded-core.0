Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f179.google.com (mail-qk0-f179.google.com
	[209.85.220.179])
	by mail.openembedded.org (Postfix) with ESMTP id 8C97160053
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jul 2015 13:19:40 +0000 (UTC)
Received: by qkfc129 with SMTP id c129so17773558qkf.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jul 2015 06:19:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=YrzTyAxaVT/ddkCKJs5qW+fD2PgZ4yrldIUiao5AbEU=;
	b=bUm8Mb5f4+/7uHFsgC1SLt/9qAs6sr2nih/xn5a0UJKlRXaguQmxqJBfPAtFc2ElDg
	kMU8sZskgaO4qSVsrCMfJBhacHWNwR+4bd/qJUc+JwKwMUz+HEqO7dqBM8pGuRqv61fP
	csAmP2syRx66S8MJirGQn0SSAt3LHyHzkeckT6rdKs8gP8pCGKcLVMxqBgdwlemGz4CJ
	TNcvyy3h48zqwplyWdOj+QWtjs8cB3SNuOlogLPW2K2extWVqEFhwuNgA1uWgWTyA5yO
	DjMx+NYPB8xkK9UmqeXDbi8DlS8UQG3lZuJg5lL31aNO8XiWPoLIcvqlHTHn+1WcyHAo
	Cvvw==
X-Gm-Message-State: ALoCoQkPkNyNTZAndyivhCRk3s7dMjMfrE7cpwzHGPZEiebaQ1hoqsH1pknDoJ0X5gVBkgfFKI08
X-Received: by 10.55.17.170 with SMTP id 42mr66078170qkr.29.1438262380285;
	Thu, 30 Jul 2015 06:19:40 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.195 with HTTP; Thu, 30 Jul 2015 06:19:20 -0700 (PDT)
In-Reply-To: <007BD92917A2324FA403BCF9A464CF8482360E56@ALA-MBA.corp.ad.wrs.com>
References: <1438110674-25138-1-git-send-email-jslater@windriver.com>
	<CAJTo0LYrj4yAgwUA6KX849S-kRsk-xZca4gvy8nS8VmM671ocw@mail.gmail.com>
	<007BD92917A2324FA403BCF9A464CF8482360E56@ALA-MBA.corp.ad.wrs.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 30 Jul 2015 14:19:20 +0100
Message-ID: <CAJTo0LakjSaW+H1gtpPi4gixpRY5G1XW+sfp7yqDx+7NnmbGxQ@mail.gmail.com>
To: "Slater, Joseph W (Wind River)" <joe.slater@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] nss: advance to version 3.19.1
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
X-List-Received-Date: Thu, 30 Jul 2015 13:19:40 -0000
Content-Type: multipart/alternative; boundary=001a1135bd02456066051c178ee3

--001a1135bd02456066051c178ee3
Content-Type: text/plain; charset=UTF-8

On 29 July 2015 at 23:10, Slater, Joseph W (Wind River) <
joe.slater@windriver.com> wrote:

> ok.  I think I just sent a new version of the patch (but for some reason I
> did not get a copy).     Joe
>
>
You did, thanks :)

Ross

--001a1135bd02456066051c178ee3
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 29 July 2015 at 23:10, Slater, Joseph W (Wind River) <span dir=3D"ltr">&=
lt;<a href=3D"mailto:joe.slater@windriver.com" target=3D"_blank">joe.slater=
@windriver.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><p c=
lass=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Calibr=
i&quot;,&quot;sans-serif&quot;;color:#1f497d">ok.=C2=A0 I think I just sent=
 a new version of the patch (but for some reason I did not get a copy).=C2=
=A0=C2=A0=C2=A0=C2=A0 Joe<u></u><u></u></span></p>
<p class=3D"MsoNormal"></p></blockquote></div><br>You did, thanks :)</div><=
div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></=
div>

--001a1135bd02456066051c178ee3--
