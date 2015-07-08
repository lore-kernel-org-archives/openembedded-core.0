Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f180.google.com (mail-qk0-f180.google.com
	[209.85.220.180])
	by mail.openembedded.org (Postfix) with ESMTP id 5487F73710
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Jul 2015 13:54:20 +0000 (UTC)
Received: by qkeo142 with SMTP id o142so163245931qke.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 08 Jul 2015 06:54:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=DfzFamGwrVobgYbPOUN//sIgG9nooVSSvC9z8X3/3f0=;
	b=mb4LaLYGTh2hLKqQvGXk0907y+XG/TjBsmAxKporG10GYgyhIxuttiEVBXCUDyowHn
	fkQ2+wRDDbSvEtTqPT3xeNNRnjLeJqVReQf8WpKVmYY6hJb06icrd7owLdmeXogUOggh
	GPrps4ni97XIsc0RQdsU+aEeSMcRUojLBiSGusT4lKHbVY4/rUSYyswAqWrv+1IV+sZ2
	uF1gHWiz/CJgm60p7LR+r8Q3FU0Np9VB7I9i4x3gQ6G37rGJibo/WxIKtChA3WuWbZlz
	QBB4C4jh+NuyPHvu247MwuQ9RpkWO7Z+i3KzDP4Jw3W4YBgDo8yd2JwuuP0EYKz5Ng6b
	RDtQ==
X-Gm-Message-State: ALoCoQkypjw5OGMjjA6JDfHyWBL/iXKZ5HVRRaSQ+oL9S2d4oRGjyxnaBrXWewvZdtxaCgsq53ir
X-Received: by 10.140.89.100 with SMTP id u91mr15931216qgd.15.1436363660375;
	Wed, 08 Jul 2015 06:54:20 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.231 with HTTP; Wed, 8 Jul 2015 06:54:00 -0700 (PDT)
In-Reply-To: <CAK8F28m62nkjQVGaF8bVYiuKoRknNeNdKxS7rSB8YK=X2-1W=g@mail.gmail.com>
References: <1436304174-24460-1-git-send-email-ashcharles@gmail.com>
	<CAJTo0LZBZ8rWUZF3MfUkm9MkZdaZwhDo4c+2ay1Peb_A05iGGw@mail.gmail.com>
	<CAK8F28m62nkjQVGaF8bVYiuKoRknNeNdKxS7rSB8YK=X2-1W=g@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 8 Jul 2015 14:54:00 +0100
Message-ID: <CAJTo0LZ=ibVusHuixDfRapcFyn4505vNgxYH-d2BNhVo+Y4s+Q@mail.gmail.com>
To: Ash Charles <ashcharles@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] python-io: Add runtime dependency on contextlib
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
X-List-Received-Date: Wed, 08 Jul 2015 13:54:20 -0000
Content-Type: multipart/alternative; boundary=001a11c1334ebed0d0051a5d794d

--001a11c1334ebed0d0051a5d794d
Content-Type: text/plain; charset=UTF-8

On 8 July 2015 at 14:53, Ash Charles <ashcharles@gmail.com> wrote:

> It is not applicable to 3.3
>

Thanks for the clarification.

Ross

--001a11c1334ebed0d0051a5d794d
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 8 July 2015 at 14:53, Ash Charles <span dir=3D"ltr">&lt;<a href=3D"mailt=
o:ashcharles@gmail.com" target=3D"_blank">ashcharles@gmail.com</a>&gt;</spa=
n> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;b=
order-left:1px #ccc solid;padding-left:1ex"><div id=3D":41r" class=3D"a3s" =
style=3D"overflow:hidden">It is not applicable to 3.3<br></div></blockquote=
></div><br>Thanks for the clarification.</div><div class=3D"gmail_extra"><b=
r></div><div class=3D"gmail_extra">Ross</div></div>

--001a11c1334ebed0d0051a5d794d--
