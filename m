Return-Path: <kergoth@gmail.com>
Received: from mail-qk0-f180.google.com (mail-qk0-f180.google.com
	[209.85.220.180])
	by mail.openembedded.org (Postfix) with ESMTP id 485BA7586F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Jul 2015 16:07:59 +0000 (UTC)
Received: by qkbp125 with SMTP id p125so31440921qkb.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Jul 2015 09:08:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=+93zGleyaSMyEBWFcUMOkyDmNginQPL9BweAiTzartY=;
	b=F+lOLljBkIX0qDaUHmJtY8TxEKXJa4VUz9cpl39K+bNP0AUgMIMh1vS1SZQJoTCsWX
	MqlduGLrHP1JhewMyiQtjFmIBkJgnFrB4w2v6m0U2OKs2eIeEl0gGjJHCu0ZxIv6wSyH
	PmW/sc6moy999W/dEA6N1X9lK43cRCNrac1h/3J0SeacshHbbbp+gD2g00uz993ZS9KI
	Pz7JdvWVAPNwa01jWyiQNCBbEvBImKYq2fGxIf1kuVQaPV5faPTeslKrLXURNnpPPDrs
	pOQvgoQcopWN+pgsyx8F9b3BIYPpiPKdLrVBqur3Fj5PQDrBv6A6dUyytqcE5wtDN00D
	/2Mg==
X-Received: by 10.140.81.135 with SMTP id f7mr9608584qgd.38.1436976479958;
	Wed, 15 Jul 2015 09:07:59 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.140.108.55 with HTTP; Wed, 15 Jul 2015 09:07:40 -0700 (PDT)
In-Reply-To: <1436971374-4975-1-git-send-email-daniel.alexandrux.istrate@intel.com>
References: <1436971374-4975-1-git-send-email-daniel.alexandrux.istrate@intel.com>
From: Christopher Larson <clarson@kergoth.com>
Date: Wed, 15 Jul 2015 09:07:40 -0700
X-Google-Sender-Auth: yHtcJzCx6HU9WXz-_69UK4H3EZo
Message-ID: <CABcZAN=kUzg+gD51Ar4XsK+P2jVcZ=QfMRQO0G63ZFA_Uts==Q@mail.gmail.com>
To: Daniel Istrate <daniel.alexandrux.istrate@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] oeqa/runtime: Added one automated runtime testcase.
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
X-List-Received-Date: Wed, 15 Jul 2015 16:08:00 -0000
Content-Type: multipart/alternative; boundary=001a11c12ae6a37f57051aec287b

--001a11c12ae6a37f57051aec287b
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 15, 2015 at 7:42 AM, Daniel Istrate <
daniel.alexandrux.istrate@intel.com> wrote:

> testcase 240: Checks that bash is installed in image.
>
> Signed-off-by: Daniel Istrate <daniel.alexandrux.istrate@intel.com>
>

This commit message summary is not particularly informative. Generic
messages like that are not ideal, IMO. =E2=80=9Coeqa/runtime: Added one aut=
omated
runtime testcase.=E2=80=9D says nothing about what=E2=80=99s being tested. =
It leads to a
shortlog which tells very little about what=E2=80=99s really being done.
--=20
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--001a11c12ae6a37f57051aec287b
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Wed, Jul 15, 2015 at 7:42 AM, Daniel Istrate <span dir=3D"ltr">&lt;<a hr=
ef=3D"mailto:daniel.alexandrux.istrate@intel.com" target=3D"_blank">daniel.=
alexandrux.istrate@intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"=
gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border=
-left-color:rgb(204,204,204);border-left-style:solid;padding-left:1ex"><div=
 id=3D":25d" class=3D"" style=3D"overflow:hidden">testcase 240: Checks that=
 bash is installed in image.<br>
<br>
Signed-off-by: Daniel Istrate &lt;<a href=3D"mailto:daniel.alexandrux.istra=
te@intel.com">daniel.alexandrux.istrate@intel.com</a>&gt;</div></blockquote=
></div><br>This commit message summary is not particularly informative. Gen=
eric messages like that are not ideal, IMO. =E2=80=9Coeqa/runtime: Added on=
e automated runtime testcase.=E2=80=9D says nothing about what=E2=80=99s be=
ing tested. It leads to a shortlog which tells very little about what=E2=80=
=99s really being done.<br>-- <br><div class=3D"gmail_signature">Christophe=
r Larson<br>clarson at kergoth dot com<br>Founder - BitBake, OpenEmbedded, =
OpenZaurus<br>Maintainer - Tslib<br>Senior Software Engineer, Mentor Graphi=
cs</div>
</div></div>

--001a11c12ae6a37f57051aec287b--
