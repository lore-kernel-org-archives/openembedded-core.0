Received: from mail-vx0-f175.google.com ([209.85.220.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1SKYds-0001JQ-7J
	for openembedded-core@lists.openembedded.org;
	Wed, 18 Apr 2012 19:26:08 +0200
Received: by vcbfl13 with SMTP id fl13so5660306vcb.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Apr 2012 10:16:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=mIKoCbJpPgOkE8Uj5jAffbshz6dlgzRogw7abkfNktM=;
	b=oi4d9pR2s7s5njMf2/AruMFH8/w7FAdq9FDsUrwQ/xTg9PnbxEN9vLko9D2db0jWTk
	dfj3A6hY6CW2T1UlzR8n6e83je8ZvvezQ/8sPyZAwcWo6mXhhHSVuXvCfmIe5EsVb+4W
	2MdPNSbv00PWN8c0pdeQlRjFBrmHJ7A4AENIGbwwVhAMVcY0wvDagPPYdOFROoyJMKdd
	rCBXsEenqoKTMA9DuEG+IoKMK3AvFMQk65gj/dBbJaYI9bInlrpJRz68zi8ei40Odxjz
	JcdeU6a7NaGpvpU824/3FjgTs3pwf7V2CAJxbMybMCFseggiP3PCHNrhuFF73dCHHkEz
	pfJg==
MIME-Version: 1.0
Received: by 10.220.151.71 with SMTP id b7mr1553888vcw.62.1334769400058; Wed,
	18 Apr 2012 10:16:40 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.220.108.146 with HTTP; Wed, 18 Apr 2012 10:16:39 -0700 (PDT)
In-Reply-To: <CABcZANmrzmSPJNZH2VqtO0o=L_Wk0-VK_PEP4m0+TRWQ8cYMjg@mail.gmail.com>
References: <1334760467.24091.100.camel@ted>
	<20120418145330.GM3635@jama.jama.net>
	<1334762445.24091.110.camel@ted>
	<CABcZANkaABCKZ+WmhhGTZEvFnHYwrP7uNSSvNTxxKxfun4JaPA@mail.gmail.com>
	<1334768537.24091.156.camel@ted>
	<CABcZANk+nFT1F7=WBNdE_z3pj=zAzrSQBuD6-DcKT8+OCLKr9g@mail.gmail.com>
	<CABcZANmrzmSPJNZH2VqtO0o=L_Wk0-VK_PEP4m0+TRWQ8cYMjg@mail.gmail.com>
Date: Wed, 18 Apr 2012 14:16:39 -0300
X-Google-Sender-Auth: Vx4mwCRVGVu0qsO0AztxArKnaeI
Message-ID: <CAP9ODKrn2hC2gFMgV7wGWFXsY2+EiUZyvZ9sHg1VAOqSWhXK=g@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Cc: yocto <yocto@yoctoproject.org>
Subject: Re: Yocto Project 1.2 Release Status
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
X-List-Received-Date: Wed, 18 Apr 2012 17:26:08 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 18, 2012 at 14:11, Chris Larson <clarson@kergoth.com> wrote:
..
> If you want folks like us working more closely with upstream, then you
> have to realize that folks are going to have changes to push which
> aren't bugfixes (or aren't critical), and contrary to your
> implication, does not imply that folks are ignoring the stabilization
> efffort. Previous work needs to go up, and isn't occupying current
> development effort.
..

In fact if Yocto had something like Linux merge window and smaller
development releases with some time for bugfix only would allow for a
generally stable tree bug with a flow of new features comming all the
time.

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


