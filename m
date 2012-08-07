Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SylhR-00069z-PZ
	for openembedded-core@lists.openembedded.org;
	Tue, 07 Aug 2012 17:28:01 +0200
Received: by eekb57 with SMTP id b57so1288372eek.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 07 Aug 2012 08:16:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=WHl0H/wOYFO31RcENsaYUTsDAoxKg37FnsMVMwvdABo=;
	b=ESMlynXxxFopzDcVFMgZ9NBTomZChAtCH9rS9LCZ2pp02gEu3o3HA45HpvOjn883Yn
	YvE+/2rY8yRMRrYmA/HI0fH8lndV4ZWqeEgLtPi4Eo2hapuTjMC/I4kzT9fE8uPboFZi
	tR7Oxn68VE11MoSCc6zcvDVp9sJZ3b14T2G3Nlj+ItAnQn02NtpWnV4X9vsLL6igofHN
	FlTaajwRh3zVwiKelk58EsNLkpMv4Td0F6rjHsenpRNzTwOfKVYIZ9z4+B5z6R61slF3
	zcwo4L9oMzQPPaGFj4PNutyQLMWJlh/ExVFtpTymhfoXDax7IdrqIl7BDTFVCQ24Uzsm
	fN7A==
Received: by 10.14.173.71 with SMTP id u47mr18289369eel.22.1344352575946; Tue,
	07 Aug 2012 08:16:15 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.97.141 with HTTP; Tue, 7 Aug 2012 08:15:45 -0700 (PDT)
In-Reply-To: <50212459.8080801@nedap.com>
References: <50212459.8080801@nedap.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 7 Aug 2012 08:15:45 -0700
Message-ID: <CAMKF1soH+456jfMtDtQWHtgV-05ZcGe9U4w7PEm0FRnhtkiAcw@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: libtool
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
X-List-Received-Date: Tue, 07 Aug 2012 15:28:01 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Aug 7, 2012 at 7:21 AM, Jaap de Jong <jaap.dejong@nedap.com> wrote:
> I've seen this one before, but can't remember where...
>
>     | libtool: link: warning: cannot determine absolute directory name of
> `=/usr/lib'
>
> Anyone knows how to fix?

this package uses old libtool update the libtool scripts for it

>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


