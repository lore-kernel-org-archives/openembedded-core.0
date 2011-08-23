Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <klausfpga@gmail.com>) id 1Qvnqb-0006DV-Cf
	for openembedded-core@lists.openembedded.org;
	Tue, 23 Aug 2011 12:04:41 +0200
Received: by fxg11 with SMTP id 11so119915fxg.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Aug 2011 02:59:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject
	:content-type:content-transfer-encoding;
	bh=6eGA5Ovn3hLQyJPKZdBEga9fgvHac6AmPwM9oxD0B18=;
	b=v92Cap1O0QA69Uc3pyS6KfMeVuz3BV+oAmNBCwJWX9ZMvMGVB+5gWvb2Wt0RTvnwhU
	E8t0+tcHjEPUTWyrDLlToalhglGUnfM+rFnw1K/QbMTeryX/w93BjnQZcR5hopXfn0EY
	7Qrv0OtO0mramW3WzDWFA9Nfr/h/YzvfwzPMM=
Received: by 10.223.46.90 with SMTP id i26mr5253457faf.83.1314093592059;
	Tue, 23 Aug 2011 02:59:52 -0700 (PDT)
Received: from [192.168.0.5] (unicorn.dungeon.de [81.56.82.123])
	by mx.google.com with ESMTPS id y21sm4541faj.23.2011.08.23.02.59.50
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 23 Aug 2011 02:59:50 -0700 (PDT)
Message-ID: <4E537A0E.2040605@gmail.com>
Date: Tue, 23 Aug 2011 11:59:42 +0200
From: Klausfpga <klausfpga@gmail.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.18) Gecko/20110617 Lightning/1.0b2 ""
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
Subject: Wiki seems dead. is openembedded wiki still active?
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
X-List-Received-Date: Tue, 23 Aug 2011 10:04:41 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hi,

After many years I wanted to play with ompenembedded again.

So I wanted to go to the wiki ( http://www.openembedded.org/ ) to get
some info.

The wiki displays:
> MediaWiki internal error.
>
>
>
> Exception caught inside exception handler

Am I using the correct url? (it's at least the url also mentioned in
wikipedia)

Is the Wiki just temporarily down and I was just unlucky enough to try
to connect at the wromg time?


What I wanted to find out on the wiki:


- what branch / tag to checkout to have a consitant verison
- what to use as starting point for a minimalist x86 system being able
to run under qemu (x86)
- How to add a gnu toolchain package to my minimalist target system
- what to use as starting point for a minimalist arm11 system being able
to run under qemu (x86)
- what is the recommended way to run bitbake in a 64 bit environment
(psyco is not working). Is pypy an option?
- what are the correct mailing lists for such questions

Thanks in advance for  your answers





