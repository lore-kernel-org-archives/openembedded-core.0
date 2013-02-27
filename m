Received: from mail-wi0-f181.google.com ([209.85.212.181])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <twoerner@gmail.com>) id 1UAfnJ-0007xh-Ob
	for Openembedded-core@lists.openembedded.org;
	Wed, 27 Feb 2013 13:07:33 +0100
Received: by mail-wi0-f181.google.com with SMTP id hm6so528139wib.2
	for <Openembedded-core@lists.openembedded.org>;
	Wed, 27 Feb 2013 03:51:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:cc:content-type;
	bh=1yRZTPw3T7Hqt78lmvi9vZuXcKgzdFtCq114X+h+7E8=;
	b=JIOx+iAHzNPe3Mbw0GvuYLCZi1L2KRuXmIcAxDPfRJ80oLGWL4JklZXgtevWRZv30q
	A5NSPKHfnKkRhtDZvjrPwCKqoU4IZVgmmSTIdX+H6QyxiJAtSJQvuz0nuHQg9O4FoSTT
	B3QwpPeGgsIRT00nXR5ACzge4Amp4S4Lt+9Ab8p4YZ0BgKqTqOuIFoZxt2g7D/DOPpnd
	gIJncmtrTIuaaYJ+u+IKuROs8Pv5DkD/l/zMmCTtusOWGgRIUY3tZd8w+q3y5XeWPC87
	9yDyiNmGv0rfWHuXuN6auIDtbyTmjuxM6D581vpicZj0t/tfxVd64Ldw2r9gwq+pO5pU
	eC/w==
MIME-Version: 1.0
X-Received: by 10.180.77.9 with SMTP id o9mr25874061wiw.16.1361965873445; Wed,
	27 Feb 2013 03:51:13 -0800 (PST)
Received: by 10.194.45.100 with HTTP; Wed, 27 Feb 2013 03:51:13 -0800 (PST)
In-Reply-To: <1361930646-10689-1-git-send-email-jason.wessel@windriver.com>
References: <1361930646-10689-1-git-send-email-jason.wessel@windriver.com>
Date: Wed, 27 Feb 2013 06:51:13 -0500
Message-ID: <CAHUNapRkAFDfkyhS=+BEzcU_Gt4AO5WoMv7PpZ16bjjoR9+cfg@mail.gmail.com>
From: Trevor Woerner <twoerner@gmail.com>
To: Jason Wessel <jason.wessel@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<Openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] syslinux.bbclass: Add a default serial console option and real boot menu support
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
X-List-Received-Date: Wed, 27 Feb 2013 12:07:34 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Feb 26, 2013 at 9:04 PM, Jason Wessel
<jason.wessel@windriver.com> wrote:
> You can see the screen shots attached to the bugzilla.
>
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=3944
>
> [ YOCTO #3944 ]

Is the "Windriver" logo on the VGA example optional?


