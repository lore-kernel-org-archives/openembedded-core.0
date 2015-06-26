Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f170.google.com (mail-qk0-f170.google.com
	[209.85.220.170])
	by mail.openembedded.org (Postfix) with ESMTP id EBB52607BB
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Jun 2015 08:28:17 +0000 (UTC)
Received: by qkei195 with SMTP id i195so13293945qke.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Jun 2015 01:28:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=tYM6Tf6mMi1z+/bEfsde/GDuwW/22y41iIfg62YdlDQ=;
	b=hBpa1y6bg6GuhlIdD1INxLSGyn/hIpdCbY74JMWSs3NEosYj5PRKv6BYhYdcFuznt8
	q06XAX17uullBLUG++zuU8sAp2kqv63qYlHw+buvN9ln9TawzcUHbIm6DEPQosnnuCYK
	syeLKFcKpXBHZreXrKXacawu7GCvgIjHU7aDyxzJRD4Aps/d3rQMw7C+jpr5q5yFipGb
	bDQtMLBKlW3BzqJ6KMOdsrxXo7Xt4rCjvH3L3SF0fROaCrAh3DdN3MeleciKNI5dmpBX
	GTGzK5JkBwvNEXvvSoPTqxqt0CpeVO5VqapdpDCHvkfQDIONJp183npu6/uZKecI8LSp
	XPgA==
X-Gm-Message-State: ALoCoQldXDNYoQxPlbuhmCtEENCDjFMsS25XOl9u7NJOfI1OU8pFAQQjHv7hrp6sY5Z00dYxuqXo
X-Received: by 10.140.89.104 with SMTP id u95mr543679qgd.15.1435307299174;
	Fri, 26 Jun 2015 01:28:19 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.231 with HTTP; Fri, 26 Jun 2015 01:27:59 -0700 (PDT)
In-Reply-To: <558D0204.8080304@topic.nl>
References: <558D0204.8080304@topic.nl>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 26 Jun 2015 09:27:59 +0100
Message-ID: <CAJTo0LZDwYJtVrcS4+d-ZyuAm3bpHDkTwj3pFittc6wKAd2zvA@mail.gmail.com>
To: Mike Looijmans <mike.looijmans@topic.nl>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: Any "desktop" layers?
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
X-List-Received-Date: Fri, 26 Jun 2015 08:28:21 -0000
Content-Type: multipart/alternative; boundary=001a11c135f6b615df0519678538

--001a11c135f6b615df0519678538
Content-Type: text/plain; charset=UTF-8

On 26 June 2015 at 08:40, Mike Looijmans <mike.looijmans@topic.nl> wrote:

> So I'd like to forward this one to the list. There's plenty boards out
> there now with big CPUs and supporting big screens and all. If I wanted to
> turn such not-so-mainstream board into a real desktop, how does one do that?
>

meta-xfce is fairly well used and up to date.

Ross

--001a11c135f6b615df0519678538
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 26 June 2015 at 08:40, Mike Looijmans <span dir=3D"ltr">&lt;<a href=3D"m=
ailto:mike.looijmans@topic.nl" target=3D"_blank">mike.looijmans@topic.nl</a=
>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 =
0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":hf" class=
=3D"a3s" style=3D"overflow:hidden">So I&#39;d like to forward this one to t=
he list. There&#39;s plenty boards out there now with big CPUs and supporti=
ng big screens and all. If I wanted to turn such not-so-mainstream board in=
to a real desktop, how does one do that?<br></div></blockquote></div><br>me=
ta-xfce is fairly well used and up to date.</div><div class=3D"gmail_extra"=
><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a11c135f6b615df0519678538--
