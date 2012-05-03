Received: from outpost1.zedat.fu-berlin.de ([130.133.4.66])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <heinold@mi.fu-berlin.de>) id 1SPqxf-0003QG-1W
	for openembedded-core@lists.openembedded.org;
	Thu, 03 May 2012 10:00:27 +0200
Received: from relay1.zedat.fu-berlin.de ([130.133.4.67])
	by outpost1.zedat.fu-berlin.de (Exim 4.69)
	for openembedded-core@lists.openembedded.org with esmtp
	(envelope-from <heinold@mi.fu-berlin.de>)
	id <1SPqoG-0006Na-1b>; Thu, 03 May 2012 09:50:44 +0200
Received: from andorra.imp.fu-berlin.de ([160.45.42.84])
	by relay1.zedat.fu-berlin.de (Exim 4.69)
	for openembedded-core@lists.openembedded.org with esmtp
	(envelope-from <heinold@mi.fu-berlin.de>)
	id <1SPqoF-0001PV-VU>; Thu, 03 May 2012 09:50:44 +0200
Received: from heinold by internal andorra.imp.fu-berlin.de with local (Exim
	4.72) id 1SPqoE-0007l9-S4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 03 May 2012 09:50:42 +0200
Date: Thu, 3 May 2012 09:50:42 +0200
From: Henning Heinold <heinold@inf.fu-berlin.de>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120503075042.GA28592@mi.fu-berlin.de>
References: <cover.1335991900.git.raj.khem@gmail.com>
	<a3a55198a8b6f40debf754501c5f0f2b317603ed.1335991900.git.raj.khem@gmail.com>
MIME-Version: 1.0
In-Reply-To: <a3a55198a8b6f40debf754501c5f0f2b317603ed.1335991900.git.raj.khem@gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Sender: Henning Heinold <heinold@mi.fu-berlin.de>
X-Originating-IP: 160.45.42.84
Subject: Re: [PATCH 3/7] libatomics-ops: Make it build for SH4
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
X-List-Received-Date: Thu, 03 May 2012 08:00:27 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

why do we still patch the old recipe instead of using the git version and do not move it to its own directory?

Bye Henning


