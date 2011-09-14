Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1R3rYO-0004Sb-In
	for openembedded-core@lists.openembedded.org;
	Wed, 14 Sep 2011 17:39:12 +0200
Received: by bke11 with SMTP id 11so1587321bke.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Sep 2011 08:34:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=s2plzuxVhFpdy07MJKKscqRysxu8yhFxYkLuo9XGFXk=;
	b=pvCyNocskbYPQ4xDsma4JdyCIRWiF4rojy9q06hJYq2o/aHW87uIx+i3f04DLLkaXr
	mPMd/nq8GA/9ze2bK/EpcXKYOMWhm7FISoTZ2BhGQBBBo/8M5A0hlc35deYVYqJbresd
	4wieVpZfGp2LCOncrNQ1myN09m/0qrYCL5fjs=
MIME-Version: 1.0
Received: by 10.204.157.8 with SMTP id z8mr150239bkw.145.1316014442159; Wed,
	14 Sep 2011 08:34:02 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.204.65.194 with HTTP; Wed, 14 Sep 2011 08:34:02 -0700 (PDT)
In-Reply-To: <4E70A76E.1030101@eukrea.com>
References: <20110911172241.GA3674@chargestorm.se>
	<1315762415-18070-1-git-send-email-eric@eukrea.com>
	<201109121134.42474.paul.eggleton@linux.intel.com>
	<FF2EB738-77F7-4BC5-BB83-82ED8CBC0F96@dominion.thruhere.net>
	<4E70A76E.1030101@eukrea.com>
Date: Wed, 14 Sep 2011 12:34:02 -0300
X-Google-Sender-Auth: P-Rd6jbH2gShAAniyVu8eu_QQoU
Message-ID: <CAP9ODKqgNTF3Uz_kfTfE_=pFrovt-tpmGRGsKBGcXDFy3k-52w@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] qt4: update to latest version 4.7.4
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
X-List-Received-Date: Wed, 14 Sep 2011 15:39:12 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 14, 2011 at 10:09, Eric B=E9nard <eric@eukrea.com> wrote:
> I sent patches to update meta-oe, meta-angstrom & meta-intel : did you ge=
t
> them ?

The md5sum of the tarball doesn't match. GNUtoo is aware of the issue.

Please hold the patch merging until a new patchset is send with the
fixes md5sum hashes.

Cheers,

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


