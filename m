Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <josh@linux.intel.com>) id 1Runwy-0000be-PM
	for openembedded-core@lists.openembedded.org;
	Tue, 07 Feb 2012 17:31:24 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 07 Feb 2012 08:23:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="122027760"
Received: from unknown (HELO [10.255.15.17]) ([10.255.15.17])
	by fmsmga002.fm.intel.com with ESMTP; 07 Feb 2012 08:23:08 -0800
Message-ID: <4F314FEC.6090108@linux.intel.com>
Date: Tue, 07 Feb 2012 08:23:08 -0800
From: Joshua Lock <josh@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0) Gecko/20120131 Thunderbird/10.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <29270F77-234D-4561-974D-C8E266898FA3@beagleboard.org>
In-Reply-To: <29270F77-234D-4561-974D-C8E266898FA3@beagleboard.org>
Subject: Re: [meta-openembedded][RFC] meta-multimedia layer
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
X-List-Received-Date: Tue, 07 Feb 2012 16:31:25 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit



On 07/02/12 03:08, Koen Kooi wrote:
> Hi,
>
> During FOSDEM Paul Eggleton and I discussed moving a few multimedia recipes (libav, xbmc, faac, faad, etc) out of meta-oe into a new meta-multimedia layer hosted in the meta-openembedded git repo. This would allow e.g. meta-baryon to drop a number of recipes while avoiding the need to drag in the complete meta-oe layer.
>
> Thoughts?

Yes please!

Would this layer be open to patches to enable 
LICENSE_FLAGS/INCOMPATIBLE_LICENSE ?

Cheers,
Joshua
-- 
Joshua Lock
         Yocto Project "Johannes factotum"
         Intel Open Source Technology Centre


