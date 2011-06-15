Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QWrIX-0005XL-UF
	for openembedded-core@lists.openembedded.org;
	Wed, 15 Jun 2011 16:42:26 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 15 Jun 2011 07:38:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,370,1304319600"; d="scan'208";a="13186568"
Received: from unknown (HELO [10.255.13.50]) ([10.255.13.50])
	by azsmga001.ch.intel.com with ESMTP; 15 Jun 2011 07:38:46 -0700
Message-ID: <4DF8C3F5.90204@linux.intel.com>
Date: Wed, 15 Jun 2011 07:38:45 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110428 Fedora/3.1.10-1.fc13 Thunderbird/3.1.10
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1308139578.25285.1539.camel@phil-desktop>
	<14EEB73F-6128-4529-9A23-6F18D713F8F2@dominion.thruhere.net>
In-Reply-To: <14EEB73F-6128-4529-9A23-6F18D713F8F2@dominion.thruhere.net>
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: tinylogin unfetchable
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
X-List-Received-Date: Wed, 15 Jun 2011 14:42:26 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 06/15/2011 05:09 AM, Koen Kooi wrote:
>
> Op 15 jun 2011, om 14:06 heeft Phil Blundell het volgende geschreven:
>
>> The SRC_URI http://tinylogin.busybox.net/downloads/tinylogin-1.4.tar.bz2
>> doesn't seem to work anymore.  Does anybody know an alternate URL that
>> could be used in the recipe?
>
I am also looking at moving us to the tinylogin that is part of busybox 
implementation, the source should also be available at:

http://autobuilder.pokylinux.org/sources/tinylogin-1.4.tar.bz2

Is the fallback to MIRRORS not working?

Sau!

> http://www.angstrom-distribution.org/unstable/sources/tinylogin-1.4.tar.bz2 will exist for at least 3 years from now due to GPL :)
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


