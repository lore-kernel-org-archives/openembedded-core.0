Received: from mail-vx0-f175.google.com ([209.85.220.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RxjTH-0000v0-B3
	for openembedded-core@lists.openembedded.org;
	Wed, 15 Feb 2012 19:20:51 +0100
Received: by vcbfl15 with SMTP id fl15so1075513vcb.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Feb 2012 10:12:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	bh=U9amvC1fuXbRp91iA+U2ORjJfz88umTziipGfBNQcv4=;
	b=SzTXc2+FvPHVXVVe2+WShaiqkH+e/tRbl7L6HnJaOozr0EVVwayb/LquF7m6h9M4Gz
	ri/ZQbiOl+NfiMAcztFPEy7Ve3btSRFFqROxNy5ZcH8j12vVx6w0EzgJzMNrjmyBvkxo
	Go4MO+XAB1cUHC8DGMna+NxYzEoW2fi6K9WKc=
MIME-Version: 1.0
Received: by 10.52.67.229 with SMTP id q5mr11589779vdt.14.1329329558828; Wed,
	15 Feb 2012 10:12:38 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.220.3.84 with HTTP; Wed, 15 Feb 2012 10:12:38 -0800 (PST)
In-Reply-To: <1329327647-21681-1-git-send-email-Martin.Jansa@gmail.com>
References: <1329327647-21681-1-git-send-email-Martin.Jansa@gmail.com>
Date: Wed, 15 Feb 2012 16:12:38 -0200
X-Google-Sender-Auth: nsDfLNbUGR6MzaO1o4U3fPm7K6A
Message-ID: <CAP9ODKppqZH7G8fcPNyTR=R_s3jJxr21o2qwK7kySGjmR_fSKg@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libsdl: add fix for new _XGetRequest symbol backported to libx11
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
X-List-Received-Date: Wed, 15 Feb 2012 18:20:51 -0000
Content-Type: multipart/alternative; boundary=20cf307811a024b80b04b904a89d

--20cf307811a024b80b04b904a89d
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Feb 15, 2012 at 15:40, Martin Jansa <martin.jansa@gmail.com> wrote:

> +Upstrea-Status: Accepted
>

Typo!

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br

--20cf307811a024b80b04b904a89d
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div class=3D"gmail_quote">On Wed, Feb 15, 2012 at 15:40, Martin Jansa <spa=
n dir=3D"ltr">&lt;<a href=3D"mailto:martin.jansa@gmail.com">martin.jansa@gm=
ail.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D=
"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
+Upstrea-Status: Accepted<br></blockquote><div><br></div><div>Typo!</div><d=
iv>=A0</div></div>-- <br>Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0O.S. Systems<br>E-mail: <a href=3D"mailto:otavio@os=
systems.com.br" target=3D"_blank">otavio@ossystems.com.br</a>=A0 <a href=3D=
"http://www.ossystems.com.br" target=3D"_blank">http://www.ossystems.com.br=
</a><br>
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0<a href=3D"http://pro=
jetos.ossystems.com.br" target=3D"_blank">http://projetos.ossystems.com.br<=
/a><br><br>

--20cf307811a024b80b04b904a89d--
