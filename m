Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SKWpl-0004T8-Vv for openembedded-core@lists.openembedded.org;
	Wed, 18 Apr 2012 17:30:18 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q3IFKoPc002983;
	Wed, 18 Apr 2012 16:20:50 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 02534-06; Wed, 18 Apr 2012 16:20:45 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q3IFKhdU002976
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Wed, 18 Apr 2012 16:20:44 +0100
Message-ID: <1334762445.24091.110.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 18 Apr 2012 16:20:45 +0100
In-Reply-To: <20120418145330.GM3635@jama.jama.net>
References: <1334760467.24091.100.camel@ted>
	<20120418145330.GM3635@jama.jama.net>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: yocto <yocto@yoctoproject.org>
Subject: Re: Yocto Project 1.2 Release Status
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
X-List-Received-Date: Wed, 18 Apr 2012 15:30:18 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2012-04-18 at 16:53 +0200, Martin Jansa wrote:
> On Wed, Apr 18, 2012 at 03:47:47PM +0100, Richard Purdie wrote:
> > I thought I'd update everyone with the current 1.2 status.
> > 
> > I'm going to branch master for release at this point. We've fixed a lot
> > of issues, I'm hoping the -rc4 build will be a good one. There are signs
> > there are some more minor issues around and bugs do keep getting opened.
> > These are still being investigated so we'll continue to let that happen.
> > Once we have a QA report for -rc4, we'll be in a better position to make
> > a call on how things are looking.
> 
> Does it mean that after creating branch, master will be open for
> postponed patches from ML and master-next or do you want to keep master
> as close to release branch as possible for some time (e.g. for those
> 1.2.1 fixes)?

I have hoped people would work more on the stabilisation and testing but
I don't think I'll be able to hold off the pressure to start master
rolling again at some point relatively soon.

It won't happen immediately as the 1.2 release is building which means I
have no resources to test master right now so I will hold off until
those are available.

To be honest at a personal level, I'm also pretty worn out after the
past couple of weeks of bug fixing, triage and review and would ideally
like to disappear for a couple of weeks. Realistically this isn't going
to happen now but maybe in a few weeks...

Cheers,

Richard



