Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f181.google.com (mail-qk0-f181.google.com
	[209.85.220.181])
	by mail.openembedded.org (Postfix) with ESMTP id C901565CBD
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jul 2015 11:43:10 +0000 (UTC)
Received: by qkdv3 with SMTP id v3so67730894qkd.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jul 2015 04:43:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=zjGUGaP+y4O/iuVsPCZKWgXmDCFvTzC6TlNvsFP7ihA=;
	b=Rd2lAFV8+JI1ecf7dMYkorItkP4/O+jcXVSzQiWX4rnb07H2fOHKxjVJhir/k+58x2
	K0xeHCfqBDez6r7K2YzYnZ3nvb944iUrnI4OgTnuZnGyl0Xg6kenza6EVs+1LR6nCQ6l
	u6nINg0738gESdqjH0F8MmqCtrrE9tNG7PWdf0nc58qw6jLyQei7bmTtAkwU/wlZ/3og
	qC80DN0L7fOEe28P7psR9fYGINCuZK0Cp7d7D643zVRAab/c79Tqcv/Ia6d5HT9V0wH/
	YNO27FB9m+KBlfL90tOMhgSgbBA33OqacrFa1VevaKm1CMVOoEoQkwr521/61Ox0v7tI
	Qg7A==
X-Gm-Message-State: ALoCoQk+ZN1KE9MoEg0QGVLwXrupB4FRdN+V+95jCEYVMcZxFbUGIplvHkY1bBKxb/GINvxTcCX6
X-Received: by 10.140.89.100 with SMTP id u91mr24387452qgd.15.1437133390712;
	Fri, 17 Jul 2015 04:43:10 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.231 with HTTP; Fri, 17 Jul 2015 04:42:51 -0700 (PDT)
In-Reply-To: <1436928233-11337-1-git-send-email-otavio@ossystems.com.br>
References: <1436928233-11337-1-git-send-email-otavio@ossystems.com.br>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 17 Jul 2015 12:42:51 +0100
Message-ID: <CAJTo0LbRHRc-5cP1_XUT_VfEmt6AAPcdt37DyfiV=r7=rn1Y-Q@mail.gmail.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] u-boot: Upgrade to 2015.07 release
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
X-List-Received-Date: Fri, 17 Jul 2015 11:43:13 -0000
Content-Type: multipart/alternative; boundary=001a11c1334e3faac7051b10b10f

--001a11c1334e3faac7051b10b10f
Content-Type: text/plain; charset=UTF-8

Hi Otavio,

On 15 July 2015 at 03:43, Otavio Salvador <otavio@ossystems.com.br> wrote:

> -LIC_FILES_CHKSUM =
> "file://Licenses/README;md5=c7383a594871c03da76b3707929d2919"
> +LIC_FILES_CHKSUM =
> "file://Licenses/README;md5=0507cd7da8e7ad6d6701926ec9b84c95"
>

Remember to explain why the license checksums have changed.

Ross

--001a11c1334e3faac7051b10b10f
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra">Hi Otavio,</div><div class=3D"g=
mail_extra"><br><div class=3D"gmail_quote">On 15 July 2015 at 03:43, Otavio=
 Salvador <span dir=3D"ltr">&lt;<a href=3D"mailto:otavio@ossystems.com.br" =
target=3D"_blank">otavio@ossystems.com.br</a>&gt;</span> wrote:<br><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc s=
olid;padding-left:1ex"><div id=3D":4wp" class=3D"a3s" style=3D"overflow:hid=
den">-LIC_FILES_CHKSUM =3D &quot;file://Licenses/README;md5=3Dc7383a594871c=
03da76b3707929d2919&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://Licenses/README;md5=3D0507cd7da8e7ad6d67=
01926ec9b84c95&quot;</div></blockquote></div><br>Remember to explain why th=
e license checksums have changed.</div><div class=3D"gmail_extra"><br></div=
><div class=3D"gmail_extra">Ross</div></div>

--001a11c1334e3faac7051b10b10f--
