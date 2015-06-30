Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f175.google.com (mail-qk0-f175.google.com
	[209.85.220.175])
	by mail.openembedded.org (Postfix) with ESMTP id 15506607A5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Jun 2015 19:06:07 +0000 (UTC)
Received: by qkeo142 with SMTP id o142so13593349qke.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Jun 2015 12:06:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=Vxh+r0iCwTP7q33SBKSE8732gjOXhzTK8rQ/mhcMINc=;
	b=iR/ELqk9mHwOUA6d+BDS1iA6o3BblRMbKI3w2hfa9oSbuz7BE9FwXovelUP2w8fbL+
	c1j0ByZbhsPRP9omf/RVD5AC9muBVBEK1mOjoadaeLvH9oPFhh/PjU5m4FpxehVWl7OH
	ZtaZ9sgthzcbLedX5cBkCR/N8Zo7gQKhype5I1T8jAkunV6ltjOoH43yqRHEh7+qIvbp
	/gANuoJDL+W5EOATM1RM2Rsh6lDLyTRWNtKOLWIdApj6JaVLd0+aO9secmtkOQOlaMJ0
	AAmOmIERV25vw0F1TczDo2XmE57QK27wWUegl8nuojUsnIJI/BhPoZjXmbbQyR6wWNP2
	Iqhg==
X-Gm-Message-State: ALoCoQmLb8KNU2BOLH/xXSUSzdD2FaYIzoCtDVe6sJzN9LErHU187z8a4+p1Tst0Ja8Cfa9yZFid
X-Received: by 10.55.53.193 with SMTP id c184mr35235631qka.62.1435691168032;
	Tue, 30 Jun 2015 12:06:08 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.231 with HTTP; Tue, 30 Jun 2015 12:05:48 -0700 (PDT)
In-Reply-To: <5592D5AB.1090405@linux.intel.com>
References: <1435240007-1878-1-git-send-email-leonardo.sandoval.gonzalez@linux.intel.com>
	<CAJ86T=XJNHC1+eQKdYZ_US8EmjkmWCRLaK9LKe3A1EKiDXp_rg@mail.gmail.com>
	<5592D5AB.1090405@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 30 Jun 2015 20:05:48 +0100
Message-ID: <CAJTo0LbC5jnV0VBYsh0BV87x-vO6Ey4DB791K8T5zwimxWiChg@mail.gmail.com>
To: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>,
	swg@linux.intel.com
Subject: Re: [PATCH] buildhistory.bbclass: Create a files-in-<pkg>.txt containg recipe's pkg files
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
X-List-Received-Date: Tue, 30 Jun 2015 19:06:10 -0000
Content-Type: multipart/alternative; boundary=001a11476f1413f5930519c0e6d1

--001a11476f1413f5930519c0e6d1
Content-Type: text/plain; charset=UTF-8

On 30 June 2015 at 18:45, Leonardo Sandoval <
leonardo.sandoval.gonzalez@linux.intel.com> wrote:

> Anyway, please remove this patch and try with the one I will send today.
>

As this is already in master it can't be removed, just send a suitable fix.

Ross

--001a11476f1413f5930519c0e6d1
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 30 June 2015 at 18:45, Leonardo Sandoval <span dir=3D"ltr">&lt;<a href=
=3D"mailto:leonardo.sandoval.gonzalez@linux.intel.com" target=3D"_blank">le=
onardo.sandoval.gonzalez@linux.intel.com</a>&gt;</span> wrote:<br><blockquo=
te class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc so=
lid;padding-left:1ex"><div id=3D":1he" class=3D"a3s" style=3D"overflow:hidd=
en">Anyway, please remove this patch and try with the one I will send today=
.<br></div></blockquote><div><br></div><div>As this is already in master it=
 can&#39;t be removed, just send a suitable fix.</div><div><br></div><div>R=
oss</div></div></div></div>

--001a11476f1413f5930519c0e6d1--
