Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1R6ine-0004I2-GV
	for openembedded-core@lists.openembedded.org;
	Thu, 22 Sep 2011 14:54:46 +0200
Received: by bke11 with SMTP id 11so2828315bke.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Sep 2011 05:49:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:date:x-google-sender-auth:message-id:subject
	:from:to:content-type:content-transfer-encoding;
	bh=RXS6RmJi13/VAZb1+P8h0G/ehLkI4fBkDWLmhS28U1M=;
	b=a5fEm7ncApSlBpejV18bETXV6fIhqZgE86mPuAaEAHbdbgXvy+HANhsvSEGFI0wXFT
	S0QC/r0OajshBEVki0LYhYJn0U5ntnX8PVViyzUw+FmTYsrr93ACE0Zl4HLMp+E1KAOM
	2zXJ46oTHn+8bw6H91fxE0/D09aMo9CiAwvUI=
MIME-Version: 1.0
Received: by 10.204.132.142 with SMTP id b14mr1503750bkt.270.1316695767046;
	Thu, 22 Sep 2011 05:49:27 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.204.65.194 with HTTP; Thu, 22 Sep 2011 05:49:26 -0700 (PDT)
Date: Thu, 22 Sep 2011 09:49:26 -0300
X-Google-Sender-Auth: Htz7Du5P4Ksf_kfWcvII6C1D6Rw
Message-ID: <CAP9ODKpF7hQQmB7YWE4RCWDbEfZwv8432KJrBmvpwe1u_SaCTg@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Branch management for OE-Core release
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
X-List-Received-Date: Thu, 22 Sep 2011 12:54:46 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hello,

I noticed the 2011-1 branch today and it seems it is not fully merged
into master; this is a mistake since it will create an upgrade path
problem for users of it.

How this is going to be managed?

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


