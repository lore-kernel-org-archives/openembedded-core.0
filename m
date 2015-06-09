Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f175.google.com (mail-qk0-f175.google.com
	[209.85.220.175])
	by mail.openembedded.org (Postfix) with ESMTP id 174866AC37
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Jun 2015 16:50:38 +0000 (UTC)
Received: by qkoo18 with SMTP id o18so12642638qko.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 09 Jun 2015 09:50:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=8fNvj2GnX+gWbFBcsK2BG7p7XTzIEBW7gycx323g6ZI=;
	b=JGkcrb7RkCIlMwwJDygOIG1Wv+8f5SjsDq76ExHOYX0yKySDKJYa7GV9STQ3CHDz27
	sJcB/U4uaa+QaKlWZL4NmCO2pKWsPMD5VmbTudWxf4HATGm5yKqxe3Qcy0j+by4/5CSl
	GXG7KvciDn7fls9bROPyt8+uNSkjrKSJa2C0YTURmz7rwyMfC/DrNGwyI6CBPFZnXqb+
	DAJKk0Rj0yP2TrK3Hf0LsfCEqRVZXKQjPQpPy/TsJvCvuaTDhUxHXpXrXwATQl7rEG2J
	RZVaC/MFwvtnOE8yux0h0F0ac+DVM6bH+vdRCosYkjX+9Ago/bgAqxS8cj09VTKF2/o1
	EV5A==
X-Gm-Message-State: ALoCoQmLdkL7hugV6BwMPecKTl4y0UFJnmdKEs3/dlXcYoiMUOLUyRPptyXfigGQvI4cZsJGMkfR
X-Received: by 10.140.43.228 with SMTP id e91mr26777114qga.80.1433868639542;
	Tue, 09 Jun 2015 09:50:39 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.231 with HTTP; Tue, 9 Jun 2015 09:50:19 -0700 (PDT)
In-Reply-To: <4a0a666e39c7a9a7a608a07bed7aa1d082018514.1433842738.git.liezhi.yang@windriver.com>
References: <cover.1433842738.git.liezhi.yang@windriver.com>
	<4a0a666e39c7a9a7a608a07bed7aa1d082018514.1433842738.git.liezhi.yang@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 9 Jun 2015 17:50:19 +0100
Message-ID: <CAJTo0LYX4=vyLko7jJgdsTonCV6b6Obaq-HVCuKDcjkrj2JNeA@mail.gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 10/12] blktrace: 1.0.5 -> 1.1.0
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
X-List-Received-Date: Tue, 09 Jun 2015 16:50:41 -0000
Content-Type: multipart/alternative; boundary=001a113a34bcea3afb0518188e4c

--001a113a34bcea3afb0518188e4c
Content-Type: text/plain; charset=UTF-8

On 9 June 2015 at 15:51, Robert Yang <liezhi.yang@windriver.com> wrote:

>  SRCREV = "d6918c8832793b4205ed3bfede78c2f915c23385"
>
> -PR = "r6"
> -PV = "1.0.5+git${SRCPV}"
> +PV = "1.1.0+git${SRCPV}"
>

You forgot to change SRCREV :)

Ross

--001a113a34bcea3afb0518188e4c
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 9 June 2015 at 15:51, Robert Yang <span dir=3D"ltr">&lt;<a href=3D"mailt=
o:liezhi.yang@windriver.com" target=3D"_blank">liezhi.yang@windriver.com</a=
>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 =
0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":3ql" clas=
s=3D"a3s" style=3D"overflow:hidden">=C2=A0SRCREV =3D &quot;d6918c8832793b42=
05ed3bfede78c2f915c23385&quot;<br>
<br>
-PR =3D &quot;r6&quot;<br>
-PV =3D &quot;1.0.5+git${SRCPV}&quot;<br>
+PV =3D &quot;1.1.0+git${SRCPV}&quot;</div></blockquote></div><br>You forgo=
t to change SRCREV :)</div><div class=3D"gmail_extra"><br></div><div class=
=3D"gmail_extra">Ross</div></div>

--001a113a34bcea3afb0518188e4c--
