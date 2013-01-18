Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1TwFXW-00061k-Na
	for openembedded-core@lists.openembedded.org;
	Fri, 18 Jan 2013 18:15:54 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 18 Jan 2013 09:00:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,493,1355126400"; d="scan'208";a="245676178"
Received: from unknown (HELO [10.255.15.56]) ([10.255.15.56])
	by azsmga001.ch.intel.com with ESMTP; 18 Jan 2013 09:00:12 -0800
Message-ID: <50F97F9B.1060808@linux.intel.com>
Date: Fri, 18 Jan 2013 09:00:11 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: "Iorga, Cristian" <cristian.iorga@intel.com>
References: <1358509171-19924-1-git-send-email-cristian.iorga@intel.com>
	<1358509171-19924-2-git-send-email-cristian.iorga@intel.com>
	<1358515371.27799.26.camel@ted>
	<969F26A8BAB325438E7EB80D3C3134FB161E974F@IRSMSX102.ger.corp.intel.com>
In-Reply-To: <969F26A8BAB325438E7EB80D3C3134FB161E974F@IRSMSX102.ger.corp.intel.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] alsa-utils: upgrade to 1.0.26
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
X-List-Received-Date: Fri, 18 Jan 2013 17:15:55 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 01/18/2013 05:29 AM, Iorga, Cristian wrote:
> Is no longer necessary, the build system if now fixed.
>
So please add this to the commit message and resend.

Thanks
	Sau!

> -----Original Message-----
> From: Richard Purdie [mailto:richard.purdie@linuxfoundation.org]
> Sent: Friday, January 18, 2013 3:23 PM
> To: Iorga, Cristian
> Cc: openembedded-core@lists.openembedded.org
> Subject: Re: [OE-core] [PATCH 2/2] alsa-utils: upgrade to 1.0.26
>
> On Fri, 2013-01-18 at 13:39 +0200, Cristian Iorga wrote:
>> Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
>> ---
>>   .../alsa/alsa-utils-1.0.25/ncursesfix.patch        |   44 --------------------
>>   ...-t-let-systemd-unit-restore-the-volume-wh.patch |    0
>>   .../obsolete_automake_macros.patch                 |    0
>>   .../uclibc-exp10-replacement.patch                 |    0
>>   .../{alsa-utils_1.0.25.bb => alsa-utils_1.0.26.bb} |    7 ++--
>>   5 files changed, 3 insertions(+), 48 deletions(-)  delete mode 100644
>> meta/recipes-multimedia/alsa/alsa-utils-1.0.25/ncursesfix.patch
>
> What happened to the patch?
>
> Cheers,
>
> Richard
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
>


