Received: from katalix.com ([82.103.140.233] helo=mail.katalix.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <celston@katalix.com>) id 1Qdlvn-0005Cg-Bn
	for openembedded-core@lists.openembedded.org;
	Mon, 04 Jul 2011 18:23:31 +0200
Received: from [192.168.1.100] (188-220-141-241.zone11.bethere.co.uk
	[188.220.141.241])
	(using SSLv3 with cipher DHE-RSA-CAMELLIA256-SHA (256/256 bits))
	(No client certificate requested) (Authenticated sender: chris)
	by mail.katalix.com (Postfix) with ESMTPSA id 388F2A6206D
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Jul 2011 17:12:24 +0100 (BST)
From: Chris Elston <celston@katalix.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <4E11DFA1.70608@slimlogic.co.uk>
References: <1309780493.20200.17.camel@desktop.home>
	<4E11DFA1.70608@slimlogic.co.uk>
Date: Mon, 04 Jul 2011 17:12:22 +0100
Message-Id: <1309795942.20200.123.camel@desktop.home>
Mime-Version: 1.0
X-Mailer: Evolution 2.26.3 (2.26.3-1.fc11) 
Subject: Re: [PROPOSAL] Package feature switches, redux.
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: celston@katalix.com, Patches and discussions about the oe-core layer
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
X-List-Received-Date: Mon, 04 Jul 2011 16:23:31 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

> Hi, with my Angstrom cap on I like this syntax and I think it will be
> really useful.
> 
> A second level concern I have is about conflicting features, its not
> something we will come across probably in DISTRO land as we are sensible
> enough not to select them. But users could select them in local.conf.
> 
> Graeme

As a new developer, I've discovered that there are plenty of things that
you can set in local.conf which break things :D

Could you please give an example of conflicting features that could
cause problems, I'm not experienced enough with OE to have encountered
that problem yet.

Cheers,

Chris.



