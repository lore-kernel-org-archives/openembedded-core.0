Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Qnyg5-0004o8-0Z for openembedded-core@lists.openembedded.org;
	Mon, 01 Aug 2011 22:01:29 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p71Jv9El009756
	for <openembedded-core@lists.openembedded.org>;
	Mon, 1 Aug 2011 20:57:09 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 08426-06 for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Aug 2011 20:57:05 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p71Jv18W009748
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 1 Aug 2011 20:57:04 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <4E36FDA2.7030001@mentor.com>
References: <1312206333.2344.456.camel@rex>  <4E36FDA2.7030001@mentor.com>
Date: Mon, 01 Aug 2011 20:56:47 +0100
Message-ID: <1312228607.2344.526.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: Commits to master in my absence
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
X-List-Received-Date: Mon, 01 Aug 2011 20:01:29 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2011-08-01 at 12:25 -0700, Tom Rini wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
> 
> On 08/01/2011 06:45 AM, Richard Purdie wrote:
> 
> > I'm a little frustrated to see what happened when I was away from a
> > couple of days. I thought we'd agreed we'd queue up patches in a branch
> > and then I'd take care of things when I got back.
> 
> So, I agree with everything you did say.  But I'd also like to suggest
> we should have gone with "merge everything Monday" not "merge everything
> Wednesday before RP runs off".  Yes, this would have meant either moving
> some testing, or having testing also pull from a different (merged)
> branch.  And I too was "wait, what, more stuff went in?  I thought we
> caught the big problem already".

If I'd merged everything unexpectedly and not communicated the situation
I think that would be bad. As it was, I did merge things but I also
hopefully clearly communicated the issues and the expectation. Master is
the development tip and some instability, particularly as new features
merge is not entirely unexpected at this point in the cycle.

I'd hope we don't end up in a situation like that again, if we do, I'll
see what other options there and weigh them up as the situation
dictates.

Cheers,

Richard







