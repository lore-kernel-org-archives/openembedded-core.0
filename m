Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f51.google.com (mail-qg0-f51.google.com
	[209.85.192.51])
	by mail.openembedded.org (Postfix) with ESMTP id 25C7A6017E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Dec 2014 20:32:29 +0000 (UTC)
Received: by mail-qg0-f51.google.com with SMTP id i50so10590239qgf.38
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Dec 2014 12:32:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=ohU9IujBUXHkvgOEZSZ8hys3eUOnXgJIohU12cUyHI4=;
	b=jrocIaYPJcgCweQoayCZR0PX02c6Na2m55Ouke9E8HKLQLosRjEhwsGLJOpvLHj6Gd
	zVlFUio40EGOe8N+Xp27qD0OE9Ee24wDSF5+DVLWijAOQEfFzkVX2YN54IhOCK4o/Iw3
	9r90uErEXJqiSJQ+Fu/TiQrRT3WIiwXkl3RJgSFcLo0UqNjZZU7mmPp2vhwXIClzm7Nq
	ps3HcJB/cE5tL2u0laymE1/D88k+1svV2Ia3xHLQBGql3kMrYC1w6wsgBFXomBJEDVAe
	610zOcqGkukaqPlF3YhdzUlXcm+c/ia3oMloYFldp3QrLGntljqmXJBX7GghnEh17T0H
	ilKA==
X-Gm-Message-State: ALoCoQnj3C7mRT9secu6WFL3QjIRUU05wPOkESWTnv/RzqgM0aGEIemPyCaN5guv1aEmOg98W2DT
X-Received: by 10.224.93.6 with SMTP id t6mr38343082qam.93.1419971549826; Tue,
	30 Dec 2014 12:32:29 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.96.166 with HTTP; Tue, 30 Dec 2014 12:32:09 -0800 (PST)
In-Reply-To: <CAP71WjzcSN6yuA6-1UwH=z+8KAHFFZfKTuTU5=Oi552aPUFf4g@mail.gmail.com>
References: <1419962645-26989-1-git-send-email-ross.burton@intel.com>
	<CAP71WjzcSN6yuA6-1UwH=z+8KAHFFZfKTuTU5=Oi552aPUFf4g@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 30 Dec 2014 20:32:09 +0000
Message-ID: <CAJTo0La+UxGSN7tKFV3pea2Gzo4aUTAaj10qKw7GrtN7nE4LjA@mail.gmail.com>
To: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/7] gstreamer1.0: upgrade to 1.4.5
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
X-List-Received-Date: Tue, 30 Dec 2014 20:32:32 -0000
Content-Type: multipart/alternative; boundary=089e01495028d1a704050b74e371

--089e01495028d1a704050b74e371
Content-Type: text/plain; charset=UTF-8

On 30 December 2014 at 18:59, Nicolas Dechesne <nicolas.dechesne@linaro.org>
wrote:

> however you are adding extra empty lines in the first 6 patches in the
> series. was is intentionally done?
>

Yes, the tight spacing wasn't pleasing visually.

Ross

--089e01495028d1a704050b74e371
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 30 December 2014 at 18:59, Nicolas Dechesne <span dir=3D"ltr">&lt;<a hre=
f=3D"mailto:nicolas.dechesne@linaro.org" target=3D"_blank">nicolas.dechesne=
@linaro.org</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=
=3D":142" class=3D"a3s" style=3D"overflow:hidden">however you are adding ex=
tra empty lines in the first 6 patches in the<br>
series. was is intentionally done?</div></blockquote></div><br>Yes, the tig=
ht spacing wasn&#39;t pleasing visually.</div><div class=3D"gmail_extra"><b=
r></div><div class=3D"gmail_extra">Ross</div></div>

--089e01495028d1a704050b74e371--
