Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1QKKao-0000QD-HV
	for openembedded-core@lists.openembedded.org;
	Thu, 12 May 2011 03:21:31 +0200
Received: by bwz5 with SMTP id 5so1016772bwz.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 May 2011 18:18:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=bJsUI4Njxe7xcV7nX2VQR/ftnKlKTbAKdbrjjd5LgLs=;
	b=OjVtlkuuubAKiHow3pwF8rRHAFiAAM+2qXFRzh4BPvDB7logGv1tKgPbeMX1h/w3qT
	PiHkdzxlDXbZmzhODGmvxYSFFGJgcsXj02GOCoY+UhfFJvYUpa6lswARKuKjOyLTrNcK
	GDu0v+oDwzg10W8vyeNlzqMbQion1nfyDBTr4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	b=ic0TFN5sH82C4EooboHo9Ugmxr11okEswmQ0KmYjQ6ers4DAUn5EPjoSn7Lpp5MtQ8
	7b3LEhzGs579fYUP7hvtTgIsvcGLN7lJL463aBwVK15y4XcO2+mZVN6V/KafD3/n2vD5
	fU53dNcG/Iqom+DgAoNQUmVeEVhPF5bv3LMNM=
MIME-Version: 1.0
Received: by 10.205.33.194 with SMTP id sp2mr1885643bkb.27.1305162704651; Wed,
	11 May 2011 18:11:44 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.204.79.70 with HTTP; Wed, 11 May 2011 18:11:44 -0700 (PDT)
In-Reply-To: <1305127023.30391.374.camel@rex>
References: <1305039119-1469-1-git-send-email-otavio@ossystems.com.br>
	<1305039119-1469-3-git-send-email-otavio@ossystems.com.br>
	<1305127023.30391.374.camel@rex>
Date: Wed, 11 May 2011 22:11:44 -0300
X-Google-Sender-Auth: 3oLLwb3Bk5vxWa9KlyH2Z3gGro4
Message-ID: <BANLkTinb+3g16LVqDZGVSCc_X2L3-9OktA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/3] cmake: add support for oe qt4 tools names
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
X-List-Received-Date: Thu, 12 May 2011 01:21:31 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Wed, May 11, 2011 at 12:17, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> This looks ok but could you please give more details in the patch about
> why its needed. Saul should be able to point you at the details of where
> that information is.

Sorry Richard but I didn't follow you. In my point of view the patch
description is small and complete. I see no need of more information
on that.

Saul?

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


