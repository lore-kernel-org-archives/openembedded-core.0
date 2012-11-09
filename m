Received: from mail-pa0-f47.google.com ([209.85.220.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1TWcXw-0002Sa-Pa
	for openembedded-core@lists.openembedded.org;
	Fri, 09 Nov 2012 01:34:09 +0100
Received: by mail-pa0-f47.google.com with SMTP id fa11so2181952pad.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 08 Nov 2012 16:20:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	bh=A0ICbkdsJ9i0Fkj9tmuTqbBiu+IM6cezCuFmt6hnzpE=;
	b=kzCf5o1phxfWH7PTmoN1/su5ECHc0/E02K5SoF37y++0NY4mV/BT1gvmQmGn6S9czN
	i3UovKQ+x5dpVAi3YFk68DlwfsBlzA9lpeCwcsfzaVhcAR+h7J6D/auaHKjpfn2+Mm8u
	Xc6zDPQFh1aEO45kp62nZzbJ93STPXXAyaAEIz6qzGDTbdVlYvuET4jF1hK5LJZayPAx
	X1nFNDTC4CTnouuLQ1w5yNyrVfRigUtn8sWgp2tmupuYjVKt1vCUd82IkB/kHrQSVwDL
	T92r+OPnFrq5FGqoAtHnoU5H4Se1247dyF8snqsjWAuysGAwVIbfNofWsiqlkwvOYHbo
	vJeg==
MIME-Version: 1.0
Received: by 10.68.254.10 with SMTP id ae10mr22397285pbd.126.1352420419844;
	Thu, 08 Nov 2012 16:20:19 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.68.16.225 with HTTP; Thu, 8 Nov 2012 16:20:19 -0800 (PST)
In-Reply-To: <CAGiJk9cVC2aR9DUd1AjQL5Yvkci1Gvq7ydxW+a6Rh-T8cVg_Nw@mail.gmail.com>
References: <CAGiJk9d7sCukgAiM=vdEJm3RKOP=6yqTW6HAGGiBb4oqBj0LqA@mail.gmail.com>
	<20120808213143.GC2854@jama.jama.net>
	<CAGiJk9cVC2aR9DUd1AjQL5Yvkci1Gvq7ydxW+a6Rh-T8cVg_Nw@mail.gmail.com>
Date: Thu, 8 Nov 2012 22:20:19 -0200
X-Google-Sender-Auth: PEtsQ8yMjdMyexIPCgh8rJwo4d4
Message-ID: <CAP9ODKpd1GcO1EbAtB9oFWE7CHXH2tYT0vS_0t5-jcq8rM+pkw@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Qt test cases (was: Re: Replacing Web in Sato with Midori)
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
X-List-Received-Date: Fri, 09 Nov 2012 00:34:09 -0000
Content-Type: multipart/alternative; boundary=047d7b2e0da1b63bd904ce04eae8

--047d7b2e0da1b63bd904ce04eae8
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Aug 9, 2012 at 3:27 AM, Samuel Stirtzel
<s.stirtzel@googlemail.com>wrote:

> Off topic: Do we want to support Qt5 parallel with Qt4 when it is
> released soon [1]?
>
> [1] http://qt-project.org/wiki/Qt_5.0#d50ae403cb49a205bdf789f377f5cfe6


I am on that and I had some discussion with upstream at ESC-e/LinuxCon and
we found some problems to allow parallel toolchain availability. Once I get
some answer on those points I update the project about it.

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br

--047d7b2e0da1b63bd904ce04eae8
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<br><br><div class=3D"gmail_quote">On Thu, Aug 9, 2012 at 3:27 AM, Samuel S=
tirtzel <span dir=3D"ltr">&lt;<a href=3D"mailto:s.stirtzel@googlemail.com" =
target=3D"_blank">s.stirtzel@googlemail.com</a>&gt;</span> wrote:<br><block=
quote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc=
 solid;padding-left:1ex">
Off topic: Do we want to support Qt5 parallel with Qt4 when it is<br>
released soon [1]?<br>
<br>
[1] <a href=3D"http://qt-project.org/wiki/Qt_5.0#d50ae403cb49a205bdf789f377=
f5cfe6" target=3D"_blank">http://qt-project.org/wiki/Qt_5.0#d50ae403cb49a20=
5bdf789f377f5cfe6</a></blockquote><div><br></div><div>I am on that and I ha=
d some discussion with upstream at ESC-e/LinuxCon and we found some problem=
s to allow parallel toolchain availability. Once I get some answer on those=
 points I update the project about it.</div>
<div>=A0</div></div>-- <br>Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0O.S. Systems<br>E-mail: <a href=3D"mailto:otavio=
@ossystems.com.br" target=3D"_blank">otavio@ossystems.com.br</a>=A0 <a href=
=3D"http://www.ossystems.com.br" target=3D"_blank">http://www.ossystems.com=
.br</a><br>
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0<a href=3D"http://pro=
jetos.ossystems.com.br" target=3D"_blank">http://projetos.ossystems.com.br<=
/a><br><br>

--047d7b2e0da1b63bd904ce04eae8--
