Return-Path: <ross.burton@intel.com>
Received: from mail-ob0-f173.google.com (mail-ob0-f173.google.com
	[209.85.214.173])
	by mail.openembedded.org (Postfix) with ESMTP id 36BF875EEA
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jul 2015 22:26:23 +0000 (UTC)
Received: by obdeg2 with SMTP id eg2so5838490obd.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jul 2015 15:26:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=yWqOoEDjQOifJfvf+kYs0ByTs+k9vq+eTV+Tu+/Q/Jw=;
	b=c2xfCd9nsARYW+ri/8wSKADPzpvgcbYKgaFbs2hkWinYJmuZGDftSWppPzoQrWgQXy
	XH1UtaQtNbxld5idUZSFfEcp3Oby+YgDyZqilkHH/9UkYxxf+HrtXIKxc2JfDuhSz4+a
	JgYJnUejtYn29OGlkqJbOWQSsFLDS4EL0/loCmn8zw7JTJbT13YNTDnqnJt+sqxEX89n
	lThemLnttIMwCkLh/irNEaH+FsraCegtHHUZIj2V8bfJdFmjp0H2dQODGLyJL4xFZqKh
	g5Po0TLJP0CLzN64MSv7/+r0UcyEMkknMvuV7dWCKvSwdSKC2FO3iGy5ZcZlZf5OvUuD
	OjrQ==
X-Gm-Message-State: ALoCoQlGGbzqIv3jXgf+LdM87gQ9EcSolABEjvPBcAFRAxlBErW/yhJu63m7m9mqIhboSn/jLENo
X-Received: by 10.60.50.168 with SMTP id d8mr12280742oeo.41.1437690384141;
	Thu, 23 Jul 2015 15:26:24 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.202.108.4 with HTTP; Thu, 23 Jul 2015 15:26:04 -0700 (PDT)
In-Reply-To: <1B858668EC6A94408DCA5225FDFA85AAF8779A97@ALA-MBB.corp.ad.wrs.com>
References: <1435827696-10546-1-git-send-email-jackie.huang@windriver.com>
	<1B858668EC6A94408DCA5225FDFA85AAF8779A97@ALA-MBB.corp.ad.wrs.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 23 Jul 2015 23:26:04 +0100
Message-ID: <CAJTo0LYuVHdw04m5h_urgR5kF7yhSM7fz-GYn6W2t_4BR_Y2=g@mail.gmail.com>
To: "Huang, Jie (Jackie)" <Jackie.Huang@windriver.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] qemu: CVE-2014-3689
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
X-List-Received-Date: Thu, 23 Jul 2015 22:26:24 -0000
Content-Type: multipart/alternative; boundary=001a11c30bf0a50b3f051b92603e

--001a11c30bf0a50b3f051b92603e
Content-Type: text/plain; charset=UTF-8

On 23 July 2015 at 02:53, Huang, Jie (Jackie) <Jackie.Huang@windriver.com>
wrote:

> Ping.
>

We're now at 2.4.0-rc1 in master and a patch for rc2 is on the list.  Does
this still need to be applied?

Ross

--001a11c30bf0a50b3f051b92603e
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 23 July 2015 at 02:53, Huang, Jie (Jackie) <span dir=3D"ltr">&lt;<a href=
=3D"mailto:Jackie.Huang@windriver.com" target=3D"_blank">Jackie.Huang@windr=
iver.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=
=3D":1u7" class=3D"a3s" style=3D"overflow:hidden">Ping.<br></div></blockquo=
te></div><br>We&#39;re now at 2.4.0-rc1 in master and a patch for rc2 is on=
 the list.=C2=A0 Does this still need to be applied?</div><div class=3D"gma=
il_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a11c30bf0a50b3f051b92603e--
