Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1QZ0eP-000338-9k
	for openembedded-core@lists.openembedded.org;
	Tue, 21 Jun 2011 15:05:53 +0200
Received: by gwb11 with SMTP id 11so662241gwb.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jun 2011 06:02:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type;
	bh=DbLArxsgPA0UTQr+j9WwHR9lOli7Do4kGDhrFRCAfHY=;
	b=nIoLQvRBfNauZ8DgeIIY1Co9Wa4ebtLRCc8Emzwu/JLyMAkfAzoEOszPwNII9xiU4s
	rlCIEvom5oDgoCSYLAqPPlep6epnYzcqqs/sLpZH0XxSiWNI8zHdUKlbBaRqWDPugTQ6
	g5h3XzoInfq83VVhQObNjPncrUBXR9gs6wKQ4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=UXgRxyb48Tw/2H6nSInKavloJUZYmNhBaTIrB02Bzb9SQWAvlSqah/2wz1hT5WnAJM
	oY/Nqjtu15nXcUgEiWWgkBKw0NPEn96pS5rCaMuUoa6sDUP+hY33RvNm54/ZUnQZ52Dd
	o+IYfCheEBmPH34fa5Y7RnDqPXvr0YB0R6sGs=
MIME-Version: 1.0
Received: by 10.91.149.5 with SMTP id b5mr7144069ago.91.1308661339132; Tue, 21
	Jun 2011 06:02:19 -0700 (PDT)
Received: by 10.90.10.36 with HTTP; Tue, 21 Jun 2011 06:02:19 -0700 (PDT)
In-Reply-To: <1308658461.20015.24.camel@rex>
References: <1308658461.20015.24.camel@rex>
Date: Tue, 21 Jun 2011 15:02:19 +0200
Message-ID: <BANLkTimMLo4g7uWsrhAr=hun4wZ6AaDjQg@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Multilib Development Update
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
X-List-Received-Date: Tue, 21 Jun 2011 13:05:53 -0000
Content-Type: multipart/alternative; boundary=0016e64095c240125804a638765c

--0016e64095c240125804a638765c
Content-Type: text/plain; charset=ISO-8859-1

As I already asked before: what is the benefit having this in embedded
systems?

If I am doing an embedded system I know the target hardware, and there is no
need to have e.g. both 32 and 64 bit libs.

Frans.

--0016e64095c240125804a638765c
Content-Type: text/html; charset=ISO-8859-1

As I already asked before: what is the benefit having this in embedded systems?<br><br>If I am doing an embedded system I know the target hardware, and there is no need to have e.g. both 32 and 64 bit libs.<br><br>Frans.<br>

--0016e64095c240125804a638765c--
