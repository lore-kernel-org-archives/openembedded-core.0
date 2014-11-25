Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f180.google.com (mail-qc0-f180.google.com
	[209.85.216.180])
	by mail.openembedded.org (Postfix) with ESMTP id 20CD8721BB
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Nov 2014 20:47:18 +0000 (UTC)
Received: by mail-qc0-f180.google.com with SMTP id i8so1058411qcq.25
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Nov 2014 12:47:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=fB/PcrDxNJRSDuIa5drt1zm4ZN50REKVg8z7vlEl8jg=;
	b=Jp6WPsPeLzki1+DOCWo5BPTWiufu1LorDWB+0L6LxJxHzdjTvVlNTQcMSqX0rAXIig
	5j3KwqF4cdTur6g3zo3nkZPQpEFTL8ACx5pO5A0+oeHKZtlTWAxQiPsUBNKR5Lv/HOzG
	J+whhd6DLB2F5c78y5uoZHSiwePWvsdlx4mrV4zoYRS0u/Eznx9qRBSHzG+p/X8utMne
	/kjZf0srAjwrQ+MHnTXCRWrkA2mUKfixljzFrcfKiaMxHiPLiqD1gpE+sDMkfQYGoNJO
	Gq3piKz6ul4XElBhhT+6mlNGwq5LlraSP2+JnYCFW3CgycfNllWGzvvnrDpKIOncxcVZ
	HFhA==
X-Gm-Message-State: ALoCoQnDi0nw9IHN/nLt+frZSNoUU1jfWX0MiNKjyVKZ+D+PQ3keK3Ji4zIWT+55XX4ki9AGd67C
X-Received: by 10.224.2.135 with SMTP id 7mr41109852qaj.64.1416948438640; Tue,
	25 Nov 2014 12:47:18 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.48.231 with HTTP; Tue, 25 Nov 2014 12:46:58 -0800 (PST)
In-Reply-To: <54183e481450413484c1441603cf77cc@BN1AFFO11FD033.protection.gbl>
References: <54183e481450413484c1441603cf77cc@BN1AFFO11FD033.protection.gbl>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 25 Nov 2014 20:46:58 +0000
Message-ID: <CAJTo0LZhPES_4mZx7zvuEGH3PLTeOR5a9GdRKJpM7JYuGyYUQA@mail.gmail.com>
To: Ezra Savard <ezra.savard@xilinx.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] powertop: update version number from 2.6.1 to 2.7
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
X-List-Received-Date: Tue, 25 Nov 2014 20:47:26 -0000
Content-Type: multipart/alternative; boundary=001a11c3defa59b1f00508b50464

--001a11c3defa59b1f00508b50464
Content-Type: text/plain; charset=UTF-8

On 25 November 2014 at 17:52, Ezra Savard <ezra.savard@xilinx.com> wrote:

>  meta/recipes-kernel/powertop/powertop_2.7.bb | 31
> ++++++++++++++++++++++++++++
>

Please also delete 2.6.1.

Ross

--001a11c3defa59b1f00508b50464
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 25 November 2014 at 17:52, Ezra Savard <span dir=3D"ltr">&lt;<a href=3D"=
mailto:ezra.savard@xilinx.com" target=3D"_blank">ezra.savard@xilinx.com</a>=
&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0=
 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":30" class=
=3D"a3s" style=3D"overflow:hidden">=C2=A0meta/recipes-kernel/powertop/<a hr=
ef=3D"http://powertop_2.7.bb" target=3D"_blank">powertop_2.7.bb</a> | 31 ++=
++++++++++++++++++++++++++<br></div></blockquote></div><br>Please also dele=
te 2.6.1.</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_ext=
ra">Ross</div></div>

--001a11c3defa59b1f00508b50464--
