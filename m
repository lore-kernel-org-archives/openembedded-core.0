Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1TJRcy-0000S6-SI for openembedded-core@lists.openembedded.org;
	Wed, 03 Oct 2012 18:16:53 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q93G3qpU028538;
	Wed, 3 Oct 2012 17:03:52 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 26503-04; Wed,  3 Oct 2012 17:03:47 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q93G3gOH028532
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Wed, 3 Oct 2012 17:03:44 +0100
Message-ID: <1349280226.18301.50.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>,
	yocto@yoctoproject.org
Date: Wed, 03 Oct 2012 17:03:46 +0100
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Yocto Project 1.4 Planning Process
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 03 Oct 2012 16:16:53 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Whilst I appreciate people are concentrating on 1.3, we do also need to
think about planning 1.4.

https://wiki.yoctoproject.org/wiki/Yocto_1.4_Features

is seeded with the 1.4/Future targeted enhancement requests from the
bugzilla. This is currently unsorted/unprocessed other than some guesses
from the triage team and I doubt we can actually do everything listed
there but there are plenty of good ideas.

If people can see anything that is missing from those lists which they
think is something we should consider working on in 1.4, I'd recommend
filing enhancement requests in the bugzilla so they're included in the
list.

In about a week's time, I'll be sitting down with this list and talking
with the project stakeholders about what resources are available and
which tasks we could use those resources on and generally figure out
what we're going to target in 1.4. If there are resources available I'm
unaware of, please do talk to me btw! :)

Equally, I'd also ask that if there are things you're planning to do in
the 1.4 timescale, please indicate this with an entry in the bugzilla
which you take ownership of, give a rough time estimation/ETA of and set
the status to ACCEPTED. This tells others that you're working on
something and gives us an idea of what changes to expect and when. This
is useful for planning things like demos and the beta testing.

Questions are more than welcome, as is feedback about this process.

Cheers,

Richard






