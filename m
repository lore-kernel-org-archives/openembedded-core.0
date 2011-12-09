Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1RZ6Rk-0007U1-B1
	for openembedded-core@lists.openembedded.org;
	Fri, 09 Dec 2011 20:49:28 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 09 Dec 2011 11:42:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="84119936"
Received: from unknown (HELO envy.home) ([10.255.12.30])
	by azsmga001.ch.intel.com with ESMTP; 09 Dec 2011 11:42:36 -0800
Message-ID: <4EE264BB.6060306@linux.intel.com>
Date: Fri, 09 Dec 2011 11:42:51 -0800
From: Darren Hart <dvhart@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0) Gecko/20110927 Thunderbird/7.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1323358819.git.otavio@ossystems.com.br>
	<e27fba3b38877fb7420c58a3e35cdbcef1cb767a.1323358819.git.otavio@ossystems.com.br>
	<4EE25E38.3060704@linux.intel.com>
	<CAP9ODKpr=xgxfJcrzsbv8q+VQh8oQOdKjQurev7hVjiMAv1PkA@mail.gmail.com>
	<4EE25FA0.2050500@linux.intel.com>
	<CAP9ODKrMGQbcQaNiwcDKUv6q06Bn5Cy7MEvJ4nMipsG9UOAhSA@mail.gmail.com>
In-Reply-To: <CAP9ODKrMGQbcQaNiwcDKUv6q06Bn5Cy7MEvJ4nMipsG9UOAhSA@mail.gmail.com>
X-Enigmail-Version: 1.3.3
Subject: Re: [PATCH 2/3] dosfstools: update native to 2.11
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
X-List-Received-Date: Fri, 09 Dec 2011 19:49:28 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit



On 12/09/2011 11:35 AM, Otavio Salvador wrote:
> On Fri, Dec 9, 2011 at 17:21, Darren Hart <dvhart@linux.intel.com
> <mailto:dvhart@linux.intel.com>> wrote:
> 
>     So pulling this in would mean we can't build live images when building
>     non GPLv3 images? We are looking to revamp the image creation, but until
>     then I can't agree to this.
> 
> 
> NO. This is 2.11 release.
> 
> The GPLv3 versions are the 3.0.x (now it is at 3.0.12).

Ah, this should be fine then. Otavio says the llseek patch which had the
comment regarding licensing is in 2.11.

No objection your honor.

-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Linux Kernel


