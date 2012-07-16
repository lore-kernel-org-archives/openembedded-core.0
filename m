Received: from mail-vc0-f175.google.com ([209.85.220.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1SqlcY-0002Fw-0O
	for openembedded-core@lists.openembedded.org;
	Mon, 16 Jul 2012 15:45:54 +0200
Received: by vcbfy27 with SMTP id fy27so2895340vcb.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Jul 2012 06:34:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=0niIfCsCgchvFZa/FuBb6d5AAWfXWaQwRRTQLNfjNs0=;
	b=TlljnQDj4tElv30gplAmNvgFI9McXvw93HOJREVwI3P7kUh4Rq0IR9vZLAeXTkhR10
	/3zDmIPEUhM3Gn+zF71f+Iga2bRA3JjGqgHPkV5RMJ4WLxDpNO00256itDbDI4ocUEzf
	C4ZXcYh8qgQQM6f7nYZu7W+aptqM6wNsL4Nz5rjvqkwMVuaV7pwe4k0w5L9yFirCFUUv
	YMPX95I6sqaIoe74AeMFdC355Cp6oj+LAdUv+msCuxtCBSxzFAcnlXnGbZfA1X8H7kr/
	0uvFZYtIRoEN3zBj6wXKX6PLcq56opioqFlu7jAvf5v+GsUWoeOaaUzWYL7/ENxtyke1
	d5XA==
MIME-Version: 1.0
Received: by 10.220.16.8 with SMTP id m8mr5286245vca.10.1342445675575; Mon, 16
	Jul 2012 06:34:35 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.220.220.196 with HTTP; Mon, 16 Jul 2012 06:34:35 -0700 (PDT)
In-Reply-To: <E5F016E0-45BD-4F23-8B53-01E45EB25AFB@dominion.thruhere.net>
References: <1342259955-8875-1-git-send-email-koen@dominion.thruhere.net>
	<CAP9ODKpJLfsbmfPnjL2zZMddeDXO9sWV4+-ZhHmzESQMFu=woQ@mail.gmail.com>
	<29D9FA58-0AB0-4ADF-B67E-0541BC7DA14C@dominion.thruhere.net>
	<CAP9ODKrBnzOM7rfhRr5KC-L_EjuwZ73NkpHcyg1hiOxKXD+6Rg@mail.gmail.com>
	<E5F016E0-45BD-4F23-8B53-01E45EB25AFB@dominion.thruhere.net>
Date: Mon, 16 Jul 2012 10:34:35 -0300
X-Google-Sender-Auth: 4lBeo4ji7CW_uI6hoOmb8LUTmxQ
Message-ID: <CAP9ODKo3gqTjcYwnZuNJ9yq6G_CYh54A8JtngBA78hyREURTqw@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Koen Kooi <koen@dominion.thruhere.net>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] powertop: update to 2.0+git
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
X-List-Received-Date: Mon, 16 Jul 2012 13:45:54 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Mon, Jul 16, 2012 at 10:22 AM, Koen Kooi <koen@dominion.thruhere.net> wrote:
>> From what I read, those are backports; so you can use Backport
>> [applied in version X.Y]
>
> No, they were pulled of the powertop mailinglist and git-am'ed :)

So it is pending.

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br


