Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RilaK-0000Rr-0v for openembedded-core@lists.openembedded.org;
	Thu, 05 Jan 2012 12:34:16 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q05BQsX7003867
	for <openembedded-core@lists.openembedded.org>;
	Thu, 5 Jan 2012 11:26:54 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 32043-05 for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Jan 2012 11:26:48 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q05BQiQB003860
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 5 Jan 2012 11:26:44 GMT
Message-ID: <1325762804.20759.59.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Thu, 05 Jan 2012 11:26:44 +0000
In-Reply-To: <cover.1325755613.git.paul.eggleton@linux.intel.com>
References: <cover.1325755613.git.paul.eggleton@linux.intel.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 0/4] Minor fixes
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
X-List-Received-Date: Thu, 05 Jan 2012 11:34:16 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2012-01-05 at 09:29 +0000, Paul Eggleton wrote:
> Fix an omitted Upstream-Status in a recent patch I added, plus some text
> changes in a few other places.
> 
> The following changes since commit f309769d10cb3d8b72b8c7c4f7f418dcb8422c61:
> 
>   valgrind: Fix for automake update (2012-01-04 16:03:59 +0000)
> 
> are available in the git repository at:
>   git://git.openembedded.org/openembedded-core-contrib paule/fixes9
>   http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/fixes9
> 
> Paul Eggleton (4):
>   classes/update-alternatives: fix typos and grammar
>   README: add short description of OE-Core
>   conf/local.conf.sample: fix typos/grammar/formatting
>   qt4: add Upstream-Status to recently added qt-4.8.0 patch

Merged to master thanks.

Richard



