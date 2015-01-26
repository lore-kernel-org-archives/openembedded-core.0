Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f181.google.com (mail-qc0-f181.google.com
	[209.85.216.181])
	by mail.openembedded.org (Postfix) with ESMTP id 16F6072A5A
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Jan 2015 17:15:50 +0000 (UTC)
Received: by mail-qc0-f181.google.com with SMTP id l6so7930915qcy.12
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Jan 2015 09:15:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=cimtaT8col153dNHCCgQfK1qY5q+blXoCv1k20cCsFw=;
	b=NxN/4Z3d0SL/A+/WWVH5NzvivyA930rDM/e1z9msKwopidt1YbSx8rRYWPfxnp9UaV
	hMz3/q3WZvSVSX+BhBAvPmb2COWdZ6TP8KHtVaXMtrC46Rkit3cQ2fPNfY2yQcV3peLR
	o6S4klB+MlIZsNsyVl6TEZd3pr2y0nZ2Yo//64Ze1JwiTPFmTa11lxHyB/up1QuXvT/J
	d8Zy+C8oljJ15ZY579DJE8mqoT8daZ8qdZFwgOROPSsNwMd1fggMWOKCd7KR7nNJIXeb
	5hzeRzscQ26QMdW6tQZBJtxoxIA0O9WZ/e4RlUKNpdLjYUL9O6E13RqzH3DNKegZOOeH
	zH5Q==
X-Gm-Message-State: ALoCoQmo0Ke+7J/1IrSRQiLBY83IqGI8hSp2DajWR0l8SduFNaQBSwMVV/vJ9PDjr7am/siKWz/N
X-Received: by 10.224.97.72 with SMTP id k8mr37356533qan.52.1422292551141;
	Mon, 26 Jan 2015 09:15:51 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.96.166 with HTTP; Mon, 26 Jan 2015 09:15:30 -0800 (PST)
In-Reply-To: <20150126171355.GE28747@denix.org>
References: <1422052818-3276-1-git-send-email-denis@denix.org>
	<20150126171355.GE28747@denix.org>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 26 Jan 2015 17:15:30 +0000
Message-ID: <CAJTo0Lb7rh6qxR4jeOK9GcYfcMKc-1wzQGKU_QF3Q=vY_d+vuw@mail.gmail.com>
To: Denys Dmytriyenko <denis@denix.org>
Cc: Denys Dmytriyenko <denys@ti.com>, Otavio Salvador <otavio@ossystems.com.br>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] u-boot: update to version 2015.01
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
X-List-Received-Date: Mon, 26 Jan 2015 17:15:58 -0000
Content-Type: multipart/alternative; boundary=001a11c2cb5a4724b9050d914a33

--001a11c2cb5a4724b9050d914a33
Content-Type: text/plain; charset=UTF-8

On 26 January 2015 at 17:13, Denys Dmytriyenko <denis@denix.org> wrote:

> Any feedback so far?
>

Builds for me for beaglebone, totally untested.  An ack from Otavio would
be greatly appreciated :)

Ross

--001a11c2cb5a4724b9050d914a33
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 26 January 2015 at 17:13, Denys Dmytriyenko <span dir=3D"ltr">&lt;<a hre=
f=3D"mailto:denis@denix.org" target=3D"_blank">denis@denix.org</a>&gt;</spa=
n> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;b=
order-left:1px #ccc solid;padding-left:1ex"><div id=3D":1dn" class=3D"a3s" =
style=3D"overflow:hidden">Any feedback so far?</div></blockquote><div><br><=
/div><div>Builds for me for beaglebone, totally untested.=C2=A0 An ack from=
 Otavio would be greatly appreciated :)</div><div><br></div><div>Ross</div>=
</div><br></div></div>

--001a11c2cb5a4724b9050d914a33--
