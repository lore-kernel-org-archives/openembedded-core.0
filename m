Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QJnf7-00069u-PJ for openembedded-core@lists.openembedded.org;
	Tue, 10 May 2011 16:11:46 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p4AE8ucL006639;
	Tue, 10 May 2011 15:08:56 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 06348-05; Tue, 10 May 2011 15:08:52 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p4AE8mmm006633
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Tue, 10 May 2011 15:08:48 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <BANLkTim0hVFjUd+8j5jTR5dv7TwSMk=4qA@mail.gmail.com>
References: <cover.1305035617.git.richard.purdie@linuxfoundation.org>
	<BANLkTim0hVFjUd+8j5jTR5dv7TwSMk=4qA@mail.gmail.com>
Date: Tue, 10 May 2011 15:08:45 +0100
Message-ID: <1305036525.30391.275.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: Tom, King <ka6sox@gmail.com>
Subject: Re: [PATCH 0/6] RFC Distro config changes
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
X-List-Received-Date: Tue, 10 May 2011 14:11:46 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-05-10 at 16:05 +0200, Frans Meulenbroeks wrote:
> > Pull URL: git://git.openembedded.org/openembedded-core-contrib
> >  Branch: rpurdie/distro
> >  Browse:
> > http://git.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rpurdie/distro
> >
> 
> THere is something wrong with git.
> If I browse to the 2nd url I get:
> Bad object id: rpurdie/distro
> going to git and navigating to the branch gives the same result.
> 
>  Anyway, although I am not able to review the changes on git, a thumbs up
> for the initiative.

I've noticed this happening with branches on that repository for the
past couple of days, its not just this branch.

Khem/Cliff/Tom: Who might be able to look into and help fix this?

Frans: You can still checkout the branch and look, its just the web
interface that has issues.

Cheers,

Richard



