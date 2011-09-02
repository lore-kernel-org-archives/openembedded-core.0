Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rpurdie@rpsys.net>) id 1QzXBQ-00063X-8H
	for openembedded-core@lists.openembedded.org;
	Fri, 02 Sep 2011 19:05:36 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p82H0dRS027625;
	Fri, 2 Sep 2011 18:00:39 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 27097-04; Fri,  2 Sep 2011 18:00:35 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p82H0YSN027619
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Fri, 2 Sep 2011 18:00:35 +0100
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1314976910.3526.36.camel@mattotaupa>
References: <1314962732.3526.32.camel@mattotaupa>
	<CAP9ODKpMU3yr==7+qyBvTyW3ikoSXtZqurKwsCn3Nn_54E0k7Q@mail.gmail.com>
	<1314969543.5939.586.camel@rex> <1314976910.3526.36.camel@mattotaupa>
Date: Fri, 02 Sep 2011 18:00:16 +0100
Message-ID: <1314982816.5939.616.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [oe] Please merge lists openembedded-devel and openembedded-core again.
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
X-List-Received-Date: Fri, 02 Sep 2011 17:05:36 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2011-09-02 at 17:21 +0200, Paul Menzel wrote:
> Am Freitag, den 02.09.2011, 14:19 +0100 schrieb Richard Purdie:
> > On Fri, 2011-09-02 at 10:05 -0300, Otavio Salvador wrote:
> > > On Fri, Sep 2, 2011 at 08:25, Paul Menzel wrote:
> 
> > > > it would be great if we could join the lists oe-devel and oe-core again.
> > > > As far as I know the only reason the list oe-core was created was to
> > > > discuss the initial setup and the creation of oe-core. Now that it has
> > > > been setup I do not see any reason to have two separate lists.
> > > >
> > > > I suggest to abandon/archive openembedded-core and use
> > > > openembedded-devel.
> > > 
> > > I fully support this merge.
> > 
> > I'm not so sure rushing into this is a great idea.
> 
> I interpret your answer that the merge is planned. What is the right
> time then?

Not planned, it has been talked about, particularly by the TSC members.

> > Speaking as someone who has problems trying to figure out where
> > patches are intended for
> 
> Also now you have to decide to what list to send them to. Now you just
> add a prefix/tag as is done on oe-devel already to differentiate between
> oe.dev and meta-oe.

Well, its relatively simple to decide if an email is appropriate for
oe-core or not.

Sure we could start asking people to use tags/prefixes but I fail to see
the advantage of putting more email in one place when a reasonable and
logical separate exists which actively helps people.

> > and who tracks whether they've been applied,
> 
> Well, the list is not a patch tracker. The patch queue is [1].

For various reasons its not how I track patches for OE-Core.

> > I do find the split useful...
> 
> Hmm, could you please elaborate?

We all try to find ways to make our workflows more efficient and to do
the best job we can at the things we attempt. The mailing list
separation actively helps me notice the most important things I need to
deal with. Now yes, I could use mail filters, I could do a variety of
things. Even with those I believe my response to various things would be
adversely impacted if we do merge the lists as with the best will in the
world, people sometimes don't do things like tags/prefixes/whatever and
its easier for anyone new to OE to get confused.

Cheers,

Richard



