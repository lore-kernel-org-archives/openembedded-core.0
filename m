Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1TgHCV-0007cc-6S
	for openembedded-core@lists.openembedded.org;
	Wed, 05 Dec 2012 16:47:55 +0100
Received: by mail-pb0-f47.google.com with SMTP id un1so3284128pbc.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 05 Dec 2012 07:33:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=oPoobcSj5nw2iFB2D23267XABzjMdX21SGNCPcmKpwY=;
	b=DqEzUnHKMYfIFSJU5xclKjTaXcMf02cXv6aJwErOB8keaFPThsYXx1LVaefytAerpy
	nFTepcAbsuaMZtlLtym7WjE+VqsIjEhuVtwQ8c1tGY49PcPNaYf3hzaRliXQbBUAuwdI
	wEhiJsZHBQE8jGCi0qFIEgbmvEfDy4H17I6KhgNrtS+bF+CttxaqgjHS6twdkkOw4A7K
	w9m9n0+9a7xKDLmTaZX3RRXfQ1jnaQMXnS0qsHyKXmLehpQRznzLar7gbPZWONTCMS6o
	oWJ5G1YPltFLoVXnEHj2SrP7JYNmhcPsL+bYWZ0urhPnDriOqybLoy11P2HhhY4cUtiN
	A8ZA==
MIME-Version: 1.0
Received: by 10.68.213.33 with SMTP id np1mr49659332pbc.64.1354721610367; Wed,
	05 Dec 2012 07:33:30 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.68.16.225 with HTTP; Wed, 5 Dec 2012 07:33:30 -0800 (PST)
In-Reply-To: <d69418647adf8bc836c8880a4caa59076a8c498f.1354711738.git.radu.moisan@intel.com>
References: <cover.1354711738.git.radu.moisan@intel.com>
	<d69418647adf8bc836c8880a4caa59076a8c498f.1354711738.git.radu.moisan@intel.com>
Date: Wed, 5 Dec 2012 13:33:30 -0200
X-Google-Sender-Auth: DPLhCRdy6tvhar_5iCCj-DSJ7-s
Message-ID: <CAP9ODKocfW+WBGY_5nzKny43cTot_mE5UzTVwOGwjDAhoa3H+Q@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Radu Moisan <radu.moisan@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/4] u-boot-mkimage: upgrade to 2012.07
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
X-List-Received-Date: Wed, 05 Dec 2012 15:47:55 -0000
Content-Type: multipart/alternative; boundary=e89a8ff1c12e5b036504d01cb4b9

--e89a8ff1c12e5b036504d01cb4b9
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Dec 5, 2012 at 10:57 AM, Radu Moisan <radu.moisan@intel.com> wrote:

> From: Constantin Musca <constantinx.musca@intel.com>
>
> License checksum change due to README diff (only the
> instructions have changed)
>
> Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
> Signed-off-by: Radu Moisan <radu.moisan@intel.com>
> ---
>

I'd say to go to 2012.10 as this is the last release.

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br

--e89a8ff1c12e5b036504d01cb4b9
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<br><div class=3D"gmail_extra"><br><br><div class=3D"gmail_quote">On Wed, D=
ec 5, 2012 at 10:57 AM, Radu Moisan <span dir=3D"ltr">&lt;<a href=3D"mailto=
:radu.moisan@intel.com" target=3D"_blank">radu.moisan@intel.com</a>&gt;</sp=
an> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">From: Constantin Musca &lt;<a href=3D"mailto=
:constantinx.musca@intel.com">constantinx.musca@intel.com</a>&gt;<br>
<br>
License checksum change due to README diff (only the<br>
instructions have changed)<br>
<br>
Signed-off-by: Constantin Musca &lt;<a href=3D"mailto:constantinx.musca@int=
el.com">constantinx.musca@intel.com</a>&gt;<br>
Signed-off-by: Radu Moisan &lt;<a href=3D"mailto:radu.moisan@intel.com">rad=
u.moisan@intel.com</a>&gt;<br>
---<br></blockquote></div><div><br></div><div>I&#39;d say to go to 2012.10 =
as this is the last release.</div><div><br></div>-- <br>Otavio Salvador=A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O.S. Systems<br>E-ma=
il: <a href=3D"mailto:otavio@ossystems.com.br" target=3D"_blank">otavio@oss=
ystems.com.br</a>=A0 <a href=3D"http://www.ossystems.com.br" target=3D"_bla=
nk">http://www.ossystems.com.br</a><br>
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0<a href=3D"http://pro=
jetos.ossystems.com.br" target=3D"_blank">http://projetos.ossystems.com.br<=
/a><br><br>
</div>

--e89a8ff1c12e5b036504d01cb4b9--
