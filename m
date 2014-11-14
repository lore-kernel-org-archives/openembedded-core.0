Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f175.google.com (mail-qc0-f175.google.com
	[209.85.216.175])
	by mail.openembedded.org (Postfix) with ESMTP id 6041E65C7B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Nov 2014 11:05:48 +0000 (UTC)
Received: by mail-qc0-f175.google.com with SMTP id b13so14134092qcw.34
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Nov 2014 03:05:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=k44/OzZRhzMuiRJV8Mggm3jzLzRq+FWDEfTUU3UHqF4=;
	b=aFx1R+Tu9VKYDS+QumMDPLczc2sWkqmBtF/7slv7Y72kQQUOoyj440/hZ+PzeZNU5U
	VHnvL3aCbWdQFwu8+tfGJViSph4mMqOGL85eey+yG4WXyW9UNOKXUWtD/uE6xwkVDnVM
	nuJdipImdSWdVxGJ4uu/gROOqC2gOPta6uF4AkgBbFkv9+A+6Zd4xSt0sOhddFIX8C4A
	rKIOvPFkcoq7BRMkmUfh/0+MCOSOuMq3I8Ce5ExAo/xtXwYqqyholbNQMrf8NXV8yin/
	Op6Z5yUXMUO1tQR8zj0k1aG7IyHYOt6DxyKcjYj1hJgY14QYTjCA4XE5ZPVDqZFC7K3F
	+9nA==
X-Gm-Message-State: ALoCoQn8oB9tNV/65eiMCB3DCW9tb/o5fDazBi3ijh85C8M7d1R+ci+SXvt1wVQs1VPip32LAlia
X-Received: by 10.224.28.193 with SMTP id n1mr10457500qac.93.1415963149132;
	Fri, 14 Nov 2014 03:05:49 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.98.213 with HTTP; Fri, 14 Nov 2014 03:05:27 -0800 (PST)
In-Reply-To: <CALbNGRQA6wnsseWxKxkN_QgB9btuVpe5rCTx-1D6t-ehnr1EPg@mail.gmail.com>
References: <1415346729-16760-1-git-send-email-schnitzeltony@googlemail.com>
	<1415346729-16760-2-git-send-email-schnitzeltony@googlemail.com>
	<CAJTo0Lbs=jzjEvpw64X5iJ9DqG5BV8Sgc9-A80Nf2mM8q=CF_w@mail.gmail.com>
	<CALbNGRQA6wnsseWxKxkN_QgB9btuVpe5rCTx-1D6t-ehnr1EPg@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 14 Nov 2014 11:05:27 +0000
Message-ID: <CAJTo0LZ3Qc_wH3_DahzPJW49k9u+WBtjS99pGVurMWJWeDhZ3g@mail.gmail.com>
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] midori: update to 0.5.8
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
X-List-Received-Date: Fri, 14 Nov 2014 11:05:57 -0000
Content-Type: multipart/alternative; boundary=001a11c2ca3084fdcb0507cf9cd5

--001a11c2ca3084fdcb0507cf9cd5
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 14 November 2014 08:53, Andreas M=C3=BCller <schnitzeltony@googlemail.co=
m>
wrote:

> The xserever & midori series I has not the most promising start :)
>

It's amazing how often something works when tested on your own machine, but
when thrown at the autobuilder a week later all hell can break loose! ;)

Ross

--001a11c2ca3084fdcb0507cf9cd5
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 14 November 2014 08:53, Andreas M=C3=BCller <span dir=3D"ltr">&lt;<a hre=
f=3D"mailto:schnitzeltony@googlemail.com" target=3D"_blank">schnitzeltony@g=
ooglemail.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div =
id=3D":21b" class=3D"a3s" style=3D"overflow:hidden">The xserever &amp; mido=
ri series I has not the most promising start :)<br></div></blockquote></div=
><br>It&#39;s amazing how often something works when tested on your own mac=
hine, but when thrown at the autobuilder a week later all hell can break lo=
ose! ;)</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra=
">Ross</div></div>

--001a11c2ca3084fdcb0507cf9cd5--
