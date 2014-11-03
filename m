Return-Path: <ross.burton@intel.com>
Received: from mail-qa0-f51.google.com (mail-qa0-f51.google.com
	[209.85.216.51])
	by mail.openembedded.org (Postfix) with ESMTP id 98B6765D59
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Nov 2014 10:26:11 +0000 (UTC)
Received: by mail-qa0-f51.google.com with SMTP id f12so7877272qad.24
	for <openembedded-core@lists.openembedded.org>;
	Mon, 03 Nov 2014 02:26:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=5FOLMrqWc1p4ca8zfpfhM61fzuh2A5efvyYKhzvOWtA=;
	b=a1cB/Tjp8QheyGNET3Xq82puIVXMnE3qWvXvDzGReI4AA01ci4J0S4ERaUpwFMo4MQ
	JsEeb6c52UvBn43O3y8nHkSXfeq3dBMta+2BCeVAhB9sw2gxR9+sUOpDecgnjJaMgCWH
	W44dpQ6DRmcDgyWTBS78BcPGx1yV1PO0TPxeei24JKkbuZv8Irw7kNOYBXnh6bSBBsqY
	ykRgx+0Sb9yDHL35Kq/76F/K849AFfHqcWf7XlvaOCc+niXeG/9lwbtxFRY23ymqZzwW
	x6UWYv4fTQ+rjBsqIA0fsfMx/WWGgFyRCmwLbn+6pVipJTQK/AYwlnh9zgBYsxZ6iJeJ
	X94w==
X-Gm-Message-State: ALoCoQmwEikBFkShldHY5e+5DBeFdkKSpCqC/WB+iz17rJ/+Kr2MMViwYzEbEHlM61u04JajPVxI
X-Received: by 10.140.17.67 with SMTP id 61mr59055717qgc.59.1415010371717;
	Mon, 03 Nov 2014 02:26:11 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.98.213 with HTTP; Mon, 3 Nov 2014 02:25:51 -0800 (PST)
In-Reply-To: <1C408B9F-5383-488A-AE4C-E18D69800825@dominion.thruhere.net>
References: <1411387952-22717-1-git-send-email-koen.kooi@linaro.org>
	<1C408B9F-5383-488A-AE4C-E18D69800825@dominion.thruhere.net>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 3 Nov 2014 10:25:51 +0000
Message-ID: <CAJTo0LYOHMZCoGS342Wnh06LbJWUS1K_aDFfDWG4gxeFswm7EA@mail.gmail.com>
To: Koen Kooi <koen.kooi@linaro.org>, Kang Kai <Kai.Kang@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libpng 1.6.13: fix build for aarch64
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
X-List-Received-Date: Mon, 03 Nov 2014 10:26:18 -0000
Content-Type: multipart/alternative; boundary=001a11c0fa288f7fb70506f1c6d4

--001a11c0fa288f7fb70506f1c6d4
Content-Type: text/plain; charset=UTF-8

On 3 November 2014 09:57, Koen Kooi <koen@dominion.thruhere.net> wrote:

> ping
>

Last night I was looking at my "post-1.7" tag and the number of aarch64
patches there.   Kai, did you continue work on that staging branch for all
of the aarch64 patches that were being posted?

Ross

--001a11c0fa288f7fb70506f1c6d4
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">On 3=
 November 2014 09:57, Koen Kooi <span dir=3D"ltr">&lt;<a href=3D"mailto:koe=
n@dominion.thruhere.net" target=3D"_blank">koen@dominion.thruhere.net</a>&g=
t;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0=
 .8ex;border-left:1px #ccc solid;padding-left:1ex">ping<br></blockquote><di=
v><br></div><div>Last night I was looking at my &quot;post-1.7&quot; tag an=
d the number of aarch64 patches there. =C2=A0 Kai, did you continue work on=
 that staging branch for all of the aarch64 patches that were being posted?=
</div><div><br></div><div>Ross</div></div></div></div>

--001a11c0fa288f7fb70506f1c6d4--
