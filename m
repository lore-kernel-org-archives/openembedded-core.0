Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f50.google.com (mail-qg0-f50.google.com
	[209.85.192.50])
	by mail.openembedded.org (Postfix) with ESMTP id 5F7E17648C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jul 2015 14:30:14 +0000 (UTC)
Received: by qgeu79 with SMTP id u79so25287866qge.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jul 2015 07:30:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=1boLAIrgnTac/OozkcYzKCYZQfZY53wYcE0wndbLaYQ=;
	b=AN38AtBPOvDzDVCXNMzU513FO48reQMs3n1PEy93bPMGEHm0SbtnuWhvLP3KXdWP4S
	eBWbqt++NIJhHeL2U1PciRkWLvyxkaFqJK3r1I5s60z0iip0OcGWAW14bPrUWu/qiAfX
	YwArpYgD1oS7Sdqv88bWTe1ZE8BK7Nr56th0dACgUzaVFe0cSuzJDOkSWOooyaPMwMGg
	dQAlMtXkk24pWEfPUjp+4D+cHsbE7SrAHu/kuense7iggvgyvLRrMDzMLE/SuS/neATk
	GecY/a6kRb2zrAgQFbewbn2Cp3XZFcrwi0X+I4w+YuqfW4f8r63bth2FpvPZQBjkEzmb
	DZuA==
X-Gm-Message-State: ALoCoQkrQUQhAyFaR1qppBCS4NFZhIZx2dPS87kNKrFvSqmRA23fjs5cm5Vfh3NU7L8KB0g4qfr4
X-Received: by 10.140.201.200 with SMTP id w191mr6057098qha.50.1438266615095; 
	Thu, 30 Jul 2015 07:30:15 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.92.101 with HTTP; Thu, 30 Jul 2015 07:29:55 -0700 (PDT)
In-Reply-To: <20150730142900.GB2457@jama>
References: <cover.1438262915.git.alexander.kanavin@linux.intel.com>
	<0c7f8aaf4b04cf1bb866dae6af21509af051fbe6.1438262915.git.alexander.kanavin@linux.intel.com>
	<20150730142900.GB2457@jama>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 30 Jul 2015 15:29:55 +0100
Message-ID: <CAJTo0Lbv5VHh_CP9gMr7DUnyFwkOBHYG8tLVz0AU_kqx+mgpvQ@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 01/26] libproxy: update SRC_URI to not use Google Code
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
X-List-Received-Date: Thu, 30 Jul 2015 14:30:15 -0000
Content-Type: multipart/alternative; boundary=001a11431d00af7998051c188a86

--001a11431d00af7998051c188a86
Content-Type: text/plain; charset=UTF-8

On 30 July 2015 at 15:29, Martin Jansa <martin.jansa@gmail.com> wrote:

> Why has debian mirror different checksums?
>

Ones a zip, the other is tar.gz.

Ross

--001a11431d00af7998051c188a86
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 30 July 2015 at 15:29, Martin Jansa <span dir=3D"ltr">&lt;<a href=3D"mai=
lto:martin.jansa@gmail.com" target=3D"_blank">martin.jansa@gmail.com</a>&gt=
;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 =
.8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":2vr" class=3D=
"a3s" style=3D"overflow:hidden">Why has debian mirror different checksums?<=
br></div></blockquote></div><br>Ones a zip, the other is tar.gz.</div><div =
class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a11431d00af7998051c188a86--
