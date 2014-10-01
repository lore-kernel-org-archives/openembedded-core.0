Return-Path: <denis@denix.org>
Received: from vms173019pub.verizon.net (vms173019pub.verizon.net
	[206.46.173.19])
	by mail.openembedded.org (Postfix) with ESMTP id 441956A9D4
	for <openembedded-core@lists.openembedded.org>;
	Wed,  1 Oct 2014 01:32:45 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [108.18.33.160])
	by vms173019.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0NCQ00C64SA8GR30@vms173019.mailsrvcs.net> for
	openembedded-core@lists.openembedded.org;
	Tue, 30 Sep 2014 20:32:32 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id EC3CC20141; Tue,
	30 Sep 2014 21:32:31 -0400 (EDT)
Date: Tue, 30 Sep 2014 21:32:31 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Khem Raj <raj.khem@gmail.com>
Message-id: <20141001013231.GQ2480@denix.org>
References: <1411647477-12992-1-git-send-email-sledz@dresearch-fe.de>
	<20141001005520.GO2480@denix.org>
	<CAMKF1sqJ=QsZWNWe436Q6hNaegEm6HMj76JtXU-gZBhrkRutAQ@mail.gmail.com>
MIME-version: 1.0
In-reply-to: <CAMKF1sqJ=QsZWNWe436Q6hNaegEm6HMj76JtXU-gZBhrkRutAQ@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [daisy][PATCH 1/3] layer.conf: Add in useradd dependencies as ABISAFE dependencies
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 01 Oct 2014 01:32:54 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Tue, Sep 30, 2014 at 06:25:57PM -0700, Khem Raj wrote:
> On Tue, Sep 30, 2014 at 5:55 PM, Denys Dmytriyenko <denis@denix.org> wrote:
> > This line above ^^^^ has a very long trail of whitespaces and it got commited
> > that way, unfortunately :(
> 
> Better was if you commented before it went in.

And how would you suggest I was supposed to see it?? Nobody saw it. My email 
client is no different than others - it doesn't mark trailing whitespaces. The 
reason I saw it is because I ran "git log -p" on the file and that explicitly 
highlights trailing whitespaces in BRIGHT RED... :)

-- 
Denys

