Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RbyZ7-0003bP-Bc
	for openembedded-core@lists.openembedded.org;
	Sat, 17 Dec 2011 19:00:57 +0100
Received: by eaal1 with SMTP id l1so3745003eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 17 Dec 2011 09:53:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	bh=dDOuLoAJ0XqxEMLoiKkkZDJ8kYqioVvD1go8susGZ4c=;
	b=G1Ru3kveUoMxep30EW9ITr0Vvq/5T26rv55vW7f/B3V2rQG9lIn2jdTdjcbRxXDZ73
	etUsawgm9/extDF2fXM1aOcEIvAM1wfjYOX1AYfAMTH/X43/Y6y9w6AmdBZsnnRkHWie
	jxzo/i6GgoMtQvTeogBgaJWJstma3fxUF4kqc=
MIME-Version: 1.0
Received: by 10.205.127.17 with SMTP id gy17mr125010bkc.113.1324144434182;
	Sat, 17 Dec 2011 09:53:54 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.204.162.76 with HTTP; Sat, 17 Dec 2011 09:53:54 -0800 (PST)
In-Reply-To: <D5AB6E638E5A3E4B8F4406B113A5A19A12ED44B20B@shsmsx501.ccr.corp.intel.com>
References: <cover.1324132972.git.shane.wang@intel.com>
	<aec7142fcdb265b6bab0b3328043d62e8fe10a8a.1324132972.git.shane.wang@intel.com>
	<20111217153816.GA9547@rhein.zuhause.netz>
	<D5AB6E638E5A3E4B8F4406B113A5A19A12ED44B20B@shsmsx501.ccr.corp.intel.com>
Date: Sat, 17 Dec 2011 15:53:54 -0200
X-Google-Sender-Auth: h9DW-rOs6waH7Yidc34vsovZQpc
Message-ID: <CAP9ODKqCJCSt18SuwBU3RY11MGyAiNVc2ssXSxkHL0uec-t0mg@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] Create a script for SUMMARY audit in recipes
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
X-List-Received-Date: Sat, 17 Dec 2011 18:00:57 -0000
Content-Type: multipart/alternative; boundary=000e0cdfd982a17af304b44d669d

--000e0cdfd982a17af304b44d669d
Content-Type: text/plain; charset=ISO-8859-1

On Sat, Dec 17, 2011 at 15:18, Wang, Shane <shane.wang@intel.com> wrote:

> OK, nowhere. I tested with sh just now, it also worked. Will change that.


Test it with dash please.

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br

--000e0cdfd982a17af304b44d669d
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div class=3D"gmail_quote">On Sat, Dec 17, 2011 at 15:18, Wang, Shane <span=
 dir=3D"ltr">&lt;<a href=3D"mailto:shane.wang@intel.com">shane.wang@intel.c=
om</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"marg=
in:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
OK, nowhere. I tested with sh just now, it also worked. Will change that.</=
blockquote><div><br></div><div>Test it with dash please.</div><div>=A0</div=
></div>-- <br>Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0O.S. Systems<br>
E-mail: <a href=3D"mailto:otavio@ossystems.com.br" target=3D"_blank">otavio=
@ossystems.com.br</a>=A0 <a href=3D"http://www.ossystems.com.br" target=3D"=
_blank">http://www.ossystems.com.br</a><br>Mobile: +55 53 9981-7854=A0 =A0 =
=A0 =A0=A0 =A0 =A0 =A0<a href=3D"http://projetos.ossystems.com.br" target=
=3D"_blank">http://projetos.ossystems.com.br</a><br>
<br>

--000e0cdfd982a17af304b44d669d--
