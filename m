Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QZSgG-0003c5-ON for openembedded-core@lists.openembedded.org;
	Wed, 22 Jun 2011 21:01:40 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p5MIw79S007792
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Jun 2011 19:58:07 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 07688-02 for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Jun 2011 19:58:04 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p5MIvxsY007786
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Jun 2011 19:57:59 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <1308758709.21613.104.camel@phil-desktop>
References: <cover.1308706692.git.raj.khem@gmail.com>
	<1308758420.20015.82.camel@rex>
	<1308758709.21613.104.camel@phil-desktop>
Date: Wed, 22 Jun 2011 19:57:40 +0100
Message-ID: <1308769060.20015.97.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH V2 0/2] Change gcc 4.6 recipes to use svn in SRC_URI
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
X-List-Received-Date: Wed, 22 Jun 2011 19:01:40 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-06-22 at 17:05 +0100, Phil Blundell wrote:
> On Wed, 2011-06-22 at 17:00 +0100, Richard Purdie wrote:
> > I'm afraid I don't like having "gcc 4.6" being so publicly visible. Its
> > fine for the recipe names but the PV itself really needs to be something
> > like "4.6.2+svn".
> 
> Well, er, gcc 4.6.1 hasn't even been released yet.  I think "4.6.0
> +svn" (or just "4.6+svn") is the only reasonable thing to put there.
> Calling it 4.6.2 would definitely be misleading.

I'm just thinking ahead ;-)

Cheers,

Richard



