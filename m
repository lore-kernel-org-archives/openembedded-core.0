Received: from mail-oa0-f47.google.com ([209.85.219.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1UcfuI-0002Yb-Nt
	for openembedded-core@lists.openembedded.org;
	Wed, 15 May 2013 19:54:31 +0200
Received: by mail-oa0-f47.google.com with SMTP id m1so2569921oag.34
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 May 2013 10:36:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=aettBA7HLDRKvtXteXla+dVgUrrn9jw4nLtGV3Z1SG8=;
	b=Jr2StjEmq/pqGWvwZJU8XfDP5orK6+X+8Nju07IWoxTyTc4lMpXTSncR5mCe+p1Z38
	QTBDhNOzeq08K1nCPUr0bNuMhVBFEC7NzbLqcnCLVZbq7PZV5in/aHvuh/0w4dNyqFkP
	28YEmfRP8l25FuMNvLNMQ94mE4IrMH32L7CfNZEu/MU3hvVIgykJC9ZfW95LfzvyKZWb
	bu0+w1DXriDq6i5mTx+gt7kQAYekq2EKr049SlGRSTFbpvRkVl+E09x9PXBjOHYk8j7K
	iurIxIT3UkXsppzLLk8TwnoBsAmzLXJDF6/zK9OB2s2MNLIHJYbXCYXy3V4gveDuDC3M
	QpxQ==
MIME-Version: 1.0
X-Received: by 10.60.41.232 with SMTP id i8mr19252589oel.129.1368639376806;
	Wed, 15 May 2013 10:36:16 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.182.89.226 with HTTP; Wed, 15 May 2013 10:36:16 -0700 (PDT)
In-Reply-To: <1368639038.18324.6.camel@ted>
References: <518A6B25.5000108@r-finger.com> <3057509.dy5Cs7AUqs@helios>
	<519372F1.6050902@r-finger.com> <5543572.N8ppyBn6lW@helios>
	<5193B925.6010607@r-finger.com> <1368639038.18324.6.camel@ted>
Date: Wed, 15 May 2013 14:36:16 -0300
X-Google-Sender-Auth: 4L8qy2uoR_Q0drtUo4tvVgheUdY
Message-ID: <CAP9ODKqQ-TXBwUqPVZ_oZOK2MLRQhSp_9Xb7a=dOiPaQ+zUw5A@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: proposal to move cogl, clutter and related recipes from oe-core to dedicated meta-clutter layer
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
X-List-Received-Date: Wed, 15 May 2013 17:54:53 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Wed, May 15, 2013 at 2:30 PM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> I'd ask that we give trying to make this work from OE-Core a fair try.
>
> If in say 3 months from now OE-Core is causing clutter users pain we can
> look again at the problem. Equally, if nobody has sent me any clutter
> patches in the next three months, I wouldn't consider than a fair try.

No, this is not fair. If you wish to keep it you need to do the work
or find someone to make it. Tomas is willing to work in meta-clutter
and he has the right to work in his solution.

--
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br


