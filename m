Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RkhVp-0000k2-50
	for openembedded-core@lists.openembedded.org;
	Tue, 10 Jan 2012 20:37:37 +0100
Received: by lami14 with SMTP id i14so2096451lam.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Jan 2012 11:30:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	bh=9DjC0GpQg7CCRNcgMYXEUUyHMsT1uW9za+/zPe+lMXI=;
	b=tlnQ1w6b6lQECAh9wZuqoT2vXyVT/WhslHSQnMdfy/yxRoZANR/mypxe7wxfeOD4eb
	gHgyMkK3FesqyKLoiWuf77PW+b9NOW5OItt5c67Aa5TNiBmVFgBf/liDF/i/dbTdCDRI
	jRNxUn2hRBSRZy9LyEVmXV82tOjlQK8iThUKs=
MIME-Version: 1.0
Received: by 10.112.101.163 with SMTP id fh3mr4622780lbb.97.1326223807626;
	Tue, 10 Jan 2012 11:30:07 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.112.54.104 with HTTP; Tue, 10 Jan 2012 11:30:07 -0800 (PST)
In-Reply-To: <2dd7849a0c3b785b4edea7d2e8dd4d4cfb71ac57.1326216024.git.josh@linux.intel.com>
References: <cover.1326216024.git.josh@linux.intel.com>
	<2dd7849a0c3b785b4edea7d2e8dd4d4cfb71ac57.1326216024.git.josh@linux.intel.com>
Date: Tue, 10 Jan 2012 17:30:07 -0200
X-Google-Sender-Auth: T1novfW4XpZLuRdaQNE5vYy8sS8
Message-ID: <CAP9ODKr+UtbWba+XJNYQj9jKZz+uuKKy7+n6Foy9GOcPLZMkPA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/3] alsa-state: add alsa-state from oe classic
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
X-List-Received-Date: Tue, 10 Jan 2012 19:37:37 -0000
Content-Type: multipart/alternative; boundary=f46d04016b0ff23dc704b6318a9e

--f46d04016b0ff23dc704b6318a9e
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Jan 10, 2012 at 15:39, Joshua Lock <josh@linux.intel.com> wrote:

> ...

+++ b/meta/recipes-bsp/alsa-state/alsa-state/asound.state
> @@ -0,0 +1 @@
> +# Dummy file, do not delete
> \ No newline at end of file
>

^ please fix it.

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br

--f46d04016b0ff23dc704b6318a9e
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div class=3D"gmail_quote">On Tue, Jan 10, 2012 at 15:39, Joshua Lock <span=
 dir=3D"ltr">&lt;<a href=3D"mailto:josh@linux.intel.com">josh@linux.intel.c=
om</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"marg=
in:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
...=A0</blockquote><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 =
.8ex;border-left:1px #ccc solid;padding-left:1ex">+++ b/meta/recipes-bsp/al=
sa-state/alsa-state/asound.state<br>
@@ -0,0 +1 @@<br>
+# Dummy file, do not delete<br>
\ No newline at end of file<br></blockquote><div><br></div><div>^ please fi=
x it.</div><div>=A0</div></div>-- <br>Otavio Salvador=A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O.S. Systems<br>E-mail: <a href=3D"m=
ailto:otavio@ossystems.com.br" target=3D"_blank">otavio@ossystems.com.br</a=
>=A0 <a href=3D"http://www.ossystems.com.br" target=3D"_blank">http://www.o=
ssystems.com.br</a><br>
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0<a href=3D"http://pro=
jetos.ossystems.com.br" target=3D"_blank">http://projetos.ossystems.com.br<=
/a><br><br>

--f46d04016b0ff23dc704b6318a9e--
