Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f53.google.com (mail-qg0-f53.google.com
	[209.85.192.53])
	by mail.openembedded.org (Postfix) with ESMTP id 46875609B2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 May 2015 12:49:14 +0000 (UTC)
Received: by qgew3 with SMTP id w3so7400307qge.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 May 2015 05:49:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=aYbSnRSseNfWiusnr9pm63cqhClWcr2pbGy6AyqzXls=;
	b=f9POAA3EL/yQQWA4mnC+CcSlJSFoMD4ySdFGxYXB5vXUt2NVgPgJB1E5Edqtkhl8/l
	k+Uz5CqqAhS7hLNMV1AHOf2F4qVGhqbyUEllnAw/chb7SU/dOoZ8cjk29P+MWGoOza3M
	WZHTkccuMAU7cH6gejlgQ2XBgJHsXWEzFLCqECeAssTr5/0v/Ycprf9uHchPi+IUko4I
	HRVQHPPYVLFlTWleqeIqzVbCMhIzh5Cld3w8XjqAYFzz7y58ss2A02M+XRfNMJ1mKhdw
	tC3lWS9EIrc8O9FBjkCeUJiVEqhyyFkWRyffz9X5lKeeAYTuU6/xRGNrotdyxMXtC7kH
	70hQ==
X-Gm-Message-State: ALoCoQlYudsk+bZVlGXkC15UtYnkGVAHuWQKoMk+uTZHKbH2baYU/18huvlZxErnTAcyEhFIFDXR
X-Received: by 10.140.133.199 with SMTP id 190mr11208671qhf.17.1432298955608; 
	Fri, 22 May 2015 05:49:15 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.231 with HTTP; Fri, 22 May 2015 05:48:55 -0700 (PDT)
In-Reply-To: <CAP9ODKrVE0nkZR1s+NrXOKp_=9uqTzMoS9VvZUZSeJPVzV2tjA@mail.gmail.com>
References: <1432294706-18789-1-git-send-email-ross.burton@intel.com>
	<1432294706-18789-2-git-send-email-ross.burton@intel.com>
	<CAP9ODKrVE0nkZR1s+NrXOKp_=9uqTzMoS9VvZUZSeJPVzV2tjA@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 22 May 2015 13:48:55 +0100
Message-ID: <CAJTo0LZmnD1WbwUmnCbQK2_TBt2dpgE43uua4uSVsvanv4RXkg@mail.gmail.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] bitbake.conf: programatically generate COMBINED_FEATURES
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
X-List-Received-Date: Fri, 22 May 2015 12:49:15 -0000
Content-Type: multipart/alternative; boundary=001a113533907628cb0516ab16ce

--001a113533907628cb0516ab16ce
Content-Type: text/plain; charset=UTF-8

On 22 May 2015 at 13:30, Otavio Salvador <otavio@ossystems.com.br> wrote:

> Wouldn't this be a intersect?
>

Erm, yes.  :)

Ross

--001a113533907628cb0516ab16ce
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 22 May 2015 at 13:30, Otavio Salvador <span dir=3D"ltr">&lt;<a href=3D"m=
ailto:otavio@ossystems.com.br" target=3D"_blank">otavio@ossystems.com.br</a=
>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 =
0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":8p3" clas=
s=3D"a3s" style=3D"overflow:hidden">Wouldn&#39;t this be a intersect?</div>=
</blockquote><div>=C2=A0</div></div>Erm, yes. =C2=A0:)</div><div class=3D"g=
mail_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a113533907628cb0516ab16ce--
