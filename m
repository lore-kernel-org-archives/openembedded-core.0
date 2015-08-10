Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f41.google.com (mail-qg0-f41.google.com
	[209.85.192.41])
	by mail.openembedded.org (Postfix) with ESMTP id 17ECB768AB
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Aug 2015 16:02:35 +0000 (UTC)
Received: by qgj62 with SMTP id 62so95297713qgj.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Aug 2015 09:02:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=NxgFg6gNhM2Hqfd0L81zGRNHwACtys95qZRSTKKFnuI=;
	b=nBs/MR4i+89kE026tITdVVPjeT4Z7IvyYutfM4cQ8vX3THhA8pElT7CGAm/0DtqohF
	iIQQUkrgIa2/3z0Nf8VgdoQhzrYaK0ZaIpgiekYxP9cq5NayUWE9NkE+qQn91uqtlDSG
	WVrcPu6EF+Jr1RcgvQh3sKlRvIiqA9yr/ZJesisaAdtSteeJstSR1Zb3awUDeqfhiQSP
	CtiPXvbwPhwSkSxBhopM7TuXLH2W5Kcxh+jkM/AntNE7O32uzlG7jUSei0i0GLUT6jR4
	uR1xO7JNPpA9qW0zpWtQJui9ThHpQbPlmCAmRkkoy8p8l/gvJHCUQwvPp1+Y5kZtiE7V
	+SYQ==
X-Gm-Message-State: ALoCoQnTe1RBmVlK/lSkbRGPvQgSpxnhHfn0Lg5+D1GJ+ziAblaNe4ZDnsMvjU1IORZexeKy5zEm
X-Received: by 10.140.20.77 with SMTP id 71mr4336870qgi.87.1439222555747; Mon,
	10 Aug 2015 09:02:35 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.98.67 with HTTP; Mon, 10 Aug 2015 09:02:16 -0700 (PDT)
In-Reply-To: <fc2a824dd0fa2442f893327f70c9582be5d59caf.1439216269.git.alexander.kanavin@linux.intel.com>
References: <cover.1439216269.git.alexander.kanavin@linux.intel.com>
	<fc2a824dd0fa2442f893327f70c9582be5d59caf.1439216269.git.alexander.kanavin@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 10 Aug 2015 17:02:16 +0100
Message-ID: <CAJTo0LY6_da-bGLdhUc9AgPhCG3b8st0S0EHAukxGim38VOkbA@mail.gmail.com>
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
X-List-Received-Date: Mon, 10 Aug 2015 16:02:36 -0000
Content-Type: multipart/alternative; boundary=001a11c12458302d09051cf71dcc

--001a11c12458302d09051cf71dcc
Content-Type: text/plain; charset=UTF-8

On 10 August 2015 at 15:23, Alexander Kanavin <
alexander.kanavin@linux.intel.com> wrote:

> Drop bootchartd-no-bashism.patch as it's been merged upstream
>

This doesn't apply to master-next, could you rebase please?

Cheers,
Ross

--001a11c12458302d09051cf71dcc
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 10 August 2015 at 15:23, Alexander Kanavin <span dir=3D"ltr">&lt;<a href=
=3D"mailto:alexander.kanavin@linux.intel.com" target=3D"_blank">alexander.k=
anavin@linux.intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_=
quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1=
ex"><div id=3D":2v4" class=3D"a3s" style=3D"overflow:hidden">Drop bootchart=
d-no-bashism.patch as it&#39;s been merged upstream<br></div></blockquote><=
/div><br>This doesn&#39;t apply to master-next, could you rebase please?</d=
iv><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Cheers,<=
/div><div class=3D"gmail_extra">Ross</div></div>

--001a11c12458302d09051cf71dcc--
