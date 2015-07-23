Return-Path: <ross.burton@intel.com>
Received: from mail-oi0-f51.google.com (mail-oi0-f51.google.com
	[209.85.218.51])
	by mail.openembedded.org (Postfix) with ESMTP id 67C2E75EEA
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jul 2015 22:26:46 +0000 (UTC)
Received: by oihq81 with SMTP id q81so6476740oih.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jul 2015 15:26:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=xKshBV3flrlHQf10R/N4B8JS9Nf6D6Wke5w/3bLi41Y=;
	b=lY3ETcdZR7y2BgmW4Zcb0KhpAYc3+tbgd0unfuN7TLONS5cLXh+eCM1Y9MxA7hR3t9
	uC0ecp1qNu6sXLEQWE8VdYMuPAM0kcceVmZaWM5hbF33Bw/z6TSm+DjeHH6SGSSHGuM8
	Td42UBwsl35h4eaKhSLMUT3ITMlz60HE2UUlLGBohImN3IzurMxvQVM7EdSHZMqb+Mu2
	XZJXjV0q7iZsyCBWsQAcrncaj3GVK+ZhtduaH/PDBbFZmp2l8Cgbkv5m+ejWFn/BvDe/
	RYKmfaZujYiAA9dELgqppYAkJ2nPuFCEZiX499z5E3A5tp1JnFzEr0NKU/OViCu8ZCOu
	x7eg==
X-Gm-Message-State: ALoCoQmnHRTYl85Z+9UfaD+xFtx5idgRVl7+A1NTaeq5FugzNC2RsXtitBHy3LQGIcBimL9ae/eR
X-Received: by 10.182.34.167 with SMTP id a7mr11720963obj.85.1437690407288;
	Thu, 23 Jul 2015 15:26:47 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.202.108.4 with HTTP; Thu, 23 Jul 2015 15:26:27 -0700 (PDT)
In-Reply-To: <3e07b3cb41ab64e363d452c58a6e1418f219d19f.1437617250.git.Qi.Chen@windriver.com>
References: <cover.1437617250.git.Qi.Chen@windriver.com>
	<3e07b3cb41ab64e363d452c58a6e1418f219d19f.1437617250.git.Qi.Chen@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 23 Jul 2015 23:26:27 +0100
Message-ID: <CAJTo0LYjoC0Wp6jNHvCOgKmdEgDMvRHusosgM_VbaaY9gK-s0w@mail.gmail.com>
To: Chen Qi <Qi.Chen@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/3] sudo: upgrade to 1.8.14p2
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
X-List-Received-Date: Thu, 23 Jul 2015 22:26:49 -0000
Content-Type: multipart/alternative; boundary=001a11c2c916061b3e051b9262d5

--001a11c2c916061b3e051b9262d5
Content-Type: text/plain; charset=UTF-8

On 23 July 2015 at 03:10, Chen Qi <Qi.Chen@windriver.com> wrote:

> -LIC_FILES_CHKSUM =
> "file://doc/LICENSE;md5=346ce81ebf0f7f89fd379b40b6a4233b \
> +LIC_FILES_CHKSUM =
> "file://doc/LICENSE;md5=c16e542408abda013d672be8eb88d174 \
>

Please explain why the license checksum needs to be updated in the commit
log.

Ross

--001a11c2c916061b3e051b9262d5
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 23 July 2015 at 03:10, Chen Qi <span dir=3D"ltr">&lt;<a href=3D"mailto:Q=
i.Chen@windriver.com" target=3D"_blank">Qi.Chen@windriver.com</a>&gt;</span=
> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bo=
rder-left:1px #ccc solid;padding-left:1ex"><div id=3D":1qq" class=3D"a3s" s=
tyle=3D"overflow:hidden">-LIC_FILES_CHKSUM =3D &quot;file://doc/LICENSE;md5=
=3D346ce81ebf0f7f89fd379b40b6a4233b \<br>
+LIC_FILES_CHKSUM =3D &quot;file://doc/LICENSE;md5=3Dc16e542408abda013d672b=
e8eb88d174 \</div></blockquote></div><br>Please explain why the license che=
cksum needs to be updated in the commit log.</div><div class=3D"gmail_extra=
"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a11c2c916061b3e051b9262d5--
