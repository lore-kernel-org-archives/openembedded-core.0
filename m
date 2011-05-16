Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1QLz5l-0005un-8x
	for openembedded-core@lists.openembedded.org;
	Mon, 16 May 2011 16:48:17 +0200
Received: by wwb17 with SMTP id 17so4321626wwb.24
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 May 2011 07:45:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:date:x-google-sender-auth
	:message-id:subject:from:to:content-type:content-transfer-encoding;
	bh=yIkUNwqQzULWP+N21BfShlIWUUbcae5pyiDwR93tLSk=;
	b=PFbF8fSw+Ah8goFph6tpQ1x4Rc6aDXhAEA/UAYW0r2TidjhEhZ/yOraTsheKBaJLeN
	x+SpLoVaJo+rGBDREXl2mf7g+/mERJgnOvFcTTZPorvXG4mUp3zSpKKOKXnfwfXOGt0S
	+RL7WNPLogV5iJD/m6UZmmzGcXG2QbAda8FgM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:date:x-google-sender-auth:message-id:subject
	:from:to:content-type:content-transfer-encoding;
	b=CN+1bajQyj8E3ElWGSoWlQE8zinGPbgyGKBlzGvML852Dtc8XePYx2AN3asLQVBPbL
	FqWNS/lxCMGAVkpq2zWEp9mfgSmdrAt0WTR5Kf1XZFxTb2jh5yzbJu/Anp7KBuuEjK/F
	NU3li4hg9Yza4t1BXtuADJsjntgO1jvNnVqnw=
MIME-Version: 1.0
Received: by 10.216.241.132 with SMTP id g4mr131679wer.9.1305557124880; Mon,
	16 May 2011 07:45:24 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.216.19.19 with HTTP; Mon, 16 May 2011 07:45:24 -0700 (PDT)
Date: Mon, 16 May 2011 11:45:24 -0300
X-Google-Sender-Auth: ba5TgXVtBQB4ykJz0rf4_VaIyCs
Message-ID: <BANLkTi==buTZVpyhU3Kjf6ZTsNCL0XxAww@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Usage of linux (instead of linux-yocto) recipes
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
X-List-Received-Date: Mon, 16 May 2011 14:48:17 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hello,

Is someone using  regular linux recipes with oe-core (or meta-oe)?

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


