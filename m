Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1R9bQB-0005wy-Hf for openembedded-core@lists.openembedded.org;
	Fri, 30 Sep 2011 13:38:27 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p8UBdMuO013855 for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Sep 2011 12:39:23 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id HRa4ftyTZgsb
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Sep 2011 12:39:22 +0100 (BST)
Received: from [192.168.1.40] (tim [93.97.173.237]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p8UBdK7E013852
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Sep 2011 12:39:21 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Fri, 30 Sep 2011 12:32:54 +0100
X-Mailer: Evolution 3.1.91- 
Message-ID: <1317382380.12332.171.camel@ted>
Mime-Version: 1.0
Subject: Slight change to merging procedure - master-next
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
X-List-Received-Date: Fri, 30 Sep 2011 11:38:27 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

One of the issues I've been having is that I read through patches once
doing review and then have to wait ~24 hours before merging any patches
I think are acceptable in case others have comments. This means I have
to go through emails twice and its a bit of a pain.

I'm therefore going to start maintaining master-next with patches I
think are ready. They'll sit there for 24 hours before being merged if
there aren't other issues raised by anyone else.

I could just do this in private but I'm choosing to make it public. I
want to be clear that branch can rebase and change, its not definite
until it hits master. I hope some people find it useful.

Cheers,

Richard



