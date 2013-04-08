Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1UPGdk-0003U0-4h
	for openembedded-core@lists.openembedded.org;
	Mon, 08 Apr 2013 20:18:04 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 08 Apr 2013 11:00:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,432,1363158000"; d="scan'208";a="319240004"
Received: from unknown (HELO [10.255.14.17]) ([10.255.14.17])
	by fmsmga002.fm.intel.com with ESMTP; 08 Apr 2013 11:00:38 -0700
Message-ID: <516305C6.2040601@linux.intel.com>
Date: Mon, 08 Apr 2013 11:00:38 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: Radu Moisan <radu.moisan@intel.com>
References: <1365439656-29802-1-git-send-email-radu.moisan@intel.com>
	<1365440061.12407.49.camel@ted> <5162F796.8020008@intel.com>
In-Reply-To: <5162F796.8020008@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] openssl: Upgrade to v1.0.1e
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 08 Apr 2013 18:18:05 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 04/08/2013 10:00 AM, Radu Moisan wrote:
>
> On 04/08/2013 07:54 PM, Richard Purdie wrote:
>> On Mon, 2013-04-08 at 19:47 +0300, Radu Moisan wrote:
>>> Dropped obolete patches and pulled updates for debian patches
>> Isn't there some CVE this upgrade fixes which would be worth a mention
>> in here?
>
> With respect to what we had (1.0.0j) Scott pointed out the following
>
> http://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2012-2686
> http://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2013-0166
> http://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2013-0169
>
> Yocto #3965  <https://bugzilla.yoctoproject.org/show_bug.cgi?id=3965>
>
>
Please put this in the commit message is what RP is getting after here.

Thanks
	Sau!

> Radu
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


