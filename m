Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1R8u07-0005c1-Vm
	for openembedded-core@lists.openembedded.org;
	Wed, 28 Sep 2011 15:16:41 +0200
Received: by bke11 with SMTP id 11so8250443bke.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Sep 2011 06:11:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=XvYVQG+lGrcvBlZXJkHtYOzjoatTzRO/1qphxwHWhFo=;
	b=UM/i/+4t7jFvhqTOWjmth0+B3wiGR4xKtxaBe4Xi9BtuXBpFvKHZt8Cy0hDzWzgPaw
	g6XH5LDHqbTMyvlLcH2nRn2zf2DXAOVXhQMaYQnhSUwZqt77lAc6nA5KNTVteiKbU5F8
	GKtpOZZORBB+7ErFx2kmtj3rhjfWmEh0h4b+E=
MIME-Version: 1.0
Received: by 10.204.7.207 with SMTP id e15mr6308899bke.62.1317215471764; Wed,
	28 Sep 2011 06:11:11 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.204.35.198 with HTTP; Wed, 28 Sep 2011 06:11:11 -0700 (PDT)
In-Reply-To: <4E82F59B.7080808@eukrea.com>
References: <20110911172241.GA3674@chargestorm.se>
	<D9F00ABD-04FA-4A75-BB1C-13B9BBDC4C54@dominion.thruhere.net>
	<4E79E3A9.8080804@eukrea.com>
	<201109281111.33193.paul.eggleton@linux.intel.com>
	<4E82F59B.7080808@eukrea.com>
Date: Wed, 28 Sep 2011 10:11:11 -0300
X-Google-Sender-Auth: YlyoMyL5WvsQYDjuuuhR6qE91KY
Message-ID: <CAP9ODKqA7=3dCZVih09g_5Dv4fbOaonv7AEAoLmJquNV32vSAA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>
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
X-List-Received-Date: Wed, 28 Sep 2011 13:16:41 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 28, 2011 at 07:23, Eric B=E9nard <eric@eukrea.com> wrote:
> I have the patch locally and I will (really) work on this tonight.
> Sorry for the delay I've been overbusy since last wednesday.

Now that this is going into master, I think we ought to update it
directly instead of adding the newer version.

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


