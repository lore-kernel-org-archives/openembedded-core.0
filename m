Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Qm0UX-0004cV-3l for openembedded-core@lists.openembedded.org;
	Wed, 27 Jul 2011 11:33:25 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p6R9TBoc028867
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Jul 2011 10:29:11 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 28368-06 for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Jul 2011 10:29:07 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p6R9T2qY028861
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Jul 2011 10:29:03 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Wed, 27 Jul 2011 10:28:52 +0100
Message-ID: <1311758933.2344.342.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Master branch merges
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
X-List-Received-Date: Wed, 27 Jul 2011 09:33:25 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

We're coming up to an interesting point in the development cycle since a
lot of the feature development work Yocto has been working on is winding
up. It means there are a few significant patches waiting to go into
master.

Typically, life isn't straightforward and this is complicated by the
fact I'll be in a black hole as far as modern communication goes for
Thur/Fri/Sat.

I've given what I should do under these circumstances a fair bit of
thought and currently I'm thinking that the best approach is likely to
merge everything that is ready. This is realistically the only way it
will get the final round of testing.

Its possible something will break. Fixes can easily be shared and queued
up on a branch in my absence and Saul should be able to help with that
if needed.

So this is a conscious decision and we'll see how it works out! :)

Cheers,

Richard




