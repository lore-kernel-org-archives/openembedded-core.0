Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1R3uaU-0000UQ-RS
	for openembedded-core@lists.openembedded.org;
	Wed, 14 Sep 2011 20:53:34 +0200
Received: by bke11 with SMTP id 11so1753832bke.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Sep 2011 11:48:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=m8XaExL/Rc/69W2Wv6MGtwcvLszRzYwE9Rkhiqdt5xI=;
	b=XiGYekcbqQ7zCPeMTWLymWC0E8m6Ktr+x48P9aRBgL73r4d5vy8DGuUkFY9sKoC76S
	SEqBwYz1sq7kDGHhrPhpla4iaFCY9iOTVqHjqxN37czPpkKQXfhbAP1wX2ezcubwCzKa
	WIiw24jecUNaMAf5TW+SFhgqY6W0avQqdqysw=
MIME-Version: 1.0
Received: by 10.204.157.8 with SMTP id z8mr109735bkw.145.1316026104333; Wed,
	14 Sep 2011 11:48:24 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.204.65.194 with HTTP; Wed, 14 Sep 2011 11:48:24 -0700 (PDT)
In-Reply-To: <1316025869.26879.2584.camel@elmorro>
References: <1316025869.26879.2584.camel@elmorro>
Date: Wed, 14 Sep 2011 15:48:24 -0300
X-Google-Sender-Auth: 1vT7Dl5YcTBvO4FfqJS2fHrOA58
Message-ID: <CAP9ODKqQufuvDSidyOo7U9cjKuH49KBByU9vSdGH_nw+5fokUw@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Tom Zanussi <tom.zanussi@intel.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Wed, 14 Sep 2011 18:53:34 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 14, 2011 at 15:44, Tom Zanussi <tom.zanussi@intel.com> wrote:
> This adds the grub-1.98 from meta-intel while upgrading it to 1.99.
>
> Signed-off-by: Tom Zanussi <tom.zanussi@intel.com>

Acked-by: Otavio Salvador <otavio@ossystems.com.br>

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


