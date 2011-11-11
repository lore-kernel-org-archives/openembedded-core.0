Received: from vms173013pub.verizon.net ([206.46.173.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <denis@denix.org>)
	id 1RP0e9-0003AZ-H4; Sat, 12 Nov 2011 00:36:33 +0100
Received: from gandalf.denix.org ([unknown] [96.240.135.93])
	by vms173013.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009))
	with ESMTPA id <0LUI004MGRXO77F2@vms173013.mailsrvcs.net>; Fri,
	11 Nov 2011 17:30:01 -0600 (CST)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 5C0A014AF5D; Fri,
	11 Nov 2011 18:29:48 -0500 (EST)
Date: Fri, 11 Nov 2011 18:29:48 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20111111232948.GE20602@denix.org>
References: <4EBD2E8F.6060400@balister.org>
MIME-version: 1.0
In-reply-to: <4EBD2E8F.6060400@balister.org>
User-Agent: Mutt/1.5.16 (2007-06-09)
Cc: yocto@yoctoproject.org, openembedded-core@lists.openembedded.org
Subject: Re: [oe] Guidelines for creating a layer
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
X-List-Received-Date: Fri, 11 Nov 2011 23:36:33 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Fri, Nov 11, 2011 at 09:17:51AM -0500, Philip Balister wrote:
> Sorry to hack the subject and delete the earlier conversation, but Koen
> raises a good point here and I do not want it lost in the earlier
> discussion since I among others stopped reading the emails in detail.
> 
> Is there a good set of guidelines on the web site (not buried in a git
> repo) to guide people making the decision when to create a new layer, as
> opposed to contributing to an existing layer?
> 
> How do we make sure layers are well thought out and not people taking
> the path of least resistance?

I think this is a more generic and broad question to discuss it just between 
OE devs. So, my apologies for cross-post, but lets ask wider audience...

Denys


> -------- Original Message --------
> Subject: Re: [oe] RFC Creation of a meta-telephony repository
> Date: Fri, 11 Nov 2011 11:45:52 +0100
> From: Koen Kooi <koen@dominion.thruhere.net>
> Reply-To: openembedded-devel@lists.openembedded.org
> To: openembedded-devel@lists.openembedded.org
> 
> 
> Having worked with layers for quite a while now I go through the following
> list before creating one:
> 
> Does it need to be a layer? -> no -> send patches to existing layers
> 	|
> 	yes
> 	|
> Does it need to be a seperate repo? -> no -> send patches to existing repos
> 	|
> 	yes
> 	|
> Is github/gitorious/etc good enough? -> no -> ...
> 	|
> 	yes
> 	|
> Create repo + layer
> 
> And after a I while re-evaluate it.
> 
> regards,
> 
> Koen


