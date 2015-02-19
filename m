Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f51.google.com (mail-qg0-f51.google.com
	[209.85.192.51])
	by mail.openembedded.org (Postfix) with ESMTP id 14D4860556
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Feb 2015 11:00:36 +0000 (UTC)
Received: by mail-qg0-f51.google.com with SMTP id z60so5552554qgd.10
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Feb 2015 03:00:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=2CoPhh7FrGgmgP7JkSmWKqxCiufmbKx6n4jmPpoQdtk=;
	b=ZGWW8Aoi+aVj+VNGdiTFbm6IUWX522ELaBfdyIpBb/fGXj2zx4bpuEjuIND7c8pw/E
	+G0i1EXTVRLKyDL3sNKeXYfk8wAwL9S5vuRfGx4cco5J4KX2wHa9klIfOw7M0Ymf7XR8
	OzwM/Qpa2WAPir5MRV16unwZHBEfWES+ImeHgX/VJTDRpOCkAmoHYv5860VYdO29yfwU
	6952ueFL4INa/msxQmSfrjgoJZFJrW/KcX42+tEU3f7chTOhL4vnKs+RJ6gPyLeZdIll
	o3REwx4tWOllmaJ3LmVGffAkQMdq/rr5Po6BXFm3kr9EHMLXFOKUxSYIZVeUYPno0fy4
	r3gg==
X-Gm-Message-State: ALoCoQmVMAXYVG3Zg7DPmEmj28WSKBmck8WWVa77ITXwvbluk0zqdv9CzpB2H+OVd0MuvPWu3xpM
X-Received: by 10.140.84.165 with SMTP id l34mr10408956qgd.80.1424343637847;
	Thu, 19 Feb 2015 03:00:37 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.102.203 with HTTP; Thu, 19 Feb 2015 03:00:17 -0800 (PST)
In-Reply-To: <54E1B3CF.2050908@intel.com>
References: <1423746097-4198-1-git-send-email-oleg.zhurakivskyy@intel.com>
	<CAJTo0LasPzPxnq4Sv9CdR_OXuPxZiPhJNd2z7PxWjwxH50Mv-g@mail.gmail.com>
	<54E1B3CF.2050908@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 19 Feb 2015 11:00:17 +0000
Message-ID: <CAJTo0Lb_fpZ5iahemsp7BX9en+AA6Q9rtnzT0-_6omWkvvVZ+g@mail.gmail.com>
To: Oleg Zhurakivskyy <oleg.zhurakivskyy@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/2] Add libedit, neardal recipes
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
X-List-Received-Date: Thu, 19 Feb 2015 11:00:37 -0000
Content-Type: multipart/alternative; boundary=001a11c1558c928ecb050f6ed829

--001a11c1558c928ecb050f6ed829
Content-Type: text/plain; charset=UTF-8

Hi Oleg,

On 16 February 2015 at 09:09, Oleg Zhurakivskyy <oleg.zhurakivskyy@intel.com
> wrote:

> Just to make sure I understood correctly regarding meta-connectivity, is
> that meta-oe/recipes-connectivity?
>

Sorry, typos abound.  Yes, meta-oe/recipes-connectivity.

Ross

--001a11c1558c928ecb050f6ed829
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra">Hi Oleg,</div><div class=3D"gma=
il_extra"><br><div class=3D"gmail_quote">On 16 February 2015 at 09:09, Oleg=
 Zhurakivskyy <span dir=3D"ltr">&lt;<a href=3D"mailto:oleg.zhurakivskyy@int=
el.com" target=3D"_blank">oleg.zhurakivskyy@intel.com</a>&gt;</span> wrote:=
<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-lef=
t:1px #ccc solid;padding-left:1ex"><div id=3D":ri7" class=3D"a3s" style=3D"=
overflow:hidden">Just to make sure I understood correctly regarding meta-co=
nnectivity, is that meta-oe/recipes-connectivity?<br></div></blockquote><di=
v><br></div><div>Sorry, typos abound.=C2=A0 Yes, meta-oe/recipes-connectivi=
ty.</div><div><br></div><div>Ross=C2=A0</div></div></div></div>

--001a11c1558c928ecb050f6ed829--
