Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>)
	id 1TRmA3-0001RX-CK; Fri, 26 Oct 2012 17:49:27 +0200
Received: by mail-pb0-f47.google.com with SMTP id ro12so2596243pbb.6
	for <multiple recipients>; Fri, 26 Oct 2012 08:35:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=7IBWFHzhFlyxnVxA586OFwdU0Ha/8I8Ycp7aOH05Jms=;
	b=LniHAq2J9UVScXGeffucO+g4709ExqNmFyIGSRAxnzscES/ASMha8NHtqVZ2ScPsiv
	D0hCSGafk9LiarE3NrrabjGxBhzBVhPskr7b4LTKZN1PokSKVcez3/iGUAY4BBvRuwB4
	abVqYzMPnjqooaOYWITboRxNezYrL2DipFWLjNCf2MX8eQgUqzX9GpFrQd1H5zbgKSbl
	SDD4iwdkNV6gxM7TApeYShaBECXVLOtfUpEZpNVrQsUjyRuzRHmGKpL2vQ+RuAjd+QNP
	PLRGOQ4HMMy3r01ZbcDLVwAjZZyGG0PNNUJ4jNpBesDLjds2D1rSBfQL05oTAmM1PFCc
	sv9g==
MIME-Version: 1.0
Received: by 10.68.224.161 with SMTP id rd1mr71710513pbc.49.1351265756287;
	Fri, 26 Oct 2012 08:35:56 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.68.40.201 with HTTP; Fri, 26 Oct 2012 08:35:56 -0700 (PDT)
In-Reply-To: <k6e9ht$ra9$1@ger.gmane.org>
References: <CAJTo0LYm7bwU0fNYcD8wQ3unJm_ShoW-ej5tZ3FeeogEztJGnQ@mail.gmail.com>
	<k6e9ht$ra9$1@ger.gmane.org>
Date: Fri, 26 Oct 2012 13:35:56 -0200
X-Google-Sender-Auth: mg6EBJN0h-ijGWD1_EdsaoPzPJ8
Message-ID: <CAP9ODKoZXu2dbvrhGDegKsH+vDEisgtf7r2u6TcBwYy2ZEPHDA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [oe] Danny stable release branch
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 26 Oct 2012 15:49:27 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Fri, Oct 26, 2012 at 1:17 PM, Koen Kooi <koen@dominion.thruhere.net> wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> Op 26-10-12 15:44, Burton, Ross schreef:
>> Hi,
>>
>> Now that 1.3 is released[1] I can announce that I'm the Danny stable
>> release series maintainer.  This involves pulling any relevant security
>> fixes, build fixes and critical bug fixes from master, and periodically
>> rolling a 1.3.x release.
>>
>> Obviously there's a lot of activity in master so whilst I intend to
>> consider every commit, if anyone submits patches to master that should
>> also be in danny, please say so either in a direct mail or with a tag in
>> the subject line.
>>
>> Expect to see a ross/danny-next series in the poky-contrib repository
>> fairly soon where I'll be staging the commits.
>
> Who's the maintainer for the oe-core danny branch?

I hope there's no delta between oe-core and poky one so Ross is the
maintainer as far as I know.

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br


