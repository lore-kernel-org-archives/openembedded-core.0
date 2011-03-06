Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1PwE3Q-0008NW-U0 for openembedded-core@lists.openembedded.org;
	Sun, 06 Mar 2011 14:31:25 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p26DTll5025236;
	Sun, 6 Mar 2011 13:29:47 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 24948-05; Sun,  6 Mar 2011 13:29:43 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p26DTbHl025230
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Sun, 6 Mar 2011 13:29:41 GMT
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <AANLkTi=TKgiw9X3azhre2b1k3CXVNg0=8XFqQEFPN8Jk@mail.gmail.com>
References: <F22AC2B7-708D-4036-A493-B95E87C4012B@dominion.thruhere.net>
	<AANLkTi=TKgiw9X3azhre2b1k3CXVNg0=8XFqQEFPN8Jk@mail.gmail.com>
Date: Sun, 06 Mar 2011 05:29:33 -0800
Message-ID: <1299418173.17567.3002.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.3 
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: Please keep patchwork up to date
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
X-List-Received-Date: Sun, 06 Mar 2011 13:31:25 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2011-03-05 at 15:11 -0800, Khem Raj wrote:
> On Thu, Mar 3, 2011 at 7:30 AM, Koen Kooi <koen@dominion.thruhere.net> wrote:
> > Hi,
> >
> > When applying something to oe-core, please update the patch state to 'accepted' and archive it so we can only see outstanding patches when visiting http://patches.openembedded.org/project/oe-core/list/
> >
> > I went throught the list today and archived a bunch of patches, but more people looking after it would be better in the long run :)
> >
> 
> There is a post-receive.hook script available which would
> automatically update patch status after the push. I dont know if it
> works well but we certainly
> can use it in our git hooks and configure it if interest is there

I think this would make a lot of sense.

Cheers,

Richard



