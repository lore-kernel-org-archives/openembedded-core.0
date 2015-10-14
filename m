Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f52.google.com (mail-qg0-f52.google.com
	[209.85.192.52])
	by mail.openembedded.org (Postfix) with ESMTP id B272277085
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Oct 2015 10:55:42 +0000 (UTC)
Received: by qgt47 with SMTP id 47so38572662qgt.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Oct 2015 03:55:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=DFsv+EP7XICu5BaDlmmMTSN3UH5U6xLNF1aK6FPHtbk=;
	b=V0zLApbWgEFls9//tZQprPlmvovq/Qn8D+L72UTicGEA2B6n3nTf76jh38SPjPjR5t
	Pu5EVbhHnT19T3FUtbCvEb2h9kVQogi9Pz4kW/QsK5iuRnlGab3hfZMMNH4UCU38mABp
	zxBuL7RNfBclVl/WWYNC0Zav13Uec7aXhrRP70YrbW2hTaUpOL876bR2Lvi4DnTYqC/2
	syaQZcfupVDB7lB4TGewps5wbydg1d6QR2Xd3ct4wnJ9qyIUf7Qt6Eg9V+1BIc1/HBZD
	WHawYJjvvPg+Np2mJ+LZTyXU0dU4oUXvMoGJK2dlYqoan7YLFkWDH7xYZooflpIQ9e/K
	kpDQ==
X-Gm-Message-State: ALoCoQkhECsdmYT+IqW/de072rbtd/dajMIhd+oGSwjuPLQMoBU/CHkkiHden/0nqXhh/ffnzq7h
X-Received: by 10.140.44.11 with SMTP id f11mr3040386qga.80.1444820142326;
	Wed, 14 Oct 2015 03:55:42 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.94.82 with HTTP; Wed, 14 Oct 2015 03:55:22 -0700 (PDT)
In-Reply-To: <561DBD79.4090703@windriver.com>
References: <1441950663-11139-1-git-send-email-wenzong.fan@windriver.com>
	<561DBD79.4090703@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 14 Oct 2015 11:55:22 +0100
Message-ID: <CAJTo0LabjLYKjAS2D8gDfR2dRHwP0Z+-91ccN9GkdvbqLTRWMQ@mail.gmail.com>
To: wenzong fan <wenzong.fan@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] mdadm: fix CFLAGS invalid issue
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
X-List-Received-Date: Wed, 14 Oct 2015 10:55:42 -0000
Content-Type: multipart/alternative; boundary=001a113b41bc591ff305220e67d3

--001a113b41bc591ff305220e67d3
Content-Type: text/plain; charset=UTF-8

On 14 October 2015 at 03:27, wenzong fan <wenzong.fan@windriver.com> wrote:

> Ping ...
>

This doesn't apply to master now, can you rebase please.

Ross

--001a113b41bc591ff305220e67d3
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 14 October 2015 at 03:27, wenzong fan <span dir=3D"ltr">&lt;<a href=3D"m=
ailto:wenzong.fan@windriver.com" target=3D"_blank">wenzong.fan@windriver.co=
m</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margi=
n:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":1ck" =
class=3D"a3s" style=3D"overflow:hidden">Ping ...<br></div></blockquote></di=
v><br>This doesn&#39;t apply to master now, can you rebase please.</div><di=
v class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></di=
v>

--001a113b41bc591ff305220e67d3--
