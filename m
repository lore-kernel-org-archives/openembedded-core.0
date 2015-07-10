Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f49.google.com (mail-qg0-f49.google.com
	[209.85.192.49])
	by mail.openembedded.org (Postfix) with ESMTP id 29AA873710
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Jul 2015 22:11:53 +0000 (UTC)
Received: by qgep37 with SMTP id p37so43543770qge.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Jul 2015 15:11:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=6sDzuwoG3eI/ksHohDqxwPDFc/Jutm7Y+aL96XKEcso=;
	b=O+D58vigITdR01iIqrZhfD1B9iPtJ/pFaYcBJRLIEmKxBbbpRqHEUXZYOGdQhF+baF
	8Z92pFuTIaFWFLf153Xspdht5CX5C2BThQ2L3itYOXddwNoS3aaegC7qxcnqERwJe/yH
	kVxbgFyJwZfXVp/tRCUKv4R23P43XvAk7vdYJgKE6Dy6sknJaDcxpTCgqap9FXvkqKP8
	gI045XFVmF/BytVXRs+Uws/V7rwfgFjcqbWpbqzzuc5IFPWaSE5VkyspG5m+RA3wVkQ0
	yC8CUOGJ1y0csFbe8jJ4j7dMOaf6K4BktX661CM8RDe6To4vwoIeECzWMJ2XeeU32kYF
	CK0w==
X-Gm-Message-State: ALoCoQnDpatwa+SBX2ca38vPwkYpjNulJYH/oU29Y3AmViQIm0AvS3fH7AWz5OpzTpGrZQjt8KG+
X-Received: by 10.140.88.5 with SMTP id s5mr36029353qgd.59.1436566313700; Fri,
	10 Jul 2015 15:11:53 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.231 with HTTP; Fri, 10 Jul 2015 15:11:34 -0700 (PDT)
In-Reply-To: <5946300c9c5e9e0be705a2db59c1bd03340a629a.1436427694.git.jussi.kukkonen@intel.com>
References: <cover.1436427694.git.jussi.kukkonen@intel.com>
	<5946300c9c5e9e0be705a2db59c1bd03340a629a.1436427694.git.jussi.kukkonen@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 10 Jul 2015 23:11:34 +0100
Message-ID: <CAJTo0LaavHoeYCT67n51Uy088P6RrsZypj-EWMwit=-CBMKKaQ@mail.gmail.com>
To: Jussi Kukkonen <jussi.kukkonen@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/5] xf86-input-vmmouse: Upgrade 13.0.0 -> 13.1.0
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
X-List-Received-Date: Fri, 10 Jul 2015 22:11:55 -0000
Content-Type: multipart/alternative; boundary=001a11c11874d32828051a8ca8ae

--001a11c11874d32828051a8ca8ae
Content-Type: text/plain; charset=UTF-8

On 9 July 2015 at 08:52, Jussi Kukkonen <jussi.kukkonen@intel.com> wrote:

>  PR = "${INC_PR}.0"
>

I edited this out when testing in MUT, but as we need a V2 for the udev
problem you can delete this PR assignment too.

Ross

--001a11c11874d32828051a8ca8ae
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 9 July 2015 at 08:52, Jussi Kukkonen <span dir=3D"ltr">&lt;<a href=3D"ma=
ilto:jussi.kukkonen@intel.com" target=3D"_blank">jussi.kukkonen@intel.com</=
a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0=
 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":8h0" cla=
ss=3D"a3s" style=3D"overflow:hidden">=C2=A0PR =3D &quot;${INC_PR}.0&quot;<b=
r></div></blockquote></div><br>I edited this out when testing in MUT, but a=
s we need a V2 for the udev problem you can delete this PR assignment too.<=
/div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</=
div></div>

--001a11c11874d32828051a8ca8ae--
