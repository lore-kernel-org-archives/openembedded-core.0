Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f176.google.com (unknown [209.85.213.176])
	by mail.openembedded.org (Postfix) with ESMTP id 18CB166100
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 May 2014 20:26:03 +0000 (UTC)
Received: by mail-ig0-f176.google.com with SMTP id hl10so7057073igb.15
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 May 2014 13:26:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=AEyO0CUxztt2TubMLVIpGb1eo4wmTdPCxhj61h4Il/U=;
	b=PwRmTfWTFqJeypGwWzd2aJ4Oh/Qf6rodor2+q4vQThewVSeoA4Q5uyGl9B+hTwMqXw
	WnFvn9XBAj7sq+W7QaupdLPQ+Yh2BLLn/G6PIVWd9V0c6gcjlj/Bb31oPkpu3J+f0Ngs
	eZ7Qq1iKT1KMdz96hKp6v/1IZZjtvMH6MVrQVh88yby4hF4nUdYE6cAuGq5Vheuc/VhJ
	rPQ89mepEibzoj8KPfMGSfccV7lj1KLyGjpLgJyY3HzVO64mKpSF3ZduoV5dqgUIsYvc
	cXNzVflAjLqVHb3tAUyx8V2zARmVBP15qbsa6PXAv5IAgbmHhCECsOEo+3y/5b5J340L
	VlSA==
MIME-Version: 1.0
X-Received: by 10.43.62.204 with SMTP id xb12mr5464618icb.51.1400099164789;
	Wed, 14 May 2014 13:26:04 -0700 (PDT)
Received: by 10.50.79.133 with HTTP; Wed, 14 May 2014 13:26:04 -0700 (PDT)
Received: by 10.50.79.133 with HTTP; Wed, 14 May 2014 13:26:04 -0700 (PDT)
In-Reply-To: <CAP9ODKqmfR6KJa34QF1HMhBwx9muYNmTznZMJ_WH=uVKieTULA@mail.gmail.com>
References: <CAP9ODKqmfR6KJa34QF1HMhBwx9muYNmTznZMJ_WH=uVKieTULA@mail.gmail.com>
Date: Wed, 14 May 2014 13:26:04 -0700
Message-ID: <CAMKF1sp=KGMCDifbt8e=o5zRNMMKXff65-qJFHUOuuD4evikvw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: FTBFS: qemu
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
X-List-Received-Date: Wed, 14 May 2014 20:26:09 -0000
Content-Type: multipart/alternative; boundary=bcaec51a8b1a5e23c404f961fd8e

--bcaec51a8b1a5e23c404f961fd8e
Content-Type: text/plain; charset=UTF-8

On May 14, 2014 1:18 PM, "Otavio Salvador" <otavio@ossystems.com.br> wrote:
>
> Hello,
>
> Is this error already known?
>
> http://errors.yoctoproject.org/Errors/Search/Details/334/1/10/97
>

yes your build box needs to have sdl installed otherwise disable it in
local. conf
> --
> Otavio Salvador                             O.S. Systems
> http://www.ossystems.com.br        http://code.ossystems.com.br
> Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--bcaec51a8b1a5e23c404f961fd8e
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<p dir=3D"ltr"><br>
On May 14, 2014 1:18 PM, &quot;Otavio Salvador&quot; &lt;<a href=3D"mailto:=
otavio@ossystems.com.br">otavio@ossystems.com.br</a>&gt; wrote:<br>
&gt;<br>
&gt; Hello,<br>
&gt;<br>
&gt; Is this error already known?<br>
&gt;<br>
&gt; <a href=3D"http://errors.yoctoproject.org/Errors/Search/Details/334/1/=
10/97">http://errors.yoctoproject.org/Errors/Search/Details/334/1/10/97</a>=
<br>
&gt;</p>
<p dir=3D"ltr">yes your build box needs to have sdl installed otherwise dis=
able it in local. conf<br>
&gt; --<br>
&gt; Otavio Salvador =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 O.S. Systems<br>
&gt; <a href=3D"http://www.ossystems.com.br">http://www.ossystems.com.br</a=
> =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://code.ossystems.com.br">http:=
//code.ossystems.com.br</a><br>
&gt; Mobile: +55 (53) 9981-7854 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Mo=
bile: +1 (347) 903-9750<br>
&gt; --<br>
&gt; _______________________________________________<br>
&gt; Openembedded-core mailing list<br>
&gt; <a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedd=
ed-core@lists.openembedded.org</a><br>
&gt; <a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded=
-core">http://lists.openembedded.org/mailman/listinfo/openembedded-core</a>=
<br>
</p>

--bcaec51a8b1a5e23c404f961fd8e--
