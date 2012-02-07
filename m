Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1Rup58-0003Cn-Lq
	for openembedded-core@lists.openembedded.org;
	Tue, 07 Feb 2012 18:43:54 +0100
Received: by eekd41 with SMTP id d41so2219975eek.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 07 Feb 2012 09:35:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	bh=z1o8PFWfLbkWNhtaxBFM6lrOkMp/ykOrWTnrS73ybvs=;
	b=E9IrtErTX+9NaAz89/UgMhghyTpD2OooY6F9boaG9GEhk8ik9GJtsg6BQo1zYtnoL+
	9SzSMaOZlQAQPKCx4Wh5Zvyt444ueO58HhtLw0B/SliBWmO+uEDB1Llf87oPVYRPGaMn
	z8c8KfFLPv9taiAHzLO535IQGfRC/sE6yxTf8=
MIME-Version: 1.0
Received: by 10.14.52.17 with SMTP id d17mr7255383eec.56.1328636152216; Tue,
	07 Feb 2012 09:35:52 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.14.96.129 with HTTP; Tue, 7 Feb 2012 09:35:52 -0800 (PST)
In-Reply-To: <1328635982-18444-1-git-send-email-andrei@gherzan.ro>
References: <1328635982-18444-1-git-send-email-andrei@gherzan.ro>
Date: Tue, 7 Feb 2012 15:35:52 -0200
X-Google-Sender-Auth: QavkUVggAYlda3tYCmjtnQEeQS8
Message-ID: <CAP9ODKrAYsyv5BODpCYF-3npivnxr8DuoLajjY79zrMZyyjzoA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] nspr: Integrate version 4.8.9
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
X-List-Received-Date: Tue, 07 Feb 2012 17:43:54 -0000
Content-Type: multipart/alternative; boundary=002354477cd0e37e1804b8633541

--002354477cd0e37e1804b8633541
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Feb 7, 2012 at 15:33, Andrei Gherzan <andrei@gherzan.ro> wrote:

>  meta/recipes-support/nspr/files/nspr.pc |   11 ++++++++
>

Just a cosmetic issue, name the nspr.pc file nspr.pc.in so it is clear that
it is going to be processed.

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br

--002354477cd0e37e1804b8633541
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div class=3D"gmail_quote">On Tue, Feb 7, 2012 at 15:33, Andrei Gherzan <sp=
an dir=3D"ltr">&lt;<a href=3D"mailto:andrei@gherzan.ro">andrei@gherzan.ro</=
a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0=
 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
=A0meta/recipes-support/nspr/files/nspr.pc | =A0 11 ++++++++<br></blockquot=
e></div><div><br></div>Just a cosmetic issue, name the nspr.pc file <a href=
=3D"http://nspr.pc.in">nspr.pc.in</a> so it is clear that it is going to be=
 processed.<br clear=3D"all">
<div><br></div>-- <br>Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0O.S. Systems<br>E-mail: <a href=3D"mailto:otavio@oss=
ystems.com.br" target=3D"_blank">otavio@ossystems.com.br</a>=A0 <a href=3D"=
http://www.ossystems.com.br" target=3D"_blank">http://www.ossystems.com.br<=
/a><br>
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0<a href=3D"http://pro=
jetos.ossystems.com.br" target=3D"_blank">http://projetos.ossystems.com.br<=
/a><br><br>

--002354477cd0e37e1804b8633541--
