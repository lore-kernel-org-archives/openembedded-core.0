Received: from mail-la0-f46.google.com ([209.85.215.46])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@gmail.com>) id 1Tv6n4-0004IN-NQ
	for openembedded-core@lists.openembedded.org;
	Tue, 15 Jan 2013 14:43:01 +0100
Received: by mail-la0-f46.google.com with SMTP id fq13so108200lab.5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Jan 2013 05:27:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=PGSOiUghTZGhdetAg7/LRLE49bMK07pb75cxavIzxV4=;
	b=koB7CJHcefOrGGM5zoPnhe/piz/Yvr6FImi762QXw9gN56o+JDtpyhwrCeY5el7MCH
	q0/evIeNer29B6OjHmlJeWQAQ+OHeX1S1s/L3wFIxFVIgLpGWvic6XMzsHMTZHlC52PQ
	ADXrhVcNnSjJwV/SJADddNmnfFU3ukg/4Qw0bEbkdN13kfmYRMLX6fWF9IMTJvmaae5+
	R9Y+uqFmiEXkedxHwEXDaPdHUbZ26IUlKVcsnl0/b4nBu56O3CakPMtKN3DrqIq7e2cS
	03jtOCduE6cZGj8AJBG5k3HykagrVBXTlmlibx1teAXIsg8jbci348KgH3jv1kWCLPyx
	njew==
MIME-Version: 1.0
Received: by 10.112.46.199 with SMTP id x7mr36382302lbm.109.1358256458218;
	Tue, 15 Jan 2013 05:27:38 -0800 (PST)
Received: by 10.112.127.35 with HTTP; Tue, 15 Jan 2013 05:27:38 -0800 (PST)
In-Reply-To: <50F52E92.6050304@herbrechtsmeier.net>
References: <50F52E92.6050304@herbrechtsmeier.net>
Date: Tue, 15 Jan 2013 08:27:38 -0500
Message-ID: <CADkTA4M38hcwe4jh23sX1OaVYeTiTKWp-JknUeAez6HG-Er7uw@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Stefan Herbrechtsmeier <stefan@herbrechtsmeier.net>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: guilt: Unsupported version of git (1.8.0.2)
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 15 Jan 2013 13:43:05 -0000
X-List-Received-Date: Tue, 15 Jan 2013 13:43:05 -0000
Content-Type: multipart/alternative; boundary=bcaec5540568b4bcb304d353b94f

--bcaec5540568b4bcb304d353b94f
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Jan 15, 2013 at 5:25 AM, Stefan Herbrechtsmeier <
stefan@herbrechtsmeier.net> wrote:

> Hi,
>
> the current version of git is not supported by guilt and breaks
> linux-yocto when used with additional patches.
>

Open a bug in the bugzilla (if you haven't already) and assign it to me.
I'll take care of it.

Cheers,

Bruce


>
> Regards,
>   Stefan
>
>
> ______________________________**_________________
> Openembedded-core mailing list
> Openembedded-core@lists.**openembedded.org<Openembedded-core@lists.openembedded.org>
> http://lists.linuxtogo.org/**cgi-bin/mailman/listinfo/**openembedded-core<http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>
>



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--bcaec5540568b4bcb304d353b94f
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><br><div class=3D"gmail=
_quote">On Tue, Jan 15, 2013 at 5:25 AM, Stefan Herbrechtsmeier <span dir=
=3D"ltr">&lt;<a href=3D"mailto:stefan@herbrechtsmeier.net" target=3D"_blank=
">stefan@herbrechtsmeier.net</a>&gt;</span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">Hi,<br>
<br>
the current version of git is not supported by guilt and breaks linux-yocto=
 when used with additional patches.<br></blockquote><div><br></div><div sty=
le>Open a bug in the bugzilla (if you haven&#39;t already) and assign it to=
 me. I&#39;ll take care of it.</div>
<div style><br></div><div style>Cheers,</div><div style><br></div><div styl=
e>Bruce</div><div>=A0</div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
Regards,<br>
=A0 Stefan<br>
<br>
<br>
______________________________<u></u>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.<u></u>openembedded.org</a><br>
<a href=3D"http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded=
-core" target=3D"_blank">http://lists.linuxtogo.org/<u></u>cgi-bin/mailman/=
listinfo/<u></u>openembedded-core</a><br>
</blockquote></div><br><br clear=3D"all"><div><br></div>-- <br>&quot;Thou s=
halt not follow the NULL pointer, for chaos and madness await thee at its e=
nd&quot;
</div></div>

--bcaec5540568b4bcb304d353b94f--
