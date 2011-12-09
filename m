Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RZ6MH-0007K3-Sx
	for openembedded-core@lists.openembedded.org;
	Fri, 09 Dec 2011 20:43:49 +0100
Received: by bkbzt4 with SMTP id zt4so3391223bkb.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 09 Dec 2011 11:36:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	bh=Telx0zMTWbUQLmUlraTuTqTlPFtuEBvGHNEOo9M/mdI=;
	b=mRhWruUloVneeAEpT7a8AhvDBmXhPt8mkqrFeUFuzsgdJJTVAPf7+I0nlRtBqkyRwV
	zS31CsOGgbTjko6y30ru5t5BE+llJdDJMGiMFKrHHxIofG3oSRhYbeRheSVfwif273tZ
	6SuFzVXMw4rBxAs7RfU+0l75ciBWTM0j1cciw=
MIME-Version: 1.0
Received: by 10.205.139.7 with SMTP id iu7mr4766404bkc.83.1323459417411; Fri,
	09 Dec 2011 11:36:57 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.204.113.132 with HTTP; Fri, 9 Dec 2011 11:36:57 -0800 (PST)
In-Reply-To: <CAMKF1spMGdCj6-hU96gfvvQOgUwOerRtNGgFZk=5jDhAD96tTQ@mail.gmail.com>
References: <cover.1323358819.git.otavio@ossystems.com.br>
	<abe8db681be0a2ec0ada964957236a5f0511d746.1323358819.git.otavio@ossystems.com.br>
	<CAMKF1spMGdCj6-hU96gfvvQOgUwOerRtNGgFZk=5jDhAD96tTQ@mail.gmail.com>
Date: Fri, 9 Dec 2011 17:36:57 -0200
X-Google-Sender-Auth: WryTlgy0IHe0HT674dDMhekVKec
Message-ID: <CAP9ODKrH8hZ=fiD82vJMMopJ1grKEcZw07pPy7a1PNFtb_gq0w@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/3] scripts/send-pull-request: allow sending of patches without a cover letter
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
X-List-Received-Date: Fri, 09 Dec 2011 19:43:50 -0000
Content-Type: multipart/alternative; boundary=000e0cdf8dbc73108a04b3ade871

--000e0cdf8dbc73108a04b3ade871
Content-Type: text/plain; charset=ISO-8859-1

On Fri, Dec 9, 2011 at 17:34, Khem Raj <raj.khem@gmail.com> wrote:

> why do you want to avoid cover letter ? or is it for other layers
> other than oe-core
>

When it is a single patch makes no sense to send a cover letter that most
of time we just write the same of first commit.

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br

--000e0cdf8dbc73108a04b3ade871
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div class=3D"gmail_quote">On Fri, Dec 9, 2011 at 17:34, Khem Raj <span dir=
=3D"ltr">&lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&g=
t;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0=
 .8ex;border-left:1px #ccc solid;padding-left:1ex;">
<div class=3D"HOEnZb"><div class=3D"h5">why do you want to avoid cover lett=
er ? or is it for other layers</div></div>
other than oe-core<br></blockquote><div><br></div><div>When it is a single =
patch makes no sense to send a cover letter that most of time we just write=
 the same of first commit.</div><div>=A0</div></div>-- <br>Otavio Salvador=
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O.S. Systems<br>
E-mail: <a href=3D"mailto:otavio@ossystems.com.br" target=3D"_blank">otavio=
@ossystems.com.br</a>=A0 <a href=3D"http://www.ossystems.com.br" target=3D"=
_blank">http://www.ossystems.com.br</a><br>Mobile: +55 53 9981-7854=A0 =A0 =
=A0 =A0=A0 =A0 =A0 =A0<a href=3D"http://projetos.ossystems.com.br" target=
=3D"_blank">http://projetos.ossystems.com.br</a><br>
<br>

--000e0cdf8dbc73108a04b3ade871--
