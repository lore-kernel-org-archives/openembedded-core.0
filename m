Received: from mail-vb0-f47.google.com ([209.85.212.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1SRBlC-0005KN-Ad
	for openembedded-core@lists.openembedded.org;
	Mon, 07 May 2012 02:25:06 +0200
Received: by vbbfr13 with SMTP id fr13so1018509vbb.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 06 May 2012 17:15:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=X/klZFaYLBUQS8/boFg/gSMEy9ujENfymuj3JkDyglk=;
	b=VR6uGWZD7D4kCMmjfpqD3a6+xbfuD0rWzfAD7TT3hx5T1VQKzWGupwuupo5zRGtDhy
	h3NMy1KnnLBfxQmyGGLG+vq175+CseIP9eNGs7xeGKaig+LCzjw3JNigE6AyNYbyAHY4
	/QnNYcRlzCHcoB9+kJQ5igHmyNLgFxM/XHmkEk15g6JG9zvYDqbFRmCmxLLEXbpgzDr8
	TRPdXOoIVCSfaamgtBZaeBCR/ufk0SsP4aFXNnvwqXFXK9HRFD79Nct5m6gZ/79BcjCx
	CBgDOZyJwb8JiWhhjETU8R6YXXLj0X8k1TdCleR+vu/trkAXNhsGZAR0SENqoC/z0Rns
	mNtg==
MIME-Version: 1.0
Received: by 10.220.151.71 with SMTP id b7mr8583552vcw.62.1336349716148; Sun,
	06 May 2012 17:15:16 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.220.152.82 with HTTP; Sun, 6 May 2012 17:15:16 -0700 (PDT)
In-Reply-To: <20120506071506.GA3141@jama.jama.net>
References: <20120506071506.GA3141@jama.jama.net>
Date: Sun, 6 May 2012 21:15:16 -0300
X-Google-Sender-Auth: taKE5ImqOoSlI9BkY-FI032OA-U
Message-ID: <CAP9ODKr5CZMf7MB+60gdoq-bjk41x9+v9CmkJO4JbjqRrOYRRw@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: meta-demoapps layer
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
X-List-Received-Date: Mon, 07 May 2012 00:25:06 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Sun, May 6, 2012 at 4:15 AM, Martin Jansa <martin.jansa@gmail.com> wrote=
:
> What's the point of this layer in oe-core repo?
>
> Seems like nobody is using that, recipes there seems to have low quality,
> no checksums, do not build and newer or fixed versions of many are in
> different layers already.
>
> Can someone:
> 0) drop whole layer
> 1) drop broken stuff
> 2) drop recipes which exist elsewhere
> 3) merge fixes from other layers (e.g. meta-oe/meta-shr)
>
> ?

I am for dropping it all.

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


