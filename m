Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QK5aR-0005rj-9T for openembedded-core@lists.openembedded.org;
	Wed, 11 May 2011 11:20:07 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p4B9HLsu017423
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 May 2011 10:17:21 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 17297-03 for <openembedded-core@lists.openembedded.org>;
	Wed, 11 May 2011 10:17:17 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p4B9HFHt017417
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 May 2011 10:17:15 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <20110510202417.GB5171@jama.jama.net>
References: <BANLkTi=424KO0PMR6b_2QC98qtUryMykdQ@mail.gmail.com>
	<4DC8CA7E.4020302@linux.intel.com>
	<BANLkTi=G0wk3a5N4hvTzRcC09U7n-HFH1Q@mail.gmail.com>
	<4DC97D27.9080602@linux.intel.com>
	<20110510181314.GF3673@jama.jama.net>
	<4DC98507.6070103@mentor.com> <1305054238.30391.283.camel@rex>
	<20110510202417.GB5171@jama.jama.net>
Date: Wed, 11 May 2011 10:17:10 +0100
Message-ID: <1305105430.30391.314.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: Pull request with misc changes
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
X-List-Received-Date: Wed, 11 May 2011 09:20:07 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-05-10 at 22:24 +0200, Martin Jansa wrote:
> On Tue, May 10, 2011 at 08:03:57PM +0100, Richard Purdie wrote:
> > Martin/Tom: Serious question - why not use the contrib repo for this?
> 
> I have nothing against contrib repo and I'm using oe-core-contrib for
> oe-core stuff, but I had gitorious repos for meta-oe before
> meta-oe-contrib was created and now I didn't feel the need to change it
> and update my modified meta-oe-create-pull-request header :) but I will
> if you or koen find it better to pull from *-contrib (I'm pushing shr
> branch there already anyways).

I have a habit of using the cgit web interface to visualise patches so
using the contrib repo does help me a little. As you say, you're using
oe-core-contrib though so thats fine :)

FWIW, I find the gitorious web interface extremely painful to the point
of being unusable to get the information I want from it. Could just be
me but I have to pull trees somewhere else to look at them I find it
that painful.

Cheers,

Richard




