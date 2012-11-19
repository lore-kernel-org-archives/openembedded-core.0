Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1TaVTW-0000tb-E5
	for openembedded-core@lists.openembedded.org;
	Mon, 19 Nov 2012 18:49:40 +0100
Received: by mail-pb0-f47.google.com with SMTP id un1so1963899pbc.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Nov 2012 09:35:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=YSoFo/SWkGFvABapgk2JXspm92F8iP9kiSwAwrGrFtM=;
	b=lsiGt8O6Cdq9AjKyLOKQBxLgyTvsk3lLr/gAbdmtvdS5TB9Lq8XQvTIHdEbkdirlG+
	lrrXZ3vbpIT3E65aHWFNOLopqn+S8nb0gNpW6jVRt1Du9CSKziP9+I3LjRFdrr369KqJ
	IXaIDEDVVIOih2/XLTihZygDQHb8NNyJwWNV4GYmC+D3VHeyieQQ7lWpmseurxI4ebs3
	HCErRKtY1XbjACIzfNXS8eWGwfSWWyUd8dMdvaxSmmqxQkjLxqQ9H58UdMOzBeF8DDqH
	IbDwHQ87nfHTfY159b3lSAcX2B+ImoApdLi0DiVyQRHgJTx/5rGyrzJVmTg90reQSF9S
	zunA==
MIME-Version: 1.0
Received: by 10.68.204.103 with SMTP id kx7mr35101475pbc.33.1353346535088;
	Mon, 19 Nov 2012 09:35:35 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.68.16.225 with HTTP; Mon, 19 Nov 2012 09:35:34 -0800 (PST)
In-Reply-To: <1353334954-4909-1-git-send-email-ross.burton@intel.com>
References: <1353334954-4909-1-git-send-email-ross.burton@intel.com>
Date: Mon, 19 Nov 2012 15:35:34 -0200
X-Google-Sender-Auth: 6qrGxEZr7BwcjDpiemzhQ-EO5SM
Message-ID: <CAP9ODKrjHJ60u+Aca0eAhq54PJJBp3hHCWbUDXSR=Z7onMQeLg@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Ross Burton <ross.burton@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/2] qt4: remove negative preference on 4.8.3
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
X-List-Received-Date: Mon, 19 Nov 2012 17:49:40 -0000
Content-Type: multipart/alternative; boundary=047d7b10d1857b62cb04cedc8b6a

--047d7b10d1857b62cb04cedc8b6a
Content-Type: text/plain; charset=ISO-8859-1

On Mon, Nov 19, 2012 at 12:22 PM, Ross Burton <ross.burton@intel.com> wrote:

> Signed-off-by: Ross Burton <ross.burton@intel.com>
>

This change ought to be commited before removal of 4.8.1 version.

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br

--047d7b10d1857b62cb04cedc8b6a
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<br><br><div class=3D"gmail_quote">On Mon, Nov 19, 2012 at 12:22 PM, Ross B=
urton <span dir=3D"ltr">&lt;<a href=3D"mailto:ross.burton@intel.com" target=
=3D"_blank">ross.burton@intel.com</a>&gt;</span> wrote:<br><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;pad=
ding-left:1ex">
Signed-off-by: Ross Burton &lt;<a href=3D"mailto:ross.burton@intel.com">ros=
s.burton@intel.com</a>&gt;<br></blockquote><div><br></div><div>This change =
ought to be commited before removal of 4.8.1 version.</div><div>=A0</div></=
div>
-- <br>Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0O.S. Systems<br>E-mail: <a href=3D"mailto:otavio@ossystems.com.br" t=
arget=3D"_blank">otavio@ossystems.com.br</a>=A0 <a href=3D"http://www.ossys=
tems.com.br" target=3D"_blank">http://www.ossystems.com.br</a><br>
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0<a href=3D"http://pro=
jetos.ossystems.com.br" target=3D"_blank">http://projetos.ossystems.com.br<=
/a><br><br>

--047d7b10d1857b62cb04cedc8b6a--
