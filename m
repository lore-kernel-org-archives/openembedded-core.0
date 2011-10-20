Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RGs4Z-0005sS-S8 for openembedded-core@lists.openembedded.org;
	Thu, 20 Oct 2011 14:50:12 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p9KCiKL0017489
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Oct 2011 13:44:20 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 16810-06 for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Oct 2011 13:44:15 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p9KCi9mM017479
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Oct 2011 13:44:10 +0100
Message-ID: <1319114649.2410.8.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Thu, 20 Oct 2011 13:44:09 +0100
In-Reply-To: <1319101363.22985.259.camel@phil-desktop>
References: <cover.1319096633.git.sgw@linux.intel.com>
	<84da55babd48c9de760d3ff271ba97e6a65926c8.1319096633.git.sgw@linux.intel.com>
	<1319101363.22985.259.camel@phil-desktop>
X-Mailer: Evolution 3.2.1- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [CONSOLIDATED PULL - v2 09/26] x86 tune files: set baselib for x32 tune as libx32
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
X-List-Received-Date: Thu, 20 Oct 2011 12:50:12 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-10-20 at 10:02 +0100, Phil Blundell wrote:
> On Thu, 2011-10-20 at 00:50 -0700, Saul Wold wrote:
> > From: Nitin A Kamble <nitin.a.kamble@intel.com>
> > 
> > Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
> 
> Why is this a good thing?  There is no explanation in the commit
> message.

Agreed, we need to improve the commit messages. I've merged this one
with some additional comments but can people please keep good commit
messages in mind.

Cheers,

Richard



