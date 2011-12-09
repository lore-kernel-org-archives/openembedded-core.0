Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RZ63N-0006Yk-S1
	for openembedded-core@lists.openembedded.org;
	Fri, 09 Dec 2011 20:24:17 +0100
Received: by bkbzt4 with SMTP id zt4so3369697bkb.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 09 Dec 2011 11:17:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=HDLgEKxo7aaBUTcBhJPz3ic8E8m8Dk4XBv1AKirPYHg=;
	b=qc63onUihknQNhZyCXkUIO6t3ryrW5tE/1ncv6AE3lp6lM2rImyCekIhuQPfSh7KxV
	ST4Si7Q0fBCK7SoXXaErZnYNc4juB2w6h46b7T1psp9YFJwhlVFRlPTfRXyPDPb+GkR9
	lFAXV64LfoJYQruyZEsEiBGRGGv29l/+jHn3k=
MIME-Version: 1.0
Received: by 10.204.150.9 with SMTP id w9mr4646056bkv.65.1323458245569; Fri,
	09 Dec 2011 11:17:25 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.204.113.132 with HTTP; Fri, 9 Dec 2011 11:17:25 -0800 (PST)
In-Reply-To: <4EE25E38.3060704@linux.intel.com>
References: <cover.1323358819.git.otavio@ossystems.com.br>
	<e27fba3b38877fb7420c58a3e35cdbcef1cb767a.1323358819.git.otavio@ossystems.com.br>
	<4EE25E38.3060704@linux.intel.com>
Date: Fri, 9 Dec 2011 17:17:25 -0200
X-Google-Sender-Auth: TtJNPHMvk5B7UO55ZTN8AtQN6UY
Message-ID: <CAP9ODKpr=xgxfJcrzsbv8q+VQh8oQOdKjQurev7hVjiMAv1PkA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Darren Hart <dvhart@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/3] dosfstools: update native to 2.11
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
X-List-Received-Date: Fri, 09 Dec 2011 19:24:17 -0000
Content-Type: multipart/alternative; boundary=000e0ce0d9c69a2e6a04b3ada2dc

--000e0ce0d9c69a2e6a04b3ada2dc
Content-Type: text/plain; charset=ISO-8859-1

On Fri, Dec 9, 2011 at 17:15, Darren Hart <dvhart@linux.intel.com> wrote:

> What are these licensing issues, and are they no longer an issue?
>

Newer dosfstools is GPLv3.

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br

--000e0ce0d9c69a2e6a04b3ada2dc
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div class=3D"gmail_quote">On Fri, Dec 9, 2011 at 17:15, Darren Hart <span =
dir=3D"ltr">&lt;<a href=3D"mailto:dvhart@linux.intel.com">dvhart@linux.inte=
l.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"m=
argin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex;">
<div class=3D"im">What are these licensing issues, and are they no longer a=
n issue?</div></blockquote><div><br></div><div>Newer dosfstools is GPLv3.=
=A0</div></div><div><br></div>-- <br>Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O.S. Systems<br>
E-mail: <a href=3D"mailto:otavio@ossystems.com.br" target=3D"_blank">otavio=
@ossystems.com.br</a>=A0 <a href=3D"http://www.ossystems.com.br" target=3D"=
_blank">http://www.ossystems.com.br</a><br>Mobile: +55 53 9981-7854=A0 =A0 =
=A0 =A0=A0 =A0 =A0 =A0<a href=3D"http://projetos.ossystems.com.br" target=
=3D"_blank">http://projetos.ossystems.com.br</a><br>
<br>

--000e0ce0d9c69a2e6a04b3ada2dc--
