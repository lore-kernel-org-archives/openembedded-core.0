Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RCBKb-0002cf-K5 for openembedded-core@lists.openembedded.org;
	Fri, 07 Oct 2011 16:23:21 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p97EOCuW010449 for <openembedded-core@lists.openembedded.org>;
	Fri, 7 Oct 2011 15:24:12 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 5aiOs-SFsfPz
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Oct 2011 15:24:12 +0100 (BST)
Received: from [192.168.1.66] (tim [93.97.173.237]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p97EO9Gk010444
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 7 Oct 2011 15:24:10 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Fri, 07 Oct 2011 15:17:30 +0100
In-Reply-To: <1317833828.6398.15.camel@ted>
References: <1317833828.6398.15.camel@ted>
X-Mailer: Evolution 3.1.91- 
Message-ID: <1317997058.2405.21.camel@ted>
Mime-Version: 1.0
Subject: Re: WARNING: Deprecated components removal in 5 days
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
X-List-Received-Date: Fri, 07 Oct 2011 14:23:21 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-10-05 at 17:56 +0100, Richard Purdie wrote:
> I do plan to remove hal too as soon as the last dependency is removed
> (my build without hal isn't booting X correctly atm).

I've resolved those issues so I'm planning to also remove hal and
hal-info since neither component is used in OE-Core any longer.

Cheers,

Richard



