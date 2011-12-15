Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RbH8l-0001KP-B7
	for openembedded-core@lists.openembedded.org;
	Thu, 15 Dec 2011 20:38:51 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 15 Dec 2011 11:31:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="96648796"
Received: from unknown (HELO [10.255.12.229]) ([10.255.12.229])
	by fmsmga001.fm.intel.com with ESMTP; 15 Dec 2011 11:31:51 -0800
Message-ID: <4EEA4B27.6010908@linux.intel.com>
Date: Thu, 15 Dec 2011 11:31:51 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0) Gecko/20110927 Thunderbird/7.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1322665120-29586-1-git-send-email-koen@dominion.thruhere.net>
	<D72EA3E2-0752-4F03-875F-77F5764313B1@dominion.thruhere.net>
In-Reply-To: <D72EA3E2-0752-4F03-875F-77F5764313B1@dominion.thruhere.net>
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: [PATCH] webkit-gtk svn: update to r101488
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
X-List-Received-Date: Thu, 15 Dec 2011 19:38:51 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 12/15/2011 07:16 AM, Koen Kooi wrote:
> ping
>
I think there was a pending question about why zlib was needed the 
answer was quite terse, do you have any more information, is it a needed 
missing dependency or ???

Thanks
	Sau!

> Op 30 nov. 2011, om 15:58 heeft Koen Kooi het volgende geschreven:
>
>> tested on beagleboard/angstrom with midori and epiphany browsers
>>
>> Signed-off-by: Koen Kooi<koen@dominion.thruhere.net>
>> ---
>> meta/recipes-sato/webkit/files/GNUmakefile.am |   37 ++-
>> meta/recipes-sato/webkit/files/autogen.sh     |    1 -
>> meta/recipes-sato/webkit/files/configure.ac   |  395 ++++++++++++-------------
>> meta/recipes-sato/webkit/webkit-gtk_svn.bb    |    9 +-
>> 4 files changed, 232 insertions(+), 210 deletions(-)
>>
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


