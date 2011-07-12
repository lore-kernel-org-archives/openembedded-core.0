Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QgidN-00020G-1B
	for openembedded-core@lists.openembedded.org;
	Tue, 12 Jul 2011 21:28:41 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 12 Jul 2011 12:24:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,522,1304319600"; d="scan'208";a="26329082"
Received: from unknown (HELO [10.255.14.40]) ([10.255.14.40])
	by azsmga001.ch.intel.com with ESMTP; 12 Jul 2011 12:24:42 -0700
Message-ID: <4E1C9F79.9000904@linux.intel.com>
Date: Tue, 12 Jul 2011 12:24:41 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110428 Fedora/3.1.10-1.fc13 Thunderbird/3.1.10
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1310425837.git.sgw@linux.intel.com>	<d92f0fcf6f83379a91b23e697cd43ac00078257e.1310425837.git.sgw@linux.intel.com>	<C1E5A836-FA0D-40EF-9257-11885C935182@dominion.thruhere.net>	<4E1C9551.7070803@linux.intel.com>
	<1310496496.12607.1.camel@lenovo.internal.reciva.com>
In-Reply-To: <1310496496.12607.1.camel@lenovo.internal.reciva.com>
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: [PATCH 08/26] sqlite3: inherit shared_lib class
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
X-List-Received-Date: Tue, 12 Jul 2011 19:28:41 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/12/2011 11:48 AM, Phil Blundell wrote:
> On Tue, 2011-07-12 at 11:41 -0700, Saul Wold wrote:
>> The renamed shlibpackaging.bbclass has PACKAGES += "lib${PN}, that an
>> perpend according to my understanding.
>
> No, that's an append.  See the fine (though I say so myself) manual:
>
> http://bitbake.berlios.de/manual/ch02.html#id868981
>
My bad, I have read that, and I did the dyslexic thing, I will be more 
careful in the future.

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


