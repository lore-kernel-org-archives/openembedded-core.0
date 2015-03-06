Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f169.google.com (mail-qc0-f169.google.com
	[209.85.216.169])
	by mail.openembedded.org (Postfix) with ESMTP id 30E116017E
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Mar 2015 12:24:33 +0000 (UTC)
Received: by qcwb13 with SMTP id b13so12286391qcw.9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 06 Mar 2015 04:24:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=0rEk4j51BXxKuY7jyzXfSiXAmtJQr858HWjWL/qlUt8=;
	b=i2QQ5Fo6BQADgJu+7M5mN2UVd/guFdttr/7nAAOnpyAdO7eIOi+hAr/n9kvfBdca0R
	hc6hUY+8VGR4DxqLB+bsYop1Mc+vgH7WgdlCbEyucVWh5cycta+Lg4p4WgD5KSpIKarh
	4rLR6QW7x+giC7rC+MBna2F84Id3RthGkQi9pN9o5VxnYExloZtlXCPGXQcxvFmqtPzJ
	OMqpNtV13LH31fsUZVoS+46yJNhmy5uzwHNMjVxa5RyOERptfyZk8x5QOm18vnxGi4t/
	fIMKSfE6VJ7YY4ZVuufbTe2N/OCuubytL02sT+ywstULGcMiKoaMgyPxBDh8o0kr4Mne
	Ca6g==
X-Gm-Message-State: ALoCoQl/VrxRi4iOQswdSYH+M1uTF79EdWA+wqXCnJXfw1RrGPNedLr7ISfEs+q/55B6rM3PIJOv
X-Received: by 10.55.56.145 with SMTP id f139mr28376065qka.74.1425644674688;
	Fri, 06 Mar 2015 04:24:34 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.102.203 with HTTP; Fri, 6 Mar 2015 04:24:14 -0800 (PST)
In-Reply-To: <20872591b3fade728dbbe3b655045417450b3021.1425634271.git.liezhi.yang@windriver.com>
References: <cover.1425634271.git.liezhi.yang@windriver.com>
	<20872591b3fade728dbbe3b655045417450b3021.1425634271.git.liezhi.yang@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 6 Mar 2015 12:24:14 +0000
Message-ID: <CAJTo0Ladja3vEp4_stvqQPg2igWr0C47M8GV5SjusfGTJ=K3VA@mail.gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 4/6] net-tools: 1.60-25 -> 1.60-26
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
X-List-Received-Date: Fri, 06 Mar 2015 12:24:34 -0000
Content-Type: multipart/alternative; boundary=001a11470082693ac405109dc4d2

--001a11470082693ac405109dc4d2
Content-Type: text/plain; charset=UTF-8

On 6 March 2015 at 09:32, Robert Yang <liezhi.yang@windriver.com> wrote:

> The old net-tools_1.60-25.diff.gz is not available any more.
>

As I said yesterday, we're feature-frozen now.  Instead of upgrading can we
use a different mirror.  snapshot.debian.org is useful as they archive all
releases there:

http://snapshot.debian.org/package/net-tools/1.60-25/

Ross

--001a11470082693ac405109dc4d2
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 6 March 2015 at 09:32, Robert Yang <span dir=3D"ltr">&lt;<a href=3D"mail=
to:liezhi.yang@windriver.com" target=3D"_blank">liezhi.yang@windriver.com</=
a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);b=
order-left-style:solid;padding-left:1ex"><div id=3D":1vy" class=3D"" style=
=3D"overflow:hidden">The old net-tools_1.60-25.diff.gz is not available any=
 more.<br></div></blockquote></div><br>As I said yesterday, we&#39;re featu=
re-frozen now.=C2=A0 Instead of upgrading can we use a different mirror. =
=C2=A0<a href=3D"http://snapshot.debian.org">snapshot.debian.org</a> is use=
ful as they archive all releases there:</div><div class=3D"gmail_extra"><br=
></div><div class=3D"gmail_extra"><a href=3D"http://snapshot.debian.org/pac=
kage/net-tools/1.60-25/">http://snapshot.debian.org/package/net-tools/1.60-=
25/</a><br></div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_e=
xtra">Ross</div></div>

--001a11470082693ac405109dc4d2--
