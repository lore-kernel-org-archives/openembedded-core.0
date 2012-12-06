Received: from mail-pa0-f47.google.com ([209.85.220.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1Tgdbu-0006xO-As
	for openembedded-core@lists.openembedded.org;
	Thu, 06 Dec 2012 16:43:38 +0100
Received: by mail-pa0-f47.google.com with SMTP id fa10so3988332pad.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 06 Dec 2012 07:29:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=O2ygyyZsn0d/+IlJDgxVhVitqCIiH/7ttBR+pm2yXqw=;
	b=YFQJ+mHVhjWZ45xZ6Rjifu3uySUE6BUQJbw5lRU7klEU49dnE350aBUABk/XWhK9GO
	aQpn3TwLGZRCwAU4aOE3GJP9md+WIuls6aqhODRsEM+uUVqLSywcIEmRwHi0fR11J6/8
	pAXmTf3H60ycGEM4zyuCcndnFu0fO2TLCaXS3y55WXNzZquTEHJ5eS4ip4dTsyxqAbV+
	pEIX4AJ2mMm4Z7jvMniIN2zeQEOof/oL5tOHW7VzoLCFf943y6CImCt4sZBersrR8uwP
	r/tdzKNS3oqMRHByjCGp30Tuj8MEhorOfFoq5vSnesngXfiyqyuOgkU/XstwxTZ/QlqQ
	wt5w==
MIME-Version: 1.0
Received: by 10.66.76.6 with SMTP id g6mr4852636paw.61.1354807752073; Thu, 06
	Dec 2012 07:29:12 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.68.16.225 with HTTP; Thu, 6 Dec 2012 07:29:12 -0800 (PST)
In-Reply-To: <1354806692.25268.191.camel@ted>
References: <cover.1354779942.git.sgw@linux.intel.com>
	<1354806692.25268.191.camel@ted>
Date: Thu, 6 Dec 2012 13:29:12 -0200
X-Google-Sender-Auth: 06Pud2PVqQPH8CHTX4Jq5iyuKsQ
Message-ID: <CAP9ODKpmK+OJqyzr+rYAq8+Np0rfnhO4YQCrtOg1pwa6etr4KA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [CONSOLIDATED PULL 00/71] Updates and Patches (cover letter only)
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
X-List-Received-Date: Thu, 06 Dec 2012 15:43:38 -0000
Content-Type: multipart/alternative; boundary=f46d042f9c28cd213d04d030c2da

--f46d042f9c28cd213d04d030c2da
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Dec 6, 2012 at 1:11 PM, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> > Otavio Salvador (1):
> >   initramfs-framework: init: Stop mount warnings during boot
>
> This just has a PR bump in it? Corrupted?


I think you have merged it already; you can drop it.

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br

--f46d042f9c28cd213d04d030c2da
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<br><div class=3D"gmail_extra"><br><br><div class=3D"gmail_quote">On Thu, D=
ec 6, 2012 at 1:11 PM, Richard Purdie <span dir=3D"ltr">&lt;<a href=3D"mail=
to:richard.purdie@linuxfoundation.org" target=3D"_blank">richard.purdie@lin=
uxfoundation.org</a>&gt;</span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div class=3D"im">&gt; Otavio Salvador (1):<=
br></div><div class=3D"im">
&gt; =A0 initramfs-framework: init: Stop mount warnings during boot<br>
<br>
</div>This just has a PR bump in it? Corrupted?</blockquote><div><br></div>=
<div>I think you have merged it already; you can drop it.</div><div>=A0</di=
v></div>-- <br>Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0O.S. Systems<br>
E-mail: <a href=3D"mailto:otavio@ossystems.com.br" target=3D"_blank">otavio=
@ossystems.com.br</a>=A0 <a href=3D"http://www.ossystems.com.br" target=3D"=
_blank">http://www.ossystems.com.br</a><br>Mobile: +55 53 9981-7854=A0 =A0 =
=A0 =A0=A0 =A0 =A0 =A0<a href=3D"http://projetos.ossystems.com.br" target=
=3D"_blank">http://projetos.ossystems.com.br</a><br>
<br>
</div>

--f46d042f9c28cd213d04d030c2da--
