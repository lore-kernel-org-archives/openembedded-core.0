Received: from vms173005pub.verizon.net ([206.46.173.5])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <denis@denix.org>) id 1SIQzM-0001VR-17
	for openembedded-core@lists.openembedded.org;
	Thu, 12 Apr 2012 22:51:32 +0200
Received: from gandalf.denix.org ([unknown] [71.178.225.66])
	by vms173005.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0M2D00BEHTDBFC34@vms173005.mailsrvcs.net> for
	openembedded-core@lists.openembedded.org;
	Thu, 12 Apr 2012 14:41:35 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id F178520099; Thu,
	12 Apr 2012 15:41:34 -0400 (EDT)
Date: Thu, 12 Apr 2012 15:41:34 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-id: <20120412194134.GE13291@denix.org>
References: <7E680CB2A76BB8438D08CF13C09FC53A46B06325@FMSMSX151.amr.corp.intel.com>
	<4F84D58F.8020608@gmail.com> <1334221321.31685.24.camel@ted>
	<4543FDF1-0512-4B36-ABB3-DBB957B86E88@dominion.thruhere.net>
	<CAMKF1soezt5BK0Qnx1Jda_uHXuFKiW9apSxXOu650SqcsqqKCA@mail.gmail.com>
	<CAKZ=5EUVJ_E5G46=9u_oKbjc9r4BBGWZ7A8QhD4LPfF=1=rFeg@mail.gmail.com>
MIME-version: 1.0
In-reply-to: <CAKZ=5EUVJ_E5G46=9u_oKbjc9r4BBGWZ7A8QhD4LPfF=1=rFeg@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: Yocto Project 1.2 M4 schedule
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
X-List-Received-Date: Thu, 12 Apr 2012 20:51:32 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Thu, Apr 12, 2012 at 08:31:13PM +0100, Julian Pidancet wrote:
> On Thu, Apr 12, 2012 at 5:55 PM, Khem Raj <raj.khem@gmail.com> wrote:
> >
> > I think that string is fine as long as its just for yocto but I think
> > for OE-Core we are going to do a General release
> > so tagging that with something yocto project will be very confusing
> > unless we plan to do different releases of OE-Core for general
> > availability
> > and yocto project. I dont think we have bandwidth for that. And since
> > poky repository makes a copy of OE-Core metadata it can be tagged in
> > yoctoproject specific tags
> >
> 
> In case there is an oe-core general availability release separated
> from the yocto release, when would that happen ? Is there anything
> planned yet ?

There is a plan to have oe-core tagged at the same time as the Yocto Project 
release. That's what we've discussed at BSP and Collab Summits. Here we are 
deciding on the naming for those tags.

There are no plans to have separate OE-Core releases - i.e. separate from the 
corresponding Yocto Project releases.

-- 
Denys


