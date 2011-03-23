Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1Q2Mo1-00081L-0E
	for openembedded-core@lists.openembedded.org;
	Wed, 23 Mar 2011 13:04:53 +0100
Received: by bwz10 with SMTP id 10so6434350bwz.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Mar 2011 05:02:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=FtFn8nImC4ehmYa4sk+KGXdYON+IkmU4lXEHC/qc4oU=;
	b=i87a6dmzpBI79u4NJllJJlSFsw4lmTROEYVWMkIRexMP//bMF0XieFickCRiw00fgQ
	we9OKxwKNlvO2v76HaAQLHXy2Yheq+mMI7V75JFH1YbzdjDkZlICpzHpSF9Q2dg/BilG
	wfqo0O+59vrFLIflo99LZxtUfTFy2HifRmhzc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	b=eT6+P0jl5bc01iNVyMIvoZmJnHp+EB5zSCkgLLT1d6Rpu1/TFf7yAHKqJoIaqe/HPj
	jLJ2xIdJLbr7pWfE3xkXQJSKgWsR0BA/NG0UliajxGfJmQXQT0/PUgpczZfT0cOG1LRI
	JW809A6FZQVGTubSXssSF9/Y5i3Rzf3bJ3H/s=
MIME-Version: 1.0
Received: by 10.204.141.15 with SMTP id k15mr1521690bku.50.1300881779166; Wed,
	23 Mar 2011 05:02:59 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.204.8.15 with HTTP; Wed, 23 Mar 2011 05:02:59 -0700 (PDT)
In-Reply-To: <6CA3B184-AD05-4A9B-90CE-25AE38DECA39@dominion.thruhere.net>
References: <6CA3B184-AD05-4A9B-90CE-25AE38DECA39@dominion.thruhere.net>
Date: Wed, 23 Mar 2011 09:02:59 -0300
X-Google-Sender-Auth: rAlN9R7texwPUm6CEE44DUz8XsQ
Message-ID: <AANLkTinH6OSEF1pnh0MvqBmTV9UVFVYdvG8io+mA0mry@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: [RFC] recipes-efl inside meta-oe or meta-efl next to meta-oe?
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
X-List-Received-Date: Wed, 23 Mar 2011 12:04:53 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 23, 2011 at 08:49, Koen Kooi <koen@dominion.thruhere.net> wrote=
:
> Inside meta-oe:
>
> meta-openembedded/
> =A0 =A0 =A0 =A0meta-oe/
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0recipes-efl

+1

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


