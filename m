Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RZPJw-0008HO-1L
	for openembedded-core@lists.openembedded.org;
	Sat, 10 Dec 2011 16:58:40 +0100
Received: by bkbzt4 with SMTP id zt4so3950687bkb.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 10 Dec 2011 07:51:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	bh=+RubmlKWuMq27fUTGk4jNj/Hh1Pw+xG+kdwzlsRj1wU=;
	b=wSlvxYp/vtN0nppXOFqNM5tNZvKgzhIkuG3Xmp5KqmcGC7t2ZmLNLyA7K6mozD/6da
	duZNzzvp6+VBd6ZntnMcwS3+qPq5UVUeMKV2spI3MjY3pi1OQ1c8bg8bMOTLKE0enGJV
	l2Bvl6EaFl2PvV6aRB+GXSV45xwNPflIiItRQ=
MIME-Version: 1.0
Received: by 10.204.9.209 with SMTP id m17mr6195162bkm.101.1323532306043; Sat,
	10 Dec 2011 07:51:46 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.204.113.132 with HTTP; Sat, 10 Dec 2011 07:51:45 -0800 (PST)
In-Reply-To: <1323475621.5309.198.camel@ted>
References: <cover.1323358819.git.otavio@ossystems.com.br>
	<abe8db681be0a2ec0ada964957236a5f0511d746.1323358819.git.otavio@ossystems.com.br>
	<4EE25F11.80200@linux.intel.com> <1323475621.5309.198.camel@ted>
Date: Sat, 10 Dec 2011 13:51:45 -0200
X-Google-Sender-Auth: Zo-5SGOMUow36u01Afye6xLp0IA
Message-ID: <CAP9ODKqq1ZNJinzKxBrfNVXVFuiOyttq3rdh3rAi6YRE15fY_w@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/3] scripts/send-pull-request: allow sending of patches without a cover letter
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 10 Dec 2011 15:58:40 -0000
Content-Type: multipart/alternative; boundary=0015175cd884f354fd04b3bee093

--0015175cd884f354fd04b3bee093
Content-Type: text/plain; charset=ISO-8859-1

On Fri, Dec 9, 2011 at 22:07, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> Hmm, this has just merged with the typo, sorry (it had been around a
> while with no comments). Can someone sent a follow up please?
>

I will send a patch fixing it.

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br

--0015175cd884f354fd04b3bee093
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div class=3D"gmail_quote">On Fri, Dec 9, 2011 at 22:07, Richard Purdie <sp=
an dir=3D"ltr">&lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org">ri=
chard.purdie@linuxfoundation.org</a>&gt;</span> wrote:<br><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex">
<div class=3D"im">Hmm, this has just merged with the typo, sorry (it had be=
en around a</div>
while with no comments). Can someone sent a follow up please?<br></blockquo=
te><div><br></div><div>I will send a patch fixing it.</div><div>=A0</div></=
div>-- <br>Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0O.S. Systems<br>E-mail: <a href=3D"mailto:otavio@ossystems.com.b=
r" target=3D"_blank">otavio@ossystems.com.br</a>=A0 <a href=3D"http://www.o=
ssystems.com.br" target=3D"_blank">http://www.ossystems.com.br</a><br>
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0<a href=3D"http://pro=
jetos.ossystems.com.br" target=3D"_blank">http://projetos.ossystems.com.br<=
/a><br><br>

--0015175cd884f354fd04b3bee093--
