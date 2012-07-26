Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <radu.moisan@intel.com>) id 1SuNoJ-00083I-FD
	for openembedded-core@lists.openembedded.org;
	Thu, 26 Jul 2012 15:08:59 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 26 Jul 2012 05:57:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="186762018"
Received: from dell-desktop (HELO [10.237.105.32]) ([10.237.105.32])
	by fmsmga001.fm.intel.com with ESMTP; 26 Jul 2012 05:57:24 -0700
Message-ID: <50113F14.1040003@intel.com>
Date: Thu, 26 Jul 2012 15:59:00 +0300
From: Radu Moisan <radu.moisan@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:14.0) Gecko/20120714 Thunderbird/14.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1343283462-25435-1-git-send-email-radu.moisan@intel.com>
	<5010E3CF.3060709@intel.com>
	<919CF905-E475-44CE-8050-94A39C204208@dominion.thruhere.net>
	<1756274.ud5AYazWdz@helios>
	<F0E3167B-ECF8-494D-83E8-0D31CC826E65@dominion.thruhere.net>
	<50110B50.3030900@intel.com>
	<446507ED-01C5-4006-B9AE-C8D77B61C213@dominion.thruhere.net>
	<50111C7C.8080904@intel.com> <50112207.3060709@intel.com>
	<CAJTo0LYeKt+KypnrVq50tSbjqfK8XyvUnZp0xvz=KRmMx7dXzQ@mail.gmail.com>
	<C132AEAF-467E-450E-A86F-7A68BE96F917@dominion.thruhere.net>
	<CAJTo0LZx5E7tcvLUMrjPdH2B5p+DnFxU63tbtL6tsDX5dVfVSQ@mail.gmail.com>
	<501139E2.1020003@intel.com>
	<7438F5F4-0D14-463F-ABCF-1884F9DCB7C7@dominion.thruhere.net>
In-Reply-To: <7438F5F4-0D14-463F-ABCF-1884F9DCB7C7@dominion.thruhere.net>
Subject: Re: [PATCH v3] dbus: include dbus-launch in the main dbus package
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
X-List-Received-Date: Thu, 26 Jul 2012 13:08:59 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

only in meta & meta-intel.

Radu

On 07/26/2012 03:51 PM, Koen Kooi wrote:
> Op 26 jul. 2012, om 14:36 heeft Radu Moisan het volgende geschreven:
>
>> I understand the reasoning behind RPROVIDES. I've grep'ed the sources and none of the packages that depend on dbus-x11 have build time dependencies on it,
> You grepped all the layers out there for 'dbus-x11' or only oe-core?
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



