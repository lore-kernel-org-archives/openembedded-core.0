Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1R3syk-0006n3-QC
	for openembedded-core@lists.openembedded.org;
	Wed, 14 Sep 2011 19:10:30 +0200
Received: by bke11 with SMTP id 11so1668134bke.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Sep 2011 10:05:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=iDQfU61CgXOuPULwZra4sBk2hX9QnFSUO6SXg5IoDrk=;
	b=AT/6tqeI48h9GP56eCTO2xusu8ALw1kFmaGSvu7OFoJAm1MjdKGA2fK/0Og5Rkd60D
	43LRzoZAKY6g5A44QVyjhwGNYhQeahHV05tvslDUWFy9jxZ9SwTzUYQ4c16WDHo98XGB
	OZMl2NrFj9+CHHNgHwCl1higI78VIkINmfdy0=
MIME-Version: 1.0
Received: by 10.204.3.23 with SMTP id 23mr38138bkl.301.1316019920399; Wed, 14
	Sep 2011 10:05:20 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.204.65.194 with HTTP; Wed, 14 Sep 2011 10:05:20 -0700 (PDT)
In-Reply-To: <1316016728.26879.2510.camel@elmorro>
References: <1316016728.26879.2510.camel@elmorro>
Date: Wed, 14 Sep 2011 14:05:20 -0300
X-Google-Sender-Auth: Os50GrxSKGb0BFTzo5iYk5d_jPQ
Message-ID: <CAP9ODKr_bokTx+Q+1Y4PzmXza5sCm_tgj2dMaeFPhQn2SGz3SA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Tom Zanussi <tom.zanussi@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/2] grub2: new recipe
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
X-List-Received-Date: Wed, 14 Sep 2011 17:10:30 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 14, 2011 at 13:12, Tom Zanussi <tom.zanussi@intel.com> wrote:
...
> =A0.../grub/grub-1.99/grub-install.in.patch =A0 =A0 =A0 =A0 =A0 | =A0 13 =
++++++
...

This needs header addition to be OK for merging.

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


