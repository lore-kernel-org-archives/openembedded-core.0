Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1Ry1La-0005zz-JR
	for openembedded-core@lists.openembedded.org;
	Thu, 16 Feb 2012 14:26:06 +0100
Received: by daln34 with SMTP id n34so1731740dal.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Feb 2012 05:17:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	bh=aicMIFXZswWwbc8cUZ1EpebDxS37NWzXHQz14CaxFqc=;
	b=OPQL6kosVYCqWMkkCL9ndlJX9Y5G+t6TXa8bn14K11MOigTN98HKwDVAW3he1z7C52
	5XKprjG76teMrHv5N4SuNtgCt1S46s57YZDByoUUJUm0dH64wJ1mbGAZeoiMuW+FqcEk
	53HnOwTnX8EgyGfge/ipsg43GOBJ5JTgeGues=
MIME-Version: 1.0
Received: by 10.68.73.138 with SMTP id l10mr13747238pbv.22.1329398272873; Thu,
	16 Feb 2012 05:17:52 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.68.210.71 with HTTP; Thu, 16 Feb 2012 05:17:52 -0800 (PST)
In-Reply-To: <CAGiJk9ddcv7C7gZbR7a5+YVXfwyX_igRWCWyCR16TggQUrfcYg@mail.gmail.com>
References: <CAGiJk9ddcv7C7gZbR7a5+YVXfwyX_igRWCWyCR16TggQUrfcYg@mail.gmail.com>
Date: Thu, 16 Feb 2012 11:17:52 -0200
X-Google-Sender-Auth: yiJXU_se73rNwEBcNwYxPAKLGEo
Message-ID: <CAP9ODKoFQbOm12SMW-VGpBdHKbd9+A9_V0kGQHvaAwCtrxifGg@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: RFC: Qt session management is disabled via QT_DISTRO_FLAGS
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
X-List-Received-Date: Thu, 16 Feb 2012 13:26:06 -0000
Content-Type: multipart/alternative; boundary=f46d041b4a82d1d44404b914a754

--f46d041b4a82d1d44404b914a754
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Feb 16, 2012 at 11:04, Samuel Stirtzel <s.stirtzel@googlemail.com>wrote:

> Anyone knows if enabling session management in Qt is a bad idea, or if
> there is another way of solving this?


I don't think it is going to be a problem to have it enabled on x11 flavour.

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br

--f46d041b4a82d1d44404b914a754
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div class=3D"gmail_quote">On Thu, Feb 16, 2012 at 11:04, Samuel Stirtzel <=
span dir=3D"ltr">&lt;<a href=3D"mailto:s.stirtzel@googlemail.com">s.stirtze=
l@googlemail.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote"=
 style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
Anyone knows if enabling session management in Qt is a bad idea, or if<br>
there is another way of solving this?</blockquote><div><br></div><div>I don=
&#39;t think it is going to be a problem to have it enabled on x11 flavour.=
</div><div>=A0</div></div>-- <br>Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O.S. Systems<br>
E-mail: <a href=3D"mailto:otavio@ossystems.com.br" target=3D"_blank">otavio=
@ossystems.com.br</a>=A0 <a href=3D"http://www.ossystems.com.br" target=3D"=
_blank">http://www.ossystems.com.br</a><br>Mobile: +55 53 9981-7854=A0 =A0 =
=A0 =A0=A0 =A0 =A0 =A0<a href=3D"http://projetos.ossystems.com.br" target=
=3D"_blank">http://projetos.ossystems.com.br</a><br>
<br>

--f46d041b4a82d1d44404b914a754--
