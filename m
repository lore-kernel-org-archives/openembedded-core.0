Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f48.google.com (mail-qg0-f48.google.com
	[209.85.192.48])
	by mail.openembedded.org (Postfix) with ESMTP id 7DDEA72A2D
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 May 2015 15:12:42 +0000 (UTC)
Received: by qgfi89 with SMTP id i89so22287049qgf.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 07 May 2015 08:12:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=vM3gvbRKJqZGTfi839HoQGxOUHneSNl2lZJXf6QRqrY=;
	b=FEoewQwEwYjt90z2bmwXgGA3zT2XAJOMakSiT71E1cmNHg6vSV5QJpKPPnkPTnL1A2
	beqKcza8SCJin5HfpuOm0HFYBs4L4Q+JOUSJZgBYwa7q2qkcUjbNBakMGyjunkMI6SUS
	wBm5rNdlpaoXFqK1GztFjqwuZsnOfLCs9gO8IRZjh71lEigUnCN5Tnl0BjGONz6Nh9V3
	N8aV/CrNCeLXBBhF4W1/rEqFyZ7AP8yurjAPiTfVuoSlZs/Lq7+Vb8fFnX8lYxm1Gd2S
	qrio4FT7UJLyc1sGR4yWe110yLqLblqc5atxrjdgusmtmz/xqgnpM+b91tjEavwp3lRp
	cK3Q==
X-Gm-Message-State: ALoCoQk8SVcPNQ85QXDBSQYIT+2QrTdmNxKrWI1hAGbAmFqfdc1hBCrS/5c7Zog+oS0bZeGYfY2F
X-Received: by 10.55.50.20 with SMTP id y20mr9562202qky.58.1431011563577; Thu,
	07 May 2015 08:12:43 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.231 with HTTP; Thu, 7 May 2015 08:12:23 -0700 (PDT)
In-Reply-To: <1430948328-17891-1-git-send-email-igor.santos@aker.com.br>
References: <1430948328-17891-1-git-send-email-igor.santos@aker.com.br>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 7 May 2015 16:12:23 +0100
Message-ID: <CAJTo0LbMVTFqMxXC=6Dukia50oAkko5Rc16zA9T7pGTgzYVhww@mail.gmail.com>
To: Igor Santos <igor.santos@aker.com.br>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/2] Add ctags and cscope
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
X-List-Received-Date: Thu, 07 May 2015 15:12:44 -0000
Content-Type: multipart/alternative; boundary=001a11471392eab55005157f571b

--001a11471392eab55005157f571b
Content-Type: text/plain; charset=UTF-8

On 6 May 2015 at 22:38, Igor Santos <igor.santos@aker.com.br> wrote:

> Hi, these series add ctags and cscope to the devtools.
> It's interesting to add these tools to the stable branches.
>

Why should these be in oe-core instead of another layer such as meta-oe?

Ross

--001a11471392eab55005157f571b
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 6 May 2015 at 22:38, Igor Santos <span dir=3D"ltr">&lt;<a href=3D"mailto=
:igor.santos@aker.com.br" target=3D"_blank">igor.santos@aker.com.br</a>&gt;=
</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .=
8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":1od" class=3D"=
a3s" style=3D"overflow:hidden">Hi, these series add ctags and cscope to the=
 devtools.<br>
It&#39;s interesting to add these tools to the stable branches.<br></div></=
blockquote></div><br>Why should these be in oe-core instead of another laye=
r such as meta-oe?</div><div class=3D"gmail_extra"><br></div><div class=3D"=
gmail_extra">Ross</div></div>

--001a11471392eab55005157f571b--
