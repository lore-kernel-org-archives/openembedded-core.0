Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f181.google.com (mail-qc0-f181.google.com
	[209.85.216.181])
	by mail.openembedded.org (Postfix) with ESMTP id A226573CFB
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Mar 2015 21:26:20 +0000 (UTC)
Received: by qcgx3 with SMTP id x3so25724566qcg.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Mar 2015 14:26:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=Grv0iv8kAEThdiEy+PFbTuuIIyDd6L8pmLc1X2fc7kk=;
	b=BRhKL6tyzn5e0lDuh1ChsN1hAktKUCg+PhJhbt+NXVXjX3BtTGxvrmRAXN25HYMVQ9
	mVx3Aus1O88DzFdJRiU2i1YdcqxXXweTQHE1aMM1+nKJJgbNXmcc2QNzEGdSORtipvpa
	rXjlkDxx8RMKOae8GLnTqPBG77mk2DwMljpoJfskL8tvKHHcHc5Sd7d8IaywfYTV2pgB
	C3R32E4/h4ycNcpVGzdHP54dA6EaIF+idc2bS518qGA0h2jeFC6W0MJMQmcvsm+oUjmh
	SevVUmKcoTsL3yfqOLHMpFnBYoo2khwJgzpjK+iNowmIGy3HfU0W1L6LJAttRGyQ6ask
	+XJw==
X-Gm-Message-State: ALoCoQmQ++nFGmvCsdILvmZUPb+LtEmjzGrtWSaWcWqJ82waJPO4FPmloVquDhw5Euo0JGdyz+EG
X-Received: by 10.55.31.10 with SMTP id f10mr83591087qkf.58.1427837182112;
	Tue, 31 Mar 2015 14:26:22 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.203 with HTTP; Tue, 31 Mar 2015 14:26:01 -0700 (PDT)
In-Reply-To: <551ABE39.5050503@gmail.com>
References: <551ABE39.5050503@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 31 Mar 2015 22:26:01 +0100
Message-ID: <CAJTo0LbL4oNgV3iynum07uGjo0m5DGJMfsjmSq_GEhAgyze++A@mail.gmail.com>
To: akuster808 <akuster808@gmail.com>
Cc: "yocto@yoctoproject.org" <yocto@yoctoproject.org>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: package update staging
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
X-List-Received-Date: Tue, 31 Mar 2015 21:26:22 -0000
Content-Type: multipart/alternative; boundary=001a1147ebda0980eb05129c40c0

--001a1147ebda0980eb05129c40c0
Content-Type: text/plain; charset=UTF-8

On 31 March 2015 at 16:33, akuster808 <akuster808@gmail.com> wrote:

> now that fido is nearing, what is the best method for staging package
> updates meant for oe-core?
>

Send patches now if you wish, both me and Richard have started collating
patches that are good for master.

Ross

--001a1147ebda0980eb05129c40c0
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 31 March 2015 at 16:33, akuster808 <span dir=3D"ltr">&lt;<a href=3D"mail=
to:akuster808@gmail.com" target=3D"_blank">akuster808@gmail.com</a>&gt;</sp=
an> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;=
border-left:1px #ccc solid;padding-left:1ex"><div id=3D":1dw" class=3D"a3s"=
 style=3D"overflow:hidden">now that fido is nearing, what is the best metho=
d for staging package updates meant for oe-core?<br></div></blockquote></di=
v><br>Send patches now if you wish, both me and Richard have started collat=
ing patches that are good for master.</div><div class=3D"gmail_extra"><br><=
/div><div class=3D"gmail_extra">Ross</div></div>

--001a1147ebda0980eb05129c40c0--
