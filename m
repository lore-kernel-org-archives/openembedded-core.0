Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f48.google.com (mail-qg0-f48.google.com
	[209.85.192.48])
	by mail.openembedded.org (Postfix) with ESMTP id 8AC8D768AB
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Aug 2015 16:05:52 +0000 (UTC)
Received: by qgdd90 with SMTP id d90so19737812qgd.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Aug 2015 09:05:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=g+P1xwEmd51pOgrxpwxpAMbO1ZXAyrVAtrSNcfNKinM=;
	b=bPU7WPQVwF1jCVurRHdJYPzAdh5J7CCbHa5y/6BtTmZmO2npsEeryDNqQpJutlkJMg
	EXn8HsW2g+xr/+I2xYfQ37qS26TW0tGnFUKQEa9KM6PEwP6/mQDKzN+QRqn6Tbf963GT
	GwBWVmASsbGHJoPSaPPo5LczCf4+hg8Dp1s177UXg2h6Jd31HsSfNdCemVgF1mx5oqQz
	Ox8lkCD/SGMIRqvgXtI8mXOZpVdwJbjGNhX98Px986uMM9zXEdwfSH3j7ZmpO0OkoTdI
	kLKyTi4Ccx0zciFh4Nd36qCWjJXWyXPfEb+Oqly4jQ8ucyVUqoiSbUKGkw69fgG28VR+
	2Caw==
X-Gm-Message-State: ALoCoQmbfK3wMGpBCTjQuxvAIEfSxbcxrvJmNwQM2b8zeRZJqN123kOxfcl8MU9Lryh/haEVUHc1
X-Received: by 10.140.33.164 with SMTP id j33mr29877169qgj.77.1439222752461;
	Mon, 10 Aug 2015 09:05:52 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.98.67 with HTTP; Mon, 10 Aug 2015 09:05:33 -0700 (PDT)
In-Reply-To: <CAJTo0LY6_da-bGLdhUc9AgPhCG3b8st0S0EHAukxGim38VOkbA@mail.gmail.com>
References: <cover.1439216269.git.alexander.kanavin@linux.intel.com>
	<fc2a824dd0fa2442f893327f70c9582be5d59caf.1439216269.git.alexander.kanavin@linux.intel.com>
	<CAJTo0LY6_da-bGLdhUc9AgPhCG3b8st0S0EHAukxGim38VOkbA@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 10 Aug 2015 17:05:33 +0100
Message-ID: <CAJTo0LbVV42=nV3ioyP5mUAfP3WqckhkeBTqvpmCSh6mCRZpyA@mail.gmail.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 6/8] bootchart2: update to 0.14.7
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
X-List-Received-Date: Mon, 10 Aug 2015 16:05:52 -0000
Content-Type: multipart/alternative; boundary=001a1139bd9ce9de25051cf728cb

--001a1139bd9ce9de25051cf728cb
Content-Type: text/plain; charset=UTF-8

On 10 August 2015 at 17:02, Burton, Ross <ross.burton@intel.com> wrote:

> This doesn't apply to master-next, could you rebase please?
>

Ignore this - it was a trivial merge.

Ross

--001a1139bd9ce9de25051cf728cb
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 10 August 2015 at 17:02, Burton, Ross <span dir=3D"ltr">&lt;<a href=3D"m=
ailto:ross.burton@intel.com" target=3D"_blank">ross.burton@intel.com</a>&gt=
;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 =
.8ex;border-left:1px #ccc solid;padding-left:1ex"><div class=3D"gmail_extra=
">This doesn&#39;t apply to master-next, could you rebase please?</div><div=
 class=3D"gmail_extra"></div></blockquote></div><br>Ignore this - it was a =
trivial merge.</div><div class=3D"gmail_extra"><br></div><div class=3D"gmai=
l_extra">Ross</div></div>

--001a1139bd9ce9de25051cf728cb--
