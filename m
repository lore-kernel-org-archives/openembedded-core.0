Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1Rh5Pm-0001DN-Az
	for openembedded-core@lists.openembedded.org;
	Sat, 31 Dec 2011 21:20:26 +0100
Received: by eaal1 with SMTP id l1so13232860eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 31 Dec 2011 12:13:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=0nAgZMC+o5zIgaOxBtm5BQsWPzDG4fv6P2wK1zF8b0I=;
	b=M67/eX6Aq6WAdiK9P7fcITfHmZhBmdwlZOGq32OBuFGRy/Z72cAlYl7ZV7PQEgsSO6
	b/1nmVdoskHxylBc6uwN5WrX7iMnpXeSn32FcirTNVnvjJgSjiIzervVGHcK1JkR3qca
	xxe4b73TSnKHjeWJ32/U7Pfu7KJ8echVNrijE=
MIME-Version: 1.0
Received: by 10.205.136.205 with SMTP id il13mr10075791bkc.37.1325362387888;
	Sat, 31 Dec 2011 12:13:07 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.204.78.79 with HTTP; Sat, 31 Dec 2011 12:13:07 -0800 (PST)
In-Reply-To: <1325347496-9980-1-git-send-email-koen@dominion.thruhere.net>
References: <1325347496-9980-1-git-send-email-koen@dominion.thruhere.net>
Date: Sat, 31 Dec 2011 18:13:07 -0200
X-Google-Sender-Auth: A7MhGv0JdcaTmUqFEDx4yHLVUbw
Message-ID: <CAP9ODKodP5Da+4yZWt=fQ+OySszKSoUHvr4aoZHT_mX=ih2W4g@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: [PATCH] procps: raise update-alternatives priority
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
X-List-Received-Date: Sat, 31 Dec 2011 20:20:26 -0000
Content-Type: multipart/alternative; boundary=000e0cdfd24a542b1104b568faf8

--000e0cdfd24a542b1104b568faf8
Content-Type: text/plain; charset=ISO-8859-1

On Sat, Dec 31, 2011 at 14:04, Koen Kooi <koen@dominion.thruhere.net> wrote:

> This fixes a problem with the uptime utility:
>

This fixes nothing; this is a workaround.

It would be better to find why this fails instead of changing it.

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br

--000e0cdfd24a542b1104b568faf8
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div class=3D"gmail_quote">On Sat, Dec 31, 2011 at 14:04, Koen Kooi <span d=
ir=3D"ltr">&lt;<a href=3D"mailto:koen@dominion.thruhere.net">koen@dominion.=
thruhere.net</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
This fixes a problem with the uptime utility:<br></blockquote><div><br></di=
v><div>This fixes nothing; this is a workaround.</div><div><br></div><div>I=
t would be better to find why this fails instead of changing it.</div><div>
=A0</div></div>-- <br>Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0O.S. Systems<br>E-mail: <a href=3D"mailto:otavio@oss=
ystems.com.br" target=3D"_blank">otavio@ossystems.com.br</a>=A0 <a href=3D"=
http://www.ossystems.com.br" target=3D"_blank">http://www.ossystems.com.br<=
/a><br>
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0<a href=3D"http://pro=
jetos.ossystems.com.br" target=3D"_blank">http://projetos.ossystems.com.br<=
/a><br><br>

--000e0cdfd24a542b1104b568faf8--
