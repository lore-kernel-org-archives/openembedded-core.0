Return-Path: <diego.sueiro@gmail.com>
Received: from mail-qa0-f47.google.com (mail-qa0-f47.google.com
	[209.85.216.47])
	by mail.openembedded.org (Postfix) with ESMTP id 587946E9F9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Feb 2014 17:56:21 +0000 (UTC)
Received: by mail-qa0-f47.google.com with SMTP id j5so16414594qaq.20
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Feb 2014 09:56:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=AUzxr8MrXqHIns2HE1Snm8YP11BL5Gxwp9Ohv5waCZk=;
	b=pbLcGGg+NEs3DPWVPRokzAHoZ9KlvotA1PkvZ3zJX5uuCFfsRoxaFo4xs5YlrBkVdz
	P0RzyazK9vsoIgEoJmphxwSnnXgwFfesCMvyObT75nORS5Be8XO+/zEpT78ZUjfoEDsJ
	ImrR9fvC+1VN3YbzG/6OenV3p36Z/vJyY2VPCCS9rpAVx5PuLEHJ/2b2q7kYoeGpEm5w
	CLy+rfhhZ5ks7zTO/7AmAqsn+t4NVZk7G7hemhxnNyppAaAc+eqD99pjmeWMHETNG29R
	DkHgmjRrrwDjoDsKfV7VOGU7XjVaHaiO19e/PgkN28yoo7Wk+ejFoxTCp5Rzxyg8ikFl
	rnlA==
X-Received: by 10.224.160.83 with SMTP id m19mr4811670qax.21.1392314182217;
	Thu, 13 Feb 2014 09:56:22 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.25.47 with HTTP; Thu, 13 Feb 2014 09:56:02 -0800 (PST)
In-Reply-To: <CAMCfZKE1+RDpEE8HehL_GDp2WxrVWjpjVL0Fb94Y_729Zi0A=w@mail.gmail.com>
References: <CAMCfZKE1+RDpEE8HehL_GDp2WxrVWjpjVL0Fb94Y_729Zi0A=w@mail.gmail.com>
From: Diego Sueiro <diego.sueiro@gmail.com>
Date: Thu, 13 Feb 2014 15:56:02 -0200
Message-ID: <CAMCfZKFBnmFip9qdUxjf60F_T5yBBEUfENULR_Bxt_b+Hso77g@mail.gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: Re: qte-4.8.5 missing libQtUiToolsE.a on toolchain
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
X-List-Received-Date: Thu, 13 Feb 2014 17:56:21 -0000
Content-Type: multipart/alternative; boundary=047d7bacb2aa3f367204f24d68f3

--047d7bacb2aa3f367204f24d68f3
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Feb 11, 2014 at 10:34 AM, Diego Sueiro <diego.sueiro@gmail.com>wrote:

> libQtUiToolsE.a is just present at qt4-embedded-staticdev package.
> Shouldn't it needed to be added to meta-toolchain-qte?


Should I have to send a patch to fix this?


Regards,

--
*dS
Diego Sueiro

Administrador do Embarcados
www.embarcados.com.br

/*long live rock 'n roll*/

--047d7bacb2aa3f367204f24d68f3
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Tue, Feb 11, 2014 at 10:34 AM, Diego Sueiro <span dir=3D"ltr">&lt;<a hre=
f=3D"mailto:diego.sueiro@gmail.com" target=3D"_blank">diego.sueiro@gmail.co=
m</a>&gt;</span> wrote:<br>

<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">libQtUiToolsE.a is just present at=A0qt4-emb=
edded-staticdev package. Shouldn&#39;t it needed to be added to meta-toolch=
ain-qte?</blockquote>

</div><br>Should I have to send a patch to fix this?</div><div class=3D"gma=
il_extra"><br><br clear=3D"all"><div><div dir=3D"ltr"><div>Regards,</div><d=
iv><br></div>--<br>*dS<br>Diego Sueiro<br><br>Administrador do Embarcados<b=
r>

<a href=3D"http://www.embarcados.com.br" target=3D"_blank">www.embarcados.c=
om.br</a><br><br>/*long live rock &#39;n roll*/<br></div></div>
</div></div>

--047d7bacb2aa3f367204f24d68f3--
