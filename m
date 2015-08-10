Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f45.google.com (mail-qg0-f45.google.com
	[209.85.192.45])
	by mail.openembedded.org (Postfix) with ESMTP id 7AC5B768AB
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Aug 2015 16:01:14 +0000 (UTC)
Received: by qged69 with SMTP id d69so120300352qge.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Aug 2015 09:01:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=mpjY/WO+L6/1g8iL8+AXI2xEwVnoEQAHgBqxP4P8TnE=;
	b=jjbQ0i5yE8J7eTz66OTBS5HCrTTPHLtjc/EJIOcHnLCbQGoMcIYQ+V4sqiZS5IZ1OF
	M59iRzuVo0oputuernZ+Wz9ySnESls4voWNkvdMLRexQ18aVLdv37x1QMfvQWSlmJQ5+
	Xqd2wcWsR/dcoIw96IA1ecBjFgCAZiNh42nwqdSDR56RqDbV+mzfbCBH2DQxWEtPzZWN
	3jRyzpeWwx0dBIup3aUQlWKhTtB6qmLIg1zfQui2qbiWa2bfigfgVU6BvteG5kjlYcp0
	9mEylzxxZmxEFC6dHqVCH1OhXy3oT1COrhBmSYTcHe1yKuIyN7qCnUVdRgzaUHRvHD8y
	RPCQ==
X-Gm-Message-State: ALoCoQlVH8MfX2ermqkHnEQ6pQ7OByC0RVeyFZEvL3bjkAfEPG+0Ex/KvDVurOSkUN/vRPEbzkpJ
X-Received: by 10.140.20.77 with SMTP id 71mr4325611qgi.87.1439222474717; Mon,
	10 Aug 2015 09:01:14 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.98.67 with HTTP; Mon, 10 Aug 2015 09:00:55 -0700 (PDT)
In-Reply-To: <17f1f21601d991e414718a56bdb1952ea522c400.1439216269.git.alexander.kanavin@linux.intel.com>
References: <cover.1439216269.git.alexander.kanavin@linux.intel.com>
	<17f1f21601d991e414718a56bdb1952ea522c400.1439216269.git.alexander.kanavin@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 10 Aug 2015 17:00:55 +0100
Message-ID: <CAJTo0LaR5=pkdC=hBjAXBwxFVKqrrFor+u+yJVf5uFd3AgHoJQ@mail.gmail.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/8] apmd: update to 3.2.2-15
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
X-List-Received-Date: Mon, 10 Aug 2015 16:01:21 -0000
Content-Type: multipart/alternative; boundary=001a11c124585bdfbc051cf7187b

--001a11c124585bdfbc051cf7187b
Content-Type: text/plain; charset=UTF-8

On 10 August 2015 at 15:23, Alexander Kanavin <
alexander.kanavin@linux.intel.com> wrote:

> +++ b/meta/recipes-bsp/apmd/apmd/legacy.patch
>

Patch needs a header/upstream-status/signed-off-by.  Don't bother putting
the comment in the recipe, but put that metadata in the patch itself.

Ross

--001a11c124585bdfbc051cf7187b
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 10 August 2015 at 15:23, Alexander Kanavin <span dir=3D"ltr">&lt;<a href=
=3D"mailto:alexander.kanavin@linux.intel.com" target=3D"_blank">alexander.k=
anavin@linux.intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_=
quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1=
ex"><div id=3D":235" class=3D"a3s" style=3D"overflow:hidden">+++ b/meta/rec=
ipes-bsp/apmd/apmd/legacy.patch<br></div></blockquote></div><br>Patch needs=
 a header/upstream-status/signed-off-by.=C2=A0 Don&#39;t bother putting the=
 comment in the recipe, but put that metadata in the patch itself.</div><di=
v class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></di=
v>

--001a11c124585bdfbc051cf7187b--
