Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1R3ohB-0007dn-64
	for openembedded-core@lists.openembedded.org;
	Wed, 14 Sep 2011 14:36:05 +0200
Received: by bke11 with SMTP id 11so1420135bke.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Sep 2011 05:30:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=DEO4oaqx4VxBbWEZ/qrhzJdhCTliayIQp+lGuNXgl0E=;
	b=TquCo6XfPWXdEutKhLat+Uu7lzaV3dtSbemo1TWljdoHltTJyyRsFaEy18fs+vlY0f
	qhWTM1f3M2mdjyOOr8aFRi/rrYyPgv5OIk4ckIpgTfPO8jxY/imhovc7KK4pnBVrYgfe
	rbVjGBjgOOfi/pfVwDtkXmTrFS2kBexiYGqmc=
MIME-Version: 1.0
Received: by 10.204.3.23 with SMTP id 23mr2029886bkl.301.1316003454990; Wed,
	14 Sep 2011 05:30:54 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.204.65.194 with HTTP; Wed, 14 Sep 2011 05:30:54 -0700 (PDT)
In-Reply-To: <1315978760.26879.1858.camel@elmorro>
References: <1315978760.26879.1858.camel@elmorro>
Date: Wed, 14 Sep 2011 09:30:54 -0300
X-Google-Sender-Auth: h1yiSDXT3shDhMNqIZUkS4YRIZw
Message-ID: <CAP9ODKrn8ZZZFFZPwuMU-Jto5X9On3A5p8wKeEU7ZcQAa9GoHg@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/2] Add new recipes for grub2
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
X-List-Received-Date: Wed, 14 Sep 2011 12:36:05 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 14, 2011 at 02:39, Tom Zanussi <tom.zanussi@intel.com> wrote:
/> A future patch will factor out the common parts of init_install_2.0.sh
> with init_install 1.0 - this initial patchset essentially just fixes
> what's necessary for YOCTO bug #1428 in order to get things working again=
.

Wouldn't be better to drop 1.0 completely?

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


