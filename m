Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QaAhQ-0007fn-Nu
	for openembedded-core@lists.openembedded.org;
	Fri, 24 Jun 2011 20:01:49 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 24 Jun 2011 10:58:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,420,1304319600"; d="scan'208";a="18188369"
Received: from unknown (HELO [10.255.13.191]) ([10.255.13.191])
	by azsmga001.ch.intel.com with ESMTP; 24 Jun 2011 10:58:10 -0700
Message-ID: <4E04D031.7040009@linux.intel.com>
Date: Fri, 24 Jun 2011 10:58:09 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110428 Fedora/3.1.10-1.fc13 Thunderbird/3.1.10
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1308231207.25285.4608.camel@phil-desktop>
In-Reply-To: <1308231207.25285.4608.camel@phil-desktop>
Subject: Re: oh-puzzles_svn
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
X-List-Received-Date: Fri, 24 Jun 2011 18:01:49 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 06/16/2011 06:33 AM, Phil Blundell wrote:
> The install paths in this recipe are all a bit confused which makes it
> fail if $prefix is set to anything other than /usr.  I'm going to just
> avoid building it for now but maybe someone from the sato crew could
> take a look and see if they can straighten it out a bit.
>
Could you please file a bug on this one.

Thanks
	Sau!

> p.
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


